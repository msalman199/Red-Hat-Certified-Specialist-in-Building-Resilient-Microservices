#!/bin/bash
GATEWAY_URL=$(kubectl get svc istio-ingressgateway -n istio-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
if [ -z "$GATEWAY_URL" ]; then
    GATEWAY_URL="localhost"
    kubectl port-forward svc/istio-ingressgateway -n istio-system 8080:80 &
    PORT_FORWARD_PID=$!
    GATEWAY_URL="localhost:8080"
fi

echo "Generating traffic to $GATEWAY_URL"
for i in {1..100}; do
    curl -s "http://$GATEWAY_URL/productpage" > /dev/null
    echo "Request $i sent"
    sleep 2
done
