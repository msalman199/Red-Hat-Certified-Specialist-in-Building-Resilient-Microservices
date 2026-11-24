<div align="center">

# 🕸️ Monolith vs Microservices & OpenShift Service Mesh

### Architecture Comparison, Istio Traffic Configuration, and a Circuit Breaker Simulator

![OpenShift](https://img.shields.io/badge/OpenShift-Service%20Mesh-EE0000?style=for-the-badge&logo=redhatopenshift&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-VirtualService%20%2B%20DestinationRule-466BB0?style=for-the-badge&logo=istio&logoColor=white)
![Envoy](https://img.shields.io/badge/Envoy-Sidecar%20Proxy-AC6199?style=for-the-badge&logo=envoyproxy&logoColor=white)
![Python](https://img.shields.io/badge/Python-Analysis%20%26%20Simulation-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Microservices](https://img.shields.io/badge/Architecture-Microservices-2EA44F?style=for-the-badge)
![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Lab-0A66C2?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [📖 Overview](#-overview)
- [🏆 Key Accomplishments](#-key-accomplishments)
- [🧠 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🏁 Conclusion](#-conclusion)

---

## 📖 Overview

This lab compares **monolithic** and **microservice** architectures hands-on, then introduces **OpenShift Service Mesh** as the infrastructure layer that makes microservices manageable at scale. The work moves through three stages:

1. **Architecture comparison** — project scaffolding and a weighted decision matrix for monolith vs microservices
2. **Microservices analysis** — Python scripts examining benefits and challenges, plus your own written reflections tied to organizational context
3. **Service mesh fundamentals** — core OpenShift Service Mesh concepts, generated Istio `VirtualService` and `DestinationRule` configurations, and a working circuit breaker simulator

> 💡 **Lab Focus:** See how a service mesh moves traffic splitting, load balancing, and failure isolation out of application code and into a centrally managed infrastructure layer.

---

## 🏆 Key Accomplishments

### 🏗️ 1. Compared Monolithic and Microservice Architectures
- ✅ Scaffolded projects for both architectural styles
- ✅ Built a **weighted decision matrix** to evaluate each approach
- ✅ Saw concretely why **small, low-complexity systems** often favor a monolith
- ✅ Saw why **large-scale, high-deployment-frequency systems** favor microservices

### 🐍 2. Analyzed Microservices with Python
- ✅ Used Python scripts to analyze the **benefits and challenges** of microservices
- ✅ Captured your own written reflections
- ✅ Tied each finding back to **organizational context**

### 🕸️ 3. Explored OpenShift Service Mesh
- ✅ Explored core OpenShift Service Mesh concepts
- ✅ Generated real Istio **`VirtualService`** configurations
- ✅ Generated real Istio **`DestinationRule`** configurations
- ✅ Built a working **circuit breaker simulator** that correctly models the `CLOSED`, `OPEN`, and `HALF_OPEN` state transitions

---

## 🧠 Key Concepts

| Concept | Description |
|---------|-------------|
| 🧱 **Monolithic Architecture** | A single deployable unit; often the better fit for small, low-complexity systems |
| 🧩 **Microservice Architecture** | Independently deployable services; favored for large-scale systems with high deployment frequency |
| ⚖️ **Weighted Decision Matrix** | A scoring method that weighs criteria to compare architectural options objectively |
| 🕸️ **Service Mesh** | A dedicated, centrally managed infrastructure layer that handles service-to-service concerns |
| 🔀 **VirtualService** | Istio resource that defines routing rules, such as traffic splitting |
| 🎯 **DestinationRule** | Istio resource that defines policies applied after routing, such as load balancing and circuit breaking |
| 🛡️ **Circuit Breaker** | A failure-isolation pattern that stops calls to an unhealthy service |
| 🔁 **Circuit Breaker States** | `CLOSED` (normal), `OPEN` (calls blocked), `HALF_OPEN` (testing recovery) |
| 🚗 **Envoy Sidecar** | Proxy that enforces mesh policies automatically alongside each service in production |

---

## 🌍 Real-World Applications

| Scenario | How This Lab Applies |
|----------|----------------------|
| 🏢 **Architecture decisions** | Use a weighted decision matrix to justify monolith vs microservices for a given organization |
| 🚦 **Traffic management** | Control traffic splitting and load balancing through Istio configuration instead of application code |
| 🧯 **Failure isolation** | Apply circuit breaker behavior so one failing service does not cascade across the system |
| ⚙️ **Platform operations** | Manage microservices through a centrally managed OpenShift Service Mesh layer |

---

## 🏁 Conclusion

In this lab, you compared monolithic and microservice architectures directly through project scaffolding and a weighted decision matrix, seeing concretely why small, low-complexity systems often favor a monolith while large-scale, high-deployment-frequency systems favor microservices. You then used Python scripts to analyze the benefits and challenges of microservices and captured your own written reflections tying each finding back to organizational context. Finally, you explored core OpenShift Service Mesh concepts, generated real Istio `VirtualService` and `DestinationRule` configurations, and built a working circuit breaker simulator that correctly models the CLOSED, OPEN, and HALF_OPEN state transitions that Envoy sidecars enforce automatically in a production service mesh. Together, these exercises demonstrate how a service mesh shifts concerns like traffic splitting, load balancing, and failure isolation out of application code and into a dedicated, centrally managed infrastructure layer, which is the central value proposition of adopting OpenShift Service Mesh for microservice management.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Powered%20by-Al%20Nafi-0A66C2?style=for-the-badge)

**Happy Learning! 🚀**

</div>
