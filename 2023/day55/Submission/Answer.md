# Day 55: Understanding Configuration Management with Ansible

## What is Ansible?

- **Ansible** is a software tool that provides simple but `powerful automation` for **cross-platform computer support**. It is primarily intended for **IT professionals**, who use it for **application deployment**, **updates on workstations and servers**, **cloud provisioning**, **configuration management**, **intra-service orchestration**, and nearly anything a systems administrator does on a weekly or daily basis.
- **Ansible** doesn't depend on agent software and has `no additional security infrastructure`, so it's **easy to deploy**.

## How Ansible Works?

- **Ansible** works by `connecting to nodes` (**clients**, **servers**, or whatever you're `configuring`) on a **network**, and then sending a small program called an `Ansible module` to that node. **Ansible** executes these modules over SSH and removes them when finished.
- **SSH keys** are the most common way to provide access, but other forms of `authentication` are also supported.

## Ansible Architecture: Nodes and Modules

- **Ansible's Architecture** is based on the concept of a **control node** and a **managed node**. The platform is executed from the control node where a user runs the `ansible-playbook` command. There must be at least one `control node`; a backup control node can also exist. The devices being automated and managed by the control node are known as **managed nodes**.
- **Ansible** automates `Linux` and `Windows` by connecting to managed **nodes** and pushing out small programs called `Ansible modules`. **Ansible** executes these `modules`, which are the resource models of the desired system state, over **Secure Socket Shell (SSH)** by default and `removes` them when finished.
- `Ansible` modules are written in **Python** and can be written in any language. `Ansible` modules are reusable, standalone scripts that can be used by the **Ansible API**, **Ansible Playbooks**, or **Ansible Galaxy**.

## Create **3 Instances** on `AWS EC2` with following names:

- _Ansible_Master_Server_
- _Node_1_
- _Node_2_

![Screenshot from 2023-08-20 23-06-41](https://github.com/Rohit312001/GitDemo/assets/76991475/897ead5c-8ff3-4b58-a5b1-c83d9dd4968e)

# Task-01: Installation of Ansible on AWS EC2 (Master Node)

- **`Step-01`**: Open **Ansible_Master_Server** and run following commands or create an script for it:

```
#!/bin/bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

![Screenshot from 2023-08-20 23-10-18](https://github.com/Rohit312001/GitDemo/assets/76991475/01d4ea2e-83b1-4eeb-84fb-c7844a1d4f76)

- **`Step-02`**: Give the **permission** to the script and run it:

```
sudo chmod 777 install.sh
sudo ./install.sh
```

![Screenshot from 2023-08-20 23-10-59](https://github.com/Rohit312001/GitDemo/assets/76991475/92ada6f8-b98f-4e22-9844-6bbb61ca06c0)

- **`Step-03`**: Check the **Ansible** version:

```
ansible --version
```

![Screenshot from 2023-08-20 23-14-18](https://github.com/Rohit312001/GitDemo/assets/76991475/5fe4bccc-a570-42f8-84b0-158b026cc4d2)

# Task-02: Ansible Hosts files

### What is Hosts file?

- In the context of **Ansible**, a `host file` (also known as an **inventory file**) is a `configuration file` used to define and organize the list of **target hosts** that **Ansible should manage**.

### Where is Hosts file located?

- **Ansible** uses this file to map **target hosts** to **managed nodes**. The **hosts file** is usually located in `/etc/ansible/hosts`.

- So, open the **hosts** file and add the **IP addresses** of the **Nodes**:

```
sudo vim /etc/ansible/hosts
```

- **Step-04**: Let's add the Nodes IP addresses in the **hosts** file:

```
[servers]
Node_1 ansible_host= <Public IP-Adddress of Node-1>
Node_2 ansible_host= <Public IP-Adddress of Node-2>

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=/home/ubuntu/.ssh/id_rsa
```

![Screenshot from 2023-08-20 23-35-39](https://github.com/Rohit312001/GitDemo/assets/76991475/34fbfa40-7e00-4c8f-b4dc-78c8a0e0f2fb)

- **Step-05**: Now, let's check the **Ansible** inventory:

```
ansible-inventory --list -y -i /etc/ansible/hosts
```

![Screenshot from 2023-08-20 23-36-30](https://github.com/Rohit312001/GitDemo/assets/76991475/85841885-674d-48f9-9a49-e8cb953538a2)

### Let's Create a SSH Key on Ansible_Master_Server and copy it's Public Key in Node_1 and Node_2.

- **Step-06**: Create a SSH Key on **Ansible_Master_Server**

```
cd /home/ubuntu/.ssh
ssh-keygen
```

![Screenshot from 2023-08-20 23-37-20](https://github.com/Rohit312001/GitDemo/assets/76991475/95f41178-183d-4236-b1b5-7d0fc14f2b69)

```
cat id_rsa.pub
```

![Screenshot from 2023-08-21 01-26-58](https://github.com/Rohit312001/GitDemo/assets/76991475/a08180e9-4174-4c31-9dfe-cf8c9a7ccef7)

- **Step-07**: Copy the **Public Key** of **Ansible_Master_Server** and paste it in **Node_1**.

```
# Open Node_1
cd /home/ubuntu/.ssh
vim authorized_keys
```

![Screenshot from 2023-08-20 23-40-29](https://github.com/Rohit312001/GitDemo/assets/76991475/6b40de6e-a8ff-459e-bb9c-378045a5821d)

- Paste the **Public Key** of **Ansible_Master_Server** in **Node_1**.

![Screenshot from 2023-08-20 23-44-09](https://github.com/Rohit312001/GitDemo/assets/76991475/250b7879-6fd3-4591-b22f-e12c980333b3)

- **Step-08**: Copy the **Public Key** of **Ansible_Master_Server** and paste it in **Node_2**.

```
# Open Node_2
cd /home/ubuntu/.ssh
vim authorized_keys
```

![Screenshot from 2023-08-20 23-45-04](https://github.com/Rohit312001/GitDemo/assets/76991475/b64443e1-558d-471c-bdc1-d858d047fe88)

- **Try a ping command using ansible to the Nodes.**

```
ansible all -m ping
```

![Screenshot from 2023-08-20 23-47-57](https://github.com/Rohit312001/GitDemo/assets/76991475/0b545d30-f619-47ef-b095-efef209f9f1d)

- Thus we have Pinged the **Node_1** and **Node_2** from **Ansible_Master_Server**.
