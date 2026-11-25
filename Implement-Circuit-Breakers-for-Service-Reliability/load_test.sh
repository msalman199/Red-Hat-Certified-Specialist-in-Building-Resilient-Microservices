#!/bin/bash

echo "Starting load test..."
echo "Press Ctrl+C to stop"

counter=1
while true; do
  # Make request to user service
  response=$(curl -s -w "%{http_code}" http://localhost:3001/users/$((counter % 3 + 1))/orders)
  http_code="${response: -3}"
  
  echo "Request $counter - HTTP Code: $http_code - Time: $(date '+%H:%M:%S')"
  
  counter=$((counter + 1))
  sleep 1
done
