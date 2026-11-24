# Service Mesh Architecture Concepts

## What is a Service Mesh?
A service mesh is a dedicated infrastructure layer that handles service-to-service
communication in a microservices architecture, typically implemented via sidecar proxies.

## Core Components

### Data Plane
- Sidecar Proxies: Envoy proxies deployed alongside each service
- Traffic Management: load balancing, routing, retries, circuit breaking
- Security: mutual TLS (mTLS), authentication, authorization
- Observability: metrics, logs, traces generated at the proxy level

### Control Plane
- Configuration distribution to all sidecar proxies
- Service discovery and endpoint management
- Certificate issuance and rotation
- Policy definition and enforcement

## OpenShift Service Mesh
- Built on the open source Istio project
- Integrated with OpenShift for installation and lifecycle management
- Adds enterprise support and Red Hat security patching
