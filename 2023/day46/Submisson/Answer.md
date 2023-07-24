# Day-46: Set up CloudWatch alarms and SNS in AWS

Hey learners, you have been using aws services atleast for last 45 days. Have you ever wondered what happen if for any service is charging you bill continously and you don't know till you loose all your pocket money ?

Hahahaha😁, Well! we, as a responsible community ,always try to make it under free tier , but it's good to know and setup something , which will inform you whenever bill touches a Threshold.

## What is Amazon CloudWatch?

- **Amazon CloudWatch** is a `monitoring` and `management service` that provides **data** and **actionable insights for AWS**, **on-premises, hybrid**, and other **cloud applications** and **infrastructure resources**. You can `collect` and `access` all your performance and operational data in the form of **`logs`** and **`metrics`** from a single platform rather than monitoring them in silos `(server, network, or database).` You can use **CloudWatch to set high resolution alarms**, visualize logs and metrics side by side, take automated actions, troubleshoot issues, and discover insights to optimize your applications, and ensure they are running smoothly.
- CloudWatch enables you to monitor your complete stack (applications, infrastructure, network, and services) and `use alarms`, `logs`, and `events data` to take `automated actions` and `reduce mean time` to `resolution (MTTR)`. This frees up important resources and allows you to focus on building applications and business value.

