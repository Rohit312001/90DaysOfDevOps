# Day 53: Your CI/CD pipeline on AWS - Part 4 🚀

## What is CodePipeline ?

- CodePipeline **builds**, **tests**, and **deploys** your code every time there is a code change, based on the release process models you define.Think of it as a `CI/CD Pipeline` service.

## Workflow of CodePipeline

- A **pipeline** defines your release process `workflow`, and describes how a new code change progresses through your release process. A pipeline comprises a series of stages (e.g., `build`, `test`, and `deploy`), which act as logical divisions in your workflow. Each stage is made up of a `sequence of actions`, which are tasks such as building code or deploying to test environments.
- `AWS CodePipeline` provides you with a `graphical user interface` to **create**, **configure**, and **manage your pipeline** and its various stages and actions, allowing you to easily visualize and model your release `process workflow`.

![Product-Page-Diagram_AWS-CodePipeline 4a1bea38d3c8d3b2c1384dd0a7d2a858f4350471](https://github.com/Rohit312001/GitDemo/assets/76991475/7c4cef44-ece4-4013-a556-53a20bbb5a71)

### Previously on Day 50, 51 & 52 we have done the following:

- _Created a CodeCommit Repository._
- _Created a CodeBuild Project._
- _Created a CodeDeploy Application_.

### Today we will make a CodePipeline that will get the code from CodeCommit, Builds the code using CodeBuild and deploys it to a Deployment Group.

## Task-01 :

- **`Step-01`**: Go to `CodePipeline` service from `AWS Management Console`.

![Screenshot from 2023-08-11 23-55-59](https://github.com/Rohit312001/GitDemo/assets/76991475/02cf612c-9884-40bd-9b67-e679550008cd)

- **`Step-02`**: Click on `Create pipeline`.

![Screenshot from 2023-08-11 23-56-25](https://github.com/Rohit312001/GitDemo/assets/76991475/77eb71ff-5f6e-47e8-a255-30397f4bd285)

- **`Step-03`**: Give a `name` to your pipeline and click on `Next`.

![Screenshot from 2023-08-11 23-56-45](https://github.com/Rohit312001/GitDemo/assets/76991475/8b57556c-ce13-4766-8936-3e8248514408)

- **`Step-04`**: Select `AWS CodeCommit` as `Source provider` and select your `Repository name` and `Branch name` and click on `Next`.

![Screenshot from 2023-08-11 23-57-08](https://github.com/Rohit312001/GitDemo/assets/76991475/870a5ae6-62ee-42db-9ed2-6cd806d2beee)

- **`Step-05`**: Select `AWS CodeBuild` as `Build provider` and select your `Region` and `Project name` and click on `Next`.

![Screenshot from 2023-08-11 23-57-33](https://github.com/Rohit312001/GitDemo/assets/76991475/65343ad8-8f5e-4874-9fab-41e492f8d32a)

- **`Step-06`**: Select `AWS CodeDeploy` as `Deploy provider` and select your `Region` and `Application name` and `Deployment group` and click on `Next`.

![Screenshot from 2023-08-11 23-58-24](https://github.com/Rohit312001/GitDemo/assets/76991475/224811aa-c809-46da-9822-141861a5faa5)

- **`Step-07`**: Review your pipeline.

![Screenshot from 2023-08-11 23-58-39](https://github.com/Rohit312001/GitDemo/assets/76991475/7a899eda-e4c1-4a35-82ea-b1fcb26a3a89)

- Click on `Create pipeline`.

![Screenshot from 2023-08-11 23-58-49](https://github.com/Rohit312001/GitDemo/assets/76991475/0fc9baa5-616e-43ad-9972-a6d96bdb991c)

- Thus, your `pipeline is created`.

![Screenshot from 2023-08-12 00-01-38](https://github.com/Rohit312001/GitDemo/assets/76991475/1ccfa6e2-701b-41a1-92a2-8f79cb74f529)

- Thus now go to the Public IP of your `EC2 Instance` and check the running `index.html` file.

So we have successfully created a `CI/CD Pipeline` on `AWS` using `CodeCommit`, `CodeBuild` & `CodeDeploy`.

---
