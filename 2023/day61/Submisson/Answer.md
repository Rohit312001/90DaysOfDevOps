# Day 61- Terraform Commands

### What is Terraform?

- **`Terraform`** is an `infrastructure as code (IaC) tool` that allows you to `create`, `manage`, and `update infrastructure resources` such as `virtual machines`, `networks`, and `storage in a repeatable`, `scalable`, and `automated way`.
- **Terraform** is an `open-source` tool created by `HashiCorp` and is written in the `Go programming language`. It is available for **Windows**, **Linux**, and **macOS**

## Task 1:

**Terraform is an infrastructure-as-code (IAC) tool used for building, changing, and versioning infrastructure efficiently. It has several commands to manage your infrastructure code and the resources it provisions.**

**Here are some commonly used Terraform commands:**

1. **Command: init**

`terraform init`

- `Initializes` a **new** or **existing Terraform configuration** in the current directory. This command downloads the necessary provider `plugins` and sets up the `working directory`.
- **What it does:** Prepares your project for Terraform.

2. **Command: init -upgrade**

`terraform init -upgrade`

- `Upgrades` the installed Terraform plugins to the latest version, if available. This command is useful when `upgrading Terraform versions` or when there are new versions of the plugins that need to be used.
- **What it does:** It Upgrades the installed Terraform to its latest version.

3. **Command:**

`terraform plan`

- Generates an `execution plan` describing what Terraform will do to `reach the desired state` defined in your configuration. It shows which resources will be **created**, **updated**, or **destroyed**.
- **What it does:** Shows what Terraform will do without making changes.

4. **Command: apply**

`terraform apply`

- `Applies the changes` defined in your Terraform configuration to `create` or `update resources` based on the execution plan. It prompts for confirmation before making changes.
- **What it does:** Makes changes to your infrastructure based on the plan.

5. **Command: validate**

`terraform validate`

- `Checks the syntax` and `configuration of your Terraform files` for errors without actually creating or modifying resources.
- **What it does:** Checks your configuration for errors.

6. **Command: fmt**

`terraform fmt`

- `Rewrites` Terraform configuration files to a `canonical format` and style. This applies standard formatting conventions to the code to make it easier to read and understand.
- **what it does:** It helps ensure that your code is easy to **read**, **maintain**, and **collaborate** on by enforcing a consistent code structure.

7. **Command: destroy**

`terraform destroy`

- Destroys all `resources` defined in your `configuration,` effectively tearing down your infrastructure. It also prompts for confirmation before proceeding.
- **What it does:** Removes all resources created by Terraform.

8. **Command:show**

`terraform show`

- Inspects the `current state` of the `infrastructure` and `outputs` the `resource` information.
- **What it does:** Shows the current state of your infrastructure.

9. **Command: graph**

`terraform graph`

- **terraform graph:** Creates a visual representation of the Terraform `resources` defined in your `configuration`. It outputs the generated graph in the DOT format.
- **What it does:** Generates a visual graph of resource dependencies.

10. **Command:**

`terraform import`

- Imports existing `infrastructure` into your Terraform `state`. This allows you to take resources you've created by some other means and bring it under Terraform management.
- **What it does:** Imports existing infrastructure into Terraform.

11. **Command: output**

`terraform output`

- Reads the `state` file and `outputs` the `value` of a `specified output variable`. This is useful for fetching the value of a specific variable.
- **What it does:** Reads an output from a state file.

12. **Command: provider**

`terraform providers`

- Prints a tree of the `providers` used in the `configuration`. This is useful for finding out the providers required for a configuration.
- **What it does:** Lists the providers (e.g., AWS, Azure) used in your configuration.

13. **Command: workspace**

`terraform workspace`

- Used to create, list, and delete Terraform `workspaces`. Workspaces allow you to manage multiple distinct sets of infrastructure resources with the same configuration files.
- **What it does:** Manages workspaces (e.g., dev, staging, prod).

14. **Command: refresh**

`terraform refresh`

- Updates the `state` of `resources` in a Terraform `state` file. This is useful when the `state` of a resource is changed by some other means.
- **What it does:** Updates the state file.

15. **Command: version**

`terraform version`

- Prints the `Terraform version`. This is useful for checking which version of Terraform is running.
- **What it does:** Prints the Terraform version.

### Who are Terraform's main competitors?

![Terraform_Diagram](https://github.com/Rohit312001/GitDemo/assets/76991475/0f7f29ab-b76e-464f-867c-33a821cf08b0)

- **AWS CloudFormation:** AWS CloudFormation is a service provided by Amazon Web Services (AWS) for defining and deploying infrastructure as code on the AWS platform. It's a direct competitor for those who are heavily invested in AWS.

- **Ansible:** Ansible is an open-source software provisioning, configuration management, and application-deployment tool. It's a direct competitor for those who are heavily invested in Red Hat.

- **Chef and Puppet:** Chef and Puppet are traditional configuration management tools but can also be used for infrastructure automation. While they differ in their approach from Terraform, they can be considered competitors in the broader infrastructure automation landscape.

- **Packer:** Packer is an open-source tool for creating identical machine images for multiple platforms from a single source configuration. It's a direct competitor for those who are heavily invested in HashiCorp.

- **Kubernetes:** While not a direct competitor, Kubernetes, the container orchestration platform, plays a significant role in managing application deployments and infrastructure at scale. It complements tools like Terraform, and there's some overlap in use cases.

- **Cloud Foundry:** Cloud Foundry is an open-source, multi-cloud application platform as a service (PaaS) governed by the Cloud Foundry Foundation, a 501(c)(6) organization. It's a direct competitor for those who are heavily invested in Cloud Foundry.

---
