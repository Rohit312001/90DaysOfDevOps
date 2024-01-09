# Day 37 Task: Kubernetes Important Questions.

## Questions:

### 1.What is Kubernetes and why it is important?
- **`Kubernetes`** is an `open-source` **container orchestration tool** developed by `Google` to manage containerized applications in different types of environments such as `physical`, `virtual`, and `cloud infrastructure`. It is used to **automate** the **deployment**, **scaling**, and **management of containerized applications**.
- Kubernetes is important because it allows you to deploy **containerized applications** to a **cluster** without tying them specifically to individual machines. Kubernetes automates the **distribution** and **scheduling** of application containers across a cluster in a more efficient way.

### 2.What is difference between docker swarm and kubernetes?
- **`Docker Swarm`** is a **container orchestration tool**, meaning that it allows the user to manage multiple containers deployed across multiple host machines. **`Kubernetes`** is also a **container orchestration tool**. However, it is more extensive than Docker Swarm and is more popular as well.
- **`Docker Swarm`** is a **native clustering** or **orchestration tool** for **Docker**. It allows us to create and **access a pool of Docker hosts** using the full suite of Docker tools. **`Kubernetes`** is an **open-source container orchestration tool** developed by **Google**.
- **`Docker Swarm`** is **easy to set up** and **use**. **`Kubernetes`** is **complex** to set up and **use**.
- **`Docker Swarm`** is **less secure** than **Kubernetes**. **`Kubernetes`** is **more secure** than **Docker Swarm**. 
- **`Docker Swarm`** is **less scalable** than **Kubernetes**. **`Kubernetes`** is **more scalable** than **Docker Swarm**.
- **`Docker Swarm`** is **less flexible** than **Kubernetes**. **`Kubernetes`** is **more flexible** than **Docker Swarm**.
- **`Docker Swarm`** is **less portable** than **Kubernetes**. **`Kubernetes`** is **more portable** than **Docker Swarm**.
- **`Docker Swarm`** is **less efficient** than **Kubernetes**. **`Kubernetes`** is **more efficient** than **Docker Swarm**.

### 3.How does Kubernetes handle network communication between containers?
- **`Kubernetes`** uses **`kube-proxy`** to **handle network communication** between **containers**. **`Kube-proxy`** is a **network proxy** that runs on each node in the cluster. It maintains `network rules on nodes`. These network rules allow network communication to your Pods from network sessions inside or outside of your cluster.
- **`Kube-proxy`** uses the **`iptables`** utility to **set up rules** for handling **network operations**. **`Kube-proxy`** sets up **rules** to **forward** all **traffic** to **Services** (that have the **`type=NodePort`** or **`type=LoadBalancer`**).

### 4.How does Kubernetes handle scaling of applications?
- **Kubernetes** lets you `automate many management tasks`, including `provisioning` and `scaling`.
- The Kubernetes autoscaling mechanism uses two layers:
1. **`Pod-based scaling—supported`** by the **Horizontal Pod Autoscaler (HPA)** and the newer **Vertical Pod Autoscaler (VPA)**.
2. **`Node-based scaling`**— supported by the **Cluster Autoscaler**.

- ###  Horizontal Pod Autoscaler (HPA):
1. When the level of application usage changes, you need a way to `add or remove pod replicas`. Once configured, the **Horizontal Pod Autoscaler** manages workload scaling automatically.
2. The **Horizontal Pod Autoscaler** (HPA) automatically scales the `number of pods` in a `replication controller`, `deployment`, `replica set` or `stateful set` based on observed **CPU utilization** (or, with custom metrics support, on some other application-provided metrics).

- ###  Vertical Pod Autoscaler (VPA):
1. The **Vertical Pod Autoscaler** (VPA) frees you from having to think about the `resource requirements` of your containers. It automatically sets the **resource requirements** for your containers based on usage patterns.
2. Some **workloads** can require short periods of `high utilization`. Increasing request limits by default would entail wasting unused resources, and would limit the nodes that can run those workloads.

