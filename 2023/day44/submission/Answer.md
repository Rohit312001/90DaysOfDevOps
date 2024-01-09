# Day 44: Relational Database Service in AWS.

## What is AWS Relational Database Service or RDS ☁️🖥️📊?
- **`AWS RDS (Amazon Relational Database Service)`** is a `cloud-based service` provided by Amazon Web Services that simplifies the process of **setting up**, **operating**, and **scaling relational databases**. It is designed to make it **easier for developers** to manage `databases` without the need to worry about the `underlying infrastructure`.
- In simple terms, `AWS RDS` allows you to `create` and `manage databases` in the cloud without having to `set up` and `maintain your own database servers`. It supports popular relational database engines like **`MySQL`**,**`PostgreSQL`**, **`Oracle`**, **`SQL Server`**, and **`MariaDB`**.
- With **AWS RDS**, you can perform tasks such as creating a `new database instance`, `scaling your database to handle increased traffic`, and `automating backups`. It handles many administrative tasks for you, such as **software patching**, **database backups**, and **system maintenance**, so you can focus more on building your applications.
- **AWS RDS** offers features like **automated backups**, which can be scheduled to occur at regular intervals, and you can `restore your database` to any point in time within the backup retention period. It also provides `high availability` and `fault tolerance` by automatically replicating your database across multiple availability zones, ensuring that your data is safe and accessible even if one zone fails.
- Furthermore, AWS RDS allows you to `easily scale your database` resources **up** or **down** based on your **application's needs**. This means you can increase the **processing power**, **memory**, or **storage capacity** of your database instance as your application demands grow, without significant downtime or manual intervention.

