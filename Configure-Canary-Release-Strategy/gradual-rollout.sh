#!/bin/bash

NAMESPACE="canary-demo"
VIRTUAL_SERVICE="product-service-vs"

STAGES=(10 25 50)
WAIT_TIME=20

echo "Starting gradual canary rollout..."
echo "Stages: ${STAGES[@]}%"

for stage in "${STAGES[@]}"; do
    stable_weight=$((100 - stage))
    canary_weight=$stage

    echo "=== Stage: ${canary_weight}% canary traffic ==="

    kubectl patch virtualservice $VIRTUAL_SERVICE -n $NAMESPACE --type='merge' -p="{
        \"spec\": {
            \"http\": [{
                \"match\": [{\"uri\": {\"prefix\": \"/\"}}],
                \"route\": [
                    {\"destination\": {\"host\": \"product-service\", \"subset\": \"stable\"}, \"weight\": $stable_weight},
                    {\"destination\": {\"host\": \"product-service\", \"subset\": \"canary\"}, \"weight\": $canary_weight}
                ]
            }]
        }
    }"

    echo "Updated traffic split: ${stable_weight}% stable, ${canary_weight}% canary"
    echo "Waiting ${WAIT_TIME}s for traffic to stabilize..."
    sleep $WAIT_TIME

    echo "Running health check..."
    ./monitor-canary.sh | grep -E "(Error rate|Stable:|Canary:)"

    echo "Stage ${canary_weight}% completed"
    echo "----------------------------------------"
done

echo "Gradual rollout completed. Current state: 50% stable, 50% canary"

