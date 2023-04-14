# Day 30 Task: Kubernetes Architecture

<p  align="center"><img  align="center"  src="https://kubernetes.io/images/kubernetes-horizontal-color.png"  /></p>

---
## Kubernetes Overview

- Kubernetes is a **portable**, **extensible**, **open source platform** for managing `containerized workloads` and `services`, that facilitates both **declarative configuration** and **automation**. 
- It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.
- **Google** open-sourced the **Kubernetes project in 2014**.Kubernetes combines over 15 years of Google's experience running production workloads at scale with best-of-breed ideas and practices from the community.

---
## Tasks

### What is Kubernetes?

- **`Kubernetes`** is a platform for managing containerized applications at scale. It automates **deployment**, **scaling**, and **management of applications** using a declarative approach and provides features like **self-healing**, **automatic scaling**, and **rolling updates**.
- It is built on a cluster architecture and offers a wide range of plugins and extensions for integration with other tools and services.

---
### Why do we call it k8s?

- The name **Kubernetes** originates from **Greek**, meaning **`helmsman`** or **`pilot`**. **`K8s`** as an abbreviation results from counting the `eight letters` between the **"K"** and the **"s"**.

---
### What are the benefits of using k8s?

- **`Scalability`**: Kubernetes makes it easy to `scale` your application **up** or **down** based on demand.It can automatically adjust the number of containers running your application to handle **increased traffic** or **reduce the number of containers** during periods of **low demand**.

- **`Resiliency`**: Kubernetes provides **self-healing capabilities** that can automatically **restart failed containers** or **replace them** with new ones to ensure that your application is always available.

- **`Flexibility`**: Kubernetes is **highly configurable** and can be adapted to fit a wide range of use cases.It can work with a variety of **container runtimes**, and **offers a wide range of plugins** and extensions for **integrating** with other tools and **services**.

- **`Portability`**: Kubernetes can be deployed across a variety of **cloud providers** and on-premises data centers, making it easy to move your applications between environments.

- **`Increased productivity`**: Kubernetes automates many of the tasks involved in deploying and managing containerized applications, freeing up developers to focus on building and improving their applications.

- **`Cost-effectiveness`**: Kubernetes allows for efficient use of resources by managing containers and applications in a highly optimized manner, **reducing costs** associated with **hardware and infrastructure**.

---
### Explain the architecture of Kubernetes.

- The **`Kubernetes (k8s)`** architecture consists of a `master node` and `worker nodes`. The master node controls the cluster and includes the **API server**, **etcd cluster**, and **control components** like the **Kubernetes Scheduler** and **Controller Manager**. 
- The `worker nodes` run the applications and include a **container runtime** and the **Kubernetes Node Agent**. Each pod in the cluster runs one or more containers and has its own `IP address` for communication. The k8s architecture is **scalable**, **fault-tolerant**, and **flexible** for managing containerized applications.

![K8-Architecture](https://user-images.githubusercontent.com/76991475/232131027-03b888a7-d4df-48aa-a6d2-c2009742cc5e.png)

### What is Control Plane?

- **`API Server`**: The `API server` is a component of the Kubernetes `control plane` that exposes the **Kubernetes API**.The API server is the **front end** for the Kubernetes control plane.

- **`etcd`**: `etcd` is a distributed **key-value** store that provides a reliable way to store data across a cluster of machines. It is used by Kubernetes as a backing store for all cluster data.

- **`Scheduler`**: The `scheduler` is a control plane component that watches for newly created pods with **no assigned node**, and selects a node for them to run on.

- **`Controller Manager`**: The `controller manager` is a daemon that embeds the **core control loops** shipped with Kubernetes. In Kubernetes, a `control loop` is a `non-terminating` `loop` that **watches the state of the cluster through the API server** and makes changes attempting to move the current state towards the desired state.

---
### Write the difference between kubectl and kubelets.

- **`kubectl`**: `kubectl` is a command-line tool for controlling Kubernetes clusters. It allows you to run commands against Kubernetes clusters from the terminal.

- **`kubelet`**: `kubelet` is an agent that runs on each node in the cluster. It makes sure that containers are running in a pod. It also **reports the health of the node** and **pod** to the master node.

---
### What is a Pod?

- A `pod` is the **smallest deployable unit** of computing that you can create and manage in `Kubernetes`. A pod is a group of `one or more containers`, with shared `storage/network`, and a `specification for how to run the containers`.

---
### What is a Node? 

- A `node` is a worker machine in Kubernetes, previously known as a `minion`. A node may be a `VM` or physical machine, depending on the cluster. Each node contains the services necessary to run **pods** and is managed by the master components.
```
{
  "kind": "Node",
  "apiVersion": "v1",
  "metadata": {
    "name": "10.240.79.157",
    "labels": {
      "name": "my-first-k8s-node"
    }
  }
}
```
**Note**: A `node` can have **multiple pods**, and the **Kubernetes master** automatically handles scheduling the pods across the nodes in the cluster.

---
### What is a Service?

- A **`service`** is an abstraction which defines a logical set of `pods` and a policy by which to access them. Services enable a loose coupling between dependent `pods`.

---
### Explain the role of the API server.

- The **API server** in Kubernetes (k8s) is a component that acts as a central hub for managing the k8s cluster. It `authenticates` and `authorizes users` or `services` before allowing them to access the cluster's resources. 
- It manages the resources of the cluster, such as **nodes**, **pods**, **services**, and **deployments**. It provides an API endpoint that allows **clients to interact** with the k8s cluster using **HTTP requests**.
- It also handles **scaling** and **scheduling of pods on worker nodes** based on **available resources** and **user-defined constraints**. Overall, the API server is a crucial component that enables the management of containerized applications at `scale in the k8s ecosystem`.

---