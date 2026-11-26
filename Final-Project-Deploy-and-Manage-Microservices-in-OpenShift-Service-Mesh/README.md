<div align="center">

# 📚 Bookinfo on OpenShift Service Mesh: Routing, Resilience, Security & Troubleshooting

### Canary Routing • Circuit Breaking • Strict mTLS • Authorization Policies • Diagnostics

![OpenShift](https://img.shields.io/badge/OpenShift-EE0000?style=for-the-badge&logo=redhatopenshift&logoColor=white)
![Istio](https://img.shields.io/badge/Istio-466BB0?style=for-the-badge&logo=istio&logoColor=white)
![Envoy](https://img.shields.io/badge/Envoy-AC6199?style=for-the-badge&logo=envoyproxy&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![Level](https://img.shields.io/badge/Level-Advanced-red?style=for-the-badge)

</div>

---

## 📑 Table of Contents

- [🎯 Overview](#-overview)
- [✅ Key Accomplishments](#-key-accomplishments)
- [🛡️ MITRE ATT&CK Mapping](#️-mitre-attck-mapping)
- [🧠 Key Concepts](#-key-concepts)
- [🌍 Real-World Applications](#-real-world-applications)
- [🏁 Conclusion](#-conclusion)

---

## 🎯 Overview

In this lab, you deployed the **Bookinfo** microservices application onto **OpenShift Service Mesh**, then configured traffic routing, resilience, and security policies across its services. The lab closed with a realistic troubleshooting scenario in which you diagnosed and repaired a broken routing configuration directly from cluster evidence.

---

## ✅ Key Accomplishments

| # | 🏅 Accomplishment | 📝 Description |
|---|------------------|----------------|
| 1 | 🚀 **Bookinfo Deployment** | Deployed the Bookinfo microservices application onto OpenShift Service Mesh |
| 2 | 🐤 **Weighted Canary Routing** | Configured weighted canary routing and load-balancing policies across multiple service versions |
| 3 | 🔁 **Resilience Features** | Layered in retries, timeouts, and outlier-detection circuit breaking |
| 4 | 🔐 **Strict Mutual TLS** | Secured inter-service communication with strict mTLS |
| 5 | 🚦 **Authorization Policies** | Applied fine-grained authorization policies and confirmed both allowed and denied call paths |
| 6 | 🛠️ **Troubleshooting a Broken VirtualService** | Used `istioctl analyze`, Envoy route dumps, and gateway logs to identify missing and overly restrictive match conditions, then authored your own corrected routing configuration rather than reapplying a known-good file |

---

## 🛡️ MITRE ATT&CK Mapping

| 🎯 Technique | 🆔 ID | 🔒 Lab Relevance |
|-------------|------|-----------------|
| Adversary-in-the-Middle | T1557 | Strict mTLS protects inter-service communication from interception |
| Network Sniffing | T1040 | Encrypted service-to-service traffic limits exposure of captured traffic |
| Remote Services | T1021 | Authorization policies restrict which services may call others |
| Valid Accounts | T1078 | Fine-grained policies limit what authenticated identities can access |

---

## 🧠 Key Concepts

| 🔑 Concept | 📖 Description |
|-----------|---------------|
| **Bookinfo** | Sample microservices application deployed onto the mesh in this lab |
| **Weighted Canary Routing** | Distributing traffic across multiple service versions by percentage |
| **Load-Balancing Policy** | Rules governing how traffic is spread across service versions |
| **Retries & Timeouts** | Resilience settings that handle transient failures and bound request duration |
| **Outlier Detection** | Circuit-breaking mechanism that identifies and ejects unhealthy endpoints |
| **Strict mTLS** | Mutual TLS enforced for all inter-service communication |
| **Authorization Policy** | Fine-grained rules defining which calls are allowed or denied |
| **VirtualService** | Istio resource defining routing and match conditions |
| **`istioctl analyze`** | Command-line analysis used to surface configuration issues |
| **Envoy Route Dump** | Proxy route configuration inspected to find routing mismatches |
| **Configuration Drift** | Divergence between intended and actual mesh configuration |

---

## 🌍 Real-World Applications

- 🔧 **Production service mesh operations** — The diagnostic workflow mirrors how mesh issues are found and fixed in production
- 🩹 **Repairing drift and partial deployments** — Configuration problems are identified and repaired directly from cluster evidence rather than from memory
- 🔐 **Secured service communication** — Strict mTLS with authorization policies controls which service-to-service paths are permitted

---

## 🏁 Conclusion

In this lab you deployed the Bookinfo microservices application onto OpenShift Service Mesh, configured weighted canary routing and load-balancing policies across multiple service versions, and layered in resilience features such as retries, timeouts, and outlier-detection circuit breaking. You then secured inter-service communication with strict mutual TLS and fine-grained authorization policies, confirming both allowed and denied call paths. The final task required you to work through a realistic troubleshooting scenario: given a broken VirtualService, you used `istioctl analyze`, Envoy route dumps, and gateway logs to identify the missing and overly restrictive match conditions, then authored your own corrected routing configuration rather than reapplying a known-good file. This mirrors the diagnostic workflow required in production service mesh operations, where configuration drift and partial deployments must be identified and repaired directly from cluster evidence rather than from memory.

---

<div align="center">

![Al Nafi](https://img.shields.io/badge/Powered%20by-Al%20Nafi-blue?style=for-the-badge)

**🎓 Lab Complete — Keep Building Resilient Service Meshes!**

</div>
