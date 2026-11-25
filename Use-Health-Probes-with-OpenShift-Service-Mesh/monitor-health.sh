#!/bin/bash

echo "=== Health Probe Monitoring Script ==="
echo "Monitoring pods in health-probe-lab namespace..."
echo

while true; do
    echo "$(date): Checking pod status..."
    
    # Get pod status
    oc get pods -n health-probe-lab -o custom-columns=NAME:.metadata.name,STATUS:.status.phase,READY:.status.containerStatuses[*].ready,RESTARTS:.status.containerStatuses[*].restartCount
    
    echo
    echo "Checking service endpoints..."
    oc get endpoints health-demo-service -n health-probe-lab -o yaml | grep -A 10 addresses
    
    echo "----------------------------------------"
    sleep 10
done
