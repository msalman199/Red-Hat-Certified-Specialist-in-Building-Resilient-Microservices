#!/bin/bash

CLIENT_POD=$(oc get pod -l app=client-app -n rate-limiting-lab -o jsonpath='{.items[0].metadata.name}')
BACKEND_URL="http://backend-service.rate-limiting-lab.svc.cluster.local"

echo "Testing quota exhaustion..."
for i in {1..60}; do
  RESULT=$(oc exec $CLIENT_POD -n rate-limiting-lab -- curl -s -o /dev/null -w "%{http_code}" $BACKEND_URL 2>/dev/null)
  echo "Request $i: HTTP $RESULT"
  
  if [ "$RESULT" != "200" ]; then
    echo "Quota limit reached at request $i"
    break
  fi
  sleep 1
done
