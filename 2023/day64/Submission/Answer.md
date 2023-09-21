# Day 64 : Terraform with AWS

Provisioning with AWS involves setting up and managing cloud resources on Amazon Web Services, a leading cloud computing platform. AWS offers a wide range of services, from virtual servers (EC2) to databases (RDS), enabling users to create, configure, and scale their infrastructure as needed. This process can be done through the AWS Management Console, CLI, or Infrastructure as Code (IaC) tools like AWS CloudFormation. It allows businesses and individuals to leverage the power of the cloud without the hassle of managing physical hardware, making it easier to build and scale applications and services.

### What is AWS-CLI?

- The **AWS CLI (Amazon Web Services Command Line Interface)** is a versatile `command-line` tool that enables users to interact with and manage a wide range of AWS services directly from the command line or through `scripts`. It facilitates tasks such as `resource provisioning`, `application deployment`, and `security management`, making it invaluable for **developers**, **administrators**, and **DevOps professionals**. AWS CLI is `platform-agnostic`, `supporting Windows`, `macOS`, and `Linux`, and offers features for access control and customizable output formats, empowering users to efficiently automate and control their AWS resources and workflows.

### Installation of AWS CLI on EC2 Instance.

- To install the AWS CLI on an EC2 instance, you must first connect to the instance using SSH. Once connected, you can install the AWS CLI using the following command:

```
sudo apt update
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

![Screenshot from 2023-09-21 09-17-00](https://github.com/Rohit312001/GitDemo/assets/76991475/072c4dee-ca40-4ddb-93be-0f9e543e89ce)

- After Installation Check the version of AWS CLI using the following command:

```
aws --version
```

![Screenshot from 2023-09-21 09-17-34](https://github.com/Rohit312001/GitDemo/assets/76991475/36983c96-be78-4b43-8d41-bb754fee6c22)

### What is IAM User?

- An **IAM (Identity and Access Management)** user in `Amazon Web Services (AWS)` is an entity representing an individual, system, or application within an AWS account, granting them **unique credentials** and **permissions to access** and manage AWS resources securely. IAM users help enforce the principle of least privilege by ensuring users and systems only have the necessary permissions, enhancing overall account security and access control.

- **Step 1** : Create an **IAM User** in AWS Console for that go to **Services** and search for **IAM** and click on it to Create an User.

![Screenshot from 2023-09-21 09-19-45](https://github.com/Rohit312001/GitDemo/assets/76991475/4f969f21-6ae2-4524-8b05-394924a6bfb5)

- **Step 2** : Specify the **User Name** and select the **Access Type** as **Programmatic Access** and click on **Next: Permissions**.

![Screenshot from 2023-09-21 09-20-34](https://github.com/Rohit312001/GitDemo/assets/76991475/9eb57799-d20d-4af3-850d-ff3e6a4ea8a0)

- **Step 3** : Select the **Attach Policies Directly** and add the policy **AmazonEC2FullAccess** and click on **Next: Tags** and then click on **Next: Review**.

![Screenshot from 2023-09-21 09-22-08](https://github.com/Rohit312001/GitDemo/assets/76991475/6c238f9a-07ae-4bf5-9509-ed56807639b6)

- **Step 4** : Review the details and click on **Create User**.

![Screenshot from 2023-09-21 09-22-55](https://github.com/Rohit312001/GitDemo/assets/76991475/ed308172-6c67-496a-8eb5-bea6b873ac9b)

- **Step 5** : Now Click on User and go to **Security Credentials** and click on **Create Access Key**.

![Screenshot from 2023-09-21 09-24-36](https://github.com/Rohit312001/GitDemo/assets/76991475/0f7bb218-bdbd-4580-b8f1-fa16370fe848)

- **Step 6** : Download the **.csv** file and save it in your local machine.

![Screenshot from 2023-09-21 09-25-18](https://github.com/Rohit312001/GitDemo/assets/76991475/0e511f87-c96d-4360-abbc-2cc6d4146b82)

- **Step 7** : Now Configure the AWS CLI using the following command:

```
aws configure
```

![Screenshot from 2023-09-21 09-27-40](https://github.com/Rohit312001/GitDemo/assets/76991475/70271cf5-4a04-4338-aef4-07b7c4994369)

### Let's Install the required providers for Terraform.

```
# Define required providers and their versions.
terraform {
  required_providers {
    # Declare the AWS provider with its source and version constraints.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16" # Use version 4.x of the AWS provider.
    }
  }

  # Set the minimum required Terraform version.
  required_version = ">=1.2.0"
}

# Configure the AWS provider with your desired region.
provider "aws" {
  region = "ap-south-1" # Specify the AWS region (e.g., Asia Pacific - Mumbai).
}
```

- Create a file **main.tf** and paste the above code in it.

![Screenshot from 2023-09-21 09-32-56](https://github.com/Rohit312001/GitDemo/assets/76991475/1677524c-875c-400e-919c-ae4e313d6c96)

---

## Task 1 : Provision an AWS EC2 instance using Terraform.

```
# Declare required providers and their versions.
terraform {
  required_providers {
    # Define the AWS provider with its source and version constraints.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16" # Use version 4.x of the AWS provider.
    }
  }

  # Specify the minimum required Terraform version.
  required_version = ">=1.2.0"
}

# Configure the AWS provider with the desired region.
provider "aws" {
  region = "ap-south-1" # Set the AWS region to Asia Pacific - Mumbai.
}

# Define AWS EC2 instances.
resource "aws_instance" "example_instance" {
  count                  = 3 # Create 3 instances with the same configuration.
  ami                    = "ami-0f5ee92e2d63afc18" # Use a specific AMI.
  instance_type          = "t2.micro" # Specify the instance type.
  vpc_security_group_ids = ["sg-0c168b0d362f5a2b4"] # Attach a security group to instances.

  connection {
    type        = "ssh"
    user        = "ubuntu" # SSH user for connecting to instances.
    private_key = file("/home/ubuntu/apache.pem") # Path to the private key for SSH.
  }
}

```

- Edit the **main.tf** file and paste the above code in it.

![Screenshot from 2023-09-21 09-41-00](https://github.com/Rohit312001/GitDemo/assets/76991475/d4739af8-8cf1-4e90-9c25-50386277d1cb)

- Now run the following command to initialize the Terraform.

```
terraform init
```

![Screenshot from 2023-09-21 09-41-37](https://github.com/Rohit312001/GitDemo/assets/76991475/769f26c1-5db9-4f83-953d-a3e0d98bffb0)

- Now run the following command to check the execution plan.

```
terraform plan
```

![Screenshot from 2023-09-21 09-42-06](https://github.com/Rohit312001/GitDemo/assets/76991475/490deaa3-db7f-47d7-bd18-9451fdafcc2a)

- Now run the following command to apply the changes.

```
terraform apply
```

![Screenshot from 2023-09-21 09-43-23](https://github.com/Rohit312001/GitDemo/assets/76991475/9384ca06-8a62-49d4-b2c0-b776a2d058b3)

- Check the created instances on CLI.

![Screenshot from 2023-09-21 09-43-37](https://github.com/Rohit312001/GitDemo/assets/76991475/45a17cff-b06f-46b8-91e7-8cec0615c757)

- Check the created instances on AWS Console.

![Screenshot from 2023-09-21 09-45-03](https://github.com/Rohit312001/GitDemo/assets/76991475/37140fc5-8cfe-43a4-96f0-550bf8f235dc)

---

### Happy Learning :)
