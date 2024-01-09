# Day 50: Your CI/CD pipeline on AWS - Part-1 🚀

In the Upcoming next 4 days, I will be making a `CI/CD pipeline` on **AWS** with these tools.

- _CodeCommit_
- _CodeBuild_
- _CodeDeploy_
- _CodePipeline_
- _S3 Bucket_

## What is CodeCommit ?

- **AWS CodeCommit** is a fully-managed source control service that hosts secure **Git-based repositories**. It makes it easy for teams to collaborate on code in a `secure` and `highly scalable` ecosystem. `CodeCommit` eliminates the need to operate your `own source control system` or worry about `scaling its infrastructure`. We can use CodeCommit to `securely store` anything from `source code` to `binaries`, and it works seamlessly with your existing `Git tools`.

## Why do we use CodeCommit ?

- **CodeCommit** is a `managed source control service` by AWS that allows users to `store`, `manage`, and `version` their `source code` and `artifacts` securely and at scale. It supports `Git`, integrates with other AWS services, enables collaboration through `branch` and `merge` workflows, and provides `audit logs` and `compliance reports` to meet regulatory requirements and track changes. Overall, CodeCommit provides developers with a reliable and efficient way to manage their codebase and set up a `CI/CD pipeline` for their `software development projects`.

## Features of AWS CodeCommit:

- **`Collaborative Software Development:`** `AWS CodeCommit` facilitates `collaboration` among software development teams by providing version control capabilities such as `code commit`, `branching`, and `merging`, `ensuring smooth teamwork` and `project management`.
- **`Secure Data Transfer and Storage:`** CodeCommit allows users to `transfer code` to and from `repositories` securely using **HTTPS** or **SSH**. Additionally, repositories are `automatically encrypted` at rest through `AWS Key Management Service` (KMS) using **customer-specific keys**, **ensuring data security**.
- **`Access Control and Monitoring:`** `AWS Identity` and `Access Management (IAM)` is used to `control` and `monitor` access to `CodeCommit repositories`, allowing administrators to `set permissions` for `individuals` or `groups` and `track repository access` through **AWS CloudTrail** and **AWS CloudWatch**.
- **`High Availability and Durability:`** `CodeCommit stores repositories` in **Amazon S3** and **Amazon DynamoDB**, `leveraging the redundancy` of these services to provide `high availability` and `durability` for your codebase across multiple facilities.
- **`Easy Integration and Notifications:`** `CodeCommit supports all Git commands`, enabling `seamless integration` with existing `Git tools and workflows`. Users can receive notifications for `repository events` through `Amazon SNS`, and `custom scripts` or `AWS Lambda functions` can be triggered in response to these events for `additional automation and notifications`.

# Task-01 :

### Lets setup an IAM User for AWS CodeCommit.

- **`Step-01:`** Go to **IAM** service in `AWS Console`.

