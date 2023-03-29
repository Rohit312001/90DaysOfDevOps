# Day 17 Task: Docker Project for DevOps Engineers.

## Today's challenge is bit special Because You are going to do DevOps project today with Docker.

### Before moving to project on Docker.Let's understand what is Dockerfile.

# Dockerfile

- A **`Dockerfile`** is like a set of instructions for making a container. It tells Docker `what base image to use`, `what commands to run` and `what files to include`. 
- For example, if you were making a container for a website, the Dockerfile might tell Docker to use an official web server image, copy the files for your website into the container, and start the web server when the container starts.

## Basic need for a Dockerfile are as follow:

- **Specify the base image** **`(FROM)`**: The first line of a Dockerfile should specify the base image that the **Docker image** will be built upon. This can be a minimal operating system image or a **pre-built image** that includes a specific software stack.{eg.`FROM node`}

- **Install dependencies** **`(RUN)`**: If your application has dependencies, you need to install them in the Docker image. This can be done using the `RUN` command in the Dockerfile.

- **Copy application files** **`(COPY)`**: After installing dependencies, you need to copy your application files into the Docker image. This can be done using the `COPY` command in the Dockerfile.

- **Set environment variables** **`(ENV)`**: You can set environment variables in the Dockerfile that will be used by your application. This can be done using the `ENV` command in the Dockerfile.

- **Expose ports** **`(EXPOSE)`**: If your application listens on a specific port, you need to expose that port in the Docker image. This can be done using the `EXPOSE` command in the Dockerfile.

- **Define the command to run** **`(CMD)`**: Finally, you need to specify the command that Docker will use to run your application inside the container. This can be done using the `CMD` command in the Dockerfile.

---
# Tasks:

### Create a Dockerfile for a simple web application.

![Screenshot from 2023-03-30 02-33-29](https://user-images.githubusercontent.com/76991475/228670646-20102f3d-c896-4388-9a88-8e75c9ad45f2.png)

![Screenshot from 2023-03-30 02-35-12](https://user-images.githubusercontent.com/76991475/228670693-948eb427-fa9b-4c2c-93b1-0898620eb42c.png)

---
### Build the image using the Dockerfile and run the container.

![Screenshot from 2023-03-30 02-33-46](https://user-images.githubusercontent.com/76991475/228670656-171dfb84-5ebe-444d-8a89-443ecf48aad3.png)

![Screenshot from 2023-03-30 02-34-25](https://user-images.githubusercontent.com/76991475/228670667-702ecf87-75c2-4385-8e7b-e92fa1409628.png)

---
### Now run on the port you want to run your website.

![Screenshot from 2023-03-30 02-34-46](https://user-images.githubusercontent.com/76991475/228670682-3381fa9b-1ea1-4cfd-8a9d-d183a81f4dab.png)

---
### Verify that the application is working as expected by accessing it in a web browser

![Screenshot from 2023-03-30 02-54-41](https://user-images.githubusercontent.com/76991475/228671204-7fecba74-85de-4161-a43e-63a159107a70.png)

---
### Push the image to a public or private repository (e.g. Docker Hub )

![Screenshot from 2023-03-30 03-08-56](https://user-images.githubusercontent.com/76991475/228673859-0d066483-e816-4135-ba91-81dca3d361f9.png)

![Screenshot from 2023-03-30 03-10-22](https://user-images.githubusercontent.com/76991475/228674023-56ea4017-92f8-495b-85fb-3089a4c17972.png)

---