#!/usr/bin/env python3
import json
import jwt
import time

# JWT payload
payload = {
    'iss': 'testing@secure.istio.io',
    'sub': 'testing@secure.istio.io',
    'aud': 'productpage',
    'exp': int(time.time()) + 3600,  # 1 hour from now
    'iat': int(time.time())
}

# Generate token (using 'secret' as key for demo purposes)
token = jwt.encode(payload, 'secret', algorithm='HS256')
print(token)
