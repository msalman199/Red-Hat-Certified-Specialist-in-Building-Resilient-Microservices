#!/bin/bash

echo "Generating traffic for monitoring..."

# Generate mixed traffic patterns
for i in {1..100}; do
    # Regular traffic
    curl -s http://localhost:8080/api/version > /dev/null
    
    # Beta user traffic
    if (( i % 10 == 0 )); then
        curl -s -H "user-group: beta" http://localhost:8080/api/version > /dev/null
    fi
    
    # Premium user traffic
    if (( i % 15 == 0 )); then
        curl -s -H "user-type: premium" http://localhost:8080/api/version > /dev/null
    fi
    
    # Session-based traffic
    if (( i % 7 == 0 )); then
        curl -s -H "Cookie: session-version=v2" http://localhost:8080/api/version > /dev/null
    fi
    
    sleep 0.1
done

echo "Traffic generation complete!"
