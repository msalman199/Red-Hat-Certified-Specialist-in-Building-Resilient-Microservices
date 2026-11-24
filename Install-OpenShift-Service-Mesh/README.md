<div align="center">

# 🕸️ Installing OpenShift Service Mesh

### Operators, Control Plane, Member Roll, and Sidecar Injection

![OpenShift](https://img.shields.io/badge/OpenShift-Service%20Mesh-EE0000?style=for-the-badge&logo=redhatopenshift&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-Control%20Plane-466BB0?style=for-the-badge&logo=istio&logoColor=white)
![Jaeger](https://img.shields.io/badge/Jaeger-Tracing-60D0E4?style=for-the-badge&logo=jaeger&logoColor=black)
![Kiali](https://img.shields.io/badge/Kiali-Observability-0A66C2?style=for-the-badge)
![Elasticsearch](https://img.shields.io/badge/Elasticsearch-Operator-005571?style=for-the-badge&logo=elasticsearch&logoColor=white)
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

This lab walks through a complete **OpenShift Service Mesh installation**: installing the required operators with the Operator Lifecycle Manager, creating a Service Mesh Control Plane, defining which namespaces join the mesh, and validating everything with a sample application using automatic sidecar injection.

> 💡 **Lab Focus:** Build the foundation for advanced microservices patterns such as traffic management, security policies, and observability.

---

## 🏆 Key Accomplishments

### 📦 1. Installed the Required Operators
- ✅ Used the **Operator Lifecycle Manager (OLM)**
- ✅ Installed the **Elasticsearch**, **Jaeger**, **Kiali**, and main **Service Mesh** operators

### 🎛️ 2. Created the Service Mesh Control Plane (SMCP)
- ✅ Configured essential components: **Istio**, **Jaeger** for tracing, and **Kiali** for observability

### 🔍 3. Verified the Installation
- ✅ Checked with the **OpenShift CLI**
- ✅ Checked with the **Web Console**
- ✅ Confirmed all components are running correctly

### 👥 4. Set Up the Service Mesh Member Roll
- ✅ Defined which namespaces participate in the service mesh

### 🧪 5. Tested Service Mesh Functionality
- ✅ Deployed a sample application
- ✅ Confirmed **automatic sidecar injection**

---

## 🧠 Key Concepts

| Concept | Description |
|---------|-------------|
| 🔄 **Operator Lifecycle Manager (OLM)** | Installs and manages operators on OpenShift |
| 🧩 **Service Mesh Operators** | Elasticsearch, Jaeger, Kiali, and the main Service Mesh operator |
| 🎛️ **Service Mesh Control Plane (SMCP)** | Core resource that deploys Istio, Jaeger, and Kiali components |
| 👥 **Service Mesh Member Roll** | Defines which namespaces participate in the mesh |
| 🚗 **Sidecar Injection** | Automatic addition of a proxy sidecar to application pods |
| 🔎 **Jaeger** | Distributed tracing component |
| 📊 **Kiali** | Observability component for the mesh |

---

## 🌍 Real-World Applications

| Capability | What the Mesh Enables |
|------------|-----------------------|
| 🚦 **Traffic management** | Control how requests flow between services |
| 🔒 **Security policies** | Mutual TLS between services |
| 🧯 **Resilience** | Circuit breaking and load balancing |
| 🔭 **Observability** | Distributed tracing across microservices |

---

## 🎓 Certification Relevance

Understanding OpenShift Service Mesh installation is crucial for the **Red Hat Certified Specialist in Building Resilient Microservices** exam, as it demonstrates your ability to set up the infrastructure required for production-ready microservices deployments.

---

## 🏁 Conclusion

In this lab, you have successfully:

- Installed all required Service Mesh operators using the Operator Lifecycle Manager, including Elasticsearch, Jaeger, Kiali, and the main Service Mesh operator
- Created and configured a Service Mesh Control Plane (SMCP) with essential components like Istio, Jaeger for tracing, and Kiali for observability
- Verified the installation using both the OpenShift CLI and Web Console, ensuring all components are running correctly
- Set up a Service Mesh Member Roll to define which namespaces participate in the service mesh
- Tested the service mesh functionality by deploying a sample application with automatic sidecar injection

This installation provides the foundation for implementing advanced microservices patterns such as traffic management, security policies, and observability. The service mesh will enable you to manage complex microservices architectures with features like mutual TLS, circuit breaking, load balancing, and distributed tracing.

The skills learned in this lab will enable you to implement robust, observable, and secure microservices architectures in enterprise environments.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Powered%20by-Al%20Nafi-0A66C2?style=for-the-badge)

**Happy Learning! 🚀**

</div>
