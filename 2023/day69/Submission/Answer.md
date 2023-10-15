# Day 69 : Meta-Arguments in Terraform.

### What are Meta-Arguments?

- In Terraform, **"meta-arguments"** are not a specific concept or terminology used. However, I believe you might be referring to what are commonly known as `"meta-arguments"` in the context of Terraform configuration files. These are arguments that apply at the **resource** or **module level** rather than being specific to a particular resource attribute.
- When you define a `resource block` in Terraform, by default, this specifies one resource that will be created. To manage several of the same resources, you can use either **count** or **for_each**, which removes the need to write a separate block of code for each one. Using these options reduces overhead and makes your code neater.
- In Terraform, configuration files are written in **HashiCorp Configuration Language (HCL)** or HashiCorp Configuration Language Version 2 (HCL2), and you use various blocks and arguments to define infrastructure resources. Here are some common meta-arguments:

1. **depends_on:** This meta-argument is used to specify explicit `dependencies` between **resources.** It ensures that one resource is created or updated only after the resources it depends on have been successfully `created or updated`. This is often used when resource relationships cannot be inferred automatically.

- **Example of depends_on meta-argument:**

```t
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_security_group" "example" {
  name        = "example"
  description = "Example security group"
}

resource "aws_network_interface_sg_attachment" "example" {
  security_group_id = aws_security_group.example.id
  network_interface_id = aws_instance.example.network_interface_ids[0]

  depends_on = [aws_instance.example, aws_security_group.example]
}
```

2. **count:** The count meta-argument allows you to create **multiple instances** of a resource based on a `specified count.` It can be useful when you want to create multiple similar resources, such as **multiple EC2 instances.**

- **Example of count meta-argument:**

```t
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  count         = 3
}
```

3. **for_each:** The **for_each meta-argument** is `similar` to `count`, but it allows you to specify a **map or a set of values** to create resources based on the elements of the map or set. It's useful when you want to create different instances with unique configurations.

- **Example of for_each meta-argument:**

```t
resource "aws_instance" "example" {
  for_each = {
    server1 = "ami-12345678"
    server2 = "ami-87654321"
  }

  ami           = each.value
  instance_type = "t2.micro"
}
```

-

4. **provider:** The **provider block** specifies the `cloud` or `infrastructure` provider that Terraform should use for a particular set of resources. It allows you to work with `multiple providers` within the same configuration.

- **Example of provider meta-argument:**

```t
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

provider "google" {
  credentials = file("google-creds.json")
  project     = "my-gcp-project"
}
```

5. **lifecycle:** The **lifecycle meta-argument** is used to `configure the lifecycle` of a resource. It allows you to `prevent` a resource from being `destroyed` or `updated` in certain situations.

- **Example of lifecycle meta-argument:**

```t
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  lifecycle {
    prevent_destroy = true
  }
}
```

- Thus,these are some common examples of what could be referred to as **"meta-arguments"** in Terraform configuration. They help you manage dependencies, control resource instantiation, and specify providers at a higher level of the configuration.

---

## Task-01

- **Create a Infrastructure as Code and make use of `count` meta-argument to create multiple instances of a resource.**

- **Step-01:** Create a file named `count_main.tf` and add the below code.

```t
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"
}
provider "aws" {
  access_key = "use your user IAM access key"
  secret_key = "use your user IAM secret key"
  region     = "ap-south-1"
}
resource "aws_instance" "server" {
  count         = 3
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"
  tags = {
    Name = "rohit_server ${count.index}"
  }
}
```