![Product-Page-Diagram_Amazon-CloudWatch 095eb618193be7422d2d34e3abd5fdf178b6c0e2](https://github.com/Rohit312001/GitDemo/assets/76991475/ee269c12-82b8-4cdb-bb3b-5c95230665f6)

## What is Amazon SNS?

- **Amazon Simple Notification Service (Amazon SNS)** is a managed service that provides `message delivery` from **publishers** to **subscribers** (also known as producers and consumers). `Publishers communicate asynchronously with subscribers` by sending messages to a topic, which is a logical access point and communication channel. Clients can subscribe to the SNS topic and receive published messages using a supported endpoint type, such as `Amazon Kinesis Data Firehose`, `Amazon SQS`, `AWS Lambda`, `HTTP`, `email`, `mobile push notifications`, and `mobile text messages (SMS)`.

**Some of the feature of AWS SNS are:**

- **Application-to-application messaging:** `Application-to-application` messaging supports subscribers such as `Amazon Kinesis Data Firehose` `delivery streams`, `Lambda functions`, `Amazon SQS queues`, `HTTP/S endpoints`, and `AWS Event Fork Pipelines`.

- **Application-to-person notifications:** `Application-to-person` notifications provide user notifications to subscribers such as `mobile applications`, `mobile phone numbers`, and `email addresses`.

- **Message durability:** `Published messages are stored across multiple`, geographically `separated servers` and `data centers`.If a subscribed endpoint isn't available, Amazon SNS runs a delivery retry policy.To preserve any messages that aren't delivered before the delivery retry policy ends, you can create a dead-letter queue.

![sns-delivery-protocols](https://github.com/Rohit312001/GitDemo/assets/76991475/a5c9d1de-f06b-496f-9370-e1c5f76e0421)

---

### Before creating a billing alarm, you need to enable billing alarm in your AWS account. To enable billing alarm, follow the steps given below:

- **Step-01:** Sign in to the AWS Management Console and open the Billing Dashboard at https://console.aws.amazon.com/billing/home#/.

![Screenshot from 2023-07-24 15-00-59](https://github.com/Rohit312001/GitDemo/assets/76991475/8dacebd0-1743-40ac-84bb-229b8ea7c8ca)

- **Step-02:** Now go to Preferences and open the `Billing preferences page.`

![Screenshot from 2023-07-24 15-01-28](https://github.com/Rohit312001/GitDemo/assets/76991475/7c5b7cf9-5ca7-46a0-92ad-1bb44d688636)

- **Step-03:** Now select the invoice section and click on the `Invoices delivery preferences` option so that it will give `PDF Invoices.`

![Screenshot from 2023-07-24 15-02-42](https://github.com/Rohit312001/GitDemo/assets/76991475/cb5d327a-91ea-458a-a26a-513cb317e6e6)

- **Step-04:** Now select the `Receive billing alerts` option and click on the `Save preferences` button.

![Screenshot from 2023-07-24 15-03-09](https://github.com/Rohit312001/GitDemo/assets/76991475/4370f588-7a1b-4cac-97be-643597a11e19)

- Thus we have enabled Billing Alert in our AWS account.

![Screenshot from 2023-07-24 15-03-29](https://github.com/Rohit312001/GitDemo/assets/76991475/915b7e88-5ca7-4d6e-8da0-513e47184abd)

### Task-01:

- **Create a CloudWatch alarm that monitors your billing and send an email to you when a it reaches $2.**

- **Step-01:** Go to the `AWS Management Console` and open the **CloudWatch console**.

![Screenshot from 2023-07-24 15-04-06](https://github.com/Rohit312001/GitDemo/assets/76991475/38228b4e-7bbf-4453-9f81-97488ce2ffe4)

- **Step-02:** Now click on the `Alarms` option and then click on the `All Alarm` and hit the `Create Alarm` button.

![Screenshot from 2023-07-24 22-33-07](https://github.com/Rohit312001/GitDemo/assets/76991475/bcfb867d-571e-419c-9cfd-7a0ab30944fc)

- **Step-03:** Now select the `metric` option and then click on the `Select Metric` button.

![imageedit_2_2080468908](https://github.com/Rohit312001/GitDemo/assets/76991475/a3e9e5b5-6515-49c5-910e-bf982f4d8fd2)

- And then select the `Billing` option.

![imageedit_6_2883134857](https://github.com/Rohit312001/GitDemo/assets/76991475/84650ddd-5cd5-4fb7-bf3e-271b022e0e3b)

- Then select the `Total Estimated Charge` option.

![imageedit_10_4538016264](https://github.com/Rohit312001/GitDemo/assets/76991475/805a093c-d1bd-4125-aebb-62a914d761d9)

- Now select the `USD` option and then click on the `Select Metric` button.

![imageedit_8_4947056057](https://github.com/Rohit312001/GitDemo/assets/76991475/b4c19565-35a9-4e99-b5f2-4bd74c9da4a7)

- **Step-04:** Now select the `Metric` option and choose the Period as `6 Hour` and then click on the `Next` button.

![Screenshot from 2023-07-24 22-35-50](https://github.com/Rohit312001/GitDemo/assets/76991475/ee0b8c59-c10d-4063-abae-3974b4315ae5)

- **Step-05:** Now select the `Static` option and then enter the `2` Dollar in the text box and then click on the `Next` button.

![Screenshot from 2023-07-24 22-36-05](https://github.com/Rohit312001/GitDemo/assets/76991475/bf9278eb-d6c3-4a18-b321-97bc88bc37c2)

- **Step-06:** Now create the `Notification` by `clicking on create new topic` and then enter the `Topic name` and then click on the `Create Topic` button.

![Screenshot from 2023-07-24 22-39-13](https://github.com/Rohit312001/GitDemo/assets/76991475/942f097d-1cb9-47ee-96d3-af969cdcc9b3)

- After this select this as `exixting SNS topic`.

![Screenshot from 2023-07-24 22-39-24](https://github.com/Rohit312001/GitDemo/assets/76991475/123ed452-b60e-4bcd-b4d1-aa668c394f2f)

- Keep the `Auto Scaling` and `EC2` option as it is and then click on the `Next` button.

![Screenshot from 2023-07-24 22-39-48](https://github.com/Rohit312001/GitDemo/assets/76991475/3b37852d-f63b-4df3-93ec-6b47f9a1d114)

- **Step-07:** Now enter the `Alarm name` and `Alarm description` and then click on the `Next` button.

![Screenshot from 2023-07-24 22-40-23](https://github.com/Rohit312001/GitDemo/assets/76991475/36f44cda-7d97-40f9-9c73-4aa35db41056)

- **Thus we have Created a CloudWatch alarm that monitors your billing and send an email to you when a it reaches $2.**

![Screenshot from 2023-07-24 22-41-54](https://github.com/Rohit312001/GitDemo/assets/76991475/d119d641-4b4d-4190-99f4-49c2591c972d)

---

### Delete your billing Alarm that you created now.

- **Step-0\*1:**

![Screenshot from 2023-07-24 22-42-17](https://github.com/Rohit312001/GitDemo/assets/76991475/9a329087-4f94-4128-a82e-5ee62689b302)

![Screenshot from 2023-07-24 22-42-36](https://github.com/Rohit312001/GitDemo/assets/76991475/874a18f9-25b5-4f48-a814-b713a6054bd8)

- Thus we succesfully `deleted` our `billing alarm.`

![Screenshot from 2023-07-24 23-47-27](https://github.com/Rohit312001/GitDemo/assets/76991475/ae5a71cb-c2aa-45d6-942e-0fac82167b26)

---
