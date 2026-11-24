#!/bin/bash

echo "=== Performance Testing Different Routing Configurations ==="

test_performance() {
    local config_name=$1
    local description=$2
    
    echo "Testing: $description"
    kubectl apply -f $config_name
    sleep 5
    
    # Use Apache Bench for performance testing
    ab -n 1000 -c 10 http://localhost:8080/api/version
    echo "----------------------------------------"
}

# Test different configurations
test_performance "virtual-service-100-0.yaml" "100% V1 Traffic"
test_performance "virtual-service-50-50.yaml" "50/50 Split"
test_performance "virtual-service-ab-testing.yaml" "A/B Testing Configuration"
