# Day 81 : How Netflix Notifies Users About New Movies using S3 and Lambda.

This real-time project is utilized by leading companies such as **Netflix**, **Amazon**, **AirBnB**, and numerous others for their notification system so whenever there is a new file uploaded to the S3 bucket, it triggers an event and sends a notification to the user.

For example whenever there is a new show on Netflix, it sends a notification to the user. This is done by using AWS S3 event triggering.

## Prerequisites:
- AWS Account
- S3 Bucket
- Lambda Function
- SNS Topic
- IAM Role

## Steps to be followed:

### IAM User Creation:

- **Step-1:** We will create a new user by clicking on the "Add user" button in the IAM dashboard.

![Screenshot from 2024-03-18 13-51-53](https://github.com/rohit-rajput1/GitDemo/assets/76991475/9547a247-3f8a-42c6-9b2d-1c270ecb5970)

- **Step-2:** Now we will add the policy to the user, which includes `AWSLambdaFullAccess`, `AmazonS3FullAccess`, `AmazonSNSFullAccess` and `IAMFullAccess`.

![image](https://github.com/rohit-rajput1/GitDemo/assets/76991475/0976da9d-9fd2-4fdb-b6fe-70f031cb006a)

- After this save the **user** and **download the credentials**.

![Screenshot from 2024-03-18 13-54-30](https://github.com/rohit-rajput1/GitDemo/assets/76991475/bc11cac2-f6b4-42a9-bbb4-db596d42dad8)

### Creation of Security Credentials for the User:

- **Step-3:** Go to **IAM Dashboard** >> **Users** >> Select the **User** >> **Security Credentials** >> **Create Access Key** or create a new one if it is not created.

![image](https://github.com/rohit-rajput1/GitDemo/assets/76991475/3bfa17fa-e0ce-4bb5-8bae-6978ec828494)

### AWS EC2 Instance Creation:

- **Step-4:** Go to **EC2 Dashboard** >> **Instances** >> **Launch Instance** >> Select the **AMI** according to your requirement.

![Screenshot from 2024-03-18 19-15-01](https://github.com/rohit-rajput1/GitDemo/assets/76991475/6827584c-b5d2-4aae-9c9e-aa7a25c1f403)

- **Step-5:** Now select the **Instance Type** >> **Configure Instance Details** >> **Add Storage** >> **Add Tags** >> **Configure Security Group** 

![Screenshot from 2024-03-18 19-15-20](https://github.com/rohit-rajput1/GitDemo/assets/76991475/eb460edd-52d4-40cf-b286-8c8411fd3bce)

- **Step-6:** After this **Review and Launch** >> **Launch** the instance.

![Screenshot from 2024-03-18 19-17-35](https://github.com/rohit-rajput1/GitDemo/assets/76991475/c2eb6025-7b98-4962-9d70-fc6443c95b66)

- First we will update all the system packages and install the required packages.

```bash
sudo apt update -y
```

![Screenshot from 2024-03-18 14-08-02](https://github.com/rohit-rajput1/GitDemo/assets/76991475/3cbd4af5-097d-4192-ab19-c6fc390e0160)

### AWS CLI Installation:
- The AWS CLI needed to be installed in the EC2 instance to interact with the AWS services.

```bash
sudo apt install unzip
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

![Screenshot from 2024-03-18 14-08-27](https://github.com/rohit-rajput1/GitDemo/assets/76991475/f7156ac4-b9d6-4cb8-9d06-96767267151e)

- Check the version of the AWS CLI installed.

```bash
aws --version
```
![Screenshot from 2024-03-18 14-10-52](https://github.com/rohit-rajput1/GitDemo/assets/76991475/cf377498-91c7-402d-a2c5-d70b2153ce67)

### AWS Configuration:
- AWS Configuration is needed to be done to interact with the AWS services.

```bash
aws configure
```

![imageedit_1_9294372385](https://github.com/rohit-rajput1/GitDemo/assets/76991475/e1b6ac7c-2bd6-4952-9662-1e5b367a278b)

![Screenshot from 2024-03-18 14-12-34](https://github.com/rohit-rajput1/GitDemo/assets/76991475/7a73a809-a0fe-470a-ab17-a61a719080e3)


- We will also install `jq` and `zip` packages.

```bash
# To Parse JSON we use jq
sudo apt install jq -y
```

![Screenshot from 2024-03-18 19-24-09](https://github.com/rohit-rajput1/GitDemo/assets/76991475/ed39b1ed-d084-4ae2-b37e-1c31289955aa)

```bash
# To zip the files
sudo apt install zip -y
```

![Screenshot from 2024-03-18 19-24-47](https://github.com/rohit-rajput1/GitDemo/assets/76991475/ddffde33-1f45-44eb-a7e9-6e449a30a041)

## Scripting Part:

### Steps:
1. The script will upload a file to the s3 bucket.
2. Then script is used to trigger the s3 bucket event.
3. After this, s3 bucket event will trigger the lambda function.
4. This lambda function will send the message to the sns topic.
5. The sns topic will send the message to the email.
6. At last email will be received by the user.


### In part-1 of the code, I have created the variable that holds the `account-id`, `s3 bucket name`, `lambda function name`, `role name`, and `email address` and also `role responses` to which i have attached `IAM policies`.

```bash
#!/bin/bash

# First we will use set -x command to run the script in debugging mode.
set -x

# We will create a variable in which we will store the AWS Account ID. The AWS CLI retrives the caller identity, which includes information about the AWS account.
aws_account_id=$(aws sts get-caller-identity --query 'Account' --output text)

# We will print the AWS Account ID.
echo "AWS Account ID: $aws_account_id"

# Now we will create a variable in which we will store the name of the s3 bucket.
aws_region="us-east-1"
s3_bucket_name="s3-123-buczet"
lambda_function_name="s3-lambda-function"
role_name="s3-lambda-sns"
email_address="xyz@gmail.com"

# Here we will create an IAM role for the lambda function to give it the permission to access the s3 bucket.
role_response=$(aws iam create-role --role-name s3-lambda-sns --assume-role-policy-document '{
  "Version": "2012-10-17",
  "Statement": [{
    "Action": "sts:AssumeRole",
    "Effect": "Allow",
    "Principal": {
      "Service": [
         "lambda.amazonaws.com",
         "s3.amazonaws.com",
         "sns.amazonaws.com"
      ]
    }
  }]
}')

# This commands tell us that it extract the ARN(Amazon Resource Name) of a role from JSON data stored in the '$role_response' variable and assign it to the '$role_arn' variable.
role_arn=$(echo "$role_response" | jq -r '.Role.Arn')

# Here we are printing the role ARN.
echo "The Role ARN is: $role_arn"

# Now we will attach the policy to the role.
aws iam attach-role-policy --role-name $role_name --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess
aws iam attach-role-policy --role-name $role_name --policy-arn arn:aws:iam::aws:policy/AmazonSNSFullAccess
```

### In part-2 of the code, I have created the S3 bucket and uploaded a file to the s3 bucket.

```bash
# Now we will create a S3 bucket which captures the output in a variable.
s3_bucket_output=$(aws s3api create-bucket --bucket "$s3_bucket_name" --region "$aws_region")

# Here we are printing the output of the s3 bucket.
echo "The S3 Bucket Output is: $s3_bucket_output"

# Now we will upload a file to the s3 bucket.
aws s3 cp ./buxar.txt s3://"$s3_bucket_name"/buxar.txt

# So we will create a zip file which will be uploaded to the lambda function.After that, the lambda function will extract the zip file and execute the code.

zip -r s3-lambda-function.zip ./s3-lambda-function

sleep 5
```

### In part-3 of the code, I have created the lambda function and attached the role to the lambda function also SNS Topic is created to send the message to the email.

```bash
# Now we will create a lambda function.
aws lambda create-function \
    --region "$aws_region" \
    --fucntion-name $lambda_function_name \
    --runtime "python3.8" \
    --handler "s3-lambda-function/s3-lambda-function.lambda_handler" \
    --memory-size 128 \
    --timeout 30 \
    --role "arn:aws:iam::$aws_account_id:role/$role_name" \
    --zip-file "fileb://s3-lambda-function.zip"

# Now we will add the permission to S3 Bucker to invoke the lambda function.
aws lambda add-permission \
    --function-name "$lambda_function_name" \
    --statement-id "s3-lambda-sns" \
    --action "lambda:InvokeFunction" \
    --principal s3.amazonaws.com \
    --source-arn "arn:aws:s3:::$s3_bucket_name" \

# Here we will create S3 event triggering for the lambda fucntion to be invoked.
LambdaFunctionArn="arn:aws:lambda:ap-south-1:$aws_account_id:function:s3-triggering-lambda-function"
aws s3api put-bucket-notification-configuration \
    --region "$aws_region" \
    --bucket "$s3_bucket_name" \
    --notification-configuration '{
        "LambdaFunctionConfigurations":[{
            "LambdaFunctionArn":"'"$LambdaFunctionArn"'",
            "Events":["s3:ObjectCreated:*"]
    }]
}'

# Now we will create a SNS topic and save the topic arn to a variable.
topic_arn=$(aws sns create-topic --name s3-lambda-sns --output json | jq -r '.TopicArn')

# Here we are printing the topic ARN.
echo "The Topic ARN is: $topic_arn"

# Now we will subscribe the email to the SNS topic that we have created.
aws sns subscribe \
    --topic-arn "$topic_arn" \
    --protocol email \
    --notification-endpoint "$email_address"

# Publish SNs message to the topic.
aws sns publish \
    --topic-arn "$topic_arn" \
    --subject "A New S3 Bucket has been created for S3 triggering" \
    --message "The S3 Bucket $s3_bucket_name has been created and the lambda function $lambda_function_name has been invoked."
```

### I have created a file to be uploaded to the s3 bucket.

- Use touch to create a file to be uploaded in S3 Bucket.

```bash
touch buxar.txt

#Buxar is famous since the epic period for being the seats of eminent saints, battlefield of Gods and Demons as per Puranas and a combat zone between foreign invasion and countrymen in modern history.
```

### In part-4 of the code, I have created the lambda function which will be invoked when the file is uploaded to the s3 bucket.

```python
import boto3
import json

def lambda_handler(event, context):
    #extracting the bucket name and key from the event object.
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']

    # Now we will print the operation that is being performed on the object.
    print(f"File '{object_key}' was uploaded to bucket '{bucket_name}'.")

    # Sending the notification to the SNS topic.
    sns_client = boto3.client('sns')
    topic_arn = "arn:aws:sns:ap-south-1:024977362083:s3-lambda-sns"
    sns_client.publish(
        TopicArn=topic_arn,
        Subject="S3 Object Created",
        Message=f"File '{object_key}' was uploaded to bucket '{bucket_name}'."
    )

    return{
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully.')
    }
```

- This handler function is invoked when the file is uploaded to the s3 bucket.

---

### Before running the script, we will check the S3 bucket, Lambda function, and SNS topic.

## Lambda Function:

![Screenshot from 2024-03-18 19-30-18](https://github.com/rohit-rajput1/GitDemo/assets/76991475/c5ad0638-c000-476d-b4a2-cb8f932118ac)

## IAM Role:

![Screenshot from 2024-03-18 19-30-39](https://github.com/rohit-rajput1/GitDemo/assets/76991475/bb8fe159-283f-45d3-a7aa-37ed8d199055)

## S3 Bucket:

![Screenshot from 2024-03-18 19-33-27](https://github.com/rohit-rajput1/GitDemo/assets/76991475/bf43e304-6d2e-4c25-a0dc-f7573bfa2d29)

---

- **Step-7:** Now we will make that script executable, so that we can run the script.

```bash 
chmod 777 s3-trigger.sh
```

![Screenshot from 2024-03-18 19-30-05](https://github.com/rohit-rajput1/GitDemo/assets/76991475/a1b3eb07-2c80-44e5-92c9-669806819c92)

- **Step-8:** Now we will run the script.

```bash
./s3-trigger.sh
```

![Screenshot from 2024-03-18 20-19-34](https://github.com/rohit-rajput1/GitDemo/assets/76991475/ba0c1f6c-529c-4ab1-8659-f26a9dcdf709)

![Screenshot from 2024-03-18 20-19-47](https://github.com/rohit-rajput1/GitDemo/assets/76991475/1d933af3-8582-468b-b0c9-1cdb5f6fb8e0)

## Now when we check the Lambda function, role, and S3, we can see that the script has done what we wanted in AWS.

## IAM Role:

![imageedit_5_3828245679](https://github.com/rohit-rajput1/GitDemo/assets/76991475/d922ced5-8084-4ca3-9b78-5066626a752c)


## S3 Bucket:

![imageedit_3_6797566686](https://github.com/rohit-rajput1/GitDemo/assets/76991475/a5cc6924-e81f-43ce-be54-7b33452581cc)

## Lambda Function:

![Screenshot from 2024-03-18 20-20-34](https://github.com/rohit-rajput1/GitDemo/assets/76991475/bccf549c-c2bf-47e5-95a3-f0b7e6e7509e)

![Screenshot from 2024-03-18 20-22-09](https://github.com/rohit-rajput1/GitDemo/assets/76991475/f46e7a54-fa18-4a9b-9852-101b9c30489e)

### Since the Lambda Function is triggered we notified by an email using SNS Topic.

![Screenshot from 2024-03-18 20-23-07](https://github.com/rohit-rajput1/GitDemo/assets/76991475/33dd14e2-e620-4550-b3b5-f0c8cb78cc6f)

## Thus we have successfully triggered Lamdba function using Shell Scripting.

---
# Thankyou ;)