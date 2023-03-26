# Day 16 Task: Docker for DevOps Engineers.

## What is Docker?
- Docker is a container platfrom that allows you to **build**,**test** and **deploy** application quickly.
- A Developer defines all the applications and its dependencies in a `Dockerfile` which is then used to build **docker images** that defines  Docker container.
- Doing this ensures that your application will run in any environment.

## What is "`Image`" in Docker ?
- In Docker, an image is a `lightweight`, `stand-alone`, `executable package` that includes everything needed to run a piece of software, including the code,**runtime**,**libraries**,**environment variables**, and any other dependencies. 
- Docker images are typically built using a `Dockerfile`, which is a text file that contains a set of instructions for creating the image.

## What is "`Container`" in Docker?
- A Container is a way to package application with everything they need inside the package including the dependencies & Configuration.

## What is "`Container Image`" in Docker?
- When running a container, it uses an isolated file system.This custom file system is provided by a container image.
- Since the image contains the container's file system, it must contain everything needed to run an application `-all dependenices`, `configurations`, `scripts`, `binaries` etc.
- The image also contains other configurations for the container such as **environment variables**, a default `command to run` and other **metadata**.

---
## How to check Docker Version ?

![docker version](https://user-images.githubusercontent.com/76991475/227799561-33288aee-80f8-4dcb-b17c-5d3baca08358.png)

---
# Docker Commands:
- **`docker pull <image_name>`** -> This command is used to image from local repository or from DockerHub.

![docker pull](https://user-images.githubusercontent.com/76991475/227799767-94468a81-3550-43af-a5e9-9a8268929961.png)

- **`docker container`** -> This command is used to list all the container of images.

![docker container ls](https://user-images.githubusercontent.com/76991475/227799581-fb443d39-3c06-4212-8cfe-ba8f7c11ed3d.png)

- **`docker run <image_id>`** -> Docker run means to run an image to create an container.

![docker run](https://user-images.githubusercontent.com/76991475/227799605-5401eb71-6f17-4dfb-9da6-61da7bc3f44b.png)

`Docker Desktop AppView`

![docker run desktop view](https://user-images.githubusercontent.com/76991475/227799614-9efc6014-2c9d-49c8-865e-9750c1e1f298.png)

`Running in **Interactive Environment** `

![docker run -it command](https://user-images.githubusercontent.com/76991475/227799647-5b391b1f-d0c7-4761-963c-2e058a023e85.png)


- **`docker inspect <image_id>`** -> It will give all the information of the container.(eg.**state**,**path**,**id**)

![docker inspect](https://user-images.githubusercontent.com/76991475/227799664-a2b6fca8-c7e4-4cce-aaf0-1cecedda6f5a.png)

- **`docker port`** -> This command is used for mapping of port for a containers.

![docker port](https://user-images.githubusercontent.com/76991475/227799787-2efc2843-b924-44cb-afcd-450dbdc591dd.png)

`WebView on httpport:27017`

![docker http port 27017](https://user-images.githubusercontent.com/76991475/227799795-10f45714-bf4d-4019-9127-300d8de383b8.png)

- **`docker stats <image_id>`** -> This command show the resource usage statistics for one or more containers.

![docker stats](https://user-images.githubusercontent.com/76991475/227799829-3faaae90-e2f6-46b1-8374-d12f4096f5ac.png)
![docker stats shown](https://user-images.githubusercontent.com/76991475/227799848-59ebc866-7bb5-4c99-9b9e-136e1d9907d0.png)

- **`docker top <container_id>`** -> This command shows the processes running inside a containers.

![docker top](https://user-images.githubusercontent.com/76991475/227799860-2fdd0ffa-bc9d-4d71-a1c6-2296b12a89f1.png)

- **`docker save`** -> This command is used to save an image to a tar archive.
`docker save [OPTIONS] IMAGE [IMAGE...]`

![docker save](https://user-images.githubusercontent.com/76991475/227799887-bfc8c908-cdb9-49b2-9e2b-9892f59ef4cc.png)
![docker save folder view](https://user-images.githubusercontent.com/76991475/227799894-e1bf8605-8262-4c6c-a375-d428e465814c.png)

- **`docker load`** -> This ccommand is used to load an image from a tar archive.

![docker load](https://user-images.githubusercontent.com/76991475/227799911-5b82c948-4e2b-4ba5-afb6-d5a53f219762.png)

---

