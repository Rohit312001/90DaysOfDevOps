# Day 70 : Terraform Modules.

## What are Terraform Modules?

- **Modules** are `containers` for multiple resources that are used together. A module consists of a collection of **.tf** and/or **.tf.json** files kept together in a directory
- A module can call other modules, which lets you include the child module's resources into the configuration in a concise way.
- Modules can also be called multiple times, either within the same configuration or in separate configurations, allowing resource configurations to be packaged and re-used.

### Key Points to Remember:

- **Abstraction:** Modules provide a level of abstraction. You can define the `inputs` and `outputs` of a module, which allows you to customize the behavior of the module when it is used in different contexts.

- **Reusability:** You can reuse modules across different parts of your infrastructure or in different projects, promoting `code reuse` and `reducing duplication`.

- **Encapsulation:** Modules encapsulate related resources and their configurations, making it easier to understand and manage complex infrastructure setups.

- **Versioning:** You can version your modules to ensure that different parts of your infrastructure are using the same version of a module, which helps in maintaining consistency.

- **Remote Modules:** Modules can be stored remotely in version control systems (e.g., GitHub) or in Terraform Module Registry. You can reference these remote modules in your configuration, making it easy to share and update them.

- **Directory Structure:**

```hcl
my_module/
  ├── main.tf
  ├── variables.tf
  └── outputs.tf
```

## Difference between Root Module and Child Module.

### Root Module:

- The main entry point for your Terraform configuration.
- Configures the core components of your infrastructure.
- Orchestrates the use of child modules.
- Specifies providers, backends, variables, and outputs.
- Can be applied independently to deploy your entire infrastructure.

### Child Module:

- Modular components encapsulating related resources and configurations.
- Stored in separate directories.
- Used within the root module or other child modules.
- Promote code reusability and maintainability.
- Can have input variables and output values.
- Customizable and used multiple times within the infrastructure.

- **Root Module and Child Module Structure:**

```hcl
my-infrastructure/
  ├── main.tf (Root module)
  ├── variables.tf (Root module)
  ├── outputs.tf (Root module)
  ├── child-module-1/
  │     ├── main.tf (Child module)
  │     ├── variables.tf (Child module)
  │     ├── outputs.tf (Child module)
  ├── child-module-2/
  │     ├── main.tf (Child module)
  │     ├── variables.tf (Child module)
  │     ├── outputs.tf (Child module)
```

## Is Modules and Namespaces are same?

- **Modules** are a way to organize and reuse code components in Terraform for managing infrastructure.
- **Namespaces** are used in various contexts, such as Kubernetes, to create isolated environments to prevent naming conflicts and manage resources separately.
- **Modules** organize code, while **namespaces** isolate resources. They serve different purposes.

---

## Task-01:

- **Step-01:** First create a folder named as **"modules/ec2_instance"** in which we will create our module files like **main.tf**,**variable.tf** and **output.tf**.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/5839fd11-9556-48c9-9245-4f73f6acf632)

- **Step-02:** Now create a file named as **main.tf** in which we will create our **aws_instance** resource inside the module **(modules/ec2_instance)**.

```hcl
provider "aws" {
  access_key = "provide the access key"
  secret_key = "provide the secret key"
  region     = "ap-south-1"
}
resource "aws_instance" "example" {
  ami           = var.ami_value
  instance_type = "t2.micro"
}
```

![Screenshot from 2023-10-20 19-10-07](https://github.com/Rohit312001/GitDemo/assets/76991475/68d07382-e3fe-46eb-bec0-a9d15af8d200)

- **Step-03:** Now create a file named as **variable.tf** in which we will create our **input variables** for our module **(modules/ec2_instance)**.

```hcl
variable "ami_value" {
  description = "value for the ami"
}

variable "instance_type_value" {
  description = "value for instance_type"
}
```

![Screenshot from 2023-10-20 19-10-15](https://github.com/Rohit312001/GitDemo/assets/76991475/dd191052-af0f-44c8-b06b-8786f1116a65)

- **Step-04:** Now create a file named as **output.tf** in which we will create our **output variables** for our module **(modules/ec2_instance)**.

```hcl
output "public-ip-address" {
  value = aws_instance.example.public_ip
}
```

![Screenshot from 2023-10-20 19-10-23](https://github.com/Rohit312001/GitDemo/assets/76991475/aed09114-3aee-412a-9aca-d839a5b096b8)

- **Step-05:** Now let's create a **main.tf** file outside the module **(modules/ec2_instance)** in which we will call our module **(modules/ec2_instance)**.

```hcl
provider "aws" {
  region = "ap-south-1"
}
module "ec2_instance" {
  source              = "/home/rohit/Documents/terraform/day12/modules/ec2_instance"
  ami_value           = "ami-099b3d23e336c2e83"
  instance_type_value = "t2.micro"
}
```

### So why we create a module?

- We create a module because we want to use the same code again and again in our project.

![Screenshot from 2023-10-20 19-10-31](https://github.com/Rohit312001/GitDemo/assets/76991475/3e26cc26-1871-4e0e-b960-98b02abcba6b)

- **Step-06:** Now let's run the **terraform init** command to initialize the terraform.

![Screenshot from 2023-10-20 19-09-13](https://github.com/Rohit312001/GitDemo/assets/76991475/230949d0-0be5-4caf-8f52-4806097f23a1)

- **Step-07:** Now let's run the **terraform apply** command to create the resources.

![Screenshot from 2023-10-20 19-09-28](https://github.com/Rohit312001/GitDemo/assets/76991475/f81e277d-99e6-4f19-ae26-4769beab4cad)

- **Now we can see that our module is created.**

![Screenshot from 2023-10-20 19-09-41](https://github.com/Rohit312001/GitDemo/assets/76991475/62b184b8-2f1b-4375-8130-88679d722d9f)

- **Step-08:** Thus at last we can verify it on our **AWS console.**

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/80204474-1434-43dc-8470-f3f1d8ab1bc8)

---

## Happy Terraforming:)
