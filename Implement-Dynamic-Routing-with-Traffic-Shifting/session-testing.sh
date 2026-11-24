#!/bin/bash

echo "=== Session-Based Routing Tests ==="
echo

# Test with session cookie
echo "Test 1: User with v2 session cookie"
curl -s -H "Cookie: session-version=v2; other-cookie=value" http://localhost:8080/api/version | jq '.version, .message'
echo

echo "Test 2: User with v1 session cookie"
curl -s -H "Cookie: session-version=v1; other-cookie=value" http://localhost:8080/api/version | jq '.version, .message'
echo

echo "Test 3: User with even ID (should go to v2)"
curl -s -H "user-id: 1234" http://localhost:8080/api/version | jq '.version, .message'
echo

echo "Test 4: User with odd ID (should go to v1)"
curl -s -H "user-id: 1235" http://localhost:8080/api/version | jq '.version, .message'
echo

echo "Test 5: User with no special headers (should go to v1)"
curl -s http://localhost:8080/api/version | jq '.version, .message'