![Screenshot from 2023-08-02 23-11-45](https://github.com/Rohit312001/GitDemo/assets/76991475/d31fdf4b-0fe1-4729-947f-31cb09f54986)

- **`Step-02:`** Click on **`Users`** and then click on **`Add User`**.

![Screenshot from 2023-08-02 23-13-31](https://github.com/Rohit312001/GitDemo/assets/76991475/6bab5169-20f4-40bf-af16-b24d8839c92b)

- **`Step-03:`** Enter the **`User name`** and then provide console access to person `"IAM USER"` and create a `custom password` for the user so that whenever login to the console, the user will be asked to change the password for `secutiry reasons`.

![Screenshot from 2023-08-02 23-16-46](https://github.com/Rohit312001/GitDemo/assets/76991475/434f5cf8-3003-4d53-8d69-0d04185b8eae)

- **`Step-04:`** Click on **`Next:Permissions`** and then click on **`Attach existing policies directly`** and then select **`AWSCodeCommitFullAccess`** then click on **`Next:Tags`**.

![Screenshot from 2023-08-02 23-18-16](https://github.com/Rohit312001/GitDemo/assets/76991475/858fb6de-34a6-4140-b554-1bb519ee2dfd)

- **`Step-05:`** Click on **`Next:Review`** and then click on **`Create User`**.

![Screenshot from 2023-08-02 23-18-30](https://github.com/Rohit312001/GitDemo/assets/76991475/7ffff397-49a4-4ccf-9d37-a5ce15a3d2ce)

- **`Step-06:`** Now, click on **`Download .csv`** and save it in your local machine for future use.

![Screenshot from 2023-08-02 23-18-48](https://github.com/Rohit312001/GitDemo/assets/76991475/ef88994d-473c-486f-8519-9beada4f2d25)

- Thus we have Successfully created an IAM User with `AWSCodeCommitFullAccess` policy.

![Screenshot from 2023-08-02 23-22-13](https://github.com/Rohit312001/GitDemo/assets/76991475/12445207-5f6f-4be5-aee6-39bde3038a65)

---

### How add HTTP GitCredentials in your AWS IAM.

- **`Step-01:`** Go to **IAM** > **Users** > **Security Credentials** .

![Screenshot from 2023-08-02 23-28-57](https://github.com/Rohit312001/GitDemo/assets/76991475/ebb5428a-ff5a-4647-8066-dd6f5c159564)

- **`Step-02:`** Scroll down to **`HTTPS Git credentials for AWS CodeCommit`** and then click on **`Generate credentials`**

- **HTTPS Git credentials for AWS CodeCommit** > **Generate** > **Download Credentials**.

![Screenshot from 2023-08-02 23-29-20](https://github.com/Rohit312001/GitDemo/assets/76991475/730edfab-d3c2-41f8-9a3d-9293391cc119)

- Thus we have `Generated Credentials` for our `IAM User`.

![Screenshot from 2023-08-02 23-29-40](https://github.com/Rohit312001/GitDemo/assets/76991475/57b09c8b-b5e1-4751-903c-ec39ee9a5ba6)

---

### Set up a code repository on CodeCommit and clone it on your local.

- **`Step-01:`** Go to **CodeCommit** service in `AWS Console`.

![Screenshot from 2023-08-02 23-38-12](https://github.com/Rohit312001/GitDemo/assets/76991475/e231fc1e-a042-410e-a3be-9d1f0cbd50ca)

- **`Step-02:`** Click on **`Create repository`**.

![Screenshot from 2023-08-02 23-39-04](https://github.com/Rohit312001/GitDemo/assets/76991475/c9794a28-94ab-45bf-9350-7f99d9b908d3)

- **`Step-03:`** Enter the **`Repository name`** and then click on **`Create repository`**.

![Screenshot from 2023-08-02 23-39-35](https://github.com/Rohit312001/GitDemo/assets/76991475/812796a9-6015-4401-8a7f-ce76632deb0a)

- **`Step-04:`** Now, click on **`Clone URL`** and then copy the **`HTTPS URL`**.

![imageedit_2_6433028831](https://github.com/Rohit312001/GitDemo/assets/76991475/9d5dfaa5-d88d-4df3-a011-3814ae4125da)

## Before Moving to TASK-02, Lets create a New EC2 Instance and Install Git in it so that we can clone the repository in our local machine.

- **`Step-01:`** Go to **EC2** service in `AWS Console`.

![Screenshot from 2023-08-03 16-24-53](https://github.com/Rohit312001/GitDemo/assets/76991475/20955922-a530-4999-a781-86b65bd314c1)

- **`Step-02:`** Click on **`Launch Instance`**.

![Screenshot from 2023-08-03 16-25-18](https://github.com/Rohit312001/GitDemo/assets/76991475/e8bf8db1-ea97-4e3e-9a66-f8abc9a90440)

- **`Step-03:`** Select **`Ubuntu, SSD Volume Type`** and then click on **`Select`**.

![Screenshot from 2023-08-03 16-26-17](https://github.com/Rohit312001/GitDemo/assets/76991475/4cf36c85-6ffe-450c-8de1-5b92e9435ff0)

- **`Step-04:`** Select **`t2.micro`** and then select `keypair`.

![Screenshot from 2023-08-03 16-26-35](https://github.com/Rohit312001/GitDemo/assets/76991475/31cef9d8-4a35-454c-8f83-c6d8b51f4fff)

- **`Step-05:`** Click on **`Network Settings`**.

![Screenshot from 2023-08-03 16-26-49](https://github.com/Rohit312001/GitDemo/assets/76991475/b54032e2-5980-4efc-8a0f-2a74f4cd0174)

- Thus we have created EC2 instance on which we can use our `CodeCommit` **`HTTPS URL to clone the repository.`**

![Screenshot from 2023-08-03 16-27-43](https://github.com/Rohit312001/GitDemo/assets/76991475/dcbb916e-9edb-475c-873a-31e56687b127)

- Now Login the EC2 instance via SSH and open Terminal.

---

# Task-02 :

**Before Doing anything check if Git is installed in the EC2 instance for use**

```
sudo apt update
sudo apt install git
```

### Clone the repository in your local machine.

```
git clone <HTTPS URL>
# The URL which is copied from CodeCommit
# Enter the UserName and Password which we downloaded for HTTP and git credentials.
```

![Screenshot from 2023-08-03 00-03-42](https://github.com/Rohit312001/GitDemo/assets/76991475/f9e87fc7-f889-4b2f-9a49-cf35123ab347)

- After this we can see that the `repository` is `cloned` in our `local machine`.

```
ls
cd <repository which we have cloned>
```

![Screenshot from 2023-08-03 00-04-05](https://github.com/Rohit312001/GitDemo/assets/76991475/07cabe07-c3ba-4f03-8476-448ac42f31e6)

### Add a new file from local and commit to your local branch.

- **`Step-01:`** Create a `new file` in the `repository` which we have` cloned`.

```
touch file{01..05}.txt
```

![Screenshot from 2023-08-03 00-04-54](https://github.com/Rohit312001/GitDemo/assets/76991475/823aa572-65f6-45fd-ab7e-2f74e20fb816)

- From now here we will use `Git Commands`.

```
# For Example
git add
git status
git commit -m
git push
```

- **`Step-02:`** We will use git status to check the status of the repository `unstaged` or `staged`.

```
git status
```

![Screenshot from 2023-08-03 00-05-23](https://github.com/Rohit312001/GitDemo/assets/76991475/e7b99664-764c-41ea-a126-c12c70555584)

- **`Step-03:`** We will use `git add to add` the files to the staging area.

```
# git add . will add all the files to staging area.
git add .
```

![Screenshot from 2023-08-03 00-05-51](https://github.com/Rohit312001/GitDemo/assets/76991475/4ea10647-8a3d-4ab6-9572-17f3612511d7)

- **`Step-04:`** Now we will use `git commit -m` to commit the files to the local branch.

```
# git commit -m <Your Message>
git commit -m "Added 5 files"
```

![Screenshot from 2023-08-03 00-09-43](https://github.com/Rohit312001/GitDemo/assets/76991475/ab3b986d-02f7-4e3e-bfbe-cbe10b633fe8)

- **`Step-05:`** Now we will use `git push` to push the files to the remote repository.

```
git push origin master
```

![Screenshot from 2023-08-03 00-10-45](https://github.com/Rohit312001/GitDemo/assets/76991475/1053c889-11c7-468c-896d-93d61e4e6310)

### So we can Checke Pushed the local changes to CodeCommit repository.

- **`Step-01:`** Go to `CodeCommit` service in `AWS Console`.

![Screenshot from 2023-08-03 00-11-26](https://github.com/Rohit312001/GitDemo/assets/76991475/7beaf640-037c-4c22-ae2e-49cdccffd27f)

- **`Step-02:`** Click on `Repositories` and then click on `Repository Name`.

![Screenshot from 2023-08-03 00-11-37](https://github.com/Rohit312001/GitDemo/assets/76991475/d6c8f4bc-0162-440a-9121-a061cc5ea6a0)

- Thus we have pushed the local changes to `CodeCommit` repository.

---
