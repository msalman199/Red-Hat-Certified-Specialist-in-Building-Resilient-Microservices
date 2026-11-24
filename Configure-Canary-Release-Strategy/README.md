<div align="center">

# 🐤 Canary Releases and Rollback with Istio

### Progressive Traffic Splitting, Failure Simulation, and Emergency and Gradual Rollback on Kubernetes

![Kubernetes](https://img.shields.io/badge/Kubernetes-Canary%20Release-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-Gateway%20%2B%20VirtualService-466BB0?style=for-the-badge&logo=istio&logoColor=white)
![Traffic](https://img.shields.io/badge/Traffic-Splitting-2EA44F?style=for-the-badge)
![Rollback](https://img.shields.io/badge/Rollback-Emergency%20%26%20Gradual-D73A49?style=for-the-badge)
![Monitoring](https://img.shields.io/badge/Monitoring-Error%20Rate%20%26%20Latency-0A66C2?style=for-the-badge)
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

This lab implements a complete **canary release workflow on Kubernetes using Istio**. You deploy stable and canary versions of a microservice, split traffic between them, progressively increase canary exposure while monitoring health, and then simulate a real failure with a deliberately broken canary to practice both emergency and gradual rollback.

> 💡 **Key Takeaway:** Canary releases are only safe when paired with active health monitoring and a tested, fast rollback path. Traffic-splitting configuration alone is not sufficient without the ability to detect problems and revert quickly.

---

## 🏆 Key Accomplishments

### 🚀 1. Implemented a Canary Release Workflow
- ✅ Deployed **stable** and **canary** versions of a microservice
- ✅ Split traffic between them with an Istio **Gateway**, **DestinationRule**, and **VirtualService**
- ✅ Progressively increased canary exposure

### 📈 2. Monitored Canary Health
- ✅ Monitored **error rates** and **response times** while canary exposure increased

### 💥 3. Simulated a Real Failure Scenario
- ✅ Deployed a deliberately **broken canary subset**
- ✅ Routed live traffic to it
- ✅ Observed the resulting **error rate increase**

### ⏪ 4. Executed Rollback Procedures
- ✅ Performed an **emergency rollback**
- ✅ Performed a **gradual rollback**
- ✅ Restored full traffic to the stable version

---

## 🧠 Key Concepts

| Concept | Description |
|---------|-------------|
| 🐤 **Canary Release** | Exposing a new version to a growing share of traffic before full rollout |
| 🔀 **VirtualService** | Istio resource that splits traffic between stable and canary versions |
| 🎯 **DestinationRule** | Istio resource that defines the stable and canary subsets |
| 🚪 **Gateway** | Istio resource that handles incoming traffic to the service |
| 📊 **Health Monitoring** | Tracking error rates and response times to judge canary health |
| 🚨 **Emergency Rollback** | Fast reversion of all traffic to the stable version |
| 🪜 **Gradual Rollback** | Step-by-step reduction of canary exposure back to zero |
| 🔁 **Progressive Delivery** | Gradual exposure, continuous health checks, and scripted or automated rollback |

---

## 🌍 Real-World Applications

| Pattern | Role in Production Kubernetes Environments |
|---------|--------------------------------------------|
| 📉 **Gradual exposure** | Limits the impact of a bad release to a small share of traffic |
| 🩺 **Continuous health checks** | Detects problems before full rollout |
| ⏪ **Automated or scripted rollback** | Restores the stable version quickly when problems appear |
| 🚢 **Progressive delivery** | Foundation of safe release practices in production Kubernetes environments |

---

## 🏁 Conclusion

In this lab, you implemented a complete canary release workflow on Kubernetes using Istio: deploying stable and canary versions of a microservice, splitting traffic between them with a Gateway, DestinationRule, and VirtualService, and progressively increasing canary exposure while monitoring error rates and response times. You then simulated a real failure scenario by deploying a deliberately broken canary subset, routing live traffic to it, observing the resulting error rate increase, and executing both emergency and gradual rollback procedures to restore full traffic to the stable version. The key takeaway is that canary releases are only safe when paired with active health monitoring and a tested, fast rollback path — traffic-splitting configuration alone is not sufficient without the ability to detect problems and revert quickly. These same patterns of gradual exposure, continuous health checks, and automated or scripted rollback form the foundation of safe progressive delivery practices used in production Kubernetes environments.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Powered%20by-Al%20Nafi-0A66C2?style=for-the-badge)

**Happy Learning! 🚀**

</div>
