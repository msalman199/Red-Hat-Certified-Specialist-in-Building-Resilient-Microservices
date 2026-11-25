#!/bin/bash
echo "Testing circuit breaker with concurrent requests..."

# Function to make request
make_request() {
  local id=$1
  status=$(curl -s -o /dev/null -w "%{http_code}" "http://$GATEWAY_URL/productpage")
  echo "Request $id: Status $status"
}

# Make concurrent requests to trigger circuit breaker
echo "Sending 20 concurrent requests..."
for i in {1..20}; do
  make_request $i &
done

wait
echo "All requests completed"