![product-page-diagram_Amazon-RDS-Custom_HIW-V2 2a0401dfa56ea4cb6494ac52c6ad6dd1c62f5d44](https://github.com/Rohit312001/GitDemo/assets/76991475/ad1fa245-5251-4d7b-87ed-e8a808a57677)

## Why use AWS RDS?
- **AWS RDS** is a `fully managed service` that `simplifies` the `process` of `setting up`, `operating`, and `scaling` relational databases. It `eliminates` the `need` to `provision` and `manage` your own `database servers`, `install` and `configure` database software, and `perform` ongoing `maintenance` tasks such as `software patching`, `database backups`, and `system maintenance`.

## Task-01

### Before Creating RDS Instance let's create an EC2 Instance which we will use to connect to our RDS Instance.

**Step-01:** Go to **`AWS Console`** >> **`Services`** >> **`EC2`**.

![Screenshot from 2023-07-17 11-56-04](https://github.com/Rohit312001/GitDemo/assets/76991475/2d8d2ab6-302a-49ce-a9fd-85fb562eef6d)

**Step-02:** Click on **`Launch Instance`**.

![Screenshot from 2023-07-17 11-56-37](https://github.com/Rohit312001/GitDemo/assets/76991475/3821920c-0ccc-49ec-a955-0c9671b3002c)

**Step-03:** Give a Name to your Instance and Select **`Ubuntu and it Version`**.

![Screenshot from 2023-07-17 11-58-14](https://github.com/Rohit312001/GitDemo/assets/76991475/6e60c851-7a34-431b-987d-04e0568a4822)

**Step-04:** Select **`t2.micro`** as your **`Instance Type`** and also `key pair`.

![Screenshot from 2023-07-17 11-58-33](https://github.com/Rohit312001/GitDemo/assets/76991475/c2020de5-d5d0-4ca3-9122-8432f2ac8c09)

**Step-05:** Click on **`Review and Launch`** and check dashboard for your instance.

![Screenshot from 2023-07-17 12-03-45](https://github.com/Rohit312001/GitDemo/assets/76991475/46ae6b0c-74e3-4d1d-ad4a-b5a09b5b9967)

---

### Create a Free tier RDS instance of MySQL

- **Step-01:** Go to **`AWS Console`** >> **`Services`** >> **`RDS`**.

![Screenshot from 2023-07-15 21-16-14](https://github.com/Rohit312001/GitDemo/assets/76991475/aeb838aa-625d-4217-9a4c-5f9706ad5590)

- **Step-02:** Click on **`Create database`**.

![imageedit_2_4092586013](https://github.com/Rohit312001/GitDemo/assets/76991475/fec872ee-a1ac-4e85-bd52-67e1807c42ae)

- **Step-03:** Select **`MySQL`** as the **`Database creation method`**.

![Screenshot from 2023-07-15 21-18-32](https://github.com/Rohit312001/GitDemo/assets/76991475/b07d573a-eef4-4d1c-8a8c-d21b16232c19)

- **Step-04:** Select **Engine Version** and then Select **`Free tier`** in **`Templates`**.

![Screenshot from 2023-07-15 23-11-13](https://github.com/Rohit312001/GitDemo/assets/76991475/43154a0d-f628-49cb-a08a-c27438eab79b)

- **Step-05:** Now we will set the **`DB instance identifier`** and **`Master username`** and **`Master password`** and make sure a 

![imageedit_7_6313015612](https://github.com/Rohit312001/GitDemo/assets/76991475/1d575216-3cc8-4b1a-8851-27d5c09f31a1)

- **Step-06:** Instance Configuration >> **`Burstable classes`** >> **`db.t3.micro`**.

![Screenshot from 2023-07-15 23-13-50](https://github.com/Rohit312001/GitDemo/assets/76991475/e7b8846f-5013-4bb3-a298-647f734bb330)

- **Step-07:** `Connectivity` with your` EC2 instance`which we created previously for `RDS connection`.

![Screenshot from 2023-07-17 09-16-40](https://github.com/Rohit312001/GitDemo/assets/76991475/597c1f8d-ace1-4397-90bd-fca51a0dc09d)

- **Step-08:** Add the VPC security group (lauch-wizard-23) which we will configure in the EC2 instance of **Security group** >> **Edit inbound rules**.

![Screenshot from 2023-07-17 09-18-59](https://github.com/Rohit312001/GitDemo/assets/76991475/c91476d0-8f75-46bb-8e4c-85e1ae6c8dc0)

- **Step-09:** Thus we have created a **RDS instance**.

![Screenshot from 2023-07-17 09-31-06](https://github.com/Rohit312001/GitDemo/assets/76991475/7ae640c1-a294-4473-ab45-cd077eab9806)

---

### Assign the role to EC2 so that your EC2 Instance can connect with RDS Instance.

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

### Once the RDS instance is up and running, get the credentials and connect your EC2 instance using a MySQL client.

- **Step-01:** Go to **`AWS Console`** >> **`Services`** >> **`RDS`** >> **`Databases`** >> **`Connectivity & security`** >> **`Endpoint`**.

![imageedit_8_6018864739](https://github.com/Rohit312001/GitDemo/assets/76991475/f467a50d-cd40-49df-a0d3-347f30d4ecbc)

- **Step-02:** Now Open the EC2 instance and install the MySQL client.
```
sudo apt-get install mysql-client
```

![Screenshot from 2023-07-17 10-16-04](https://github.com/Rohit312001/GitDemo/assets/76991475/59931952-82a0-4c74-bbe6-b3956c5b2007)

```
mysql --version
```

![Screenshot from 2023-07-17 10-18-08](https://github.com/Rohit312001/GitDemo/assets/76991475/3a0bb216-0c84-4c10-b43f-c9fafd67ca99)

- **Step-03:** Now Let's configure the Security group of the EC2 instance to allow the inbound traffic from the RDS instance.

![imageedit_13_6694516260](https://github.com/Rohit312001/GitDemo/assets/76991475/830fa4a1-ceec-4d06-89d1-069c374ed48c)

- Here we have configure the **port MySQL (3306)** and source as the security group of the RDS instance.

![imageedit_10_2759972710](https://github.com/Rohit312001/GitDemo/assets/76991475/b2080ec0-bfa0-47e8-8047-a6cd74a16cca)

- **Step-04:** Now connect the RDS instance with the EC2 instance using the MySQL client.
```
mysql -h <endpoint-name> -P <port-name> -u <username> -p
```

- **At last verigy your password and we are connected to mysql.**

![Screenshot from 2023-07-17 10-25-26](https://github.com/Rohit312001/GitDemo/assets/76991475/7f3d1c3a-1f5a-4674-bd07-5f5cf6125ae3)

**Thus we have connected our Relational Database (MySql) to an EC2 instance using IAM roles.**

---