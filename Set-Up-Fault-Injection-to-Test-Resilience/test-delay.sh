#!/bin/bash
echo "Testing delay fault injection..."
for i in {1..5}; do
  echo "Request $i:"
  echo -n "  Normal user: "
  curl -s -o /dev/null -w "Time: %{time_total}s, Status: %{http_code}\n" \
    "http://$GATEWAY_URL/productpage"
  
  echo -n "  Jason user: "
  curl -s -o /dev/null -w "Time: %{time_total}s, Status: %{http_code}\n" \
    -H "Cookie: user=jason" \
    "http://$GATEWAY_URL/productpage"
  echo "---"
  sleep 2
done
