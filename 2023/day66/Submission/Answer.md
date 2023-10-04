# Day 66 : Build Your Own AWS Infrastructure with Ease using Infrastructure as Code (IaC)

## What is AWS(Amazon Web Services)?

- **Amazon Web Services (AWS)** is a secure `cloud services platform`, offering `compute power`, `database storage`, `content delivery` and other functionality to help businesses `scale` and `grow`.
- Explore how millions of customers are currently leveraging AWS cloud products and solutions to build sophisticated applications with increased flexibility, **scalability** and **reliability**.

## What is Cloud Computing?

- **Cloud computing** is the on-demand availability of computer system resources, especially data storage (cloud storage) and computing power, without direct active management by the user.
- The term is generally used to describe data centers available to many users over the Internet.
- Large clouds, predominant today, often have functions distributed over multiple locations from central servers.

## What is Infrastructure as Code (IaC)?

- **Infrastructure as Code (IaC)** is the process of managing and provisioning computer data centers through `machine-readable` definition files, rather than physical hardware configuration or interactive configuration tools.
- The IT infrastructure managed by this process comprises both physical equipment, such as `bare-metal servers`, as well as `virtual machines`, and associated configuration resources.
- The definitions may be in a version control system. It can use either `scripts` or `declarative definitions`, rather than manual processes, but the term is more often used to promote declarative approaches.

## What is Terraform?

- **Terraform** is an **open-source** infrastructure as code software tool created by **HashiCorp**.
- It enables users to define and provision a datacenter infrastructure using a high-level configuration language known as `Hashicorp Configuration Language (HCL)`, or optionally **JSON**.
- Terraform supports a number of cloud infrastructure providers such as `Amazon Web Services`, `IBM Cloud` (formerly Bluemix), `Google Cloud Platform`, `Linode`, `Microsoft Azure`, `Oracle Cloud Infrastructure`, or `VMware vSphere` as well as `OpenStack`.

### What is AWS VPC?

- **Amazon Virtual Private Cloud (Amazon VPC)** lets you provision a logically isolated section of the Amazon Web Services (AWS) Cloud where you can launch AWS resources in a virtual network that you define.
- You have complete control over your `virtual networking environment`, including selection of your own `IP address range`, creation of `subnets`, and configuration of `route tables` and `network gateways`.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/8b1fc2f4-ee13-48b6-86c6-73ef48fec262)

### What is Public Subnet?

- A **public subnet** is a subnet that's associated with a `route table` that has a route to an `Internet gateway`.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/0783ccb0-7da2-4aec-85ab-d22239311cb9)

### What is Private Subnet?

- A **private subnet** is a subnet that's associated with a `route table` that has no route to an `Internet gateway`.

### What is Internet Gateway?

- An **internet gateway** is a horizontally scaled, redundant, and highly available `VPC component` that allows communication between instances in your `VPC` and the `internet`.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/df9ca5e0-62ea-4dab-984f-ca101761fa50)

### What is Route Table?

- A **route table** contains a set of rules, called `routes`, that are used to determine where network traffic is directed.
- Each `subnet` in your VPC must be associated with a route table; the table controls the routing for the subnet.

### What is Elastic IP?

- An **Elastic IP address** is a static IPv4 address designed for dynamic cloud computing.
- An Elastic IP address is associated with your AWS account.
- With an Elastic IP address, you can mask the failure of an instance or software by rapidly remapping the address to another instance in your account.

# Task-01:

### Create a VPC (Virtual Private Cloud) with CIDR block 10.0.0.0/16.

- Create a file named `vpc.tf` and add the following code to it.

```hcl
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main"
  }
}
```

![Screenshot from 2023-10-04 13-45-41](https://github.com/Rohit312001/GitDemo/assets/76991475/9563bf4d-9ea8-44b0-bed2-f6c3df16053d)

- In this Terraform code:

1. **resource "aws_vpc" "main"** - defines an AWS VPC resource named "main."

2. **cidr_block = "10.0.0.0/16"** specifies the IP address range for the VPC, allowing you to create instances with IP addresses in the range from `10.0.0.0 to 10.0.255.255.`

3. \*_tags = { Name = "main" }_ sets a tag for the VPC, giving it the name "main" for easy identification and organization within your `AWS account`.

- Verify the VPC in the AWS console.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/34ba5454-aab0-4aab-9905-69e3ebbfda56)

---

### Create a public subnet with CIDR block 10.0.1.0/24 in the above VPC.

- Create a file named `subnet.tf` and add the following code to it.

```hcl
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public_subnet"
  }
}
```

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/5146b403-6527-4cab-bfed-c470dbc315ed)

- In this Terraform code:

1. **resource "aws_subnet" "public_subnet"** defines an AWS subnet resource named "public_subnet" that will be created within the previously defined VPC.\*

2. **vpc_id = aws_vpc.main.id** specifies the VPC in which this subnet will be created by referencing the ID of the `"aws_vpc.main"` resource.

