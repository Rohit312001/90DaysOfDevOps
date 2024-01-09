# Day 38: AWS and its Basics Components.

### Till now we have learned about the basics of DevOps and its tools like Linux,Shell-Scripting, Git, GitHub, Jenkins, Docker and Kubernetes. 

### Why AWS ?
- **`AWS`** is one of the `most popular Cloud Provider` that has `free tier too for students and Cloud enthutiasts` for their `Handson` while `learning` (Create your free account today to explore more on it).

### What is AWS ?
- **Amazon Web Services (AWS)** is a comprehensive and widely-used **cloud computing platform provided by Amazon**. It offers a vast array of cloud services and solutions designed to enable `businesses`, `organizations`, and `individuals to build` and `manage their applications` and `infrastructure in a scalable`, `secure`, and `cost-effective manner`.

## Services provided by AWS:
### Compute Services:

- **Amazon Elastic Compute Cloud (EC2):** Provides virtual servers in the cloud.
- **AWS Lambda:** Runs your code in response to events without provisioning or managing servers.
- **Amazon Elastic Container Service (ECS):** Orchestrates and manages Docker containers.
- **AWS Elastic Beanstalk:** Deploys and manages applications in multiple languages.

### Storage and Content Delivery Services:

- **Amazon Simple Storage Service (S3):** Provides object storage with high durability and scalability.
- **Amazon Elastic Block Store (EBS):** Offers persistent block-level storage volumes for EC2 instances.
- **Amazon Glacier:** Secure and durable cloud storage for archiving and long-term backup.
- **Amazon CloudFront:** Content delivery network (CDN) for fast and secure content delivery.

### Database Services:

- **Amazon RDS:** Managed relational database service supporting various engines like MySQL, PostgreSQL, Oracle, and SQL Server.
- **Amazon DynamoDB:** Fully managed NoSQL database service.
- **Amazon Redshift:** Fast, fully managed data warehouse for analytics.
*- *Amazon Aurora:** MySQL and PostgreSQL-compatible relational database.

### Networking and Content Delivery Services:

- **Amazon VPC:** Virtual private cloud for isolated virtual network environments.
- **AWS Direct Connect:** Establishes dedicated network connections between on-premises infrastructure and AWS.
- **Amazon Route 53:** Scalable domain name system (DNS) web service.
- **AWS CloudFront:** Content delivery network for low-latency and high-speed content delivery.

### Machine Learning and AI Services:

- **Amazon SageMaker:** Fully managed machine learning service for building, training, and deploying models.
- **Amazon Rekognition:** Deep learning-based image and video analysis.
- **Amazon Comprehend:** Natural language processing for extracting insights from text.
- **Amazon Lex:** Builds conversational interfaces using voice and text.

**Analytics Services:**

- **Amazon Kinesis:** Collects, processes, and analyzes real-time streaming data.
- **Amazon Athena:** Interactive query service to analyze data in Amazon S3.
- **Amazon QuickSight:** Business intelligence service for visualizing and analyzing data.
- **AWS Glue:** Fully managed extract, transform, and load (ETL) service.

## AWS Regions and Availability Zones:

### North America:

- US East (N. Virginia)
- US East (Ohio)
- US West (N. California)
- US West (Oregon)
- Canada (Central)

### South America:

- South America (Sao Paulo)

### Europe:

- Europe (Ireland)
- Europe (London)
- Europe (Frankfurt)
- Europe (Paris)
- Europe (Stockholm)

### Asia Pacific:

- Asia Pacific (Mumbai)
- Asia Pacific (Singapore)
- Asia Pacific (Sydney)
- Asia Pacific (Tokyo)
- Asia Pacific (Seoul)
- Asia Pacific (Osaka-Local)
- Asia Pacific (Hong Kong)

### Middle East:

- Middle East (Bahrain)

### Africa:

- Africa (Cape Town)

---

## What is IAM ?
- AWS **Identity and Access Management (IAM)** is a web service that helps you `securely control access to AWS resources`. With **`IAM`**, you can `centrally manage permissions` that control which `AWS resources users` can access. You use IAM to control who is `authenticated` (signed in) and `authorized` (has permissions) `to use resources`.

