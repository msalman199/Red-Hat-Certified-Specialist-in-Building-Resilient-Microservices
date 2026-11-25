#!/bin/bash

CLIENT_POD=$(oc get pod -l app=client-app -n rate-limiting-lab -o jsonpath='{.items[0].metadata.name}')
BACKEND_URL="http://backend-service.rate-limiting-lab.svc.cluster.local"

echo "Starting load test..."
echo "Timestamp,Request_Number,HTTP_Code,Response_Time"

for i in {1..30}; do
  TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
  RESULT=$(oc exec $CLIENT_POD -n rate-limiting-lab -- curl -s -o /dev/null -w "%{http_code},%{time_total}" $BACKEND_URL)
  echo "$TIMESTAMP,$i,$RESULT"
  sleep 2
done
