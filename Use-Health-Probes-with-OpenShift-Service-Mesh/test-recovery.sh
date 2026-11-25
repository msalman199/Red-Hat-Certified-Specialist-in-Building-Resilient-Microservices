#!/bin/bash

echo "=== Testing Automated Recovery Actions ==="

# Function to check pod health
check_pod_health() {
    echo "Current pod status:"
    oc get pods -n health-probe-lab -l app=health-demo
    echo
}

# Function to check service endpoints
check_endpoints() {
    echo "Service endpoints:"
    oc get endpoints health-demo-service -n health-probe-lab -o jsonpath='{.subsets[*].addresses[*].ip}' | wc -w
    echo
}

# Test 1: Liveness probe failure and recovery
echo "Test 1: Liveness Probe Failure and Recovery"
echo "============================================"

POD_NAME=$(oc get pods -n health-probe-lab -l app=health-demo -o jsonpath='{.items[0].metadata.name}')
echo "Target pod: $POD_NAME"

check_pod_health
INITIAL_RESTART_COUNT=$(oc get pod $POD_NAME -n health-probe-lab -o jsonpath='{.status.containerStatuses[0].restartCount}')
echo "Initial restart count: $INITIAL_RESTART_COUNT"

# Disable liveness probe
echo "Disabling liveness probe..."
oc exec -n health-probe-lab $POD_NAME -c health-demo -- curl -X POST http://localhost:8080/health/live/disable

# Wait for restart
echo "Waiting for pod restart..."
sleep 60

check_pod_health
NEW_RESTART_COUNT=$(oc get pod $POD_NAME -n health-probe-lab -o jsonpath='{.status.containerStatuses[0].restartCount}' 2>/dev/null || echo "0")
echo "New restart count: $NEW_RESTART_COUNT"

if [ "$NEW_RESTART_COUNT" -gt "$INITIAL_RESTART_COUNT" ]; then
    echo "✓ Liveness probe failure triggered pod restart successfully"
else
    echo "✗ Pod restart not detected"
fi

echo
echo "Test 2: Readiness Probe Failure and Traffic Removal"
echo "=================================================="

# Get fresh pod name after potential restart
POD_NAME=$(oc get pods -n health-probe-lab -l app=health-demo -o jsonpath='{.items[0].metadata.name}')

INITIAL_ENDPOINTS=$(oc get endpoints health-demo-service -n health-probe-lab -o jsonpath='{.subsets[*].addresses[*].ip}' | wc -w)
echo "Initial endpoint count: $INITIAL_ENDPOINTS"

# Disable readiness probe
echo "Disabling readiness probe..."
oc exec -n health-probe-lab $POD_NAME -c health-demo -- curl -X POST http://localhost:8080/health/ready/disable

sleep 20
NEW_ENDPOINTS=$(oc get endpoints health-demo-service -n health-probe-lab -o jsonpath='{.subsets[*].addresses[*].ip}' | wc -w)
echo "Endpoint count after readiness failure: $NEW_ENDPOINTS"

if [ "$NEW_ENDPOINTS" -lt "$INITIAL_ENDPOINTS" ]; then
    echo "✓ Readiness probe failure removed pod from service endpoints"
else
    echo "✗ Pod was not removed from service endpoints"
fi

# Re-enable readiness probe
echo "Re-enabling readiness probe..."
oc exec -n health-probe-lab $POD_NAME -c health-demo -- curl -X POST http://localhost:8080/health/ready/enable

sleep 15
FINAL_ENDPOINTS=$(oc get endpoints health-demo-service -n health-probe-lab -o jsonpath='{.subsets[*].addresses[*].ip}' | wc -w)
echo "Final endpoint count: $FINAL_ENDPOINTS"

if [ "$FINAL_ENDPOINTS" -eq "$INITIAL_ENDPOINTS" ]; then
    echo "✓ Pod successfully re-added to service endpoints"
else
    echo "✗ Pod was not re-added to service endpoints"
fi

echo
echo "=== Recovery Test Complete ==="
