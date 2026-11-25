#!/bin/bash
GATEWAY_URL=$1

if [ -z "$GATEWAY_URL" ]; then
  echo "Usage: $0 <gateway-url>"
  exit 1
fi

echo "=== Fault Injection Testing ==="
echo "Gateway URL: $GATEWAY_URL"
echo

echo "1. Testing Normal Requests (no faults):"
for i in {1..3}; do
  echo -n "  Request $i: "
  curl -s -o /dev/null -w "Status: %{http_code}, Time: %{time_total}s\n" \
    "http://$GATEWAY_URL/productpage"
done

echo
echo "2. Testing Delay Fault Injection (user=jason):"
for i in {1..3}; do
  echo -n "  Request $i: "
  curl -s -o /dev/null -w "Status: %{http_code}, Time: %{time_total}s\n" \
    -H "Cookie: user=jason" \
    "http://$GATEWAY_URL/productpage"
done

echo
echo "3. Testing Abort Fault Injection (user=jason):"
for i in {1..3}; do
  echo -n "  Request $i: "
  response=$(curl -s -w "Status: %{http_code}, Time: %{time_total}s" \
    -H "Cookie: user=jason" \
    "http://$GATEWAY_URL/productpage")
  echo "$response" | tail -1
done
