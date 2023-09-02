# Day 60: Installation of Terraform and Its Significance.

![1_Q3vaZO0shJ4Iw4B5ABJl7w-1024x547](https://github.com/Rohit312001/GitDemo/assets/76991475/e6270ef3-804d-40b3-82fe-b5bc36a5fbfb)

### What is Terraform?

- **`Terraform`** is an `infrastructure as code (IaC) tool` that allows you to `create`, `manage`, and `update infrastructure resources` such as `virtual machines`, `networks`, and `storage in a repeatable`, `scalable`, and `automated way`.
- **Terraform** is an `open-source` tool created by `HashiCorp` and is written in the `Go programming language`. It is available for **Windows**, **Linux**, and **macOS**.

## Task 1: Install Terraform on AWS EC2 Instance

- **`Step 1:`** Create an `Amazon EC2` instance.

![Screenshot from 2023-09-02 23-59-24](https://github.com/Rohit312001/GitDemo/assets/76991475/a79616d5-fb58-4d8e-aff3-370066f6cc75)

- **`Step 2:`** Now let's install **Terraform** on our EC2 instance and for ensurance of system is up to date let's first install **gnupg**,**software-properties-common** and **curl**.

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

![Screenshot from 2023-09-02 23-36-51](https://github.com/Rohit312001/GitDemo/assets/76991475/788848ec-dbe2-4a41-aaa0-b833018e6bef)

- **`Step 3:`** Now let's add **HashiCorp** GPG key.

```
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

![Screenshot from 2023-09-02 23-37-18](https://github.com/Rohit312001/GitDemo/assets/76991475/fb9531c7-6d1a-4a0d-a5cc-1787d0eec038)

- **`Step 4:`** Verify the `key's fingerprint`.

```
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
```

![Screenshot from 2023-09-02 23-37-39](https://github.com/Rohit312001/GitDemo/assets/76991475/27eac46f-74cf-45b6-b9df-d69a1b2a569e)

- **`Step 5:`** Now let's add the **HashiCorp** `repository`.

```
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```

![Screenshot from 2023-09-02 23-37-59](https://github.com/Rohit312001/GitDemo/assets/76991475/92b62fa8-bc3c-4453-a629-6c6f78b06130)

- **`Step 6:`** Now let's update the `apt` repository.

```
sudo apt update
```

![Screenshot from 2023-09-02 23-38-25](https://github.com/Rohit312001/GitDemo/assets/76991475/41ccb0e5-bfd5-426b-9bbc-17c745be72ad)

- **`Step 7:`** Now let's install **Terraform**.

```
sudo apt-get install terraform
```

![Screenshot from 2023-09-02 23-39-03](https://github.com/Rohit312001/GitDemo/assets/76991475/7b44352e-7360-4a1f-8921-85281370f15f)

- **`Step 8:`** Now let's verify the **Terraform** installation.

```
terraform --version
```

![Screenshot from 2023-09-02 23-39-31](https://github.com/Rohit312001/GitDemo/assets/76991475/c8401c6b-9408-4814-bb0c-7522e08cf67d)

- **`Step 9:`** To enable the `tab completion` and then `install the autocomplete` package.

```
touch ~/.bashrc
terraform -install-autocomplete
```

![Screenshot from 2023-09-02 23-40-04](https://github.com/Rohit312001/GitDemo/assets/76991475/cf8d8e91-4e86-49f7-9284-40349d108e80)

---

## Task 2: Need of Terraform

### Why we use terraform?

- **Infrastructure Automation:** Terraform automates the provisioning and management of infrastructure resources, reducing manual effort and increasing efficiency.

- **Declarative Language:** It uses a declarative language (HCL) to define infrastructure as code, making it easy to read, write, and understand.

- **Multi-Cloud Support:** Terraform supports multiple cloud providers and on-premises infrastructure, enabling multi-cloud and hybrid cloud deployments.

- **Resource Abstraction:** Terraform abstracts infrastructure resources into reusable modules, facilitating code reuse and maintainability.

- **State Management:** It maintains a state file to track the current infrastructure state, enabling Terraform to understand and manage desired state changes.

- **Version Control:** Infrastructure code can be version-controlled using tools like Git, allowing for collaboration, history tracking, and code reviews.

**Immutable Infrastructure:** Terraform promotes the concept of immutable infrastructure, where changes are made by replacing resources, enhancing predictability and rollback capabilities.

**Dependency Management:** Terraform handles resource dependencies, ensuring resources are provisioned in the correct order.

**Plan and Apply:** It provides a "plan" phase to preview changes before applying them, reducing the risk of unexpected disruptions during deployments.

**Community and Ecosystem:** Terraform boasts a robust community and ecosystem with a wealth of pre-built modules and plugins, simplifying the adoption of best practices and solutions.

### What is Infrastructure as Code(IaC)?

- **Infrastructure as Code (IaC)** is the **managing** and **provisioning of infrastructure** through `code instead of through manual processe configuration files` are created that contain your infrastructure specifications, which makes it easier to edit and distribute configurations.
- It also ensures that you `provision the same environment every time`. By codifying and documenting your configuration specifications, `IaC aids configuration management` and `helps you to avoid undocumented`, `ad-hoc configuration changes`.
- **Version control** is an important part of **IaC**, and your configuration files should be under source control just like any other software source code file. `Deploying your infrastructure as code` also means that you can `divide your infrastructure into modular` components that can then be combined in different ways through `automation`.

### What is Provider?

- A "provider" refers to a `component or plugin` that allows you to interact with and` manage resources in a specific cloud` or infrastructure platform. Providers are essential in Terraform as they act as connectors between your `IaC code` and the `target infrastructure` where you want to **create**, **configure**, or **manage resources.**

```
# Define the AWS provider with your credentials
provider "aws" {
  region = "us-east-1"
}
```

### What is Resource?

- A "resource" refers to a `specific infrastructure` component or entity that you want to **create**, **configure**, or **manage**. Resources can represent a wide range of infrastructure elements, such as **virtual machines**, **databases**, **networks**, **storage**, **load balancers**, and more, depending on the cloud provider or technology being used.

```
# Define an AWS EC2 instance resource
resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name      = "my-keypair"
}

```

### Whats is State file in terraform?

- The **Terraform state file is a JSON or binary file** that contains information about the resources you've defined in your Terraform configuration. It includes details such as `resource IDs`, `attributes`, `dependencies`, and `other metadata necessary` for Terraform to understand the current `state of your infrastructure`.

- The `state file` is typically named **`terraform.tfstate`**, but it can be customized to have different names or be stored remotely in services like **AWS S3 or HashiCorp Consul**. It is essential to ensure that this file is managed and secured properly because it contains sensitive information about your infrastructure.

### What’s the importance of it ?

- **`Resource Tracking:`** The state file keeps a record of the current state of your infrastructure, including the status and attributes of resources. This tracking is essential for Terraform to understand the existing infrastructure and make necessary changes to achieve the desired configuration.

- **`Dependency Resolution:`** Terraform uses the state file to determine the dependency relationships between resources. This ensures that resources are created, updated, or destroyed in the correct order, preventing issues related to resource dependencies.

- **`Change Detection:`** During a Terraform apply operation, the state file is compared to the desired configuration defined in your code. It helps Terraform identify what changes are required to align the infrastructure with the specified configuration.

- **`Resource Deletion:`** The state file helps Terraform identify resources that are no longer part of your configuration. When you remove a resource from your Terraform code, Terraform can safely delete the corresponding resource in the infrastructure.

- **`Concurrency Control:`** In team environments, the state file facilitates concurrency control. It prevents multiple team members from making conflicting changes to the same resources simultaneously, reducing the risk of data corruption or conflicts.

### What is Desired and Current State?

**Desired State:**

- **`Definition:`** The desired state is a representation of how you want your infrastructure to be configured based on your IaC code. It's a set of declarative instructions that specify what resources should exist, how they should be configured, and how they should be interconnected.
- **`Purpose:`** The desired state is the ideal configuration you aim to achieve when you apply your IaC code using tools like Terraform. It serves as the source of truth for your infrastructure's intended state.
- `For example`, in a Terraform configuration, the desired state might specify that you want to create an AWS EC2 instance with specific attributes, such as a particular instance type, operating system, and security group.

**Current State:**

- **`Definition:`** The current state represents the actual state of your infrastructure as it exists at a given point in time. It includes information about the resources that currently exist, their attributes, and their current configurations.
- **`Purpose:`** The current state is determined by inspecting the infrastructure itself or by referencing a state file that tracks the state of resources. It is used to understand the current state of your infrastructure and to determine what actions need to be taken to bring it in line with the desired state.
- `For example`, if you have a running EC2 instance in your AWS account with specific attributes, the current state would reflect the attributes and configuration of that running instance.

---
