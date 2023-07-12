# Day 43: S3 Programmatic access with AWS-CLI 

## What is AWS S3?

- **Amazon Simple Storage Service** (Amazon S3) is an `object storage service` offering industry-leading **scalability**, **data availability**, **security**, and **performance**. Customers of all sizes and industries can store and protect any amount of data for virtually any use case, such as `data lakes`, `cloud-native applications`, and `mobile apps`. 
- With **cost-effective storage classes** and **easy-to-use management features**, you can `optimize costs`, `organize data`, and configure fine-tuned access controls to meet specific business, organizational, and compliance requirements.

## What is AWS CLI?
-The **AWS Command Line Interface** (AWS CLI) is a unified tool to manage your **AWS services**. With just `one tool to download` and `configure`, you can control `multiple AWS services` from the command line and automate them through scripts.
- The **AWS CLI** v2 offers several new features including improved `installers`, `new configuration` options such as `AWS IAM Identity` Center (successor to `AWS SSO`), and various interactive features.

---

## Task-01

### Launch an EC2 instance using the AWS Management Console and connect to it using Secure Shell (SSH).

- **Step-01:** Launch an EC2 instance using the AWS Management Console and select OS as `Ubuntu`.

![Screenshot from 2023-07-12 10-00-17](https://github.com/Rohit312001/GitDemo/assets/76991475/33c01ceb-40c3-4bbc-8323-b503301a66e4)

- **Step-02:** Select `instance type` ,`key pair` and `security group`.

![Screenshot from 2023-07-12 10-01-25](https://github.com/Rohit312001/GitDemo/assets/76991475/0ee6f5ef-2d05-427f-926e-af18f86d08a5)

**Step-03:** Launch the instance via **SSH** so `copy` the command and `paste` it in your `terminal`.

![imageedit_4_4927819131](https://github.com/Rohit312001/GitDemo/assets/76991475/c6290be4-6d8e-4274-a4cc-9ddab507ca68)

**Step-04:** Now you can see your instance is running.

![imageedit_7_6423977729](https://github.com/Rohit312001/GitDemo/assets/76991475/80cb4b45-63be-492a-979d-2fac00d236cb)

---

### Before creating S3 bucket we need to install AWS CLI in our EC2 instance.

- **Step-01:** Install AWS CLI using the following command

```
sudo apt update
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

![imageedit_17_3657219052](https://github.com/Rohit312001/GitDemo/assets/76991475/d4d7ed3b-6851-47af-97cd-b2b9b337688a)

- **Step-02:** Verify the installation using the following command

```
aws --version
```

![imageedit_19_8441271999](https://github.com/Rohit312001/GitDemo/assets/76991475/7a5db5fd-9d09-4a90-90be-86e5af44997d)

- **Step-03:** Configure the AWS CLI using the following command in  which we will provide the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` which we have created in the previous task and also provide the `region` we want to work and the `output format`.

```
aws configure
```

![imageedit_25_2247222209](https://github.com/Rohit312001/GitDemo/assets/76991475/7733509d-58f4-42cb-95e5-aead4d23a69d)

- **Step-04:** Verify the configuration using the following command which will show the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` which we have provided in the previous step.

```
aws configure list
```

![Screenshot from 2023-07-06 00-05-06](https://github.com/Rohit312001/GitDemo/assets/76991475/c3a43656-59f0-4df7-b719-ae59292f77dd)

---
### Create an S3 bucket and upload a file to it using the AWS Management Console.

- **Step-01:** Go to **S3** service and click on **Create bucket**.

![Screenshot from 2023-07-12 10-05-16](https://github.com/Rohit312001/GitDemo/assets/76991475/da4ad982-afc2-4aa1-8f9c-cfe18d438288)

- **Step-02:** Give a name to your bucket as 'rohit-s3bucket'.

![Screenshot from 2023-07-12 10-22-42](https://github.com/Rohit312001/GitDemo/assets/76991475/1f77b3fa-1c75-40ad-95ee-baab624aa75e)

**Step-03:** Now click on **Create bucket**.

![Screenshot from 2023-07-12 10-23-13](https://github.com/Rohit312001/GitDemo/assets/76991475/10061912-f1a4-437c-be48-196064edfd40)

**Step-04:** Now click on **Upload** and upload a file.

![Screenshot from 2023-07-12 10-23-37](https://github.com/Rohit312001/GitDemo/assets/76991475/a789d26c-f884-45eb-86c4-4da5fa6835fa)

![Screenshot from 2023-07-12 10-24-57](https://github.com/Rohit312001/GitDemo/assets/76991475/b2e7885d-65af-48cb-b790-41358a2c7c7a)

**Step-05:** Now click on **Upload**.

![Screenshot from 2023-07-12 10-25-19](https://github.com/Rohit312001/GitDemo/assets/76991475/c3060888-1539-4a10-84a8-b9975bf26c8c)

---

### Access the file from the EC2 instance using the AWS Command Line Interface (AWS CLI). 

- `aws s3 ls` - This command lists all of the S3 buckets in your AWS account.

![Screenshot from 2023-07-12 10-46-21](https://github.com/Rohit312001/GitDemo/assets/76991475/760a3a4f-d9c6-4749-87f5-11676260acc4)

- **Now lets create a text file and upload it to our S3 bucket.**

![Screenshot from 2023-07-12 12-06-57](https://github.com/Rohit312001/GitDemo/assets/76991475/f0f54bf1-0ec6-403f-be59-aed0cc807597)

```
aws s3 cp <filename> s3://<bucketname>
```

- **Thus we have uploaded our file to our S3 bucket.**

![Screenshot from 2023-07-12 12-09-28](https://github.com/Rohit312001/GitDemo/assets/76991475/cdd3ae26-e334-4e73-b548-fb90c6677563)

- **Check the file in the S3 bucket.**

![Screenshot from 2023-07-12 12-10-02](https://github.com/Rohit312001/GitDemo/assets/76991475/1bb356dc-bc8b-4fb1-a8bc-9bfd50f29cf4)

- **Now we will see how to download a file from S3 bucket to our EC2 instance.**

- `aws s3 cp s3://bucket-name/file.txt .` - This command downloads a file from an S3 bucket to your local file system.

![Screenshot from 2023-07-12 12-31-22](https://github.com/Rohit312001/GitDemo/assets/76991475/fb60e8df-d62d-4d01-91b9-1c4d1bdc3173)

```
aws s3 cp s3://rohit-s3bucket/rohit.txt /home/ubuntu/storage
```
![Screenshot from 2023-07-12 12-31-50](https://github.com/Rohit312001/GitDemo/assets/76991475/c8186072-c7af-45be-b4d7-3f8e70eff621)

---

## Task-02

### Create a snapshot of the EC2 instance and use it to launch a new EC2 instance.

- **Step-01:** Go to **EC2** service and click on **snapshot**.

![imageedit_12_2673864321](https://github.com/Rohit312001/GitDemo/assets/76991475/1a21919e-1de5-442a-9d52-69f4187ca32d)

- **Step-02:** In **Snapshot** click on resource type and select **instance** with appropriate `instance id`.

![Screenshot from 2023-07-12 12-56-58](https://github.com/Rohit312001/GitDemo/assets/76991475/6070cd4b-c1e6-49fe-972c-3c9f2c2bf530)

- **Step-03:** After creating the snapshot ,we will `create image from snapshot`.

![Screenshot from 2023-07-12 13-15-44](https://github.com/Rohit312001/GitDemo/assets/76991475/8415ed6f-85f7-4697-8afa-9d5cbf79dfb9)

- **Step-04:** Now we are creating `image`  from `snapshot`.

![Screenshot from 2023-07-12 13-18-01](https://github.com/Rohit312001/GitDemo/assets/76991475/fc906f74-862f-4523-8700-ecd041c12fdf)

- **Step-05:** Now we will select the snapshot from the Amazon Machine Image(AMI).  

![imageedit_16_4082641438](https://github.com/Rohit312001/GitDemo/assets/76991475/99ecbdc4-b607-4450-acbc-017797c60942)

- Select  (Owned by me) and click on **Launch instance from AMI**.

![imageedit_14_8012926792](https://github.com/Rohit312001/GitDemo/assets/76991475/312a2d54-81ca-444c-b2db-448310650718)

- **Launch snapshot by AMI instance.**

![imageedit_19_5549087778](https://github.com/Rohit312001/GitDemo/assets/76991475/a2bb2026-2680-4a22-b917-f5ada48a1ee1)

- **Step-06:** Now we will launch the instance which is a **SnapShot instance**  of the **first instance.**

![Screenshot from 2023-07-12 14-27-19](https://github.com/Rohit312001/GitDemo/assets/76991475/142235ab-a58f-49af-99a5-74590925b30a)

- **Step-07:** Now we will check the **key pair login** and **Network Setting** of the **new instance** and create it.

![Screenshot from 2023-07-12 13-28-10](https://github.com/Rohit312001/GitDemo/assets/76991475/382389db-4d33-40fd-b52f-1ffe02e8895f)

- **Step-08:** After creating the instance we will ssh into the instance.

![imageedit_22_3919884492](https://github.com/Rohit312001/GitDemo/assets/76991475/ca75261b-7f2a-4381-994c-79fb23f86027)

**`Please login as the user "ubuntu" rather than the user "root"`** - This error occurs because we are trying to login as root user.

![imageedit_30_8945820103](https://github.com/Rohit312001/GitDemo/assets/76991475/a2166f2d-18d4-4cf3-83f0-d68ab6d0ee2c)

- So follow this command to **login as ubuntu user.**
```
ssh -i "s3bucket.pem" ubuntu@ec2-13-234-204-102.ap-south-1.compute.amazonaws.com
```

![imageedit_35_9342945161](https://github.com/Rohit312001/GitDemo/assets/76991475/151ee3f8-3009-48fd-99c9-26ff134946f0)

---

- *Now we will check the content of Instance-one **(MyS3Bucket)** is snapped into instance-two **(rohit-s3bucket-snapshot-server)**.*

![Screenshot from 2023-07-12 18-53-11](https://github.com/Rohit312001/GitDemo/assets/76991475/46d4d756-827b-489d-8030-63bfae3f5133)

- **Verify that the contents of the file are the same on both EC2 instances.**

![imageedit_42_7727636729](https://github.com/Rohit312001/GitDemo/assets/76991475/c9a7b2a8-4ea5-4d53-88e3-218ccec35899)

- **Thus we have verified that the contents of the file are the same on both EC2 instances.**
---

### Here are some commonly used AWS CLI commands for Amazon S3:

- `aws s3 ls` - This command lists all of the S3 buckets in your AWS account.

- `aws s3 mb s3://bucket-name` - This command creates a new S3 bucket with the specified name.

- `aws s3 rb s3://bucket-name` - This command deletes the specified S3 bucket.

- `aws s3 cp file.txt s3://bucket-name` - This command uploads a file to an S3 bucket.

- `aws s3 cp s3://bucket-name/file.txt .` - This command downloads a file from an S3 bucket to your local file system.

- `aws s3 sync local-folder s3://bucket-name` - This command syncs the contents of a local folder with an S3 bucket.

- `aws s3 ls s3://bucket-name` - This command lists the objects in an S3 bucket.

- `aws s3 rm s3://bucket-name/file.txt` - This command deletes an object from an S3 bucket.

- `aws s3 presign s3://bucket-name/file.txt` - This command generates a pre-signed URL for an S3 object, which can be used to grant temporary access to the object.

- `aws s3api list-buckets` - This command retrieves a list of all S3 buckets in your AWS account, using the S3 API.

---