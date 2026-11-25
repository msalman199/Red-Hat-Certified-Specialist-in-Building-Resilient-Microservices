#!/bin/bash
echo "Testing timeout mechanism (3s timeout with 10s delay)..."

for i in {1..5}; do
  echo -n "Request $i: "
  start_time=$(date +%s.%N)
  status=$(curl -s -o /dev/null -w "%{http_code}" "http://$GATEWAY_URL/productpage")
  end_time=$(date +%s.%N)
  duration=$(echo "$end_time - $start_time" | bc)
  
  echo "Status: $status, Duration: ${duration}s"
done
