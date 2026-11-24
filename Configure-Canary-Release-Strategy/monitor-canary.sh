#!/bin/bash

NAMESPACE="canary-demo"

echo "=== Canary Deployment Monitoring ==="
echo "Timestamp: $(date)"
echo "======================================"

echo "1. Pod Health Status:"
echo "Stable pods:"
kubectl get pods -n $NAMESPACE -l version=stable

echo -e "\nCanary pods:"
kubectl get pods -n $NAMESPACE -l version=canary

echo -e "\n2. Resource Usage (requires metrics-server):"
kubectl top pods -n $NAMESPACE -l version=stable 2>/dev/null || echo "Metrics not available for stable"
kubectl top pods -n $NAMESPACE -l version=canary 2>/dev/null || echo "Metrics not available for canary"

echo -e "\n3. Response Time Check:"
response_time=$(curl -o /dev/null -s -w "%{time_total}" "http://$GATEWAY_URL/" || echo "0")
echo "Sample response time: ${response_time}s"

echo -e "\n4. Error Rate Check (10 requests):"
error_count=0
total_requests=10

for i in $(seq 1 $total_requests); do
    http_code=$(curl -o /dev/null -s -w "%{http_code}" "http://$GATEWAY_URL/")
    if [ "$http_code" != "200" ]; then
        error_count=$((error_count + 1))
    fi
done

error_rate=$((error_count * 100 / total_requests))
echo "Error rate: ${error_rate}% (${error_count}/${total_requests} requests failed)"

echo -e "\n5. Current Traffic Distribution (20 requests):"
stable_count=0
canary_count=0
test_requests=20

for i in $(seq 1 $test_requests); do
    response=$(curl -s "http://$GATEWAY_URL/" | grep -o "Version: [A-Za-z]*")
    if [[ $response == *"Stable"* ]]; then
        stable_count=$((stable_count + 1))
    elif [[ $response == *"Canary"* ]]; then
        canary_count=$((canary_count + 1))
    fi
done

stable_pct=$((stable_count * 100 / test_requests))
canary_pct=$((canary_count * 100 / test_requests))

echo "Stable: ${stable_pct}% ($stable_count/$test_requests)"
echo "Canary: ${canary_pct}% ($canary_count/$test_requests)"
echo "======================================"