![imageedit_1_9471924854](https://github.com/Rohit312001/GitDemo/assets/76991475/d4fc3aed-6ad2-47bc-92a7-3727cdd53843)

- **In this Terraform Code:**

1. Specifies the required **Terraform providers** and their versions. In this case, it requires the aws provider from the `Terraform Registry `with a version constraint of approximately `4.16`. It also specifies that this configuration requires at least **Terraform version 1.2.0.**

2. Configures the AWS **provider, specifying the AWS access key, secret key, and the AWS region** to use for resource provisioning. Note that it's recommended to use `AWS credentials securely`, such as via **environment variables, IAM roles, or other methods.**

3. Defines an **AWS EC2 instance resource** named "server." It creates three instances of type **t2.micro** using the specified Amazon Machine Image (AMI). Each instance is tagged with a unique Name that includes its count index.

- **Step-02:** Initialize Terraform.

```t
terraform init
```

![Screenshot from 2023-10-15 15-06-15](https://github.com/Rohit312001/GitDemo/assets/76991475/e6f3fd81-9687-4fe7-8e0a-a3bfd8bd29e0)

- **Step-03:** Now, apply the Terraform code.

```t
terraform apply
```

![Screenshot from 2023-10-15 15-06-29](https://github.com/Rohit312001/GitDemo/assets/76991475/182aa12f-bd70-4a5e-a601-78ce56f8ca7d)

- we can see we have successfully applied the code.

![Screenshot from 2023-10-15 15-06-42](https://github.com/Rohit312001/GitDemo/assets/76991475/35994ee4-fddc-4f3f-8574-1d3f8e2b3131)

- **Step-04:** Now, we can verify the instances have created on the AWS console.

![Screenshot from 2023-10-15 15-07-08](https://github.com/Rohit312001/GitDemo/assets/76991475/de42e529-190e-4beb-a1cb-30ab1bbe15b8)

---

## Task-02

- **Create a Infrastructure as Code and make use of `for_each` meta-argument to create multiple instances of a resource.**

- **Step-01:** Create a file named `for_each.tf` and add the below code.

```t
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"
}
provider "aws" {
  access_key = "use your user IAM access key"
  secret_key = "use your user IAM secret key"
  region     = "us-east-1"
}
locals {
  ami_ids = toset([
    "ami-041feb57c611358bd",
    "ami-053b0d53c279acc90",
  ])
}
resource "aws_instance" "server" {
  for_each      = local.ami_ids
  ami           = each.key
  instance_type = "t2.micro"
  tags = {
    Name = "rohit_server ${each.key}"
  }
}
```

![imageedit_2_6619159455](https://github.com/Rohit312001/GitDemo/assets/76991475/8d3f8719-d4d9-44ea-9bfa-2037ae8d99eb)

- **In this Terraform Code:**

1. Specifies the required **Terraform providers** and their versions, similar to your `original configuration.`

2. Configures the **AWS provider** with your `access key, secret key, and the AWS region.`

3. Uses the local block to define a set of **AMI IDs** in the **ami_ids local variable.**

4. Defines an AWS EC2 instance resource named `"server"` using a **for_each loop.** This loop creates instances for each AMI ID specified in the ami_ids local variable. The each.key refers to the current element `(AMI ID)` in the loop.

- **Step-02:** Initialize Terraform.

```t
terraform init
```

![Screenshot from 2023-10-15 15-21-50](https://github.com/Rohit312001/GitDemo/assets/76991475/66735b9f-0ab5-4cc1-9158-75b403f63d12)

- **Step-03:** Now, apply the Terraform code.

```t
terraform apply
```

![Screenshot from 2023-10-15 15-22-04](https://github.com/Rohit312001/GitDemo/assets/76991475/e93fed09-9724-4f53-be0f-24ed02ec4c9c)

- we can see we have successfully applied the code.

![Screenshot from 2023-10-15 15-22-20](https://github.com/Rohit312001/GitDemo/assets/76991475/e94aa0b1-5bec-41e9-aed0-4c5c7ec10bb5)

- **Step-04:** Now, we can verify the instances have created on the AWS console.

![Screenshot from 2023-10-15 15-23-53](https://github.com/Rohit312001/GitDemo/assets/76991475/127d075a-3b1a-4354-8131-63bc81209c47)

---

## Happy Terraforming:)
