#!/bin/bash

echo "=== A/B Testing Scenarios ==="
echo

# Function to make request and show result
make_request() {
    local description=$1
    local headers=$2
    
    echo "Scenario: $description"
    echo "Headers: $headers"
    
    if [[ -n "$headers" ]]; then
        response=$(curl -s $headers http://localhost:8080/api/version)
    else
        response=$(curl -s http://localhost:8080/api/version)
    fi
    
    version=$(echo $response | jq -r '.version')
    message=$(echo $response | jq -r '.message')
    
    echo "Response Version: $version"
    echo "Message: $message"
    echo "----------------------------------------"
}

# Test different scenarios
make_request "Regular user (no special headers)" ""
make_request "Beta user" "-H 'user-group: beta'"
make_request "Premium user" "-H 'user-type: premium'"
make_request "Regular user with different header" "-H 'user-group: regular'"

echo
echo "=== Testing Default Traffic Distribution ==="
echo "Making 50 requests without special headers..."

v1_count=0
v2_count=0
total_requests=50

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

echo "Distribution for regular users:"
echo "V1: ${v1_percentage}% ($v1_count requests)"
echo "V2: ${v2_percentage}% ($v2_count requests)"
