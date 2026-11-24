#!/bin/bash

# Function to test traffic distribution
test_traffic() {
    local config_name=$1
    local expected_v1=$2
    local expected_v2=$3
    
    echo "Testing configuration: $config_name"
    echo "Expected distribution - V1: ${expected_v1}%, V2: ${expected_v2}%"
    
    # Apply the configuration
    kubectl apply -f $config_name
    
    # Wait for configuration to propagate
    sleep 10
    
    # Test traffic distribution
    v1_count=0
    v2_count=0
    total_requests=100
    
    for i in $(seq 1 $total_requests); do
        version=$(curl -s http://localhost:8080/api/version | jq -r '.version')
        if [[ "$version" == "1.0.0" ]]; then
            ((v1_count++))
        elif [[ "$version" == "2.0.0" ]]; then
            ((v2_count++))
        fi
    done
    
    v1_percentage=$((v1_count * 100 / total_requests))
    v2_percentage=$((v2_count * 100 / total_requests))
    
    echo "Actual distribution - V1: ${v1_percentage}%, V2: ${v2_percentage}%"
    echo "V1 requests: $v1_count, V2 requests: $v2_count"
    echo "----------------------------------------"
}

# Test different configurations
test_traffic "virtual-service-100-0.yaml" 100 0
test_traffic "virtual-service-90-10.yaml" 90 10
test_traffic "virtual-service-70-30.yaml" 70 30
test_traffic "virtual-service-50-50.yaml" 50 50
