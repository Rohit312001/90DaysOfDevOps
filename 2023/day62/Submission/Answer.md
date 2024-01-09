# Day 62 : Terraform and Docker.

**Terraform** is an `Infrastructure as Code` tool for provisioning and managing cloud and on-premises infrastructure. It uses `declarative configurations` and supports various `cloud providers`. Terraform enables you to **plan** and **apply** changes **incrementally**, maintaining **infrastructure state**.

**Docker** is a `containerization platform` for packaging applications and their dependencies into portable containers. **Dockerfiles** define container configurations, while Docker Hub provides a **registry** for sharing `container images`. Docker is ideal for microservices, **CI/CD pipelines**, and ensuring consistent `application deployment` across different environments.

### What is Blocks in Terraform?

- A `"block"` in Terraform represents a particular kind of configuration stanza or section within a **Terraform configuration file.** Blocks are used to group related configuration settings together.
- Blocks have a specific structure and syntax. They start with a keyword followed by an opening curly brace `{` and end with a closing curly brace `}`. The contents within the **curly braces** define the configuration for that block.
- Common types of blocks in Terraform include `"provider"` blocks, `"resource"` blocks, `"module"` blocks, `"variable"` blocks, and `"output"` blocks.

```
provider "aws" {
  region = "us-east-1"
}
```

- In the above example of block type, the provider block defines the configuration for the `aws` provider. The provider block has a single argument, `region`, which specifies the `AWS region` to use.

### What is Resources in Terraform?

- A **"resource"** in Terraform represents an infrastructure object or entity that you want to manage using `Terraform`. Resources are the core building blocks of your infrastructure and can be thought of as the target entities you wish to **create**, **update**, or **destroy.**
- `Resource` blocks are defined within the configuration and follow a `specific syntax`. They typically include attributes that define the resource's properties and its configuration settings.

```
resource "aws_instance" "example" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}
```

- In the above example of resource type, the resource block defines an `aws_instance` resource named `example`. The resource block has two arguments, `ami` and `instance_type`, which specify the AMI ID and instance type to use.

### Before we start with Terraform and Docker, we need to install Docker and Terraform in our system on AWS EC2 instance.

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

### Note: In case Docker is not installed

```
sudo apt-get install docker.io
sudo docker ps
sudo chown $USER /var/run/docker.sock
```

![Screenshot from 2023-09-11 22-14-42](https://github.com/Rohit312001/GitDemo/assets/76991475/f6c2853e-d702-412e-bc20-26b569109496)

```
docker --version
```

## ![Screenshot from 2023-09-11 22-15-05](https://github.com/Rohit312001/GitDemo/assets/76991475/130e7bee-d1fe-442b-b84e-ab1f61812e20)

## Task-01:

- **Create a Terraform script with Blocks and Resources.**

```
mkdir terraform
cd terraform
sudo vim docker_terraform.tf
```

![Screenshot from 2023-09-11 21-46-56](https://github.com/Rohit312001/GitDemo/assets/76991475/2c8ba275-cbb9-42a6-8246-295e9aa5f457)

- **`Step 1:`** Create a `provider` block for `docker`.

![imageedit_3_3217547238](https://github.com/Rohit312001/GitDemo/assets/76991475/90d89866-539d-40d1-807e-f20896197f11)

```
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
        }
    }
  }
```

### Note: kreuzwerker/docker, is shorthand for registry.terraform.io/kreuzwerker/docker.

- - **`Step 2:`** Create a `resources` block for `docker`.

![imageedit_6_5114734835](https://github.com/Rohit312001/GitDemo/assets/76991475/751ab409-d9d6-43c4-ab4c-a5306a590552)

```
provider "docker" {}
```

## Task-02:

**Create a resource Block for an nginx docker image.**

- **`Step 1:`** Create a `resource` block for `docker_image`.

![imageedit_9_8175977380](https://github.com/Rohit312001/GitDemo/assets/76991475/7ec070b4-19b9-4bbf-ace6-bfada3888ace)

```
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}
```

- **`Step 2:`** Create a `resource` block for `docker_container`.

![imageedit_13_5271309647](https://github.com/Rohit312001/GitDemo/assets/76991475/3f435fb2-e532-4213-a81c-16a677ae7ac3)

```
resource "docker_container" "nginx" {
 image = docker_image.nginx.latest
 name  = "tutorial"
 ports {
   internal = 80
   external = 80
 }
}
```

- **`Step 3:`** Now let's initialize the `terraform`.

```
terraform init
```

![Screenshot from 2023-09-11 22-16-22](https://github.com/Rohit312001/GitDemo/assets/76991475/631d4e2c-aa60-46c5-893b-50b36e7329cb)

- **`Step 4:`** Now let's plan the `terraform`.

```
terraform plan
```

![Screenshot from 2023-09-11 22-16-42](https://github.com/Rohit312001/GitDemo/assets/76991475/f4837dae-ce78-43c3-bf1c-3ca1fc7ae138)

- **`Step 5:`** Now let's apply the `terraform`.

```
terraform apply
```

![Screenshot from 2023-09-11 22-17-46](https://github.com/Rohit312001/GitDemo/assets/76991475/7432c078-40af-4244-b930-c548b45eff1e)

- **`Step 6:`** Now let's verify the `docker container`.

![Screenshot from 2023-09-11 22-18-00](https://github.com/Rohit312001/GitDemo/assets/76991475/1bb67ec9-2cbc-4257-855f-d9f6971e07cb)

```
docker ps
```

![Screenshot from 2023-09-11 22-19-00](https://github.com/Rohit312001/GitDemo/assets/76991475/d894865f-cb13-4dbf-a1b4-f4348c82400f)

- **`Step 7:`** Now let's check the `nginx` page on public ip of EC2 instance.

![imageedit_16_7114875880](https://github.com/Rohit312001/GitDemo/assets/76991475/58a2f6aa-0ab8-4a08-ae04-6b592dfb9c40)

---
