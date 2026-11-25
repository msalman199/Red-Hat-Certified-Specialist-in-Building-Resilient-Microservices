#!/bin/bash

# Get a pod name
POD_NAME=$(oc get pods -n health-probe-lab -l app=health-demo -o jsonpath='{.items[0].metadata.name}')

echo "Testing readiness probe failure on pod: $POD_NAME"

# Check current endpoints
echo "Current service endpoints:"
oc get endpoints health-demo-service -n health-probe-lab

# Simulate readiness probe failure
oc exec -n health-probe-lab $POD_NAME -c health-demo -- curl -X POST http://localhost:8080/health/ready/disable

echo "Readiness probe disabled. Pod should be removed from service endpoints..."

# Wait and check endpoints again
sleep 15
echo "Service endpoints after readiness failure:"
oc get endpoints health-demo-service -n health-probe-lab

# Re-enable readiness
echo "Re-enabling readiness probe..."
oc exec -n health-probe-lab $POD_NAME -c health-demo -- curl -X POST http://localhost:8080/health/ready/enable

sleep 10
echo "Service endpoints after readiness recovery:"
oc get endpoints health-demo-service -n health-probe-lab
