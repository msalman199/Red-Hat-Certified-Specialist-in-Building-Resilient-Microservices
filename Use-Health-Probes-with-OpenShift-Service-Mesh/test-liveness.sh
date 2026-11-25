#!/bin/bash

# Get a pod name
POD_NAME=$(oc get pods -n health-probe-lab -l app=health-demo -o jsonpath='{.items[0].metadata.name}')

echo "Testing liveness probe failure on pod: $POD_NAME"

# Simulate liveness probe failure
oc exec -n health-probe-lab $POD_NAME -c health-demo -- curl -X POST http://localhost:8080/health/live/disable

echo "Liveness probe disabled. Monitor the pod for restart..."
echo "Pod will be restarted by Kubernetes when liveness probe fails."

# Monitor pod events
oc get events -n health-probe-lab --field-selector involvedObject.name=$POD_NAME --sort-by='.lastTimestamp'