- ### Cluster Autoscaler:
1. The **Cluster Autoscaler** automatically adjusts the `number of nodes` in a `cluster` when pods fail to launch due to `lack of resources` in the `cluster`. It can also scale down the `number of nodes` in the `cluster` if `nodes` are `underutilized` and their `pods` can be `freed` up by `being moved` onto `other nodes` in the `cluster`.

### 5.What is a Kubernetes Deployment and how does it differ from a ReplicaSet ?
- A **`ReplicaSet`** is a **`Pod`** **`controller`** that ensures a specified number of **`Pod`** replicas are running at any given time. However, a **`ReplicaSet`** does not guarantee that a **`Pod`** is `scheduled` onto a `node`. To `guarantee` that a `Pod` is `scheduled`, you can use a **`Deployment`**.
- A **`Deployment`** is a **`higher-level`** concept that manages **`ReplicaSets`** and provides **declarative updates** to **`Pods`** along with a lot of other useful features. Therefore, you should use **`Deployments`** instead of **`ReplicaSets`**.

### 6.Can you explain the concept of rolling updates in Kubernetes?
- **`Rolling updates`** allow **Deployments' update** to take place with **zero downtime** by incrementally updating **Pods** instances with new ones. The new **Pods** will be **scheduled** on **Nodes** with available resources.

### 7.How does Kubernetes handle network security and access control?
- **Networking**is a particularly `complex part` of `Kubernetes`. `Networks` can be configured in a variety of ways. You might use a service mesh, but you might not. Some resources in your cluster may interface only with `internal networks`, while others require `direct access to the Internet`. **Ports**, **IP addresses**, and other network attributes are usually `configured dynamically`, which can make it difficult to keep track of what is happening at the network level.
- `Network policies` define `rules` that govern how `pods can communicate with each other` at the `network level`.In addition to providing a **systematic means of controlling pod communications**, network policies offer the important advantage of **allowing admins to define resources** and associated **networking rules based on context like pod labels and namespaces**.
**`Access COntrol:`**
- `Access control` in `Kubernetes` involves **authentication and authorization mechanisms**.
- **RBAC**, roles, and role bindings are used for defining permissions.
- **Cluster roles** and bindings provide global-level access control.
- **Admission controllers** validate and enforce access policies.
- **Security contexts** and **auditing enhance security** and **accountability**.

### 8.Can you give an example of how Kubernetes can be used to deploy a highly available application?
- **Kubernetes** achieves high availability for applications by using features such as **replication**, **scaling**, **pod anti-affinity**, **health checks**, **self-healing**, **service discovery**, **load balancing**, and **persistent storage**. These features distribute the `workload`, `monitor application health`, ensure `uninterrupted service`, `balance traffic`, and maintain `data integrity`, resulting in a highly available application deployment.

### 9.What is namespace is kubernetes? Which namespace any pod  takes if we don't specify any namespace?
- In `Kubernetes`, a namespace is a `virtual cluster` within a `physical cluster`. It provides a way to divide and `segregate resources` and `objects`, such as `pods`, `services`, and `deployments`, into distinct groups. **Namespaces** are primarily used to create logical boundaries and enable multi-tenancy in a Kubernetes cluster.
- **If you don't specify a namespace for a pod**, it will be created in the **default namespace**. The default namespace is the `initial namespace` created by Kubernetes, and if no specific namespace is specified, all objects are assumed to belong to this default namespace. 
- **`Note:`**It's worth noting that you can create and use custom namespaces to organize and manage resources based on your requirements, enabling better isolation and resource allocation within the cluster.

### 10.How ingress helps in kubernetes?
- **`Ingress`** acts as a `traffic controller` and `load balancer` in Kubernetes.
- It provides `external access` to services `running within the cluster`.
- `Ingress` enables `routing of incoming traffic` based on `host`, `path`, or `other criteria`.
- It supports `load balancing` to distribute `traffic across multiple backend services`.
- Ingress allows for `TLS termination`, `handling SSL/TLS encryption at the edge`.
- It simplifies the management and exposure of multiple services behind a single entry point.

