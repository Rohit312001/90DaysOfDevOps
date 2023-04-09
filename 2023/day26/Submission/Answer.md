# Day 26 Task: Jenkins Declarative Pipeline

- One of the most important parts of your **DevOps** and **CI/CD** journey is a **`Declarative Pipeline Syntax of Jenkins`**

## What is Pipeline ?
- In Jenkins, a pipeline refers to a way of defining a sequence of stages that describe the steps of a software delivery process. This can include **building**, **testing**, and **deploying code**.

- A `pipeline` can be defined in a **`Jenkinsfile`**, which is a text file that contains the `stages` and `steps of the pipeline`. The Jenkinsfile can be stored in a version control system like `Git` along with the code it describes, allowing for the pipeline to be versioned alongside the code.

## Types of Jenkins Pipeline :

- **`Declarative`** : Declarative is a more recent and advanced implementation of a pipeline as a code.

`Example:`
```
pipeline {
    agent { docker { image 'node:16.17.1-alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'node --version'
            }
        }
    }
}
```

- **`Scripted`** : **Scripted** was the first and most traditional implementation of the `pipeline as a code` in Jenkins. It was designed as a general-purpose `DSL (Domain Specific Language)` built with **Groovy**.

`Example:`
```
node{
    stage('Hello'){
        echo 'Hello World'
    }
}
```

## Why should we have Pipeline in Jenkins ?
-  A pipeline in Jenkins offers **automation**, **consistency**, **transparency**, **collaboration**, and enables **continuous delivery**, making it an essential tool for modern software development teams.

---
# Task-01

### Create a New Job, this time select Pipeline instead of Freestyle Project.

- `Creation of Pipeline Project`

![Screenshot from 2023-04-09 12-59-49](https://user-images.githubusercontent.com/76991475/230761396-6d01c2de-68a7-4ae2-a67c-2339ea8e71b9.png)

- `Description of file`

![Screenshot from 2023-04-09 13-04-18](https://user-images.githubusercontent.com/76991475/230761400-0d54c239-6635-4736-9dcc-0c07b4cebfef.png)

- `Pipeline Script`

![Screenshot from 2023-04-09 13-04-31](https://user-images.githubusercontent.com/76991475/230761402-95b007f9-0d32-4714-9717-8be11a957ca7.png)

- `Console Output`

![Screenshot from 2023-04-09 13-04-54](https://user-images.githubusercontent.com/76991475/230761407-a20c1190-157e-44a6-bd6c-08348b3c88e1.png)


![Screenshot from 2023-04-09 13-05-13](https://user-images.githubusercontent.com/76991475/230761413-4c30b056-8ffa-4c9f-a805-1051385ace36.png)

This is Simple Pipeline in which prints out **"Hello World"** in `stage logs`.

![Screenshot from 2023-04-09 13-05-43](https://user-images.githubusercontent.com/76991475/230761416-a577cfce-9bfd-4eb7-b096-c01cf8ecfc91.png)

---
### Writing a Declarative Pipeline in Jenkins.

- `Declarative Script `

![Screenshot from 2023-04-09 13-15-09](https://user-images.githubusercontent.com/76991475/230761422-83de0c13-e929-4752-a18f-1f4dc5b7596e.png)

- `Stage View`

![Screenshot from 2023-04-09 13-15-29](https://user-images.githubusercontent.com/76991475/230761426-1486860a-d678-47ec-8707-b103fcb5cd68.png)

- `Console Output`

![Screenshot from 2023-04-09 13-16-14](https://user-images.githubusercontent.com/76991475/230761430-0970b774-fd96-4fb9-be27-1083200898da.png)

---