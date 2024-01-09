# Day 45: Deploy Wordpress website on AWS

Over 30% of all websites on the internet use WordPress as their content management system (CMS). It is most often used to run blogs, but it can also be used to run e-commerce sites, message boards, and many other popular things. This guide will show you how to set up a WordPress blog site.

## Overview

**As **WordPress** requires a `MySQL database` to store its `data` ,`create an RDS` as I did in Day 44.**

To configure this `WordPress site`, you will create the following resources in AWS:

- An **Amazon EC2** instance to **install and host the WordPress application.**
- An **Amazon RDS for MySQL database** to store your WordPress data.
- Setup the **server**(I used Apache Server) and post your new Wordpress app.

### AWS EC2 Instance?

- ` Amazon Elastic Compute Cloud`` (Amazon EC2) is a  `web service`` that provides **secure**, **resizable compute capacity** in the cloud. It is designed to make **web-scale** cloud computing easier for developers. Amazon EC2’s simple web service interface allows you to obtain and configure capacity with minimal friction.

### AWS RDS?

- `Amazon Relational Database Service` *(Amazon RDS) makes it easy to **set up**, **operate**, and **scale a relational database in the cloud**. It provides **cost-efficient** and **resizable capacity** while automating **time-consuming administration** tasks such as **hardware provisioning**, **database setup**, **patching** and \*\*bac*kups\*\*.
- It `frees` you to `focus` on your applications so you can give them the `fast performance`, `high availability`, `security` and `compatibility` they need.

### Apache Server?

- The **Apache HTTP Server**, colloquially called **Apache**, is a free and open-source **cross-platform** web server software, released under the terms of **Apache License 2.0**. Apache is developed and maintained by an open community of developers under the auspices of the Apache Software Foundation.

### IAM Role?

- An **IAM role** is an **IAM identity** that you can create in your account that has **specific permissions**. An **IAM role** is similar to an **IAM user**, in that it is an **AWS identity** with **permission policies** that determine what the identity can and cannot do in AWS.

---

## Task-01

- **Step-01:** Let's create an `EC2 instance` for our WordPress site on AWS.Give it a name and select the `Ubuntu Server 20.04 LTS (HVM), SSD Volume Type` AMI.

