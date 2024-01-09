# Day 63 : Terraform Variables

**Terraform** is an `Infrastructure as Code` tool for provisioning and managing cloud and on-premises infrastructure. It uses `declarative configurations` and supports various `cloud providers`. Terraform enables you to **plan** and **apply** changes **incrementally**, maintaining **infrastructure state**.

### What is Terraform Variables?

- **Terraform variables** are placeholders for dynamic values in your `infrastructure code`. You declare them with a `variable` block, specifying data types and optional default values. These variables can be used in `resource blocks`, `module calls`, and `expressions` throughout your Terraform configuration. They provide `flexibility` and `reusability`, allowing you to customize configurations for different environments or use cases by providing `input values` during Terraform execution. This parameterization is crucial for managing `infrastructure as code efficiently`.

### Here we use Terraform Variables to create a local file using Terraform Block type like provider, resource, variable, output, etc.

- **Example of Provider:**

```
provider "aws" {
  region = "us-east-1"
}
```

- **Example of Resource:**

```
resource "aws_instance" "example" {
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
}
```

- **Example of Variable:**

```
variable "filename" {
default = ""
}
```

- **Example of Output:**

```
output "instance_ip_addr" {
  value = aws_instance.example.public_ip
}
```

---

# Task-01:

### Create a local file using Terraform.

### What is Local File in Terraform?

- **Local files** in Terraform refer to `data` and `files` stored on the local file system. They can be read using the `file()` function for use within configurations, used as input or output for `local-exec provisioners`, and employed in rendering templates with the `template_file` data source.- Local files are useful for tasks such as `reading configuration data`, `running local commands`, or `generating dynamic` configuration files.

- **Step-1:** Create a main.tf file and write the code for creating a local file using Terraform.

```
provider "aws"{
    region = "ap-south-1"
}
resource "local_file" "example_1"{
    filename = var.filename
    content = var.content
}
```

