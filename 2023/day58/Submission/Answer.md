# Day 58: Ansible Playbooks

- **Ansible playbooks** run `multiple tasks`, `assign roles`, and `define configurations`, `deployment steps`, and `variables`. If you’re using **multiple servers**, Ansible playbooks organize the steps between the `assembled machines` or `servers` and get them organized and running in the way the users need them to. Consider playbooks as the equivalent of instruction manuals.

- It allows you to describe the desired state of your `systems` and `applications` in a **declarative manner**, and Ansible takes care of executing the `necessary tasks` to achieve that state.

- Ansible playbooks are written in **YAML**. YAML is a `human-readable data serialization language`. It is commonly used for configuration files and in applications where data is being `stored` or `transmitted`.

- **YAML** stands for **YAML Ain't Markup Language**. It is a human-readable data serialization language and commonly used for configuration files, but it can be used in many applications where data is being stored or transmitted.

**Visit my previous blog to learn about** [YAML](https://devops-rohit.hashnode.dev/day-57-comprehensive-guide-to-yaml)

---

## Task-01

- **Write an ansible playbook to create a file on a different server**

- **Write an ansible playbook to create a new user.**

```
-
  name: Create a User
  hosts: all
  become: yes
  tasks:
    - name: Create a User
      user:
        name: rohit
```

- To run the above playbook use the following command:

```
ansible-playbook user.yml
```

![Screenshot from 2023-09-01 07-59-41](https://github.com/Rohit312001/GitDemo/assets/76991475/4fb3c1d1-a6a4-43ba-acdc-c4360f369a9c)

- **Output of the above playbook:**

![Screenshot from 2023-09-01 08-00-08](https://github.com/Rohit312001/GitDemo/assets/76991475/20b6c9bf-de73-42d6-b494-11ad1f25b30d)

---

- **Write an ansible playbook to create a file on a different server.**

```
name: Display of Date in Playbook
hosts: all
server: yes
tasks:
    - name: Display of Date
      command: date

    - name: Greeting Message
      command: echo "Hello World"
# Similarly we can create a file using file module
    - name: Create a File
        file:
            path: /home/rohit/ansible.txt
            state: touch
```

- To run the above playbook use the following command:

```
ansible-playbook date_play.yml
```

![Screenshot from 2023-09-01 07-30-10](https://github.com/Rohit312001/GitDemo/assets/76991475/63110a73-b915-4a31-89aa-b5626df5193f)

- **Output of the above playbook:**

![Screenshot from 2023-09-01 07-31-34](https://github.com/Rohit312001/GitDemo/assets/76991475/fc05d5bb-f13b-481d-af1e-1d931a2a7570)

---

- **Write an ansible playbook to install docker on a group of servers**

```
-
name: Playbook for Installing Docker
hosts: all
become: yes
tasks:
    - name: Install Docker
      apt:
        name: docker.io
        state: latest
    - name: start and enable docker
      service:
        name: docker
        state: started
        enabled: yes
```

- To run the above playbook use the following command:

```
ansible-playbook docker_install.yml
```

![Screenshot from 2023-09-01 07-42-10](https://github.com/Rohit312001/GitDemo/assets/76991475/8163f162-e8a1-46bc-9f28-17eceb37ebb2)

- **Output of the above playbook:**

![Screenshot from 2023-09-01 07-43-46](https://github.com/Rohit312001/GitDemo/assets/76991475/812c5af1-421f-4c45-875e-4e16ea0a6cf9)
![Screenshot from 2023-09-01 07-44-06](https://github.com/Rohit312001/GitDemo/assets/76991475/6c3dc09f-669c-42af-9455-00fde90c9bac)

- **Check Node_1:**

![Screenshot from 2023-09-01 07-45-19](https://github.com/Rohit312001/GitDemo/assets/76991475/6d4acbf2-4c89-4cdc-b6c4-4c590f795513)

- **Check Node_2:**

![Screenshot from 2023-09-01 07-48-45](https://github.com/Rohit312001/GitDemo/assets/76991475/8ad61a17-f420-40e1-8407-6a915b071b07)

---

## Task-02

### **Ansible playbooks:**

- An **Ansible playbook** is a `structured` and `human-readable document` written in **YAML** (YAML Ain't Markup Language) that defines a `set of tasks` and configurations to be performed on remote servers. **Playbooks are the heart of Ansible automation** and allow you to define the desired state of your systems and applications.

- **YAML Syntax:** `Playbooks` are written in YAML format, which is a `human-readable markup language`. YAML uses indentation and colons to structure `data hierarchically`. Indentation is crucial in YAML to define the `nesting levels of data`.

- **Play:** A `playbook` starts with a `list of plays`. Each play targets a **specific group of hosts** and defines a **set of tasks** to be executed on those **hosts**.

- **name:** A user-friendly name for the play.

- **hosts:** The group(s) of hosts this play will target. Host groups are defined in the inventory file.

- **become:** Indicates whether privilege escalation is required to perform tasks (using sudo).

- **tasks:** List of tasks to be executed in this play.

For Example;

```
---
- name: My First Playbook
  hosts: web_servers
  become: yes
  tasks:
    # Tasks will be defined here
    - name: Ensure Nginx is installed
    apt:
      name: nginx
      state: present
```

- **name:** A description of the task.

- **module:** The Ansible module to use for the task (e.g., apt, yum, file, copy, etc.).

- **module_arguments:** Arguments specific to the module being used.

---