![imageedit_7_6805979323](https://github.com/Rohit312001/GitDemo/assets/76991475/2eb3396e-660b-4e94-9f45-b528d306fe1b)

- **Step-02:** Select the `t2.micro` instance type and key pair.

![imageedit_3_5707263619](https://github.com/Rohit312001/GitDemo/assets/76991475/9ced1862-97c2-41ec-8b65-79b8d66da55c)

- **Step-03:** Create a `new security` group and add the following `rules` to it.

![imageedit_12_8507538908](https://github.com/Rohit312001/GitDemo/assets/76991475/c9a61966-6c24-4d73-8687-f5ec40de1965)

- **Step-04:** We have created our EC2 instance.

![Screenshot from 2023-07-21 11-52-51](https://github.com/Rohit312001/GitDemo/assets/76991475/e422db87-ffaf-4ff4-8d01-eaa9c06ea82d)

---

### Now let's create an `RDS` for our WordPress site.

- **Step-01:** Search for `RDS` in the `AWS services` and select `RDS`.

![Screenshot from 2023-07-15 21-16-14](https://github.com/Rohit312001/GitDemo/assets/76991475/aeb838aa-625d-4217-9a4c-5f9706ad5590)

- **Step-02:** Click on **`Create database`**.

![imageedit_2_4092586013](https://github.com/Rohit312001/GitDemo/assets/76991475/fec872ee-a1ac-4e85-bd52-67e1807c42ae)

- **Step-03:** Select **`MySQL`** as the **`Database creation method`**.

![Screenshot from 2023-07-15 21-18-32](https://github.com/Rohit312001/GitDemo/assets/76991475/b07d573a-eef4-4d1c-8a8c-d21b16232c19)

- **Step-04:** Select **Engine Version** and then Select **`Free tier`** in **`Templates`**.

![Screenshot from 2023-07-15 23-11-13](https://github.com/Rohit312001/GitDemo/assets/76991475/43154a0d-f628-49cb-a08a-c27438eab79b)

- **Step-05:** Now we will set the **`DB instance identifier`** and **`Master username`** and **`Master password`**.

![imageedit_17_9069323176](https://github.com/Rohit312001/GitDemo/assets/76991475/71a56011-1504-4890-b05d-14f8742c7dd6)

- **Step-06:** Let the instance and storage type be default and click on **`Create database`**.
  ![Screenshot from 2023-07-21 11-47-44](https://github.com/Rohit312001/GitDemo/assets/76991475/fb5c1360-a2ea-4250-b880-01b6003cef79)

- **Step-07:** Now check the connectivity of the database by clicking on **"Don't connect to an EC2 instance"** and **VPC** be default.

![Screenshot from 2023-07-21 11-48-09](https://github.com/Rohit312001/GitDemo/assets/76991475/90985e32-fd50-47c7-b87b-2fac1fe1990b)

- **Step-08:** Configure the **Additional Setting** by adding name to it.

![Screenshot from 2023-07-21 11-48-22](https://github.com/Rohit312001/GitDemo/assets/76991475/0e8d0ff9-097f-4b9f-894e-cfbbc1773fb7)

- **Step-09:** Click on **`Create Database`** and check the dashboard for your database.

![Screenshot from 2023-07-21 14-58-56](https://github.com/Rohit312001/GitDemo/assets/76991475/7c1c2dcd-3002-4419-9f57-60b6d2e73e83)

---

### Now let's configure the AWS Relational Database Service or RDS with our EC2 instance.

- By giving the network connectivity to our EC2 instance.So Open **AWS RDS**.

![Screenshot from 2023-07-21 14-58-56](https://github.com/Rohit312001/GitDemo/assets/76991475/4fd3ebd6-da20-476d-934e-86fc9d8b2eb6)

- In the RDS console > Select the database > Click on **Connectivity & security** > Select **VPC security groups** > Click on **Edit** > Select the security group > Click on **Save**.

![imageedit_20_3810322249](https://github.com/Rohit312001/GitDemo/assets/76991475/ca432a1e-20a6-4049-99a9-d0eb3aed6e4b)

- Go inside the Security Group > Click on **Inbound rules** > Click on **Edit inbound rules**.

![imageedit_22_3880708883](https://github.com/Rohit312001/GitDemo/assets/76991475/c1c4a475-695e-47cd-a641-5cebbbdd8a52)

- Click on it and add the source as **Security group** we created earlier while creating an `EC2 instance` and click on **Save rules**.

![imageedit_26_8964083573](https://github.com/Rohit312001/GitDemo/assets/76991475/e1a4ed19-2d4a-46be-97ee-3588f1f5f283)

---

### Now let's create an IAM Role for our EC2 instance to access the RDS instance.

- **Step-01:** Go to **`AWS Console`** >> **`Services`** >> **`IAM`** >> **`Roles`** >> **`Create Role`** and also select EC2 as the service.

![Screenshot from 2023-07-17 09-56-25](https://github.com/Rohit312001/GitDemo/assets/76991475/7372ee87-83ab-445a-82dc-3efcfa68c04c)

- **Step-02:** Add the **`AmazonRDSFullAccess`** policy to the role.

![Screenshot from 2023-07-17 09-56-54](https://github.com/Rohit312001/GitDemo/assets/76991475/52977de4-3292-4fbe-8c3e-103a9a333282)

- **Step-03:** Give a name to the role and create the role and review it.

![Screenshot from 2023-07-17 09-58-06](https://github.com/Rohit312001/GitDemo/assets/76991475/e55ac07a-0b3a-4d0c-82a1-e5441162a701)

- **Step-04:** Now check whether the role is created or not.

![imageedit_4_5255382338](https://github.com/Rohit312001/GitDemo/assets/76991475/b08fb251-5ad5-496b-945d-35f67452fa0a)

- **Step-05:** Now go to **`EC2`** and select the **`Instance`** and click on **`Actions`** >> **`Instance Settings`** >> **`Modify IAM Role`**.

![Screenshot from 2023-07-17 12-48-50](https://github.com/Rohit312001/GitDemo/assets/76991475/26678580-8019-499d-a409-f18fc7994d0d)

- **Step-06:** Select the role which we created previously and click on **`Save`**.

![Screenshot from 2023-07-17 09-59-46](https://github.com/Rohit312001/GitDemo/assets/76991475/4606fb9d-9793-4cd3-a83b-078695c0f989)

---

- Now let's connect to our **EC2 instance** using **SSH**.

![Screenshot from 2023-07-21 12-21-44](https://github.com/Rohit312001/GitDemo/assets/76991475/5f07abb7-aede-4799-b9c2-a325cdfa29c9)

- Now let's install **mysql-client** in our EC2 instance.

```
sudo apt update
sudo apt-get install mysql-client
```

![Screenshot from 2023-07-21 12-23-37](https://github.com/Rohit312001/GitDemo/assets/76991475/4fda8406-5a29-43bd-a1a5-bbeebc495800)

```
mysql --version
```

![Screenshot from 2023-07-21 12-23-58](https://github.com/Rohit312001/GitDemo/assets/76991475/cba217a5-54f8-488e-9397-b25531c40b1f)

---

- Go to **RDS Console** > Open the `Database you created` > In the details of your Amazon RDS database, the hostname will be shown as the Endpoint in the Connectivity & Security section.

![imageedit_28_6002623661](https://github.com/Rohit312001/GitDemo/assets/76991475/928324b8-76cd-4402-bd53-f50e512d8b46)

- Here we are connecting the RDS Database with mysql-client in our EC2 instance.

```
export MYSQL_HOST=<your-endpoint>
#export MYSQL_HOST=wordpress.caxt8wmsdc7r.ap-south-1.rds.amazonaws.com
```

![Screenshot from 2023-07-21 12-26-16](https://github.com/Rohit312001/GitDemo/assets/76991475/71c6fa55-e8f7-4210-b880-120c69797fe2)

- Now let's fill the **Master username** and **Master password** which we created while creating the RDS instance so that it verifies and give access to mysql.

```
mysql --user=<user> --password=<password> wordpress
#mysql --user=admin --password=Rohit8329$ wordpress
```

![Screenshot from 2023-07-21 12-27-23](https://github.com/Rohit312001/GitDemo/assets/76991475/69acec11-aea9-4856-b89a-90ac548e7664)

---

- Now let's Install a Server where we can Host our Website for that we have used **Apache Server**.

```
sudo apt update
```

![Screenshot from 2023-07-21 13-28-16](https://github.com/Rohit312001/GitDemo/assets/76991475/96d43057-a73e-4357-b427-6beff75a8c1e)

```
sudo apt install apache2
```

![Screenshot from 2023-07-21 13-28-41](https://github.com/Rohit312001/GitDemo/assets/76991475/3c20aa50-32a1-4928-a2b9-a664ce857511)

- Now let's check the status of the **apache server**.Open the **Public IP** of your `EC2 instance` in the browser.

![Screenshot from 2023-07-21 13-29-25](https://github.com/Rohit312001/GitDemo/assets/76991475/5768042a-4b0f-41cf-928b-4176d0e98bc7)

---

- Now let's create a Database of our WordPress site.

```
CREATE DATABASE wordpress;
CREATE USER 'wordpress' IDENTIFIED BY 'wordpress-pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress';
FLUSH PRIVILEGES;
Exit
```

![Screenshot from 2023-07-21 13-27-43](https://github.com/Rohit312001/GitDemo/assets/76991475/22a721fe-2bf2-4188-8e7b-85608d09f87e)

- After this let's Download and COnfigure the WordPress.
- wget command is used to download the WordPress.

```
wget https://wordpress.org/latest.tar.gz
```

![Screenshot from 2023-07-21 13-30-52](https://github.com/Rohit312001/GitDemo/assets/76991475/a0ebc1f9-0f93-4d68-8438-7773115365e1)

- Now let's extract the tar file.

```
tar -xvzf latest.tar.gz
```

![Screenshot from 2023-07-21 13-31-21](https://github.com/Rohit312001/GitDemo/assets/76991475/682198d6-8d69-4e91-ab19-518137b5937a)

- After Extracting `change the directory` to wordpress and create a **copy** of the default `configuration file `which is **(wp-config-sample.php)**.

```
cd wordpress
cp wp-config-sample.php wp-config.php
```

![Screenshot from 2023-07-21 13-33-56](https://github.com/Rohit312001/GitDemo/assets/76991475/cc08723c-0f94-4572-9a08-0e1599f72e2c)

- Now let's edit the **wp-config.php** file.

```
vim wp-config.php
```

- First, We will edit the **database name** and **database user** and **database password**.

![Screenshot from 2023-07-21 16-03-12](https://github.com/Rohit312001/GitDemo/assets/76991475/3d4baf98-a4cc-4081-b3ea-f088af65d3f6)

- Now let's edit the **Authentication Unique Keys and Salts**.Copy the below API code and paste it in the **wp-config.php** file.

https://api.wordpress.org/secret-key/1.1/salt/

![Screenshot from 2023-07-21 16-03-25](https://github.com/Rohit312001/GitDemo/assets/76991475/bbea546f-0e66-408d-a6e6-964d042c80ef)

- Now let's Deploy the WordPress site, but before that we need to install some dependencies.

```
sudo apt install php libapache2-mod-php php-mysql -y
```

![Screenshot from 2023-07-21 13-37-03](https://github.com/Rohit312001/GitDemo/assets/76991475/f5358ee2-8c0c-4334-93f2-458d3e44e83b)

- Now let's copy the WordPress files to the **Apache root directory**.

```
cd ..
sudo cp -r wordpress/* /var/www/html/
sudo systemctl restart apache2
```

![Screenshot from 2023-07-21 13-37-37](https://github.com/Rohit312001/GitDemo/assets/76991475/ccf9d365-935e-4ea4-867c-ed46146c02e1)

- To check the website is running or not open the **Public IP** of your `EC2 instance` in the browser.

```
http://<public-ip>/wp-admin
```

![Screenshot from 2023-07-21 13-38-36](https://github.com/Rohit312001/GitDemo/assets/76991475/54087e5f-620d-45f1-a3f5-14b51c50f035)

Thus we have successfully deployed our WordPress site and also connected it with the RDS instance.

### NOTE : After Check the website Delete Ec2 instance and RDS instance to avoid unnecessary charges.

---
