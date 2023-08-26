# Day 56: Understanding Ad-hoc commands in Ansible

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

---

### For a more comprehensive version of this blog post, please refer to the previous entry where you can find a thorough and hands-on rephrasing of the content:

- https://devops-rohit.hashnode.dev/day-55-grasping-configuration-management-with-ansible

---

## Create **3 Instances** on `AWS EC2` with following names:

- _Ansible_Master_Server_
- _Node_1_
- _Node_2_

![Screenshot from 2023-08-26 22-37-15](https://github.com/Rohit312001/GitDemo/assets/76991475/8e3c8903-9605-472a-a7a3-d0234a594382)

### Installation of Ansible on AWS EC2 (Master Node)

```
#!/bin/bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
```

```
sudo chmod 777 install.sh
sudo ./install.sh
```

![Screenshot from 2023-08-26 21-07-38](https://github.com/Rohit312001/GitDemo/assets/76991475/031154bb-821c-4422-a749-8891acc96192)

```
ansible --version
```

![Screenshot from 2023-08-26 22-03-06](https://github.com/Rohit312001/GitDemo/assets/76991475/c8328674-8620-4610-bb0e-ee0db712c3bd)

### Create ssh key on Master Node

```
cd ~/.ssh
ssh-keygen
```

![Screenshot from 2023-08-26 22-05-56](https://github.com/Rohit312001/GitDemo/assets/76991475/c8f07db7-3985-4239-b7d7-36d8ca4d229b)

### What is Hosts file?

- In the context of **Ansible**, a `host file` (also known as an **inventory file**) is a `configuration file` used to define and organize the list of **target hosts** that **Ansible should manage**.

### Where is Hosts file located?

- **Ansible** uses this file to map **target hosts** to **managed nodes**. The **hosts file** is usually located in `/etc/ansible/hosts`.

- So, open the **hosts** file and add the **IP addresses** of the **Nodes**:

```
sudo vim /etc/ansible/hosts
```

```
[servers]
Node_1 ansible_host= <Public IP-Adddress of Node-1>
Node_2 ansible_host= <Public IP-Adddress of Node-2>

[all:vars]
ansible_python_interpreter=/usr/bin/python3
ansible_ssh_private_key_file=/home/ubuntu/.ssh/id_rsa
```

![imageedit_5_3816895337](https://github.com/Rohit312001/GitDemo/assets/76991475/b55d1e80-a26b-4df8-8a5a-cb0ea83dd126)

---

### Now we will ping Node server using Master Node by pasting the public ssh key of Master Node to the Node server.

```
# Open Node_1
cd /home/ubuntu/.ssh
vim authorized_keys
```

![imageedit_9_3321018291](https://github.com/Rohit312001/GitDemo/assets/76991475/7a28a394-ad4a-46c1-9e95-a2369a42fec0)

```
# Open Node_2
cd /home/ubuntu/.ssh
vim authorized_keys
```

![imageedit_13_8868297131](https://github.com/Rohit312001/GitDemo/assets/76991475/49a5927f-0f51-4b76-9006-ba3d2431d19d)

---

# Task-01

### **Write an `ansible` **ad hoc ping** command to ping 2 servers from inventory file.**

```
ansible all -m ping
# or
ansible servers -m ping
# or
ansible all -m ping -i /etc/ansible/hosts
```

![Screenshot from 2023-08-26 22-21-37](https://github.com/Rohit312001/GitDemo/assets/76991475/2c63055f-ae6b-447f-b802-46f225dfc9b2)

---

### **Write an `ansible` **ad hoc command** to check uptime.**

- **ansible:** This is the command-line tool used to interact with Ansible.

- **all:** This refers to the group of hosts or servers on which you want to execute the specified command. In this case, "all" means that the command will be executed on all the hosts specified in the inventory.

- **-a:** This option specifies that you are providing an ad-hoc command to execute on the targeted hosts.

- **uptime:** This is the actual command you want to run on the remote hosts. In this case, it's the "uptime" command, which provides information about how long the system has been running.

- **-i /etc/ansible/hosts:** This option specifies the inventory file to use. The inventory file contains a list of hosts or IP addresses that Ansible will manage. In this case, the inventory file is located at "/etc/ansible/hosts".

```
ansible all -a  uptime -i /etc/ansible/hosts
```

![Screenshot from 2023-08-26 22-26-21](https://github.com/Rohit312001/GitDemo/assets/76991475/394e4e21-1fe9-48ea-9f22-d39e67f96f97)

---

### Now we will use ansible ad-hoc command for checking version of python installed on Node_1 and Node_2.

```
ansible all -b -m shell -a 'sudo python3 --version
```

![Screenshot from 2023-08-26 22-29-13](https://github.com/Rohit312001/GitDemo/assets/76991475/fe84f155-875c-4d9e-ad9a-44935dc2e1ae)

## Happy Learning :)
