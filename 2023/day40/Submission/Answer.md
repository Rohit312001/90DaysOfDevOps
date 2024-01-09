# Day 40 AWS EC2 Automation

## What is AWS EC2?
- **Amazon Elastic Compute Cloud (Amazon EC2)** provides **on-demand, scalable computing capacity** in the `Amazon Web Services (AWS) Cloud`. Using `Amazon EC2` reduces **hardware costs** so you can **develop** and **deploy applications faster**. You can use Amazon EC2 to launch as many or as few `virtual servers` as you need, **configure security** and **networking**, and **manage storage**. You can add capacity (scale up) to `handle compute-heavy tasks`, such as **monthly** or **yearly processes**, or spikes in website traffic. `When usage decreases, you can reduce capacity (scale down) again`.

## Features of Amazon EC2

**Amazon EC2 provides the following high-level features:**

- **Instances:** called as `Virtual servers`.

- **Amazon Machine Images (AMIs):** Preconfigured templates for your instances that package the components you need for your server (including the operating system and additional software).

- **Instance types:** Various configurations of CPU, memory, storage, networking capacity, and graphics hardware for your instances.

- **Key pairs:** Secure login information for your instances. AWS stores the public key and you store the private key in a secure place.

- **Instance store volumes:** Storage volumes for temporary data that is deleted when you stop, hibernate, or terminate your instance.

- **Amazon EBS volumes:** Persistent storage volumes for your data using Amazon Elastic Block Store (Amazon EBS).

- **Regions, Availability Zones, Local Zones, AWS Outposts, and Wavelength Zones:** Multiple physical locations for your resources, such as instances and Amazon EBS volumes.

- **Security groups:** A virtual firewall that allows you to specify the protocols, ports, and source IP ranges that can reach your instances, and the destination IP ranges to which your instances can connect.

- **Elastic IP addresses:**
Static IPv4 addresses for dynamic cloud computing.

- **Tags:** Metadata that you can create and assign to your Amazon EC2 resources.

- **Virtual private clouds (VPCs):** Virtual networks you can create that are logically isolated from the rest of the AWS Cloud. You can optionally connect these virtual networks to your own network.

