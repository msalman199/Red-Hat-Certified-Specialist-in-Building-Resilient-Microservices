#!/bin/bash
echo "Monitoring fault injection effects..."

while true; do
  echo "=== $(date) ==="
  
  # Check pod status
  echo "Pod Status:"
  kubectl get pods -n bookinfo | grep -E "(reviews|ratings)"
  
  # Make test requests
  echo "Test Requests:"
  normal_status=$(curl -s -o /dev/null -w "%{http_code}" "http://$GATEWAY_URL/productpage")
  jason_status=$(curl -s -o /dev/null -w "%{http_code}" -H "Cookie: user=jason" "http://$GATEWAY_URL/productpage")
  
  echo "  Normal user: $normal_status"
  echo "  Jason user: $jason_status"
  
  echo "---"
  sleep 10
done
