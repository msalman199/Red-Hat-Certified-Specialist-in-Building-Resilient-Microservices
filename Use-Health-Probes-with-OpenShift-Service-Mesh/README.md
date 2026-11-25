<div align="center">

# 🩺 Health Probes with OpenShift Service Mesh

### Liveness, Readiness, and Startup Probes for Self-Healing Microservices

![OpenShift](https://img.shields.io/badge/OpenShift-EE0000?style=for-the-badge&logo=redhatopenshift&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-466BB0?style=for-the-badge&logo=istio&logoColor=white)
![Red Hat](https://img.shields.io/badge/Red%20Hat-EE0000?style=for-the-badge&logo=redhat&logoColor=white)

</div>

---

## 📑 Table of Contents

- [📖 Overview](#-overview)
- [🏆 Key Accomplishments](#-key-accomplishments)
- [💡 Why This Matters](#-why-this-matters)
- [🧠 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🎓 Certification Relevance](#-certification-relevance)
- [✅ Conclusion](#-conclusion)

---

## 📖 Overview

This lab covers configuring **health probes** for microservices in OpenShift and integrating them with **OpenShift Service Mesh**. You set up liveness, readiness, and startup probes, enable sidecar injection with Istio traffic management policies, observe automated recovery, and apply advanced health check configurations.

> 🎯 **Goal:** Build self-healing microservices that detect problems and recover without human intervention.

---

## 🏆 Key Accomplishments

In this lab, you have successfully:

| # | 🏅 Accomplishment |
|---|-------------------|
| 1️⃣ | Configured comprehensive health probes including **liveness**, **readiness**, and **startup** probes for microservices running in OpenShift |
| 2️⃣ | Integrated health probes with OpenShift Service Mesh by enabling **sidecar injection** and configuring Istio traffic management policies |
| 3️⃣ | Monitored service health and recovery actions by observing how Kubernetes automatically restarts failed containers and removes unhealthy pods from service endpoints |
| 4️⃣ | Tested automated recovery scenarios to validate that the service mesh properly handles health probe failures and traffic routing |
| 5️⃣ | Implemented advanced health check configurations with **custom headers** and **failure thresholds** |

---

## 💡 Why This Matters

Health probes are critical for building resilient microservices architectures. When integrated with service mesh technology, they provide:

- 🔄 Automated failure detection and recovery without manual intervention
- 🧭 Intelligent traffic routing that avoids sending requests to unhealthy services
- 📈 Improved application availability through proactive health monitoring
- 👁️ Better observability into service health status across the entire mesh

---

## 🧠 Key Concepts

| 🔑 Concept | 📝 Description |
|-----------|----------------|
| **Liveness Probe** | Detects failed containers so Kubernetes can restart them automatically |
| **Readiness Probe** | Determines whether a pod should receive traffic; unhealthy pods are removed from service endpoints |
| **Startup Probe** | Checks that an application has started before other probes take effect |
| **Sidecar Injection** | Adds the Istio proxy to pods so they participate in the service mesh |
| **Istio Traffic Management Policies** | Policies controlling how traffic is routed to healthy services |
| **Custom Headers** | Extra HTTP headers included in advanced health check requests |
| **Failure Threshold** | Number of consecutive probe failures before action is taken |
| **Self-Healing** | Automatic detection of problems and corrective action without human intervention |

---

## 🌍 Real-World Applications

- 🏭 **Production microservices:** Manage environments where automatic recovery and high availability are essential
- 🧭 **Traffic safety:** Keep requests away from unhealthy services
- 🔧 **Self-healing systems:** Detect problems, take corrective action, and maintain service quality without human intervention

---

## 🎓 Certification Relevance

These skills are essential for the **Red Hat Certified Specialist in Building Resilient Microservices** exam and for managing production microservices environments. The combination of Kubernetes health probes and service mesh capabilities ensures your applications can automatically recover from failures and maintain high availability.

---

## ✅ Conclusion

The techniques you've learned here form the foundation for building self-healing microservices that can detect problems, take corrective action, and maintain service quality without human intervention.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Al%20Nafi-Cybersecurity%20Education-0A66C2?style=for-the-badge)

**Made with ❤️ by Al Nafi**

</div>