![ec2-basic-arch](https://github.com/Rohit312001/GitDemo/assets/76991475/fc3d006a-1dfa-4861-92d0-8cac580e953b)

## AWS EC2 Pricing:

| Instance | CPU | Memory (GiB) | Storage (GB)| Linux On-Demand cost |
| --- | --- | --- | --- | --- |
| t2.micro | 1 | 1 | EBS only | $0.0116 per Hour |
| t2.small | 1 | 2 | EBS only | $0.023 per Hour |
| t2.medium | 2 | 4 | EBS only | $0.0464 per Hour |
| t2.large | 2 | 8 | EBS only | $0.0928 per Hour |
| t2.xlarge | 4 | 16 | EBS only | $0.1856 per Hour |
| t2.2xlarge | 8 | 32 | EBS only | $0.3712 per Hour |
| m5.large | 2 | 8 | EBS only | $0.096 per Hour |
| m5.xlarge | 4 | 16 | EBS only | $0.192 per Hour |
| m5.2xlarge | 8 | 32 | EBS only | $0.384 per Hour |

**Instance type:** The type of instance to launch. An instance type defines the hardware of the host computer used for your instance. Each instance type provides different compute and memory capabilities. You can select an instance type based on the amount of memory and computing power that you need for the application or software that you plan to run on your instance.

## AWS EC2 Instance Template:

- You can create a **launch template** that contains the `configuration information` to launch an instance. You can use launch templates to store `launch parameters` so that you do not have to specify them every time you launch an instance.
- For example, a launch template can contain the **AMI ID**, **instance type**, and **network settings** that you typically use to launch instances. When you launch an instance using the **Amazon EC2 console**, an **AWS SDK**, or a **command line tool**, you can specify the launch template to use.

![launch-template-diagram](https://github.com/Rohit312001/GitDemo/assets/76991475/cedde8bd-2bf8-46b6-a92a-5219b20fd712)


## Amazon Machine Image (AMI):

- An **Amazon Machine Image (AMI)** is an **image** that AWS supports and keeps up to date. It contains the information needed to start an instance. When you launch an instance, you must choose an AMI. When you need multiple instances with the same configuration, you can launch them from a **single AMI**.

## AWS Auto Scaling:

- **Amazon EC2 Auto Scaling** helps you maintain `application availability` and lets you automatically `add` or `remove EC2 instances` using `scaling policies` that you define. **Dynamic** or **predictive scaling** policies let you add or remove EC2 instance capacity to service established or **real-time demand patterns**. The `fleet management` features of `Amazon EC2 Auto Scaling` help maintain the **health** and ***availability of your fleet**.

## Task 1: 

**Create a launch template with Amazon Linux 2 AMI and t2.micro instance type with Jenkins and Docker setup using user data script.**

- **Step 1:** Go to the **EC2** service and click on **Launch Templates** under **INSTANCES** and hit **Create launch template**.

![Screenshot from 2023-06-24 18-48-55](https://github.com/Rohit312001/GitDemo/assets/76991475/c22970d5-f50e-4421-b7f9-0fc4497a93ad)

- **Step 2:** Select Application and OS as **Amazon Linux 2** and **t2.micro** as instance type.

![Screenshot from 2023-06-24 18-49-12](https://github.com/Rohit312001/GitDemo/assets/76991475/d8428537-c81d-4d92-8771-123c687e82cc)

- **Step 3:** Select **Create a new key pair** and give a name to it and download it and  Network type as **VPC** and Subnet as **Public Subnet**.

![Screenshot from 2023-06-24 18-49-29](https://github.com/Rohit312001/GitDemo/assets/76991475/612cd6dc-cca7-4d55-a0e6-0d84d19d6388)

- **Step 4:** Click on **Advanced details** and paste the below script in **User data** and click on **Create launch template**.

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

![Screenshot from 2023-06-24 18-50-00](https://github.com/Rohit312001/GitDemo/assets/76991475/5d7a94fa-ee02-4354-850b-dbe683f9975d)

- **Step 5:** Go to the **EC2** service and click on **Auto Scaling Groups** under **Auto Scaling** and hit **Create Auto Scaling group**.

![imageedit_8_4370752380](https://github.com/Rohit312001/GitDemo/assets/76991475/3124bfee-b750-4697-8395-f5d639debfab)

---

**Create 3 Instances using Launch Template, there must be an option that shows number of instances to be launched using Auto Scaling Group.**

- **Step 1:** Go to the **EC2** service and click on **Auto Scaling Groups** under **Auto Scaling** and hit **Create Auto Scaling group**.

![Screenshot from 2023-06-24 18-59-47](https://github.com/Rohit312001/GitDemo/assets/76991475/ad1b9da9-26b7-4bc5-8301-3a1555141aaf)

![Screenshot from 2023-06-24 19-00-20](https://github.com/Rohit312001/GitDemo/assets/76991475/5caa5b15-e907-4e85-8ccb-127939fa2cd0)

- **Step 2:** Select Network as **VPC** and Subnet as **Public Subnet** and click on **Next**.

![Screenshot from 2023-06-24 19-05-52](https://github.com/Rohit312001/GitDemo/assets/76991475/afce1bcd-6c73-4b51-aeef-1994cc41c56a)

- **Step 3:** Here we are not using **Load Balancer** so click on **Next**.

![Screenshot from 2023-06-24 19-08-34](https://github.com/Rohit312001/GitDemo/assets/76991475/fec605e7-f208-4e1e-8b9a-fa707f7f6f81)

- **Step 4:** Configure group size and scaling policies and click on **Next** and skipping notifications and tags we have created **Auto Scaling group successfully**.

![Screenshot from 2023-06-24 19-31-59](https://github.com/Rohit312001/GitDemo/assets/76991475/32ba100f-289b-446f-aaff-b6950120d540)

- **Step 5:** Go to the **EC2** service and click on **Auto Scaling Groups** under **Auto Scaling** and click on **Auto Scaling group** and click on **Edit** and change the **Desired capacity** to **3** and click on **Update**.

![Screenshot from 2023-06-24 19-48-30](https://github.com/Rohit312001/GitDemo/assets/76991475/992bca1e-7010-4704-ab5d-d15063de335c)

![Screenshot from 2023-06-24 19-48-19](https://github.com/Rohit312001/GitDemo/assets/76991475/dc28b1cb-e055-4a30-90eb-a36b5ac49620)

- **Step 6:** So After the we delete **Auto Scaling group** and it will **delete all the instances**.

![Screenshot from 2023-06-24 20-03-33](https://github.com/Rohit312001/GitDemo/assets/76991475/0c8bc705-a7f1-4a3a-af11-e95d4831ddb6)

---