![Screenshot from 2023-09-19 09-56-17](https://github.com/Rohit312001/GitDemo/assets/76991475/e83ad20b-3df0-48f3-a925-6bc931062636)

- **Step-2:** Create a variables.tf file and write the code for creating a variable.

```
variable "filename" {
    default = "/home/ubuntu/Documents/terraform/day2/library.txt"
}
variable "content" {
    default = "This is a sample file.
}
```

![Screenshot from 2023-09-19 09-56-31](https://github.com/Rohit312001/GitDemo/assets/76991475/19040ed0-ce0f-414e-88e1-e4feea52a090)

- **Step-3:** Now run the command `terraform init` to initialize the Terraform.

```
terraform init
```

![Screenshot from 2023-09-19 09-57-09](https://github.com/Rohit312001/GitDemo/assets/76991475/9a2bf49d-7db4-4211-8f8d-7b4e628342c4)

- **Step-4:** Now run the command `terraform plan` to create a local file using Terraform.

```
terraform plan
```

![Screenshot from 2023-09-19 09-57-21](https://github.com/Rohit312001/GitDemo/assets/76991475/7de3b56b-23df-4bc2-835a-01f1b0746f6a)

- **Step-5:** Now run the command `terraform apply` to create a local file using Terraform.

```
terraform apply
```

![Screenshot from 2023-09-19 09-57-39](https://github.com/Rohit312001/GitDemo/assets/76991475/14f00c4c-9914-4cb4-aac6-6de85ee0f409)

- **Step-6:** Now verify the local file using the command `cat /home/ubuntu/Documents/terraform/day2/library.txt` and this is the **Output**.

![Screenshot from 2023-09-19 09-58-01](https://github.com/Rohit312001/GitDemo/assets/76991475/53660f1a-39ce-467d-a0a2-eb7b0e03dd32)

---

### Data Types in Terraform.

### What are Data Types in Terraform?

Terraform supports several data types:

1. **String**: Holds text or characters.
2. **Number**: Stores numeric values (integers or floats).
3. **Bool**: Represents boolean values (true or false).
4. **List**: An ordered collection of values.
5. **Map**: Holds key-value pairs.
6. **Object (Complex Type)**: Complex data type for structured data.

### What is Map in Terraform?

- In Terraform, a map is a data structure that stores **key-value pairs.** It allows you to `organize` and `store data` efficiently.

- Example of Map in Terraform:

```
variable "example_map" {
  type = map(string)
  default = {
    key1 = "value1"
    key2 = "value2"
    key3 = "value3"
  }
}
```

- **Step-1:** let's create a main.tf file and write the code for creating a map in Terraform.

```
provider "aws"{
    region = "ap-south-1"
}
resource "local_file" "example3"{
    filename = "/home/rohit/Documents/terraform/day3/devops.txt"
    content = var.file_contents["statement1"]
}
resource "local_file" "example4"{
    filename = "/home/rohit/Documents/terraform/day3/devops+cloud.txt"
    content = var.file_contents["statement2"]
}
```

![Screenshot from 2023-09-19 10-40-43](https://github.com/Rohit312001/GitDemo/assets/76991475/b4ef5e30-6e3c-4eb9-a44d-427219f83b55)

- **Step-2:** let's create a variables.tf file and write the code for creating a map in Terraform.

```
variable "filename"{
    default = "/home/ubuntu/Documents/terraform/day3/library.txt"
}
varible "content"{
    default = "Hi I'm Rohit Rajput ..."
}
variable "file_contents"{
    type = map
    default = {
        "statement1" = "This is a sample file."
        "statement2" = "This is a sample file for Devops and Cloud."
    }
}
```

![Screenshot from 2023-09-19 10-40-55](https://github.com/Rohit312001/GitDemo/assets/76991475/4bb8f40e-f95f-4314-ae52-1dc889223bff)

- **Step-3:** Now run the command `terraform init` to initialize the Terraform.

```
terraform init
```

![Screenshot from 2023-09-19 13-15-25](https://github.com/Rohit312001/GitDemo/assets/76991475/e9fdb747-bdd4-48ab-8780-a9545b2f446f)

- **Step-4:** Now run the command `terraform apply` to create a map in Terraform.

```
terraform apply
```

![Screenshot from 2023-09-19 13-15-49](https://github.com/Rohit312001/GitDemo/assets/76991475/3ee3e31e-3022-4ad4-a95f-17239a896311)

- **Step-5:** Now verify the map using the command `cat /home/ubuntu/Documents/terraform/day3/library.txt` and this is the **Output**.

**The Output from file one:**
![Screenshot from 2023-09-19 10-41-01](https://github.com/Rohit312001/GitDemo/assets/76991475/31973930-f4c6-40d9-ac00-03045cdae22b)

**The Output from file two:**
![Screenshot from 2023-09-19 10-41-06](https://github.com/Rohit312001/GitDemo/assets/76991475/e246142e-a3ac-4e60-8d49-e74533dd7494)

---

# Task-02:

### What is list in Terraform?

- In Terraform, a **list** is a data type that represents an `ordered collection` of `values`. Lists maintain the order of elements and can contain values of the same or different data types.
- They are declared using `square brackets` and accessed by index. Lists are versatile for **storing** and working with `multiple values within a single variable.`

```
variable "example_list" {
  type    = list
  default = ["item1", "item2", "item3"]
}
```

- **Step-1:** let's create a `main.tf` file and write the code for creating a list in Terraform.

```
provider "aws"{
    region = "ap-south-1"
}
resource "local_file" "example3"{
    filename = "/home/rohit/Documents/terraform/day3/devops.txt"
    content = var.file_list_type[0]["statement1"]
}
resource "local_file" "example4"{
    filename = "/home/rohit/Documents/terraform/day3/devops+cloud.txt"
    content = var.file_list_type[1]["statement2"]
}
```

![Screenshot from 2023-09-19 13-14-41](https://github.com/Rohit312001/GitDemo/assets/76991475/708ab3a3-15d7-4952-8de5-36cea753a9cb)

- **Step-2:** let's create a `variables.tf` file and write the code for creating a list in Terraform.

```
variable "file_contents"{
    type = map
    default = {
        "statement1" = "This is a sample file."
        "statement2" = "This is a sample file for Devops and Cloud."
    }
}
variable "file_list_type"{
    type = list
    default = [
        "/home/rohit/Documents/terraform/day3/devops.txt",
        "/home/rohit/Documents/terraform/day3/devops+cloud.txt"
    ]
}
```

![Screenshot from 2023-09-19 13-15-11](https://github.com/Rohit312001/GitDemo/assets/76991475/44e02020-d15a-448c-8255-961740f4ceb4)

- At last, run the command `terraform apply` to create a list in Terraform.

---

### What is Object in Terraform?

- In Terraform, an `"object"` is a complex `data structure` that organizes related data using **key-value pairs**. It allows you to represent `structured data` with various attributes or properties, each with its own `data type`.
- Objects are useful for `organizing` and `managing hierarchical` or structured information within `Terraform configurations`.

- **Step-1:** let's create a `main.tf` file and write the code for creating an object in Terraform.

```
provider "aws" {
  region = "ap-south-1"
}
output "aws_ec2_object" {
  value = var.aws_ec2_object
}
```

![Screenshot from 2023-09-19 13-29-50](https://github.com/Rohit312001/GitDemo/assets/76991475/93528920-cb47-413c-99d5-262fb9337096)

- **Step-2:** let's create a `variables.tf` file and write the code for creating an object in Terraform.

```
variable "aws_ec2_object" {
  type = object({
    name     = string
    instance = number
    keys     = list(string)
    ami      = string
  })
  default = {
    name     = "MyEC2"
    instance = 1
    keys     = ["apache.pem"]
    ami      = "ami-0f5ee92e2d63afc18"
  }
}
```

![Screenshot from 2023-09-19 13-29-57](https://github.com/Rohit312001/GitDemo/assets/76991475/c9b437e9-2e4b-4db8-a90d-d4b7b9770d59)

- **Step-3:** After running the `terraform init` command run `terraform plan` to to create an object in Terraform.

```
terraform plan
```

![Screenshot from 2023-09-19 13-30-30](https://github.com/Rohit312001/GitDemo/assets/76991475/ba4c7168-6c39-4fd1-89b1-60e228e93a95)

### What is Set in Terraform?

- In Terraform, a **"set"** typically refers to creating a distinct collection of resources or modules based on conditions or input data. This is achieved using the `count` or `for_each` arguments to dynamically manage instances within Terraform configurations.
- While Terraform doesn't have a specific **"set"** data type, it allows you to achieve similar functionality by selectively creating or managing resources. Keep in mind that Terraform capabilities may have evolved since my last update, so consult the latest documentation for any changes.

- **Step-1:** let's create a `main.tf` file and write the code for creating a set in Terraform.

```
provider "aws" {
  region = "ap-south-1"
}
output "sercurity_groups" {
  value = var.sercurity_groups
}
```

![Screenshot from 2023-09-19 13-39-49](https://github.com/Rohit312001/GitDemo/assets/76991475/16bdb419-444f-427e-8d2b-9dc75473c7e9)

- **Step-2:** let's create a `variables.tf` file and write the code for creating a set in Terraform.

```
variable "sercurity_groups" {
  type    = set(string)
  default = ["sg-123231221", "sg-34282304"]
}
```

![Screenshot from 2023-09-19 13-39-58](https://github.com/Rohit312001/GitDemo/assets/76991475/9b5355d7-c8ce-47d1-8af1-321914416c23)

- **Step-3:** After running the `terraform init` command run `terraform plan` to to create an Set in Terraform.

![Screenshot from 2023-09-19 13-40-15](https://github.com/Rohit312001/GitDemo/assets/76991475/28ddfec8-65d4-49d7-ba01-8fcc5455d8ed)

- Use `terraform refresh` to refresh the state by your configuration file, reloads the variables.

```
terraform refresh
```

![Screenshot from 2023-09-19 13-41-01](https://github.com/Rohit312001/GitDemo/assets/76991475/ea88a3a3-d89b-4ffd-afdd-1a19dc1e0474)

---
