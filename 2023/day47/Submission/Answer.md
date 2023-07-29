# Day 47: Frontend-Website on AWS 💻 📈

### Today, we will be working on a frontend project on AWS, as part of the 90 Days of DevOps Challenge.

- This project comprises of Html, CSS, and JavaScript. We will be using AWS EC2 using Apache2 webserver host our website ,Auto Scaling group to scale the instances based on the demand, and AWS CloudWatch to monitor the performance of the Auto Scaling group and the EC2 instances.

- We hope that this project will give you hands-on experience with AWS services and help you understand how these services work together. If you have any questions or face any issues while doing the tasks, please let us know.

---

# Task-01

### Launch an EC2 instance using the AWS Management Console and connect to it using SSH.

- **`Step-01`** : Launch an `EC2 instance` using the `AWS Management Console` and give it a name and selecr the `Ubuntu Server 22.04 LTS (HVM), SSD Volume Type` AMI.

![Screenshot from 2023-07-28 22-43-03](https://github.com/Rohit312001/GitDemo/assets/76991475/2efe0487-a5c2-4cd2-b9e4-fc1ea22be7ef)

- **`Step-02`** : Select the `t2.micro` instance type and click on `Next: Configure Instance Details` and select `key pair` and `security group`.

![Screenshot from 2023-07-28 22-43-30](https://github.com/Rohit312001/GitDemo/assets/76991475/0cecce8e-3c71-4754-9a30-68e987fff2c0)

- **`Step-03`** : Click on `Review and Launch` and go to EC2 Dashboard and click on `Running Instances` and see if the instance is running.

- So we have our `running instance` **"Testing_AWS"** with the `instance id` "i-0fa97e...".

![Screenshot from 2023-07-28 22-44-44](https://github.com/Rohit312001/GitDemo/assets/76991475/0a76bb20-1fea-4f68-bac5-c6117920c21e)

- **`Step-04`** : Now we will `connect` to the `EC2 instance` using `SSH`.

![Screenshot from 2023-07-28 22-45-10](https://github.com/Rohit312001/GitDemo/assets/76991475/62031e45-3c43-473c-b900-c269fd3b7cbb)

- **`Step-05`** : Now we will paste our `.pem` in our terminal.

![Screenshot from 2023-07-28 22-46-34](https://github.com/Rohit312001/GitDemo/assets/76991475/42ec01cd-2b96-468a-9ed3-728de0d8808f)

---

### Install a web server on the EC2 instance.

```
sudo apt update
sudo apt install apache2
```

![Screenshot from 2023-07-28 22-47-20](https://github.com/Rohit312001/GitDemo/assets/76991475/60d553fb-5fb8-4bcb-a27f-87c6331d1b15)

![Screenshot from 2023-07-28 22-47-46](https://github.com/Rohit312001/GitDemo/assets/76991475/e3b65949-19f6-4b18-8984-2d7477087456)

- Check the webserver is installed or not...

```
apache2 -c
```

![Screenshot from 2023-07-28 22-49-15](https://github.com/Rohit312001/GitDemo/assets/76991475/f304599a-eafe-42a0-bf07-5735a09b3a4a)

- Now start the `Apache2 Server` and Check the `running status`.

![Screenshot from 2023-07-28 22-50-29](https://github.com/Rohit312001/GitDemo/assets/76991475/625bbe75-6d15-4057-b30d-10601c19dc0a)

- At last open the `Public IP Address` of the `EC2 instance` where we have installed the `Apache2 Server`.

![Screenshot from 2023-07-28 22-51-29](https://github.com/Rohit312001/GitDemo/assets/76991475/543ef901-7002-48cf-a2db-76e3aec01c37)

---

### Now Let's deploy the website on Apache2 Web Server.

- Now let's go inside the `Apache2 Server` where we can add the `file for deployment on Webserver`.

```
cd /var/wwww/html
```

- After this **install the git repository** on it.

```
sudo git clone https://github.com/Rohit312001/PokeQuest.git
```

![Screenshot from 2023-07-28 23-00-37](https://github.com/Rohit312001/GitDemo/assets/76991475/89ab7801-d027-4fb6-88e5-cb74249e2f0b)

- At last open the `Public IP Address` of the `EC2 instance` where we have installed the `Apache2 Server` and **check the website is running**.

![imageedit_3_4216849865](https://github.com/Rohit312001/GitDemo/assets/76991475/b6fb7e1f-d138-4a45-ae57-a53646291b78)

### Let's create a Launch Template of this EC2 Instance for Recurring Usage.

- **`Step-01`** : Select the **EC2 instance** > **Actions** > **Image and Templates** > **Create template from instances**.

![Screenshot from 2023-07-28 23-15-40](https://github.com/Rohit312001/GitDemo/assets/76991475/c0fd4ac3-a9d2-47cd-8182-a8c6a076379a)

- **`Step-02`** : Let's create `Launch template` , give it a meaningful `name` and `description` and **rest all be default**.

![Screenshot from 2023-07-28 23-16-55](https://github.com/Rohit312001/GitDemo/assets/76991475/f3535a8c-92e3-4fe9-a42b-047c57c471b2)

- Thus we have created `Launch template`.

![Screenshot from 2023-07-28 23-20-00](https://github.com/Rohit312001/GitDemo/assets/76991475/a6c924ef-6c1b-4673-99cb-05bbe665dc2c)

### Create an Auto Scaling group using the AWS Management Console and configure it to launch EC2 instances in response to changes in demand.

- **`Step-01`** : Go to `EC2 Dashboard` > `Auto Scaling Groups`.

![Screenshot from 2023-07-28 23-21-00](https://github.com/Rohit312001/GitDemo/assets/76991475/c7061606-14cf-4fa6-8ee8-a7693f10e65c)

- HomePage of `Auto Scaling Group`.

![Screenshot from 2023-07-28 23-21-19](https://github.com/Rohit312001/GitDemo/assets/76991475/f36452e4-6e5c-4e74-87de-7aa616743b90)

- **`Step-02`** : Give a Name to `Auto Scaling Group` and select the `Lauch Template` which we created previously and click on `next`.

![Screenshot from 2023-07-28 23-22-05](https://github.com/Rohit312001/GitDemo/assets/76991475/69ce8d09-f970-4c53-b005-9d7702f8716f)

- **`Step-03`** : Now select the Network and add your `Availability Zones` and click on `next`.

![Screenshot from 2023-07-28 23-22-47](https://github.com/Rohit312001/GitDemo/assets/76991475/be0cfbf4-b0dc-4f7d-a710-f3abf4b80fce)

- **`Step-04`** : Now we enabled the `Monitoring` so that we can use `CloudWatch` on our Website by `checking Addtional Settings.`

![Screenshot from 2023-07-28 23-25-18](https://github.com/Rohit312001/GitDemo/assets/76991475/d4c3f26c-0762-4ea4-acc7-18abfbf18a6f)

- **`Step-05`** : Now we select the `Desired Capacity`,`Minimum Capacity` and `Maximum Capacity` of Instance should as the `Scaling Property`.

![Screenshot from 2023-07-28 23-26-17](https://github.com/Rohit312001/GitDemo/assets/76991475/9160bcd4-3335-4aaa-a929-91e12eb91eda)

- Thus we can see our `EC2 Dashboard` where **already 2 extra instances** are created by own because of `Auto-Scaling Group using Launch Template`.

![Screenshot from 2023-07-28 23-43-10](https://github.com/Rohit312001/GitDemo/assets/76991475/24a8c451-c524-4f04-ba9f-4a04b78dc4d5)

- At last Select the **Auto_scaling Group** which we have created now and check its `Monitoring`.

![imageedit_9_6331433790](https://github.com/Rohit312001/GitDemo/assets/76991475/fa07c4cd-808d-4e46-999f-176d13ed9456)

---

### Use Amazon CloudWatch to monitor the performance of the Auto Scaling group and the EC2 instances and troubleshoot any issues that arise.

- **`Step-01`** : After clickling the `CloudWatch link` , **Select the AutoScaling** > **Select any one Metric to Monitoring**.

![Screenshot from 2023-07-29 00-01-13](https://github.com/Rohit312001/GitDemo/assets/76991475/d6446539-9609-475b-9d4f-0941d94a8db0)

- **`Step-02`** : Now Let's `Add Notification` when Monitoring reaches it limited by Alerting by getting `SMS` or `E-mails`

![Screenshot from 2023-07-29 00-03-46](https://github.com/Rohit312001/GitDemo/assets/76991475/0e28d54e-4105-4921-a058-85102f5a4e8c)

- Thus we have created an `Alarm` for `Auto-Scaling-Group`

![imageedit_11_5805037761](https://github.com/Rohit312001/GitDemo/assets/76991475/1c216381-5b6c-4502-862a-2c241f232af7)

---

### Use the AWS CLI to view the state of the Auto Scaling group and the EC2 instances and verify that the correct number of instances are running.

- Let's Install `AWS CLI` on the `terminal`.

```
sudo apt install aws cli
```

![Screenshot from 2023-07-29 00-21-46](https://github.com/Rohit312001/GitDemo/assets/76991475/6a2168f9-cb99-4158-9e95-19607b98db75)

```
aws -- version
```

![Screenshot from 2023-07-29 00-22-23](https://github.com/Rohit312001/GitDemo/assets/76991475/04e87ef5-87c0-4756-b9d5-e220f37792bf)

- Now Let's add the **Security Credentials**

![Screenshot from 2023-07-29 00-23-05](https://github.com/Rohit312001/GitDemo/assets/76991475/1b79f498-6fda-4c90-a21c-4c14620d535a)

- Let's Add or Create the `Access Key` for AWS Configuration.

![Screenshot from 2023-07-29 00-24-00](https://github.com/Rohit312001/GitDemo/assets/76991475/2880b9ed-c856-4308-a56c-70c5a0b75d7e)

- Thus we have created the` Access Key` and `Download the .CSV file for future access`.

![Screenshot from 2023-07-29 00-24-25](https://github.com/Rohit312001/GitDemo/assets/76991475/369f8583-af3d-4d97-b12b-f5719a06de30)

```
aws configure
```

![Screenshot from 2023-07-29 00-27-16](https://github.com/Rohit312001/GitDemo/assets/76991475/9890e799-aa05-4ba9-85cc-7dad44ea1a7b)

- Now let's see `Auto-Scaling` and `EC2 instance` using **CLI commands**.

```
aws autoscaling describe-auto-scaling-groups
```

![Screenshot from 2023-07-29 00-27-59](https://github.com/Rohit312001/GitDemo/assets/76991475/5e923de6-78a7-46f2-b9f1-d57ae209ef5c)

```
aws ec2 describe-instances
```

![Screenshot from 2023-07-29 00-28-41](https://github.com/Rohit312001/GitDemo/assets/76991475/39a09057-a2d0-4d99-9893-29304adfdad4)

- Now `Verify the Instance` we created on `EC2 Dashboard` are present in `CLI or not`.

```
aws ec2 describe-instances | grep -w "Testing_AWS"
# aws ec2 describe-instances | grep -w "<instance-name>"
```

![Screenshot from 2023-07-29 00-31-54](https://github.com/Rohit312001/GitDemo/assets/76991475/9b6f581e-a742-4c6e-8e5f-53a7c57f9eb6)

- So we have `Same no. of instances` we have created.

![Screenshot from 2023-07-29 00-33-13](https://github.com/Rohit312001/GitDemo/assets/76991475/58c07e57-dda1-4aba-a8c3-83b750484ec9)

---
