# Day-22 : Getting Started with Jenkins

## What is Jenkins?
- Jenkins is an open source **Continuous Integration-Continuous Delivery or Deployment (CI/CD)** automation software DevOps tool written in the `Java` programming language. It is used to implement CI/CD workflows, called pipelines.

- Jenkins is a tool that is used for automation, and it is an open-source server that allows all the developers to build, test and deploy software. It works or runs on java as it is written in java. By using Jenkins we can make a continuous integration of projects(jobs) or end-to-endpoint automation.

- Jenkins achieves Continuous Integration with the help of plugins. Plugins allow the integration of Various DevOps stages. If you want to integrate a particular tool, you need to install the plugins for that tool. For example **`Git`**, **`Maven 2 project`**, **`Amazon EC2`**, **`HTML Publisher`** etc.

## Why do we need Jenkins ?
- Nowadays, humans are becoming lazy day by day so even having digital screens and just one click button in front of us then also need some **automation**. 

- Here, I’m referring to that part of automation where we need not have to look upon a process(here called a job) for completion and after it doing another job. For that, we have Jenkins with us.

# Tasks: 

## What do we understand by Jenkins,Why to use Jenkins,features of Jenkins.

**`Jenkins`** is a popular automation server because it offers several benefits that can significantly improve the software development process. Here are some of the reasons why Jenkins is essential:
- **`Automation`**: Jenkins automates repetitive tasks such as **building**, **testing**, and **deploying software**, which helps developers save time and effort.This enables them to focus on other critical tasks, such as developing new features.

- **`Continuous Integration (CI)`**: Jenkins provides a robust CI system that can `integrate` with `various tools` and `plugins`, ensuring that code changes are continuously integrated and tested as they are made.

- **`Continuous Delivery (CD)`**: Jenkins also supports `CD`, which helps `automate` the `deployment of code changes` to various environments, such as **testing**, **staging**, and **production**.

- **`Scalability`**: Jenkins can handle **large-scale** software development projects, with the ability to distribute builds across multiple machines to speed up the build process.

- **`Customization`**: Jenkins provides a high degree of customization, with a vast collection of plugins available to extend its functionality.

- **`Open-source`**: Jenkins is an open-source platform, which means it is free to use and can be easily modified and adapted to meet the specific needs of a project.

Overall, Jenkins can help **streamline** the `software development process`, `improve the quality of software`, and `reduce the time` and effort required to deploy new features and updates.

## Create a freestyle pipeline to print "Hello World" or "Hi My Name is Rohit Rajput".


- First we make our local host online by running command on terminal **`java -jar jenkins.war`**

![Screenshot from 2023-04-04 21-08-06](https://user-images.githubusercontent.com/76991475/229847622-c03a3fe8-a78d-4f55-b52f-63d4002044c9.png)

- Now we are running jenkins on http://localhost:8080/.

![imageedit_2_7180300752](https://user-images.githubusercontent.com/76991475/229849815-3b1e2d63-e98c-4fd0-a6bd-fd2a67c92a2d.gif)

- let's create our first Jenkins Job in freestyle project.

![Screenshot from 2023-04-04 21-32-08](https://user-images.githubusercontent.com/76991475/229850760-9849734f-64f2-4e95-8b70-ca122eafcee5.png)

- now we will add description to our `Freestyle Project`.

![imageedit_7_2738838257](https://user-images.githubusercontent.com/76991475/229853601-34f33201-8e82-49c5-bb00-8914c5f7c33d.gif)

- Since we don't have any integration to this project so we leave blank this section.

![Screenshot from 2023-04-04 21-17-03](https://user-images.githubusercontent.com/76991475/229850160-46f1e721-e036-4fde-8473-609d1426c9a5.png)

- Now in Build Step we run this `Execute Shell` to have our command.

![imageedit_10_7548420248](https://user-images.githubusercontent.com/76991475/229850220-8328b7db-c4b4-40dd-beda-956a3576d27d.gif)

- Now it's time to build our project using CI/CD on Jenkins.

![imageedit_12_9279009469](https://user-images.githubusercontent.com/76991475/229851121-2920b54e-4f21-40a3-9e6e-8707e9995fda.gif)

- We can see our Build has Successfully Built in **`Console Output`**

![imageedit_14_3550628007](https://user-images.githubusercontent.com/76991475/229851141-3ac5a79e-d21c-4c69-8f2b-7f072c6020e8.gif)

---