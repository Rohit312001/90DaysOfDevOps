# Day 42 : IAM Programmatic access and AWS CLI 

## What is IAM Programmatic access?
- `Programmatic access` allows you to invoke actions on your AWS resources either through an application that you `write or through a third-party tool`. You use an **access key ID** and a **secret access key** to sign your requests for **authorization to AWS**. 
- Programmatic access can be quite powerful, so implementing best practices to `protect access key IDs` and `secret access keys` is important in order to `prevent accidental` or `malicious account activity`.

## What is AWS CLI?
-The **AWS Command Line Interface** (AWS CLI) is a unified tool to manage your **AWS services**. With just `one tool to download` and `configure`, you can control `multiple AWS services` from the command line and automate them through scripts.
- The **AWS CLI** v2 offers several new features including improved `installers`, `new configuration` options such as `AWS IAM Identity` Center (successor to `AWS SSO`), and various interactive features. 

---

## Task-01

### Create `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` from AWS Console.

- **Step-01:** Go to `AWS Console -> Security credentials -> Access keys (access key ID and secret access key)`
![imageedit_2_5746291933](https://github.com/Rohit312001/GitDemo/assets/76991475/9e96a097-356e-4396-b149-94ad7e98ed1f)

- **Step-02:** Click on `Create New Access Key` which will generate `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` for you.

![imageedit_7_3108766430](https://github.com/Rohit312001/GitDemo/assets/76991475/fc94c8f8-3e38-4c7e-9e50-343dc1ca08e4)

- **Step-03:** Download the `CSV` file which contains the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` for you.

![imageedit_13_7631529106](https://github.com/Rohit312001/GitDemo/assets/76991475/2a2b38e4-d79e-4474-832e-9cffe385545a)

- **Step 04:** Verify the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` in the `CSV` file.

![Screenshot from 2023-07-05 22-58-50](https://github.com/Rohit312001/GitDemo/assets/76991475/aaaa9f37-ed33-44af-8332-bfbff7c7a600)

*Thus we have created Access key ID and Secret access key  now we will connect to AWS CLI.*

---

## Task-02

### Setup and install AWS CLI and configure your account credentials.

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

- **Step-05:** We can check the AWS CLI is working or not by check the Ec2 instance using the following command.

```
aws ec2 describe-instances
```

![imageedit_27_2728458765](https://github.com/Rohit312001/GitDemo/assets/76991475/3195200f-d203-476b-9faf-c0c130c508d6)

---