### 11.Explain different types of services in kubernetes?
- A **Kubernetes Service** is an `abstraction` which defines a logical set of Pods running somewhere in your cluster, that all provide the same functionality. When created, each Service is assigned a **`unique IP address (also called clusterIP).`** 
- This `address` is tied to the `lifespan of the Service`, and will not change while the Service is alive. Pods can be configured to talk to the Service, and know that communication to the Service will be automatically load-balanced out to some pod that is a member of the Service.

### Types of Services in Kubernetes:

![6403ec82472efb1d6ff79f4e_d](https://github.com/Rohit312001/90DaysOfDevOps/assets/76991475/2fffd76e-1ee0-4fb3-b6ba-7f3fa33e6e3e)

- **`Visual Representation of Services in Kubernetes:`**

![1_tnK94zrEwyNe1hL-PhJXOA](https://github.com/Rohit312001/90DaysOfDevOps/assets/76991475/bec9683a-08b9-45ac-9df0-aafb840aeded)

### 12.Can you explain the concept of self-healing in Kubernetes and give examples of how it works?
- **`Auto-Healing`** : **Auto-healing** is a feature that allows `Kubernetes to automatically restart containers` that **fail** for various reasons. It is a very useful feature that helps to `keep your applications up and running`.

- **`Auto-Scaling`** : **Auto-scaling** is a feature that allows `Kubernetes to automatically scale the number of pods` in a deployment based on the resource usage of the existing pods.

![Screenshot from 2023-05-05 19-53-08](https://user-images.githubusercontent.com/76991475/236506510-793f4012-4add-49ab-aa19-332f1a4c776a.png)

Here on purpose I have killed the `pod` to check the **`auto-healing`** feature.
for **`Auto scaling`** we use `replica set`.

### 13.How does Kubernetes handle storage management for containers?
- A **`PersistentVolume (PV)`** is a piece of `storage in the cluster `that has been provisioned by an administrator or dynamically provisioned using Storage Classes. 
- It is a resource in the cluster just like a node is a cluster resource. `PVs are volume` plugins like `Volumes`, but have a lifecycle independent of any individual Pod that uses the PV. 
- This API object captures the details of the implementation of the storage, be that NFS, iSCSI, or a cloud-provider-specific storage system.

- A **`PersistentVolumeClaim (PVC)`** is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). Claims can request specific size and access modes (e.g., they can be mounted `ReadWriteOnce`, `ReadOnlyMany` or `ReadWriteMany`, see **`AccessModes`**.)

### 14.How does the NodePort service work?
- A **NodePort** service in `Kubernetes` exposes a `specific port` of a service to the outside world.
- `Each worker node` in the cluster listens on the `assigned NodePort` and `forwards incoming traffic to the service`.
- **NodePort services** are assigned a `random port` from the range **`30000-32767`**.
- `External clients` access the `NodePort service` using the node's `IP address` or `hostname` along with the `assigned NodePort`.
- `Load balancing` is automatically handled across `worker nodes` hosting the service.
- Security measures like `firewall rules` or `network policies` should be implemented to `control access` and `ensure security`.

### 15.What is a multinode cluster and single-node cluster in Kubernetes?
- **`Multinode Cluster:`** A `multinode cluster` consists of `multiple worker nodes` and a `control plane`. Each **worker node** is a separate `physical` or `virtual machine` that `runs containerized applications`. The control plane, typically consisting of multiple master nodes, manages and orchestrates the worker nodes. A multinode cluster offers **scalability, high availability, and fault tolerance** as the `workload` is distributed across `multiple nodes`.

- **`Single-Node Cluster:`** A `single-node cluster`, as the name suggests, comprises only `one worker node` and a `control plane`. Both the `worker node` and `control plane run on the same physical or virtual machine`. In this setup, all Kubernetes components and the `workload are running on a single node`. A single-node cluster is often used for **development**, **testing**, or learning purposes when you don't require the full capabilities of a **multinode cluster**.

### 16.Difference between create and apply in kubernetes?
- **`kubectl apply`** is used to `create` and `update` a resource in Kubernetes. If the resource does not exist, it will be created. If the resource already exists, it will be updated with the new configuration.
- **`kubectl create`** is used to `create` a resource in Kubernetes. If the resource already exists, it will throw an error.

---