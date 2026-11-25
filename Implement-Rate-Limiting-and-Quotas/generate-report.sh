#!/bin/bash

echo "=== Rate Limiting and Quota Test Report ==="
echo "Generated at: $(date)"
echo ""

echo "=== Resource Quota Status ==="
oc describe quota rate-limiting-quota -n rate-limiting-lab | grep -A 10 "Resource"
echo ""

echo "=== Pod Status ==="
oc get pods -n rate-limiting-lab -o wide
echo ""

echo "=== Service Status ==="
oc get svc -n rate-limiting-lab
echo ""

echo "=== Rate Limiting Service Status ==="
oc get pods -n istio-system | grep -E "(redis|ratelimit)"
echo ""

echo "=== Network Policies ==="
oc get networkpolicy -n rate-limiting-lab
echo ""

if [ -f "load-test-results.csv" ]; then
  echo "=== Load Test Summary ==="
  echo "Total requests: $(wc -l < load-test-results.csv)"
  echo "Successful requests (200): $(grep ',200,' load-test-results.csv | wc -l)"
  echo "Rate limited requests (429): $(grep ',429,' load-test-results.csv | wc -l)"
  echo "Other errors: $(grep -v ',200,' load-test-results.csv | grep -v ',429,' | wc -l)"
fi

echo ""
echo "=== Report Complete ==="