3. **cidr_block = "10.0.2.0/24"** sets the CIDR block for the subnet's IP address range, allowing instances within this subnet to have IP addresses in the range from `10.0.2.0 to 10.0.2.255.`

4. **tags = { Name = "public_subnet" }** defines tags for the subnet resource, with a "Name" tag set to "public_subnet" to identify the purpose of this subnet.

- Verify the subnet in the AWS console.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/3195cbdc-40db-4cae-870c-37301552b80e)

---

### Create a private subnet with CIDR block 10.0.2.0/24 in the above VPC.

- Create a file named `subnet.tf` and add the following code to it.

```hcl
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private_subnet"
  }
}
```

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/88ea2166-f2a5-46e2-a1af-6318b19cdb7e)

- In this Terraform code:

1. **resource "aws_subnet" "private_subnet"** defines an AWS subnet resource named "private_subnet" that will be created within the same VPC as the `"public_subnet."`

2. **vpc_id = aws_vpc.main.id** specifies the VPC in which this subnet will be created by referencing the ID of the `"aws_vpc.main"` resource, ensuring that it's part of the same VPC.

3. **cidr_block = "10.0.1.0/24"** sets the CIDR block for the subnet's IP address range, allowing instances within this subnet to have IP addresses in the range from `10.0.1.0 to 10.0.1.255.`

4. **tags = { Name = "private_subnet" }** defines tags for the subnet resource, with a "Name" tag set to "private_subnet" to identify the purpose of this subnet as `private`.

- Verify the subnet in the AWS console.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/3195cbdc-40db-4cae-870c-37301552b80e)

---

### Create an Internet Gateway (IGW) and attach it to the VPC.

- Create a file named `internetgateway.tf` and add the following code to it.

```hcl
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet_gateway_devops"
  }
}
```

