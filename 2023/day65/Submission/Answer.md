# Day 65 : Working with Terraform Resources 🚀

## What is Terraform Resources?

- A **Resource** in Terraform represents a component of your infrastructure, such as a `physical server`, a `virtual machine`, a `DNS recor`d, or an `S3 bucket`. Resources have attributes that define their properties and behaviors, such as the size and location of a virtual machine or the domain name of a DNS record.
- When you define a resource in Terraform, you specify the type of resource, a unique name for the resource, and the attributes that define the resource. Terraform uses the resource block to define resources in your Terraform configuration.

### Breakdown of Terraform Resource:

1. **Resource Block:** The resource block defines a resource of a given type (in this case, aws_instance), assigns it a local name (in this case, example), and sets its properties. The body of a resource block (the statements between { and }) contains the arguments that configure that resource.

```
resource "provider_type" "resource_name" {
  # Configuration parameters for the resource
  parameter1 = value1
  parameter2 = value2
  # ...
}

```

- **provider_type:** Specifies the type of provider that offers the resource. For example, for AWS resources, it would be **"aws."**

- **resource_name:** Specifies the local name of the resource. This is used to refer to the resource from elsewhere in the same Terraform module, but it has no significance outside that module.

- **parameter1, parameter2:** Specifies the configuration parameters for the resource. The parameters that are available depend on the resource type. For example, the `aws_instance` resource type has parameters such as `ami`, `instance_type`, and `subnet_id`.

2. **Resource Attributes:** Each **resource block** can have various attributes that describe the properties of the resource. These attributes are usually read-only and represent the `current state` of the resource after provisioning.

```
output "resource_attribute" {
  value = resource_type.resource_name.attribute_name
}
```

3. **Dependencies:** Resources can have `dependencies` on other resources. Terraform uses dependency information to determine the order in which resources should be created or destroyed. You can specify dependencies explicitly using the `depends_on` parameter within a `resource block`.

```
resource "aws_instance" "web_server" {
  # ...
}

resource "aws_security_group" "web_server_sg" {
  # ...
}

resource "aws_network_interface_sg_attachment" "web_server_attachment" {
  security_group_id = aws_security_group.web_server_sg.id
  network_interface_id = aws_instance.web_server.network_interface_ids[0]
  depends_on = [aws_instance.web_server, aws_security_group.web_server_sg]
}
```

- In this example, `the aws_network_interface_sg_attachment` resource depends on both the `aws_instance` and `aws_security_group` resources.

4. **Resource Lifecycle:** Terraform manages the `entire lifecycle of resources`, including `creation`, `updating`, and `deletion`. When you make changes to your Terraform configuration, it calculates a plan to determine how to reach the desired state. Then, you apply the plan to execute those changes. Terraform handles resource creation or modification by taking care of API calls and configuration updates on your behalf.

5. **Resource Meta-Arguments:** Resource blocks support the following meta-arguments:

- `count` (int) - Creates multiple instances of a resource.
- `for_each` (set) - Creates multiple instances of a resource according to a map, or set of strings.
- `provider` (string) - Specifies a provider configuration to use for this resource type.
- `depends_on` (set) - Specifies explicit dependencies.
- `lifecycle` (block) - Specifies lifecycle customizations.
- `provisioner` (block) - Specifies provisioners to run with this resource.
- `connection` (block) - Specifies connection configuration for this resource.

6. **State Management:** Terraform maintains a state file (usually stored locally or in remote storage) that `tracks the actual state` of your infrastructure resources. This state file is crucial for Terraform to understand what resources are already provisioned and what changes need to be made to reach the desired state.

7. **Providers:** Providers are responsible for managing the `API interactions` and resources for a specific `cloud` or `infrastructure service`. Terraform supports a wide range of providers, and you can use multiple providers within a `single configuration file` if you are managing resources across different `cloud platforms or services`.

---

## Task 1: Create a security group

- **To allow traffic to the EC2 instance, you need to create a security group.**

- **Step-01:** In your `main.tf` file, add the following code to create a security group:

```
provider "aws" {
  access_key = "put-your-access-key"
  secret_key = "put-your-secret-key"
  region     = "ap-south-1"
}
resource "aws_security_group" "web_server" {
  name_prefix = "web-server-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

![Screenshot from 2023-10-02 14-51-07](https://github.com/Rohit312001/GitDemo/assets/76991475/7fbafdb2-ded0-41ba-a092-3b786d811f79)

- **Step-02:** Run `terraform init` to initialize the Terraform project.

![Screenshot from 2023-10-02 14-53-48](https://github.com/Rohit312001/GitDemo/assets/76991475/0ce215ba-227b-4dda-be94-79d35327c2ad)

- **Step-03:** Run `terraform apply` to create the security group.

![Screenshot from 2023-10-02 14-54-16](https://github.com/Rohit312001/GitDemo/assets/76991475/a4d89f8d-73df-4ff5-a793-7a0c4164c24d)

- **Step-04:** Go to AWS Management Console -> EC2 -> Security Groups -> Verify the Security Group created.

- **Inbound Rules:**

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/d4d6941d-f57e-487a-83c0-fd216cbffc2c)

- Thus we have successfully created a security group.

---

- Now in our main.tf file, add the following code to create an EC2 instance:

```
resource "aws_instance" "web_server" {
  ami           = "ami-id of your choice"
  instance_type = "t2.micro"
  key_name      = "any key pair"
  security_groups = [
    aws_security_group.web_server.name
  ]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<html><body><h1>Welcome to my website!</h1></body></html>" > index.html
              nohup python -m SimpleHTTPServer 80 &
              EOF
}
```

**Note:** Replace the `ami` and `key_name values` with your own. You can find a list of available AMIs in the AWS documentation.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/93130e79-313d-48bd-9e11-c9e94eee9fe4)

- **Instance Created:**

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/b881691b-71b4-4e74-bfa5-3aedfdad6689)

---

## Task 3: Access your website

- **Now that your EC2 instance is up and running, you can access the website you just hosted on it.**

- **Step-01:** Click on the created instance -> Click on the `IPv4 Public IP` -> You will be able to see the website.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/b84fa9ff-fd2b-477a-8a62-85b2af88771b)

- Now on Apache Web Server, you can see the website or you cna edit your own content on it.

- Thus we have successfully created an EC2 instance and hosted a website on it.

---
