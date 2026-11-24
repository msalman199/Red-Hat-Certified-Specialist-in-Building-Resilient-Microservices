#!/bin/bash

NAMESPACE="canary-demo"

echo "=== CANARY DEPLOYMENT CLEANUP ==="

echo "Removing canary and problematic deployments..."
kubectl delete deployment product-service-canary -n $NAMESPACE --ignore-not-found
kubectl delete deployment product-service-problematic -n $NAMESPACE --ignore-not-found

echo "Resetting traffic to 100% stable..."
kubectl patch virtualservice product-service-vs -n $NAMESPACE --type='merge' -p='{
    "spec": {
        "http": [{
            "match": [{"uri": {"prefix": "/"}}],
            "route": [
                {"destination": {"host": "product-service", "subset": "stable"}, "weight": 100}
            ]
        }]
    }
}'

echo "Cleaning up canary and problematic ConfigMaps..."
kubectl delete configmap canary-content -n $NAMESPACE --ignore-not-found
kubectl delete configmap problematic-canary-content -n $NAMESPACE --ignore-not-found

echo "Restoring DestinationRule to stable-only subset..."
kubectl patch destinationrule product-service-destination -n $NAMESPACE --type='merge' -p='{
    "spec": {
        "subsets": [
            {"name": "stable", "labels": {"version": "stable"}}
        ]
    }
}'

echo "Verifying cleanup..."
kubectl get pods -n $NAMESPACE
kubectl get configmaps -n $NAMESPACE

echo "=== CLEANUP COMPLETED ==="
echo "Only stable version remains active"
