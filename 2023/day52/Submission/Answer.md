# Day 52: Your CI/CD pipeline on AWS - Part 3 🚀

In the Upcoming next 4 days, I will be making a `CI/CD pipeline` on **AWS** with these tools.

- _CodeCommit_
- _CodeBuild_
- _CodeDeploy_
- _CodePipeline_
- _S3 Bucket_

## What is CodeDeploy ?

- **CodeDeploy** is a deployment service that automates application deployments to `Amazon EC2 instances`, `on-premises instances`, `serverless Lambda functions`, or `Amazon ECS services`.

- **You can deploy a nearly unlimited variety of application content, including:**

1. _Code_
2. _Serverless AWS Lambda functions_
3. _Web and configuration files_
4. _Executables_
5. _Packages_
6. _Scripts_
7. _Multimedia files_

- CodeDeploy can `deploy application` content that `runs on a server` and is `stored in Amazon S3 buckets`, `GitHub repositories`, or `Bitbucket repositories`.
- CodeDeploy can also `deploy a serverless Lambda function`. You do not need to make changes to your existing code before you can use CodeDeploy.

- **CodeDeploy makes it easier for you to:**

1. _Rapidly release new features._
2. _Update AWS Lambda function versions._
3. _Avoid downtime during application deployment._
4. _Handle the complexity of updating your applications, without many of the risks associated with error-prone manual deployments._

---

### Before moving to task let's create a `CodeDeploy` application.

- **`Step-01:`** Go to `CodeDeploy` service on AWS console.

