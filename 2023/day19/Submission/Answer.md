# Day 19 Task: Docker for DevOps Engineers

### Till now you have learned how to create docker-compose.yml file and pushed it to the Repository. Let's move forward and dig more on other Docker-compose.yml concepts.
### Today we will learn Docker Volume & Docker Network.

## Docker-Volume :
- Docker allows you to create something called **volumes**.Volumes are like separate storage areas that can be accessed by containers. They allow you to store data, like a **`database`**, **`outside the container`**, so it doesn't get deleted when the container is deleted.
- You can also **mount from the same volume** and create more containers having same data.

## Docker Network
- Docker allows you to create virtual spaces called **networks**, where you can connect **`multiple containers`** (small packages that hold all the necessary files for a specific application to run) together. This way, the containers can communicate with each other and with the host machine (the computer on which the Docker is installed).
- When we run a container, it has its own storage space that is only accessible by that specific container. 

---

## Task-1

- Create a multi-container docker-compose file which will bring *UP* and bring *DOWN* containers in a single shot ( Example - Create application and database container )

![Screenshot from 2023-04-01 20-39-05](https://user-images.githubusercontent.com/76991475/229304527-d47b2da1-e5be-4590-8b8e-482d2f8abd6e.png)

- Use the `docker-compose up` command with the `-d` flag to start a multi-container application in detached mode.

![Screenshot from 2023-04-01 20-39-28](https://user-images.githubusercontent.com/76991475/229304534-e1e6ca96-0f0b-4c11-bc61-fcc4a5f71687.png)

- Use the `docker-compose scale` command to increase or decrease the number of replicas for a specific service. 

![Screenshot from 2023-04-01 20-57-52](https://user-images.githubusercontent.com/76991475/229304552-998f776f-6d0a-4e3e-a4d5-07b2832c9782.png)

- Use the `docker-compose ps` command to view the status of all containers, and `docker-compose logs` to view the logs of a specific service.

![Screenshot from 2023-04-01 20-41-20](https://user-images.githubusercontent.com/76991475/229304547-d89c0c65-f907-4803-800a-4a33bd528779.png)

- Use the `docker-compose down` command to stop and remove all containers, networks, and volumes associated with the application

![Screenshot from 2023-04-01 21-01-48](https://user-images.githubusercontent.com/76991475/229304558-fc8c2336-ba0d-43dd-ad2a-0bc287d3e97b.png)

---
## Task-2

- Learn how to use Docker Volumes and Named Volumes to share files and directories between multiple containers.

![Screenshot from 2023-04-01 21-24-43](https://user-images.githubusercontent.com/76991475/229305255-42e6b2b1-3059-41bd-8cb8-2c4492928252.png)

- Create two or more containers that read and write data to the same volume using the `docker run --mount` command.

![Screenshot from 2023-04-01 22-07-40](https://user-images.githubusercontent.com/76991475/229304575-7aa8075b-d72a-4922-ab23-9a71a6fafe4e.png)

- Use the docker volume ls command to list all volumes and docker volume rm command to remove the volume when you're done.

![Screenshot from 2023-04-01 21-24-43](https://user-images.githubusercontent.com/76991475/229304581-ec085cd6-65a2-4424-8675-161116546eb3.png)
![Screenshot from 2023-04-01 22-20-26](https://user-images.githubusercontent.com/76991475/229304585-8379f1e8-4847-4b90-b667-e7b7713b307d.png)

- We can verify the volumes are connect are not and running on required port.

![Screenshot from 2023-04-01 22-22-53](https://user-images.githubusercontent.com/76991475/229304601-00f99c55-5985-4500-a522-7ad16c517b57.png)

![Screenshot from 2023-04-01 22-23-13](https://user-images.githubusercontent.com/76991475/229304604-85a242d4-0c9e-4f9f-98c5-f4fc727baa3a.png)

![Screenshot from 2023-04-01 22-24-54](https://user-images.githubusercontent.com/76991475/229304606-c3e56295-b6b9-4b25-b055-f96d6170eedd.png)

---