# Day 23 Task: Jenkins Freestyle Project for DevOps Engineers.

Today's challenge is particularly exciting as it entails creating a Jenkins Freestyle Project, an opportunity for DevOps engineers to showcase their skills and push their limits.

## What is CI/CD?
- **`CI`** or **`Continuous Integration`** is the practice of automating the integration of code changes from multiple developers into a **single codebase**. It is a software development practice where the developers commit their work frequently into the central code repository (Github or Stash). Then there are automated tools that build the newly committed code and do a code review, etc as required upon integration.
- The `key goals of Continuous Integration` are to find and `address bugs quicker`, `make the process of integrating code across a team of developers easier`, `improve software quality` and `reduce the time` it takes to release new feature updates. 

- **`CD`** or **`Continuous Delivery`** is carried out after **Continuous Integration** to make sure that we can release new changes to our customers quickly in an `error-free way`. This includes running integration and regression tests in the staging area (similar to the production environment) so that the final release is not broken in production. It ensures to automate the release process so that we have a release-ready product at all times and we can deploy our application at any point in time. 

## What Is a Build Job?
- A **Jenkins** build job contains the configuration for automating a specific task or step in the application building process. These tasks include **gathering dependencies**, **compiling**, **archiving**, or **transforming code**, and **testing and deploying code** in different environments.

- Jenkins supports several types of **build jobs**, such as `freestyle projects`, `pipelines`, `multi-configuration projects`, `folders`, `multibranch pipelines`, and `organization folders`.

## What is Freestyle Projects ?? 🤔
A **freestyle project** in Jenkins is a type of project that allows you to **build**, **test**, and **deploy software** using a variety of different options and configurations. 

---
# Task-01

### Create a new Jenkins freestyle project for your app.

![Screenshot from 2023-04-05 15-54-04](https://user-images.githubusercontent.com/76991475/230079630-13b13ab8-a9ba-4bcb-b17c-b464cc47b796.png)

![Screenshot from 2023-04-05 15-46-29](https://user-images.githubusercontent.com/76991475/230079524-f7714d6a-705e-4ba6-b47c-2666d2773791.png)

![Screenshot from 2023-04-05 15-46-39](https://user-images.githubusercontent.com/76991475/230079551-afa22c74-7fcb-4240-87c2-df4ab2c8e2ce.png)

### In the "Build" section of the project, add a build step to run the "docker build" command to build the image for the container.

![Screenshot from 2023-04-05 15-49-03](https://user-images.githubusercontent.com/76991475/230079559-79c8d8d1-7f7a-44a0-8323-865bc1170706.png)

---
### Final Output:

`Build Successfull`

![Screenshot from 2023-04-05 15-53-41](https://user-images.githubusercontent.com/76991475/230079610-8d33bb1a-e204-4b0e-80cc-784d7365e232.png)

`Console Output`

![Screenshot from 2023-04-05 15-51-52](https://user-images.githubusercontent.com/76991475/230079579-180485bc-d72b-4106-8de6-deb252288162.png)

![Screenshot from 2023-04-05 15-52-24](https://user-images.githubusercontent.com/76991475/230079591-ad43ddbe-f65b-4fce-985d-a29d9d22e4e6.png)

---
### Docker Check pull of image is correct or not.

![Screenshot from 2023-04-05 15-54-39](https://user-images.githubusercontent.com/76991475/230079660-aa8875c8-6a9f-4a97-abaa-016c05ea038e.png)

![Screenshot from 2023-04-05 15-54-33](https://user-images.githubusercontent.com/76991475/230079681-c1eec3f4-1148-4b4d-a737-7a25c6c70076.png)

---

# Task-02

### - Create Jenkins project to run "docker-compose up -d" command to start the multiple containers defined in the compose file
`docker-compose.yaml file`

![Screenshot from 2023-04-05 17-49-51](https://user-images.githubusercontent.com/76991475/230082389-e07938fa-1692-4ccb-9c11-d31da77ca8d5.png)

![Screenshot from 2023-04-05 17-42-48](https://user-images.githubusercontent.com/76991475/230082236-000c8744-13a2-4b15-80e9-4d8c6cb72446.png)

![Screenshot from 2023-04-05 17-42-58](https://user-images.githubusercontent.com/76991475/230082252-2c454c5d-6026-4a05-a57b-7064ee5e5951.png)

`Execute Shell`
![Screenshot from 2023-04-05 17-43-02](https://user-images.githubusercontent.com/76991475/230082267-67c83c9a-1e5d-4716-8aed-4fbf21dc7187.png)

---
### Final Output:

![Screenshot from 2023-04-05 17-42-34](https://user-images.githubusercontent.com/76991475/230082224-188fac24-12f2-428b-bf9f-e31f6b2ad764.png)

![Screenshot from 2023-04-05 17-43-23](https://user-images.githubusercontent.com/76991475/230082291-76bf7396-47cc-4560-95ab-549efe4beb8d.png)

![Screenshot from 2023-04-05 17-43-35](https://user-images.githubusercontent.com/76991475/230082343-9bf27142-8afb-45ff-a6d7-e5941a3ed26b.png)

---
### Docker Check pull of image is correct or not.

![Screenshot from 2023-04-05 17-44-28](https://user-images.githubusercontent.com/76991475/230082376-afccf73b-900d-44c8-9b59-a7f6100147a9.png)

![Screenshot from 2023-04-05 17-44-11](https://user-images.githubusercontent.com/76991475/230082367-79f0eae8-3b85-4da7-b86c-1cdc8429ced2.png)

---












