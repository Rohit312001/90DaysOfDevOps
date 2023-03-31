# Day 18 Task: Docker for DevOps Engineers

### Till now you have created Docker file and pushed it to the Repository. Let's move forward and dig more on other Docker concepts.

---
## What is Docker Compose ?

- **Docker Compose** is a tool that allows you to define and run multi-container Docker applications. 
- It is a tool for defining and running multi-container Docker applications, using a **`YAML`** file to configure the application's ***`services`**, **`networks`**, and **`volumes`**.
- With Docker Compose, you can easily configure and run multiple containers as a single application, making it easier to manage and deploy complex applications.
- Docker Compose is often used for **developing** and **testing applications locally**, as it allows you to define and `run an entire application stack on a single machine`. 
- It also makes it easy to share your `application's configuration` with other developers, as the configuration is stored in a `single YAML file`that can be committed to version control.

## What is YAML?

- YAML is a **`data serialization`** language that is often used for writing configuration files. Depending on whom you ask, **`YAML`** stands for **`Yet Another Markup Language or YAML`** ain’t markup language (a recursive acronym), which emphasizes that YAML is for data, not documents. 
- YAML is a popular programming language because it is `human-readable`and easy to understand.
- YAML files use a **`.yml`** or **`.yaml`** extension.

### Steps to create Docker-Compose.yaml file :

**`Step1:`** Version (Version of Docker Compose).

**`Step2:`** Services (Where we add containers)

Eg.(**`Containers`**,**`images`**,**`port`**,**`environments`**)

**`Step3:`** We can create multiple environment like this.

---
## Task-1:

### Learn how to use the docker-compose.yml file, to set up the environment, configure the services and links between different containers, and also to use environment variables in the docker-compose.yml file. 

![Screenshot from 2023-03-31 19-56-40](https://user-images.githubusercontent.com/76991475/229152181-fcf19ca9-b507-4fa1-90f5-6b25323a37b6.png)

---

## Task-2:

### Pull a pre-existing **Docker image from a public repository** (e.g. Docker Hub) and run it on your local machine.

![](https://user-images.githubusercontent.com/76991475/227799767-94468a81-3550-43af-a5e9-9a8268929961.png)

---
### Inspect the container's running processes and exposed ports using the docker inspect command.

![](https://user-images.githubusercontent.com/76991475/227799664-a2b6fca8-c7e4-4cce-aaf0-1cecedda6f5a.png)

---
### Use the docker logs command to view the container's log output.

`docker log <container_id>`

![Screenshot from 2023-03-31 20-24-23](https://user-images.githubusercontent.com/76991475/229157424-764d01bd-ccab-4e42-ab5f-5624757f94b1.png)

---
### Use the docker stop and docker start commands to stop and start the container.

**`To stop the docker container`**
`docker stop <container_id>or<image_id>`

![Screenshot from 2023-03-31 20-26-07](https://user-images.githubusercontent.com/76991475/229157971-d1ec8b78-7304-4a22-84dc-eed3e46ea8fa.png)

![Screenshot from 2023-03-31 20-25-09](https://user-images.githubusercontent.com/76991475/229158088-cdffcadc-14fe-4dc6-a445-87ae94b290c2.png)

**`To start the docker container`**
`docker start <container_id>or<image_id>`

![Screenshot from 2023-03-31 20-26-17](https://user-images.githubusercontent.com/76991475/229158172-c3df5ba1-b1ed-4364-9647-d5a7f1927d5d.png)

![Screenshot from 2023-03-31 20-26-39](https://user-images.githubusercontent.com/76991475/229158192-aad0d876-ae27-4979-a3ce-5b288451196b.png)

---
### Use the docker rm command to remove the container when you're done.
`docker rm <container_id>or<image_id>`

![Screenshot from 2023-03-31 20-40-39](https://user-images.githubusercontent.com/76991475/229159373-3b1403a2-7d7b-4d16-adb0-75b5593b5942.png)

---