<div align="center">

# 🧩 Deploying a Multi-Tier Microservices Application in OpenShift Service Mesh

### Sidecar Injection, Gateway and VirtualService Routing, and Kiali Traffic Monitoring

![OpenShift](https://img.shields.io/badge/OpenShift-Service%20Mesh-EE0000?style=for-the-badge&logo=redhatopenshift&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-Gateway%20%2B%20VirtualService-466BB0?style=for-the-badge&logo=istio&logoColor=white)
![Envoy](https://img.shields.io/badge/Envoy-Sidecar%20Proxy-AC6199?style=for-the-badge&logo=envoyproxy&logoColor=white)
![Kiali](https://img.shields.io/badge/Kiali-Observability-0A66C2?style=for-the-badge)
![Red Hat](https://img.shields.io/badge/Red%20Hat-Resilient%20Microservices-EE0000?style=for-the-badge&logo=redhat&logoColor=white)

</div>

---

## 📑 Table of Contents

- [📖 Overview](#-overview)
- [🏆 Key Accomplishments](#-key-accomplishments)
- [🧠 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🎓 Certification Relevance](#-certification-relevance)
- [🏁 Conclusion](#-conclusion)

---

## 📖 Overview

This lab deploys a **multi-tier microservices application** within OpenShift Service Mesh and shows the mesh at work. You verify automatic sidecar proxy injection, route traffic with Istio `Gateway` and `VirtualService` resources, and use Kiali, metrics, logs, and proxy configurations to confirm that all communication flows through the mesh proxies.

> 💡 **Lab Focus:** See how a service mesh provides transparent service-to-service communication, security, and observability without any changes to application code.

---

## 🏆 Key Accomplishments

### 🚀 1. Deployed a Multi-Tier Application
- ✅ Deployed **frontend**, **reviews**, and **product catalog** services within OpenShift Service Mesh

### 🚗 2. Verified Automatic Sidecar Proxy Injection
- ✅ Examined pod configurations
- ✅ Confirmed each pod contains **both the application container and the Istio proxy container**

### 🔀 3. Configured and Tested Service-to-Service Communication
- ✅ Routed traffic through the mesh using Istio **`Gateway`** and **`VirtualService`** resources

### 📊 4. Monitored Traffic Flow
- ✅ Used the **Kiali dashboard**
- ✅ Verified that all communication flows through the service mesh proxies

### ✔️ 5. Validated Mesh Functionality
- ✅ Checked **metrics**, **logs**, and **proxy configurations**

---

## 🧠 Key Concepts

| Concept | Description |
|---------|-------------|
| 🧩 **Multi-Tier Microservices** | An application split into services such as frontend, reviews, and product catalog |
| 🚗 **Sidecar Proxy Injection** | Automatic addition of an Istio proxy container alongside each application container |
| 🚪 **Istio Gateway** | Resource that defines how external traffic enters the mesh |
| 🔀 **VirtualService** | Resource that defines how traffic is routed to services within the mesh |
| 📊 **Kiali** | Dashboard for visualizing and monitoring traffic flow through the mesh |
| 🔌 **Service Mesh Proxies** | Proxies through which all service-to-service communication flows |

---

## 🌍 Real-World Applications

| Capability | What the Mesh Provides |
|------------|------------------------|
| 🔀 **Transparent communication** | Service-to-service communication without application code changes |
| 🔒 **Security** | Built-in security for service communication |
| 🔭 **Observability** | Visibility into traffic, metrics, and logs |
| ⚖️ **Networking concerns** | Load balancing, circuit breaking, and traffic management handled by the mesh, so developers can focus on business logic |

---

## 🎓 Certification Relevance

Understanding these concepts is crucial for the **Red Hat Certified Specialist in Building Resilient Microservices** exam, as service mesh technology is becoming the standard for managing microservices communication in enterprise environments.

---

## 🏁 Conclusion

In this lab, you deployed a multi-tier microservices application, verified automatic sidecar proxy injection, configured and tested service-to-service communication using Istio Gateway and VirtualService resources, monitored traffic flow with Kiali, and validated mesh functionality through metrics, logs, and proxy configurations.

This hands-on experience demonstrates the power of service mesh architecture for microservices. The automatic sidecar injection provides transparent service-to-service communication, security, and observability without requiring changes to your application code. The service mesh handles complex networking concerns like load balancing, circuit breaking, and traffic management, allowing developers to focus on business logic rather than infrastructure concerns.

The skills you've learned here will help you build more resilient, observable, and secure microservices architectures.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Powered%20by-Al%20Nafi-0A66C2?style=for-the-badge)

**Happy Learning! 🚀**

</div>
