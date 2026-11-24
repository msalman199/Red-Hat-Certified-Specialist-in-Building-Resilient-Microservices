#!/bin/bash
stable_count=0
canary_count=0
total_requests=50

echo "Testing traffic distribution with $total_requests requests..."
echo "Expected: approximately 90% stable, 10% canary"
echo "----------------------------------------"

for i in $(seq 1 $total_requests); do
    response=$(curl -s "http://$GATEWAY_URL/" | grep -o "Version: [A-Za-z]*")
    if [[ $response == *"Stable"* ]]; then
        stable_count=$((stable_count + 1))
    elif [[ $response == *"Canary"* ]]; then
        canary_count=$((canary_count + 1))
    fi
done

stable_percentage=$((stable_count * 100 / total_requests))
canary_percentage=$((canary_count * 100 / total_requests))

echo "----------------------------------------"
echo "Results:"
echo "Stable version: $stable_count requests (${stable_percentage}%)"
echo "Canary version: $canary_count requests (${canary_percentage}%)"
echo "Total requests: $total_requests"
