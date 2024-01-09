# Day 41 : AWS with Elastic Load Balancer(ELB)

## What is Load Balancing?
- **Load Balancing** is the distribution of `workloads` across `multiple servers` to **ensure consistent** and **optimal resource utilization**. It is an essential aspect of any `large-scale and scalable computing system`, as it helps you to improve the reliability and `performance` of your applications.

## Elastic Load Balancing:
- **Elastic Load Balancing** automatically `distributes` your `incoming traffic across multiple targets`, such as **EC2 instances**, **containers**, and **IP addresses**, in one or more **Availability Zones**. 
- It monitors the health of its **registered targets**, and **routes traffic only to the healthy targets**. `Elastic Load Balancing` scales your `load balancer capacity` automatically in response to changes in `incoming traffic`. It can also automatically scale your Amazon EC2 Auto Scaling groups.

## Application Load Balancer (ALB):
- An **Application Load Balancer** functions at the application layer, the seventh layer of the Open Systems Interconnection (OSI) model.
- A **listener checks for connection requests from clients**, using the **protocol** and **port** that you **configure**. The rules that you define for a listener determine how the `load balancer routes` requests to its `registered targets`. Each rule consists of a priority, one or more actions, and one or more conditions. When the conditions for a rule are met, then its actions are performed. You must define a `default rule for each listener`, and you can optionally define `additional rules`.
- Each **target group** routes requests to one or more registered targets, such as `EC2 instances`, using the `protocol` and `port number` that you specify. You can register a `target` with `multiple target groups`. You can configure `health checks` on a per target group basis. `Health checks` are performed on `all targets registered`to a `target group` that is specified in a `listener rule` for your `load balancer`.

