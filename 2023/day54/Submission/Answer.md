# Day 54: Understanding Infrastructure as Code and Configuration Management

## What is Infrastructure as Code(IaC)?

- **Infrastructure as Code (IaC)** is the **managing** and **provisioning of infrastructure** through `code instead of through manual processe configuration files` are created that contain your infrastructure specifications, which makes it easier to edit and distribute configurations.
- It also ensures that you `provision the same environment every time`. By codifying and documenting your configuration specifications, `IaC aids configuration management` and `helps you to avoid undocumented`, `ad-hoc configuration changes`.
- **Version control** is an important part of **IaC**, and your configuration files should be under source control just like any other software source code file. `Deploying your infrastructure as code` also means that you can `divide your infrastructure into modular` components that can then be combined in different ways through `automation`.

![1_Q3vaZO0shJ4Iw4B5ABJl7w-1024x547](https://github.com/Rohit312001/GitDemo/assets/76991475/e6270ef3-804d-40b3-82fe-b5bc36a5fbfb)

## What is Configuration Management(CM)?

- **Configuration Management** helps `prevent undocumented changes` from `working their way into the environment`. By doing so, CM can help `prevent performance issues`, `system inconsistencies`, or `compliance issues` that can lead to `regulatory fines` and `penalties`. Over time, these `undocumented changes can lead` to **system downtime**, **instability**, or **failure**.
- Performing these tasks manually is too complex in **large systems**. Software configuration management can involve `hundreds or thousands` of components for `each application`, and without `proper documentation IT organizations` could easily lose track of which systems require attention, what steps are necessary to `remediate problems`, what tasks should be prioritized and whether changes have been validated and propagated throughout the system.
- A `Configuration management system allows` the enterprise to define settings in a `consistent manner`, then to **build and maintain** them according to the established baselines.
  **A configuration management plan should include a number of tools that:**
- _Enable classification and management of systems in groups_
- _Make centralized modifications to baseline configurations_
- _Push changes automatically to all affected systems to automate updates and patching_
- _Identify problem configurations that are underperforming or non-compliant_
- _Automate prioritization of actions needed to remediate issues_
- _Apply remediation when needed._

![1685170959124](https://github.com/Rohit312001/GitDemo/assets/76991475/1e94644a-6347-4334-8194-c7337650f665)

## What's the difference between IaC and CM?

| **Infrastructure as Code(IaC)**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | **Configuration Management(CM)**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| - **IaC** refers to the practice of **managing and provisioning infrastructure** using `code and automation`. The main goal of IAC is to `treat infrastructure configuration and provisioning as software development`. This involves `writing code` (usually in a **high-level scripting language**) to define the `desired state of your infrastructure components`, such as **servers**, **networks**, and **storage**.This code is _versioned_, _stored in version control systems_, and can be used to _create_, _modify_, and _delete infrastructure resources_. IaC tools like **`Terraform`**, **`AWS CloudFormation`**, and **`Ansible`** are used to achieve this. | **Configuration Management**, on the other hand, is `focused` on `maintaining` and `controlling` the `configurations of software applications` and their environments. CM involves **defining and managing the settings**, **parameters**, and **configurations of software systems**, **including applications**, **databases**, and **services**. The primary goal of CM is to ensure `consistency` and `reproducibility` across `different environments` and stages of `software development and deployment`. Tools like **Puppet**, **Chef**, and **Ansible** (which can also be used for IAC) are often used for `configuration management.` |
| - **IaC** is a **subset of configuration management**.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | - **CM** is a **broader term** that includes **IaC**.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| - **IaC** is **focused on infrastructure**.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | - **CM** is **focused on software applications**.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |

## What are the most common IaC and CM tools?

- **IaC tools** include **Terraform**, **AWS CloudFormation**, **Ansible**, **Pulumi**, **Chef**, **Puppet**, and **SaltStack**.

![infrastructure-as-a-code](https://github.com/Rohit312001/GitDemo/assets/76991475/3d2505a7-2032-4926-a5df-cc0550d55030)

- **CM tools** include **Puppet**, **Chef**, **Ansible**, **SaltStack**, **CFEngine**, and **Bcfg2**.

![List-of-top-5-configuration-management-tools-in-DevOps](https://github.com/Rohit312001/GitDemo/assets/76991475/c0884374-cc1a-4644-9d88-0fde8c731be6)

## Why we need IaC and CM?

- **IaC** and **CM** are **essential** for **modern software development** and **deployment**. They **help** you **avoid** the **pitfalls** of **manual configuration** and **provisioning** and **ensure** that your **infrastructure** and **applications** are **consistent**, **reproducible**, and **reliable**. They also **help** you **reduce** the **time** and **effort** required to **deploy** and **manage** your **applications** and **infrastructure**.

## What are the benefits of IaC and CM?

- **IaC** and **CM** provide a number of benefits, including:
- **Consistency** and **reproducibility** across **environments** and **stages** of **software development** and **deployment**
- **Reduced** time and **effort** required to **deploy** and **manage** applications and infrastructure.
- **Reduced** risk of **human error** and **downtime** due to **manual configuration** and **provisioning**.
- **Improved** security and **compliance** through **automated** and **consistent** configuration and provisioning.
- **Improved** collaboration and **communication** between **development** and **operations** teams.
- **Improved** visibility into **infrastructure** and **application configurations**.
- **Improved** scalability and **flexibility** through **modular** and **reusable** code.
- **Improved** efficiency through **automation**.

---
