#!/bin/bash
echo "Testing percentage-based fault injection (50% delay, 10% abort)..."
success=0
delayed=0
failed=0

for i in {1..20}; do
  start_time=$(date +%s.%N)
  status=$(curl -s -o /dev/null -w "%{http_code}" "http://$GATEWAY_URL/productpage")
  end_time=$(date +%s.%N)
  duration=$(echo "$end_time - $start_time" | bc)
  
  if [ "$status" = "200" ]; then
    if (( $(echo "$duration > 2.5" | bc -l) )); then
      delayed=$((delayed + 1))
      echo "Request $i: SUCCESS with DELAY (${duration}s)"
    else
      success=$((success + 1))
      echo "Request $i: SUCCESS (${duration}s)"
    fi
  else
    failed=$((failed + 1))
    echo "Request $i: FAILED ($status)"
  fi
done

echo
echo "Results:"
echo "  Successful: $success"
echo "  Delayed: $delayed"
echo "  Failed: $failed"