## Key Features of IAM :
- Shared access to your AWS account.
- Temporary access through IAM roles for time-limited permissions.
- Identity federation (including Active Directory, Facebook, LinkedIn, SAML, and OpenID Connect).
- Multifactor authentication (MFA) .
- Provide temporary access for users/devices and services where necessary.
- Password rotation policy.
- Integrates with many different AWS services.

---
## Before moving to the task create your free account on AWS and login to it.
---

## Task 1:


### Part 1: Create an IAM user with username of your own wish and grant EC2 Access. 

**Steps to be followed:**

- **Step1:** Open the AWS account as the root user.

![Screenshot from 2023-06-20 20-13-22](https://github.com/Rohit312001/GitDemo/assets/76991475/e17b8f49-cc4d-44a1-875b-55ded7029144)

- **Step2:** Now we will the Console Home of AWS.

![Screenshot from 2023-06-20 20-13-42](https://github.com/Rohit312001/GitDemo/assets/76991475/40c9c3a9-6d90-4521-b345-4fffb7503bd1)

- **Step3:** Now we will go to the IAM service. So Search for IAM in the search bar and click on the IAM service.

![Screenshot from 2023-06-20 20-14-02](https://github.com/Rohit312001/GitDemo/assets/76991475/910faa9a-eb9b-431b-9784-3e9f1dfa2176)

- **Step4:** Now you will see the IAM Dashboard. Now click on the Users tab.

![Screenshot from 2023-06-20 20-14-22](https://github.com/Rohit312001/GitDemo/assets/76991475/13b8f467-30eb-45ef-93bf-03cf4ee7973a)

- **Step5:** (Dashboard > Access Management > User > Create User)Now click on the Add User button.Also while creating the user make sure that you have selected the Programmatic Access and AWS Management Console Access.

![Screenshot from 2023-06-20 20-33-11](https://github.com/Rohit312001/GitDemo/assets/76991475/161e7271-f510-4a66-b5a5-ffd5522f31f7)

- **Step6:** After entering the username of your choice and click on the Next: Permissions button and give the **EC2FullAccess permission** to the user.

![Screenshot from 2023-06-20 20-33-47](https://github.com/Rohit312001/GitDemo/assets/76991475/01ac6d3b-7809-42bb-95d2-37ece3ecca88)

- **Step7:** Now click on the Next: Tags button and then click on the Next: Review button.

![Screenshot from 2023-06-20 20-34-45](https://github.com/Rohit312001/GitDemo/assets/76991475/b1f3046a-e0c5-4df7-bb6e-9c54e9df4d3d)

- **Step8:** You can `view` and `download the user's password` below or email the user's instructions for signing in to the AWS Management Console. **This is the only time you can view and download this password.**

![imageedit_2_8330114522](https://github.com/Rohit312001/GitDemo/assets/76991475/d4c64b79-e385-4605-ac38-dc7a7a990ff1)

- **Step9:** Now we can see the downloaded csv file which contains the username and password of the user.

![imageedit_4_5476602365](https://github.com/Rohit312001/GitDemo/assets/76991475/58ac7972-a0d9-4485-a51f-c866de59bacd)

- **Step10:** Verify that the user has been created named as **"Student_Access"** successfully.

![Screenshot from 2023-06-20 20-36-00](https://github.com/Rohit312001/GitDemo/assets/76991475/758fd199-bd49-4757-9364-67a765eae667)

- **Step11:** Now we will login to the AWS account as the **"Student_Access"** user using the password that we have downloaded in the csv file.

![Screenshot from 2023-06-20 21-22-37](https://github.com/Rohit312001/GitDemo/assets/76991475/8c293d9a-e555-47b6-b146-e1d2c21ecd5a)

- **Step12:** Now we will the Console Home of IAM User named "Student_Access".

![imageedit_6_5709073436](https://github.com/Rohit312001/GitDemo/assets/76991475/d4043cd9-b2a3-42a4-bdec-44c773215002)

### Part 2: Launch your Linux instance through the IAM user that you created now and install jenkins and docker on your machine via single Shell Script.

**Steps to be followed:**

- **Step1:** Now we will go to the EC2 service. So Search for EC2 in the search bar and click on the EC2 service.

![Screenshot from 2023-06-20 21-56-17](https://github.com/Rohit312001/GitDemo/assets/76991475/05a55d0f-e5eb-4b77-a4ec-8981485f9784)

- **Step2:** Now we will launch the EC2 instance. So click on the Launch Instance button and verify if the instances is running or not.

![Screenshot from 2023-06-20 21-56-57](https://github.com/Rohit312001/GitDemo/assets/76991475/17b8402e-6066-4a09-bc09-af9bb27c5218)

**(*Note that you can't connect to the instance using "EC2 Instance Connect" as you have not given the user access to ec2:InstanceConnect. So log in using ssh.*)**

- **Step3:** Now we will connect the terminal and EC2 instance using ssh. So click on the Connect button and copy the ssh command.

![Screenshot from 2023-06-21 00-01-51](https://github.com/Rohit312001/GitDemo/assets/76991475/9be555d8-2342-458c-aa0b-53f96425aa0a)

**(*so copy the 3rd command and example from the above image of your terminal and paste it in the terminal.*)**

![Screenshot from 2023-06-20 22-12-52](https://github.com/Rohit312001/GitDemo/assets/76991475/f7e73a37-eba6-420f-bb46-10fd4e818865)

- **Step4:** Now we will create a shell script named **"install.sh"** and copy the below code in it.

```
#!/bin/bash
sudo apt update
sudo apt install openjdk-8-jdk
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
```

![Screenshot from 2023-06-21 00-11-51](https://github.com/Rohit312001/GitDemo/assets/76991475/706c640d-15be-452a-885f-452d8124daa1)

- **Step5:** Now we will give the permission of the shell script to the user. So run the below command.

```
chmod +x install.sh
./install.sh
```

![Screenshot from 2023-06-20 22-29-47](https://github.com/Rohit312001/GitDemo/assets/76991475/a4efbd69-9d2f-4080-adb7-2aed1a11ef30)

- **Step6:** Now we will check the status of the jenkins and docker. So run the below commands.

```
sudo systemctl status docker
```
![Screenshot from 2023-06-20 22-31-38](https://github.com/Rohit312001/GitDemo/assets/76991475/a03b104b-4107-4e66-8893-e0559e10735d)

```
sudo systemctl status jenkins
```
![Screenshot from 2023-06-20 22-48-59](https://github.com/Rohit312001/GitDemo/assets/76991475/a9c5a183-d97e-466b-940e-815ca2006a3e)

- **Step7:** Now go to your browser, open PublicIP:8080 and you must be able to see the Unlock Jenkins page.

![Screenshot from 2023-06-20 22-55-50](https://github.com/Rohit312001/GitDemo/assets/76991475/93ad3a78-ae49-41d6-ba1a-b54b2c30c4eb)

---

## Task2:

### In this task you need to prepare a devops team of avengers. Create 3 IAM users of avengers and assign them in devops groups with IAM policy.

- Log in to the `AWS console` as a `root user`. Go to **IAM**.
- Go to Access Management > User Groups > Create Group > User Group Name "Avengers"

- **Step1:** Create a group named **"Avengers"** and attach the policy named "AdministratorAccess" to the group.

![Screenshot from 2023-06-20 23-04-46](https://github.com/Rohit312001/GitDemo/assets/76991475/def85b24-d51d-4ca4-a90a-885b2b7b01dc)

- **Step2:** Now give the permission of **AmazonEC2fullaccess** and **AmazonS3fullaccess** to the group named "Avengers".

![Screenshot from 2023-06-20 23-11-37](https://github.com/Rohit312001/GitDemo/assets/76991475/37402b9b-8809-4907-9ac9-1fd1e217420e)

- **Step3:** Now create 3 users named **"Ironman"**, **"CaptainAmerica"** and **"Spiderman"** and add them to the group named "Avengers".

![Screenshot from 2023-06-20 23-12-10](https://github.com/Rohit312001/GitDemo/assets/76991475/b90dab98-fa3a-4acf-b298-6ec56255af71)

- **Step4:** Check the policy added to the user named **"Ironman"** , **"CaptainAmerica"** and **"Spiderman"**.

![Screenshot from 2023-06-20 23-12-29](https://github.com/Rohit312001/GitDemo/assets/76991475/a5285905-1631-4a22-a63f-47f3e41807c4)

---