#!/bin/bash
echo "Testing retry mechanism with 50% abort rate..."

for i in {1..10}; do
  echo -n "Request $i: "
  start_time=$(date +%s.%N)
  status=$(curl -s -o /dev/null -w "%{http_code}" "http://$GATEWAY_URL/productpage")
  end_time=$(date +%s.%N)
  duration=$(echo "$end_time - $start_time" | bc)
  
  echo "Status: $status, Duration: ${duration}s"
done
