# Day 68 : Scaling with Terraform

**Yesterday, we learned how to AWS S3 Bucket with Terraform. Today, we will see how to scale our infrastructure with Terraform.**

### What is AWS Auto Scaling?

- **Auto Scaling** helps you maintain **application availability** and allows you to scale your `Amazon EC2 capacity` **up or down** automatically according to conditions you define. You can use Auto Scaling to help ensure that you are running your desired number of Amazon EC2 instances.
- Auto Scaling can also `automatically increase` the number of Amazon EC2 instances during **demand spikes** to maintain performance and decrease capacity during `lulls to reduce costs`. Auto Scaling is well suited both to applications that have stable demand patterns or that experience hourly, daily, or weekly variability in usage.

### Understanding Scaling

- Scaling is the process of adding or removing resources to match the changing demands of your application. As your application grows, you will need to add more resources to handle the increased load. And as the load decreases, you can remove the extra resources to save costs.

### Why we use Auto Scaling with Terraform?

- Terraform makes it easy to `scale your infrastructure` by providing a declarative way to define your resources. You can define the number of resources you need and Terraform will automatically create or destroy the resources as needed.

### Create a provider file for AWS.

- Create a file named `provider.tf` and add the following code to it:

```hcl
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
}
```

![imageedit_1_6250895662](https://github.com/Rohit312001/GitDemo/assets/76991475/f26a860e-650d-4b0a-8ee6-302707ff2ff3)

- **In this terraform code.**

- Replace <your-access-key-here> and <your-secret-key-here> with your actual AWS access key and secret key. These are sensitive credentials, so make sure to keep them secure and do not share them publicly.
- Replace us-east-1 with the AWS region you want to use.

### Create a Terraform version file.

- Create a file named `terraform.tf` and add the following code to it:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">=1.2.0"
}
```

![Screenshot from 2023-10-12 00-46-34](https://github.com/Rohit312001/GitDemo/assets/76991475/0e14b563-8f4f-4748-9b05-d8b9e4a5d6d3)

- **In this terraform code.**

- The terraform block specifies the required Terraform version. In this case, it requires a minimum **Terraform version of 1.2.0**.

- The **required_providers block** is used to declare and configure the required provider(s) for this Terraform configuration.

- Inside the `required_providers block`, the AWS provider is specified. The source attribute specifies where to obtain the AWS provider plugin (in this case, from HashiCorp's registry), and the version attribute sets a version constraint for the AWS provider, indicating that any version greater than or equal to 4.16 is acceptable.

- Make sure you have the specified `Terraform version installed` and that you have configured the AWS provider accordingly in your Terraform code.

### Create a VPC (Virtual Private Cloud) with CIDR block 10.0.0.0/16.

- Create a file named `vpc.tf` and add the following code to it:

```hcl
resource "aws_vpc" "main_example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main_example"
  }
}
```

![Screenshot from 2023-10-12 00-47-00](https://github.com/Rohit312001/GitDemo/assets/76991475/6117ae74-9e35-41f1-92cb-6b02d05ab876)

- **In this terraform code.**

- You are creating an AWS VPC resource using the aws_vpc resource type.

- The VPC's IP address range (CIDR block) is set to "10.0.0.0/16," which provides a range of IPv4 addresses for your VPC.

- Tags are added to the VPC to help you label and identify it. In this case, you've added a single tag with the key "Name" and the value "main_example" to make it easier to identify the VPC in the AWS Management Console or when using the AWS CLI/SDK.

- To use this Terraform configuration, make sure you have the AWS provider properly configured, and then you can apply this configuration to create the AWS VPC with the specified settings.

### Create a public subnet with CIDR block 10.0.1.0/24 and 10.0.2.0/24 in the above VPC.

- Create a file named `public_subnet.tf` and add the following code to it:

```hcl
resource "aws_subnet" "public_subnet_1" {
  vpc_id     = aws_vpc.main_example.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public subnet 1"
  }
}

resource "aws_subnet" "pubic_subnet_2" {
  vpc_id     = aws_vpc.main_example.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public subnet 2"
  }
}
```

![Screenshot from 2023-10-12 00-47-46](https://github.com/Rohit312001/GitDemo/assets/76991475/3b6ac4c5-a6b6-4f17-81ad-d8c47300ccfd)

- **In this terraform code.**
- You are creating two AWS subnet resources using the aws_subnet resource type.

- For each subnet, you specify the vpc_id attribute to associate it with the VPC named "main_example," which was previously defined.

- Each subnet has its own CIDR block, which defines the range of IP addresses available within the subnet.

- Tags are added to each subnet for identification and labeling purposes, making it easier to manage and differentiate the subnets.

### Create an Internet Gateway (IGW) and attach it to the VPC.

- Create a file named `igw.tf` and add the following code to it:

```hcl
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.main_example.id

  tags = {
    Name = "internet_gateway_devops"
  }
}
```

![Screenshot from 2023-10-12 00-48-29](https://github.com/Rohit312001/GitDemo/assets/76991475/dd6b5ea9-5724-4bc8-92ec-d890f53e21ff)

- **In this terraform code.**
- You are creating an AWS Internet Gateway resource using the `aws_internet_gateway `resource type.

- The `vpc_id` attribute is set to aws_vpc.main_example.id, which associates the Internet Gateway with the VPC named "main_example." This allows the VPC to communicate with the public internet.

- A tag is added to the Internet Gateway with the key "Name" and the value `"internet_gateway_devops"` to identify and label the resource.

### Create a route table for the public subnet and associate it with the public subnet. This route table should have a route to the Internet Gateway.

- Create a file named `route_table.tf` and add the following code to it:

```hcl
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main_example.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "route_table_devops"
  }
}