![Screenshot from 2023-08-06 22-49-11](https://github.com/Rohit312001/GitDemo/assets/76991475/91d1358b-4b8e-4508-a529-5e59769c7932)

- **`Step-02:`** Click on `Create application` button.

![Screenshot from 2023-08-06 22-49-44](https://github.com/Rohit312001/GitDemo/assets/76991475/bd2200e4-b89f-4a61-a6e1-eddb79adcaf7)

- **`Step-03:`** Enter `Application name` and `Deployment group name` and select `EC2/On-premises` as `Environment configuration` and click on `Create application` button.

**What is EC2/On-premises?**

- An **On-premises instance** is any **physical device** that is not an `Amazon EC2 instance`that can run the `CodeDeploy agent` and `connect to public AWS service endpoints`.

![Screenshot from 2023-08-06 22-50-28](https://github.com/Rohit312001/GitDemo/assets/76991475/b9696247-739c-4785-80ac-d3c876cba612)

- Thus we have created a `CodeDeploy` application.

![Screenshot from 2023-08-06 22-50-53](https://github.com/Rohit312001/GitDemo/assets/76991475/a8f674cc-31b5-4b26-ae46-f146160d7b4a)

---

### Now Let's create a `IAM role` for `CodeDeploy`.

- **`Step-01:`** Go to `IAM` service on AWS console and create a `IAM role` for `CodeDeploy`.

![Screenshot from 2023-08-06 23-05-34](https://github.com/Rohit312001/GitDemo/assets/76991475/d9deceb5-d58e-4a14-9f24-ce900dff4848)

- **`Step-02:`** Select `CodeDeploy` as `Service that will use this role` and click on `Next:Permissions` button and select `AWSCodeDeployFullAccess`, `AmazonS3FullAccess` and `AmazonEC2FullAccess` as `Permissions` and click on `Next:Tags` button.

![Screenshot from 2023-08-06 23-39-42](https://github.com/Rohit312001/GitDemo/assets/76991475/65f8f565-8d61-4f8d-a630-e368680742b6)

- **`Step-03:`** Now update the trust relationship of the role by clicking on `Edit trust relationship` button.
  Change the `Service` to `codedeploy.amazonaws.com` and click on `Update Trust Policy` button.

![Screenshot from 2023-08-06 23-52-31](https://github.com/Rohit312001/GitDemo/assets/76991475/3778ae20-6829-49a1-ae94-74d4ca7d8eb5)

---

### Now Let's create a `CodeDeploy` application.

- **`Step-01:`** Go to `CodeDeploy` service on AWS console and go inside the application that we have created earlier.

![Screenshot from 2023-08-06 23-57-11](https://github.com/Rohit312001/GitDemo/assets/76991475/a698d22e-54c2-4e21-a665-6421f97793a0)

- **`Step-02:`** Click on `Create deployment group` button.

![Screenshot from 2023-08-06 23-57-20](https://github.com/Rohit312001/GitDemo/assets/76991475/1fbab8a4-70f7-466d-8390-1713d51d402b)

- **`Step-03:`** Enter `Deployment group name` and select `IAM role` that we have created earlier and click on `Create deployment group` button.

![Screenshot from 2023-08-06 23-58-18](https://github.com/Rohit312001/GitDemo/assets/76991475/f7cc323e-7d77-42e1-9305-1f9cf82095b2)

- **`Step-04:`** Select `In-place deployment` as `Deployment type` and select `Amazon EC2 instances` as `Environment configuration` and select `Tag` as `Key` and `Value` as `Name` and click on `Create deployment group` button.

![Screenshot from 2023-08-06 23-59-21](https://github.com/Rohit312001/GitDemo/assets/76991475/764350e1-4836-43dc-b4af-40c03b117e15)

- **`Step-05:`** Agent configuration is optional so we will skip it and Select `Never` and click on `Create deployment group` button.

![Screenshot from 2023-08-07 00-01-53](https://github.com/Rohit312001/GitDemo/assets/76991475/ebd9780f-c03c-4d13-949e-57894bed672b)

- **`Step-06:`** Thus we have created a `CodeDeploy` application.

![Screenshot from 2023-08-07 00-02-53](https://github.com/Rohit312001/GitDemo/assets/76991475/8a6c45ca-a4d6-4117-aae1-adb11c7d3537)

---

# Task-01:

### Setup a CodeDeploy agent in order to deploy code on EC2

- _Updates the package manager to ensure it has the latest information about available packages._
- _Installs Ruby because the CodeDeploy agent is written in Ruby and requires it to run._
- _Downloads the installation script provided by AWS CodeDeploy and makes it executable._
- _Executes the installation script in "auto" mode to install the CodeDeploy agent with default settings._
- _Starts the CodeDeploy agent service to begin the deployment process._
- _Optionally, enables the CodeDeploy agent to start automatically on boot._

```
#!/bin/bash
sudo apt-get update
sudo apt-get install ruby-full ruby-webrick wget -y
cd /tmp
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/releases/codedeploy-agent_1.3.2-1902_all.deb
mkdir codedeploy-agent_1.3.2-1902_ubuntu22
dpkg-deb -R codedeploy-agent_1.3.2-1902_all.deb codedeploy-agent_1.3.2-1902_ubuntu22
sed 's/Depends:.*/Depends:ruby3.0/' -i ./codedeploy-agent_1.3.2-1902_ubuntu22/DEBIAN/control
dpkg-deb -b codedeploy-agent_1.3.2-1902_ubuntu22/
sudo dpkg -i codedeploy-agent_1.3.2-1902_ubuntu22.deb
systemctl list-units --type=service | grep codedeploy
sudo service codedeploy-agent status
```

![Screenshot from 2023-08-07 15-09-07](https://github.com/Rohit312001/GitDemo/assets/76991475/dc791fd9-c6ed-47a0-b4a1-b097bfc5c9ac)

```
sudo chmod 777 installation_codedeploy_agent.sh
```

![Screenshot from 2023-08-07 15-11-37](https://github.com/Rohit312001/GitDemo/assets/76991475/372247d0-46c8-450b-9b70-394571c70984)

```
./installation_codedeploy_agent.sh
```

![Screenshot from 2023-08-07 15-12-56](https://github.com/Rohit312001/GitDemo/assets/76991475/6af7f2c7-0bb4-4e87-8507-4fab8a3e3771)

---

### Read about Appspec.yaml file for CodeDeploy.

- `BeforeInstall`, `AfterInstall`, and `ApplicationStart` are different `hooks` specifying `scripts` that will run at different stages of the deployment process.
- `Replace scripts/before_install.sh`, `scripts/after_install.sh`, and `scripts/application_start.sh` with the `actual paths to your scripts.`
- `timeout` specifies `how long (in seconds) AWS CodeDeploy will wait` for `each script to finish before considering it a failure`.
- `runas` specifies the user `context under which the script will run`. In this case, the scripts will `run as the root user (root)`.
- `files section` specifies that all files from the source `(/)` should be deployed to the destination `(/var/www/html)`.

example of appspec.yaml file

```
version: 0.0
os: linux

files:
  - source: /
    destination: /var/www/html

hooks:
    BeforeInstall:
      - location: scripts/before_install.sh
        timeout: 300
        runas: root

    AfterInstall:
      - location: scripts/after_install.sh
        timeout: 300
        runas: root

    ApplicationStart:
      - location: scripts/application_start.sh
        timeout: 300
        runas: root
```

![Screenshot from 2023-08-08 14-07-48](https://github.com/Rohit312001/GitDemo/assets/76991475/88299788-e714-4ccc-9496-3644ab1fff0a)

---

### Deploy index.html file on EC2 machine using nginx web server.

- **Let's create `install-nginx.sh` file.**

```
#!/bin/bash
sudo apt-get update
sudo apt-get install nginx -y
```

![Screenshot from 2023-08-07 16-02-28](https://github.com/Rohit312001/GitDemo/assets/76991475/e9b04e5b-9f20-4fe4-ae6f-e30497b6e8c7)

- let's create `start-nginx.sh` file.

```
#!/bin/bash
sudo service nginx start
```

![Screenshot from 2023-08-07 16-02-49](https://github.com/Rohit312001/GitDemo/assets/76991475/5ed9722e-4589-4646-9514-04cf6515f969)

- At last we push all the files to github.

```
git add .
git commit -m "add all files"
git push origin master
```

![Screenshot from 2023-08-07 16-06-45](https://github.com/Rohit312001/GitDemo/assets/76991475/e0e83e45-7bc1-4975-8156-95f13068cb50)

- Thus we can verify the file uploaded on CodeBuild.

![Screenshot from 2023-08-07 16-12-10](https://github.com/Rohit312001/GitDemo/assets/76991475/446dd7ea-48c5-41c3-a68f-6886772c8833)

---

- Now Let's edit artifacts.
- **Developer tools > CodeBuild > Build projects > project name > edit artifacts**

![Screenshot from 2023-08-07 16-27-28](https://github.com/Rohit312001/GitDemo/assets/76991475/05f7553f-2990-4927-a6cb-3a7878dc2c91)

- Now `ReBuild` the project.
- **Developer tools > CodeBuild > Build projects > project name > Rebuild**

![Screenshot from 2023-08-07 16-30-36](https://github.com/Rohit312001/GitDemo/assets/76991475/b647b05f-6b3b-47e6-8f8a-2b297008dc7b)

---

### Now create a S3 bucket for code deploy.

- **Services > S3 > Create bucket > bucket name > region > Create bucket**

- I'm using my previous bucket which i have created for `code build`.

- Now add the `artifacts` in the `S3 bucket` which we have created for `code deploy` and `rebuild` again.

- Thus we can verify the file uploaded on S3 bucket and copy the `object url`.

![Screenshot from 2023-08-07 16-32-25](https://github.com/Rohit312001/GitDemo/assets/76991475/07da8fc3-463c-4741-b42a-fef51875e6e2)

- **`Step-01:`**: Go to `Developer tools > CodeDeploy > Applications > Deployment Groups > Select the deployment file`

![Screenshot from 2023-08-07 23-37-15](https://github.com/Rohit312001/GitDemo/assets/76991475/f10850f3-e319-4064-a59b-a7aa6e1f56a7)

- **`Step-02:`**: Now click on `Create deployment` button and paste the `object url` in the `Revision location` and click on `Create deployment` button.

![Screenshot from 2023-08-08 00-01-20](https://github.com/Rohit312001/GitDemo/assets/76991475/23254a91-f901-4b09-864d-fa76ab2be364)

- Now we can see the `deployment` is `successful` and you can check the file is running or not by going into `artifact.zip>index.html` and click on `index.html` file to have output.

---
