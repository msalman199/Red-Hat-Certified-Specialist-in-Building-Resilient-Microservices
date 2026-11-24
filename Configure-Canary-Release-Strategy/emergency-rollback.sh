#!/bin/bash

NAMESPACE="canary-demo"
VIRTUAL_SERVICE="product-service-vs"

echo "=== EMERGENCY ROLLBACK INITIATED ==="
echo "Timestamp: $(date)"
echo "Routing 100% traffic to stable version..."

kubectl patch virtualservice $VIRTUAL_SERVICE -n $NAMESPACE --type='merge' -p='{
    "spec": {
        "http": [{
            "match": [{"uri": {"prefix": "/"}}],
            "route": [
                {"destination": {"host": "product-service", "subset": "stable"}, "weight": 100}
            ]
        }]
    }
}'

echo "Traffic routing updated. Verifying rollback..."
sleep 5

stable_count=0
canary_count=0
test_requests=10

for i in $(seq 1 $test_requests); do
    response=$(curl -s "http://$GATEWAY_URL/" | grep -o "Version: [A-Za-z]*")
    if [[ $response == *"Stable"* ]]; then
        stable_count=$((stable_count + 1))
    elif [[ $response == *"Canary"* ]]; then
        canary_count=$((canary_count + 1))
    fi
done

echo "Rollback verification: Stable=$stable_count/$test_requests Canary=$canary_count/$test_requests"

if [ $stable_count -eq $test_requests ]; then
    echo "ROLLBACK SUCCESSFUL - All traffic routed to stable version"
else
    echo "ROLLBACK VERIFICATION FAILED - Manual intervention required"
fi

echo "=== ROLLBACK COMPLETED ==="