![Screenshot from 2023-10-04 13-45-58](https://github.com/Rohit312001/GitDemo/assets/76991475/5e227486-3d27-45b3-abec-0a2d08a65866)

- In this Terraform code:

1. **resource "aws_internet_gateway" "internet_gateway"** defines an AWS Internet Gateway resource named `"internet_gateway."`

2. **vpc_id = aws_vpc.main.id** specifies the VPC to which this Internet Gateway will be attached by referencing the ID of the "aws_vpc.main" resource. This allows the Internet Gateway to provide connectivity between the VPC and the internet.

3. **tags = { Name = "internet_gateway_devops" }** defines tags for the Internet Gateway resource, with a "Name" tag set to "internet_gateway_devops" to identify and label the Internet Gateway for organizational purposes.

- Verify the Internet Gateway in the AWS console.

![Screenshot from 2023-10-04 13-57-08](https://github.com/Rohit312001/GitDemo/assets/76991475/967e0ca6-e950-4762-96a6-0033f5d6c07a)

---

### Create a route table for the public subnet and associate it with the public subnet. This route table should have a route to the Internet Gateway.

- Create a file named `routetable.tf` and add the following code to it.

```hcl
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "route_table_devops"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}
```

![Screenshot from 2023-10-04 13-45-51](https://github.com/Rohit312001/GitDemo/assets/76991475/8bab4443-ba10-491c-ae55-2eb2b5b1c59f)

- In this Terraform code:

1. **resource "aws_route_table" "route_table"** defines an AWS route table resource named "route_table" within the VPC specified by referencing the ID of the "aws_vpc.main" resource.

2. Inside the route table resource block, a default route is defined with a **cidr_block of "0.0.0.0/0,"** which represents all IP addresses. This default route is directed to the Internet Gateway identified by gateway_id, which is the ID of the **"aws_internet_gateway.internet_gateway"** resource.

3. **tags = { Name = "route_table_devops" }** defines tags for the route table resource, with a "Name" tag set to `"route_table_devops"` for identification.

4. **resource "aws_route_table_association" "public_subnet_association"** associates the route table with a public subnet by specifying the `subnet's ID` and the `route table's ID`. This association ensures that the public subnet uses the defined route table for `routing traffic`.

- Verify the route table in the AWS console.

![Screenshot from 2023-10-04 13-56-56](https://github.com/Rohit312001/GitDemo/assets/76991475/ec0036e5-e504-468b-a729-3c31bebecc91)

---

### Launch an EC2 instance in the public subnet with the following details:

- **But before creating instance we need to provision the provider.tf and terraform.tf for the provider we use and version of teraform that we use.**

- Create a file named `provider.tf` and add the following code to it.

```hcl
provider "aws" {
  # access_key = "use your own access key"
  # secret_key = "use your own secret key"
  region = "us-east-1"
}
```

![imageedit_1_2275540681](https://github.com/Rohit312001/GitDemo/assets/76991475/fed0fd88-c386-4f10-9b43-c8c4674c8089)

- In this Terraform code:

1. The **provider "aws" block configures the AWS provider**, which allows Terraform to interact with the AWS services.

2. The **region parameter is set to "us-east-1,"** specifying the AWS region where your resources `(VPC, subnets, etc.)` will be created. You can change this region to your desired region.

3. The **access_key and secret_key are optional**. If you don't specify them here, Terraform will look for AWS credentials in other locations, such as environment variables, AWS CLI configuration, or instance profiles if you are running Terraform on an EC2 instance with an associated `IAM role`. You can uncomment and provide your access and secret keys if needed, but it's generally recommended to use more secure methods for managing credentials, especially in production environments.

- Create a file named `terraform.tf` and add the following code to it.

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.16"
    }
  }
  required_version = ">=1.2.0"
}
```

![Screenshot from 2023-10-04 13-45-27](https://github.com/Rohit312001/GitDemo/assets/76991475/0ed1c337-a631-4aed-b37d-871ab17ac748)

- In this Terraform configuration:

1. **terraform block** is used to configure settings for the `Terraform project`.

2. **required_providers block** defines the required providers for this project. In this case, it specifies that you need the `"aws"` provider from the `"hashicorp/aws"` source. It also specifies a `version constraint (~>4.16)`, which means Terraform will use any version equal to or greater than `4.16` but less than the next major version (e.g., 4.17 or higher).

3. **required_version** specifies the minimum Terraform version required to use this configuration. In this case, it requires Terraform version **1.2.0** or **newer.**

- Now we can create the instance using resource block.

- Create a file named `main.tf` and add the following code to it.

```hcl
provider "aws" {
    # access_key = "use your own access key"
    # secret_key = "use your own secret key"
    region = "us-east-1"
}
resource "aws_security_group" "web_server_devops" {
  name_prefix = "web_server_devops"
  vpc_id      = aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "server_terraform_devops" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  key_name      = "apache1useast"
  subnet_id     = aws_subnet.public_subnet.id
  security_groups = [
    aws_security_group.web_server_devops.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<html><body><h1>Welcome to my website! I'm Rohit Rajput</h1></body></html>" > index.html
              nohup python -m SimpleHTTPServer 80 &
              EOF
  tags = {
    Name = "server_terraform_devops"
  }
}
resource "aws_eip" "ip" {
  instance = aws_instance.server_terraform_devops.id
  vpc      = true
  tags = {
    Name = "elastic_ip_devops"
  }
}
```

- In this Terraform code:

1. The **aws_security_group** resource defines `inbound (ingress)` and `outbound (egress)` rules for the security group to control network traffic to and from the EC2 instances.

2. The **aws_instance resource** includes a user_data script that configures the EC2 instance by `installing Apache`, starting a `web server`, and serving a` simple web page`.

3. The **aws_eip** resource creates an Elastic IP (EIP) and associates it with the EC2 instance, allowing you to have a static public IP address for the instance.

### Security group: Allow SSH access from anywhere.

- The **aws_security_group** resource defines `inbound (ingress)` and `outbound (egress)` rules for the security group to control network traffic to and from the EC2 instances.

- Verify the security group in the AWS console.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/c027b33d-c1a8-41a5-86d2-c67b9b015849)

### Create an Elastic IP and associate it with the EC2 instance.

- Create a Elastic file resource and add the following code to it.

```hcl
resource "aws_eip" "ip" {
  instance = aws_instance.server_terraform_devops.id
  vpc      = true
  tags = {
    Name = "elastic_ip_devops"
  }
}
```

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/f42dbf6f-bd48-4aee-a41f-5855a7ff3171)

- In this Terraform code:

1. **resource "aws_eip" "ip"** defines an AWS Elastic IP (EIP) resource named `"ip."`

2. **instance = aws_instance.server_terraform_devops.id** specifies the ID of the EC2 instance that this Elastic IP will be associated with. This ensures that the Elastic IP is bound to the specified EC2 instance.

3. **vpc = true** sets the Elastic IP to be a VPC-based EIP. In a Virtual Private Cloud (VPC) environment, EIPs are associated with VPC instances and have additional features compared to `EC2-Classic EIPs`.

4. **tags = { Name = "elastic_ip_devops" }** defines tags for the Elastic IP resource, with a "Name" tag set to "elastic_ip_devops" to identify and label the Elastic IP for organizational purposes.

- Verify the Elastic IP in the AWS console.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/f5e2f8ad-9e09-4498-8b9d-3f006f45e5d2)

---

- At last we need to run the terraform commands to create the infrastructure.

```bash
terraform init
terraform plan
terraform apply
```

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/76c72d9b-0b39-408e-8baa-7ed3a0519af5)

- Thus we have successfully created the **infrastructure** using `terraform` on `AWS`.

---

### Open the website URL in a browser to verify that the website is hosted successfully and Copy the public IP of the instance and paste it in the browser.

---

## Happy Terraforming:)