![ApplicationLB](https://github.com/Rohit312001/GitDemo/assets/76991475/b30aa6ca-9880-4ee9-92b0-7cc67f07cdc7)

## Network Load Balancer (NLB):
- A **Network Load Balancer** functions at the **fourth layer** of the `Open Systems Interconnection (OSI) model`. It can handle `millions of requests per second`. After the `load balancer receives a connection request`, it `selects` a `target` from the `target group` for the default rule. It attempts to open a **TCP connection** to the selected target on the **port** specified in the listener configuration.

## Gateway Load Balancer (GWLB):
- A **Gateway Load Balancer** operates at the third layer of the `Open Systems Interconnection (OSI)` model, the **network layer**.
- **Gateway Load Balancers** enable you to `deploy`, `scale`, and `manage virtual appliances`, such as `firewalls`, `intrusion detection` and `prevention systems`, and `deep packet inspection systems`. It combines a transparent network gateway (that is, a single entry and exit point for all traffic) and distributes traffic while scaling your `virtual appliances` with the demand.

## Task 1:

- **launch 2 EC2 instances with an Ubuntu AMI and use User Data to install the Apache Web Server.**

**Step1:** : Open EC2 Dashboard and click on `Launch Instance Template` button and name as `Apache Server` and select `Ubuntu Server 20.04 LTS (HVM), SSD Volume Type` and click on `Next: Configure Instance Details` button.

![imageedit_4_3291005029](https://github.com/Rohit312001/GitDemo/assets/76991475/6c19ccee-d514-4917-82d8-bd99626b7f53)

**Step2:** Select `Key pair` and Network setting with in region by checking `VPC` and `subnet`.

![imageedit_8_6338799830](https://github.com/Rohit312001/GitDemo/assets/76991475/7dbf730b-1178-4d01-a2bb-2f18e37c6802)

**Step3:** Select `Advanced Details` and paste the below code in `User Data` which will install the Apache Web Server.

```
!#/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2    
sudo systemctl enable apache2
```

![Screenshot from 2023-06-30 22-51-48](https://github.com/Rohit312001/GitDemo/assets/76991475/a4f0dc17-f361-40d5-a7ef-f36161cc720b)

**Step4:** Now check the `EC2 Dashboard` and you can see the instance is running.

![Screenshot from 2023-06-30 22-52-58](https://github.com/Rohit312001/GitDemo/assets/76991475/539e42e8-1c87-4e30-a674-81b8e29e3059)

**Step5:** Now click on `Connect` button and copy the `SSH` command and paste it in `Terminal` and you can see the `Apache Web Server` is installed.

**`Apache Server 1 Instance:`**

![imageedit_14_8391936587](https://github.com/Rohit312001/GitDemo/assets/76991475/dd264f48-18a8-433a-8ce1-8982f307013b)

**Step6:** Change the `index.html` file in `/var/www/html` directory and add the `Instance ID` and `Availability Zone` in the file.
```
cd /var/www/html
sudo vi index.html
```

![Screenshot from 2023-07-01 15-35-49](https://github.com/Rohit312001/GitDemo/assets/76991475/192d5813-1ca5-4fb2-9560-1d7bf4f3781b)

**Step7:** Now check the **Public IP** of the instance 1 and you will see the **html** is running on the IP address.

![imageedit_36_9216541114](https://github.com/Rohit312001/GitDemo/assets/76991475/517a63a9-bf48-49cc-9da4-12f5bf7896d5)

*DO THE SAME PROCESS FOR THE SECOND INSTANCE*

**`Apache Server 2 Instance:`**

![imageedit_27_4044554253](https://github.com/Rohit312001/GitDemo/assets/76991475/f3e11689-c2b5-40a2-be6a-5afa7d36bbdd)

- **Step8:** Change the `index.html` file in `/var/www/html` directory and add the `Instance ID` and `Availability Zone` in the file.

```
cd /var/www/html
sudo vi index.html
```

![Screenshot from 2023-07-01 15-44-29](https://github.com/Rohit312001/GitDemo/assets/76991475/3335fecb-dd68-4ef1-9607-ef404ca81a87)

- **Step9:** Now check the **Public IP** of the instance 2 and you will see the **html** is running on the IP address.

![imageedit_50_4496470655](https://github.com/Rohit312001/GitDemo/assets/76991475/247f60c6-893b-4f3e-953b-26693d7fbf31)

---

## Task 2:

- **Create an Application Load Balancer (ALB) in EC2 using the AWS Management Console.**

- **Step1:** Open `EC2 Dashboard` and click on `Create Target Groups` button.

![imageedit_55_2842493372](https://github.com/Rohit312001/GitDemo/assets/76991475/9b84eb94-13f0-4d93-897a-b52c5342b709)

- **Step2:** Let's first specify the group details. Name the target group as `ApacheGroup` and select `Instance` as the target type. Click on `Next` button.

![Screenshot from 2023-07-01 00-08-19](https://github.com/Rohit312001/GitDemo/assets/76991475/f38452be-d252-4ea9-9dd1-bbe764f9e747)

- **Step3:** Now we will configure the Http settings. Select `HTTP` as the protocol and `80` as the port. Click on `Next` button.

![imageedit_58_5644159009](https://github.com/Rohit312001/GitDemo/assets/76991475/e56af654-9453-400d-bea2-c03fb2fe2675)

- **Step4:** After Configuration, click on `Create Target Group` button and we have successfully created the target group.

![Screenshot from 2023-07-01 15-53-21](https://github.com/Rohit312001/GitDemo/assets/76991475/bd7dd7c8-84aa-4acd-acda-38be71e4238e)

---

**Step1:** Now click on `Load Balancers` and click on `Create Application Load Balancer` button here we will add all the instances in the load balancer via `Target Group`.

![Screenshot from 2023-06-30 23-48-24](https://github.com/Rohit312001/GitDemo/assets/76991475/331545a1-f0ee-486b-b459-35fe2c668c4b)

- **Step2:** Name the Load Balancer as `ApacheLB` and select `Internet-facing` as the scheme. Click on `Next` button.

![Screenshot from 2023-06-30 23-51-07](https://github.com/Rohit312001/GitDemo/assets/76991475/5426f3d6-79a9-46ad-a4c8-cdcd0f8dd0da)

- **Step3:** Now we will configure the VPC and Network-Mapping. Select the VPC as `Default VPC` and select all the subnets. Click on `Next` button.

![Screenshot from 2023-06-30 23-53-52](https://github.com/Rohit312001/GitDemo/assets/76991475/5f7ea2d0-1d54-4774-b008-098fc215ff74)

- **Step4:** Now we will redirect the traffic to the target group. Select the `ApacheGroup` as the target group and click on `Next` button.

![imageedit_63_7205836346](https://github.com/Rohit312001/GitDemo/assets/76991475/d96e4302-c027-484c-b74e-c199dacf2410)

- **Step5:** Thus we have successfully created the load balancer. Click on `Create` button.

![Screenshot from 2023-06-30 23-55-11](https://github.com/Rohit312001/GitDemo/assets/76991475/586847cf-efea-4b8e-9a84-fde5fd018461)

---
- **Step1:** Let's check the Register Target to verify the instances are added in the load balancer.

![Screenshot from 2023-07-01 00-11-29](https://github.com/Rohit312001/GitDemo/assets/76991475/43bee1c6-cd81-4a63-8bc9-6452f6388d5e)

- **Step2:** Now we will check the `DNS Name` of the load balancer and paste it in the browser and you will see the `Apache Web Server` is running.

![Screenshot from 2023-07-01 15-53-11](https://github.com/Rohit312001/GitDemo/assets/76991475/38524642-b047-45cf-ae0a-3994a53478c1)

- **Step3:** Now we will check the browser again and you will see the `Apache Web Server` is running.

**Apache Server 1 on LoadBalancer DNS:**

![imageedit_67_5654606860](https://github.com/Rohit312001/GitDemo/assets/76991475/e8692992-f1ac-4afe-9100-954b26b07626)

**Apache Server 2 on LoadBalancer DNS:**

![imageedit_70_5317834601](https://github.com/Rohit312001/GitDemo/assets/76991475/fa9e7ea6-4ef6-4638-b8b8-abec077ec388)

---