resource "aws_route_table_association" "public_subnet_association_1a" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "public_subnet_association_1b" {

  subnet_id      = aws_subnet.pubic_subnet_2.id
  route_table_id = aws_route_table.route_table.id
}
```

![Screenshot from 2023-10-12 00-48-39](https://github.com/Rohit312001/GitDemo/assets/76991475/ebb414f5-c006-4ef9-b473-42a22708e9bb)

- **In this terraform code.**
- You create an AWS route table with the `aws_route_table resource`. This route table is associated with the VPC named "main_example." It has a default route (0.0.0.0/0) pointing to the Internet Gateway created earlier. This route allows outbound traffic to reach the internet.

- The `aws_route_table_association `resources are used to associate the route table with the public subnets. Two associations are created, one for each of your public subnets, `public_subnet_1` and `public_subnet_2`. This ensures that each public subnet uses the defined route table for routing.

### Let's create a Security Group for our EC2 instance.

- Create a file named `security_group.tf` and add the following code to it:

```hcl
resource "aws_security_group" "web_server_grp" {
  name_prefix = "web-server-sg"
  vpc_id      = aws_vpc.main_example.id

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
```

![Screenshot from 2023-10-12 00-48-53](https://github.com/Rohit312001/GitDemo/assets/76991475/301b0916-acf8-4f31-a438-d78d5a9fa583)

- **In this terraform code.**
- You create an AWS security group with the aws_security_group resource. The name_prefix attribute sets a prefix for the security group's name.

- The security group is associated with the VPC named "main_example" using the vpc_id attribute.

- Two **ingress rules** are defined: one for TCP traffic on port 80 (HTTP) and another for TCP traffic on port 22 (SSH). Both ingress rules allow traffic from any source (0.0.0.0/0), which means that HTTP and SSH traffic will be allowed from anywhere.

- An **egress rule** is defined that allows all outbound traffic from the security group. The protocol value of "-1" means that it allows all protocols.

## Task 1: Create an Auto Scaling Group.

- Create a file named `autoscaling.tf` and add the following code to it:

```hcl
resource "aws_launch_configuration" "web_server_launch1" {
  name                        = "web_server_launch1"
  image_id                    = "ami-067d1e60475437da2"
  instance_type               = "t2.micro"
  security_groups             = [aws_security_group.web_server_grp.id]
  associate_public_ip_address = true

  user_data = <<-EOF
                #!/bin/bash
                echo "<html><body><h1>Welcome to Terraform</h1></body></html>" > index.html
                nohup python -m SimpleHTTPServer 80 &
                EOF
}

resource "aws_autoscaling_group" "web_server_asg1" {
  name                 = "web_server-asg"
  launch_configuration = aws_launch_configuration.web_server_launch1.name
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  health_check_type    = "EC2"
  vpc_zone_identifier = [
  aws_subnet.public_subnet_1.id, aws_subnet.pubic_subnet_2.id]
}
```

![Screenshot from 2023-10-12 00-49-08](https://github.com/Rohit312001/GitDemo/assets/76991475/b4cf8086-c685-4ab8-a034-caeb0d6107f0)

- **In this terraform code.**

- An AWS Launch Configuration is defined, specifying the name, the Amazon Machine Image (AMI) to use, the instance type, the associated security group, and the option to associate public IP addresses with the instances. User data is provided to configure the instance, serving a basic HTML page on port 80.

- An AWS Auto Scaling Group is defined with the name, referencing the launch configuration created earlier, and setting the minimum, maximum, and desired number of instances in the group. It also specifies the use of EC2 instance health checks and the VPC subnets where instances will be launched.

- **Now let's initialize the terraform.**

```bash
terraform init
```

![Screenshot from 2023-10-12 00-39-44](https://github.com/Rohit312001/GitDemo/assets/76991475/79a6b669-0b92-4a59-ba7f-51f5dc64bbeb)

- **Now let's apply the terraform.**

```bash
terraform apply
```

![Screenshot from 2023-10-12 00-39-56](https://github.com/Rohit312001/GitDemo/assets/76991475/ac89e2d9-a78a-4b68-ad25-3882860d6e66)

- We can check the applied changes in terminal.

![Screenshot from 2023-10-12 00-40-11](https://github.com/Rohit312001/GitDemo/assets/76991475/e6cf3858-90e9-435f-91de-88d14ddd86da)

- Verify the changes in AWS Management Console by checking Auto Scaling Group.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/c552f787-1a84-48d8-abd8-e2a785b3b8eb)

- Check the desired capacity of Auto Scaling Group.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/96f9c009-8afc-44aa-aebe-a2e72ff6a1e5)

---

## Task 2: Test Scaling.

- **Go to the AWS Management Console and select the Auto Scaling Groups service.**

- **Step-01:** Select the Auto Scaling Group you just created and click on the "Edit" button and increase the "Desired Capacity" to 3 and click on the "Save" button.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/ab1f2718-5114-495e-ac21-7e9653b2b774)

- **Step-02:** Wait a few minutes for the new instances to be launched and verify that the new instances have been launched.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/f818d214-a50b-470f-a3c0-33ea1487f1f1)

- **Step-03:** Decrease the "Desired Capacity" to 1 and wait a few minutes for the extra instances to be terminated.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/adccbabd-5e59-41e1-ace4-2b643974c9b8)

- **Step-04:** Go to the EC2 Instances service and verify that the extra instances have been terminated.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/bcd97272-2112-4520-8baf-736825f2fe1d)

---

## Happy Terraforming:)
