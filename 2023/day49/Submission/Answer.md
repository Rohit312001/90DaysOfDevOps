# Day 49: Theory Question on AWS

## Questions:

### **Name 5 aws services you have used and what's the use cases?**

- **EC2** - **`Elastic Compute Cloud`** - It is a `web service` that provides `secure`, `resizable compute` capacity in the cloud. It is designed to make `web-scale cloud computing` easier for developers. It provides you with complete control of your computing resources and lets you run on Amazon’s proven computing environment.
- **S3** - **`Simple Storage Service`** - It is a web service offered by Amazon Web Services that `provides object storage` through a web service interface. Amazon S3 uses the same `scalable storage infrastructure` that Amazon.com uses to run its global `e-commerce network`.
- **RDS** - **`Relational Database Service`** - It is a web service that makes it easier to `set up`, `operate`, and `scale` a `relational database in the cloud`. It provides `cost-efficient`, `resizable capacity` for an industry-standard relational database and manages common database administration tasks.
- **Lambda** - It is a `serverless computing service` provided by AWS. It is a `compute service` that lets you `run code` without `provisioning` or `managing servers`. Lambda runs your code `only when needed and scales automatically`, from a `few requests per day` to `thousands per second`.
- **CloudFront** - It is a content `delivery network` offered by AWS. It is a global content delivery network service that securely `delivers data`, `videos`, `applications`, and `APIs` to your viewers with `low latency` and `high transfer speeds`.

### What are the tools used to send logs to the cloud environment?

- **CloudWatch** - It is a `monitoring` and `observability service` built for **DevOps engineers**, **developers**, **site reliability engineers (SREs)**, and **IT managers**.
- CloudWatch provides you with `data` and `actionable insights to monitor your applications`, respond to system-wide `performance changes`, o`ptimize resource utilization`, and get a unified view of `operational health`.
- CloudWatch collects `monitoring` and `operational data` in the form of `logs`, `metrics`, and `events`, providing you with a unified view of AWS resources, applications, and services that run on AWS and on-premises servers.

### What are IAM Roles? How do you create /manage them?

- **IAM** - **`Identity and Access Management`** - It is a web service that helps you `securely control access` to AWS resources for your users. You use IAM to `control who can use your AWS resources (authentication)` and `how they can use resources (authorization)`.
- **IAM Roles** - It is an `IAM identity` that you can create in your account that has `specific permissions`. It is `not associated` with a `specific user` or `group`, and it is `not permanent`. It is a `temporary identity` that can be used by `applications`, `services`, or `users` assuming a `role to perform` an `operation`.
- **How to create IAM Roles?**
- **Step 1**: - Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.
- **Step 2**: - In the navigation pane, choose Roles, and then choose Create role.
- **Step 3**: - Choose the service that will use this role. In this case, choose EC2, and then choose Next: Permissions.
- **Step 4**: - On the Attach permissions policies page, choose the permissions to attach to the role. In this case, choose AmazonS3FullAccess, and then choose Next: Tags.
- **Step 5**: - On the Add tags page, add any tags that you want to use to identify this role, and then choose Next: Review.
- **Step 6**: - On the Review page, type a name for the role, and then choose Create role.

**`Link For Learning More About IAM Roles:`** https://devops-rohit.hashnode.dev/day-38-cloud-security-aws-iam

### How to upgrade or downgrade a system with zero downtime?

- `Upgrading` or `downgrading` a system with `zero downtime` in AWS can be achieved using various strategies and services provided by AWS. The process involves `carefully planning` and `implementing the changes` to minimize any impact on the system availability. Here are some steps and techniques you can use to achieve zero-downtime upgrades or downgrades:
- **Elastic Load Balancers (ELB):** Deploy your system behind an Elastic Load Balancer (ELB) to distribute incoming traffic across multiple instances. During the upgrade or downgrade, you can take instances out of service one at a time, update them, and then add them back to the ELB.
- **Auto Scaling Groups:** Deploy your instances within an Auto Scaling Group (ASG) so that it automatically replaces instances with the new version while maintaining the desired capacity. This way, you can perform rolling updates with zero downtime.
- **Blue/Green Deployment:** Create a new environment ("Blue") with the updated version of your system alongside the existing environment ("Green"). Use Route 53 or an ELB to switch traffic gradually from the old environment to the new one.
- **AWS CodeDeploy:** Utilize AWS CodeDeploy, which allows you to automate application deployments to EC2 instances or on-premises instances. CodeDeploy supports both rolling updates and blue/green deployments.
- **Amazon Elastic Beanstalk:** If your system is built on AWS Elastic Beanstalk, it provides seamless updates to the underlying instances while maintaining the application's availability.
- **Database Replication:** If the upgrade or downgrade involves changes to the database, consider using database replication (e.g., Amazon RDS Multi-AZ or read replicas) to maintain a redundant copy of the database during the update process.

### What is infrastructure as code and how do you use it?

- `Infrastructure as Code (IaC)` means using `code to define` and `manage your IT infrastructure `instead of manually setting it up. This code describes what resources you need `(like servers, networks, and databases)` and how they should be configured. By doing this, you can automate the process of `creating` and `updating` your infrastructure, making it `faster`,` more consistent`, and `easier to manage`. It also allows you to version control your `infrastructure`, `collaborate with others`, and ensure that everyone is working with the `same setup`. Overall, Infrastructure as Code brings **efficiency** and **reliability** to infrastructure management.

### What is a load balancer? Give scenarios of each kind of balancer based on your experience.

- **Load Balancer** - It is a `device` that acts as a `reverse proxy` and `distributes network or application traffic` across a number of servers. `Load balancers` are used to `increase capacity` (concurrent users) and `reliability` of applications.
- They `improve the overall performance of applications` by `decreasing` the burden on servers associated with `managing` and `maintaining` application and `network sessions`, as well as by performing `application-specific tasks`.

- **Types of Load Balancers:**
- **Application Load Balancer (ALB)** - It is a `layer 7 load balancer` that routes `traffic` based on `advanced application-level` information, such as the `content of the request`. It is `best suited` for `load balancing` of `HTTP` and `HTTPS` traffic and provides `advanced request routing` targeted at the `delivery of modern application architectures`, including `microservices` and `containers`.
- **Network Load Balancer (NLB)** - It is a `layer 4 load balancer` that routes `traffic` based on `network-level` information, such as `IP addresses` and `ports`. It is `best suited` for `load balancing` of `TCP`, `UDP`, and `TLS` traffic where `extreme performance` is required.
- **Classic Load Balancer (CLB)** - It is a `legacy load balancer` that routes `traffic` based on `layer 4` information, such as `IP addresses` and `ports`, and `layer 7` information, such as `HTTP headers`, `cookies`, and `query strings`. It is `best suited` for `simple load balancing` of `HTTP` and `HTTPS` traffic.

### What is CloudFormation and why is it used for?

- `AWS CloudFormation` is a service that lets you `define` your AWS infrastructure as `code using templates`. With `CloudFormation`, you can `automate the creation`, `updating`, and `deletion of AWS resources`. It helps `maintain consistent` and `repeatable infrastructure` configurations across different environments and simplifies the management of complex architectures. CloudFormation is useful for automating resource provisioning and ensuring that your infrastructure follows best practices and is easy to scale.

### Difference between AWS CloudFormation and AWS Elastic Beanstalk?

- **AWS CloudFormation** is an `Infrastructure as Code` service that allows you to `provision` and `manage AWS resources using templates`, giving you full control over `infrastructure management`.
- **AWS Elastic Beanstalk** is a Platform as a Service offering focused on simplifying the `deployment` and `management of applications`, abstracting away much of the `infrastructure complexity` for `developers`.
- Choosing between **`CloudFormation`** and **`Elastic Beanstalk`** depends on `your specific use case`. If you need fine-grained control over your `infrastructure` and want to `manage the entire stack`, CloudFormation is a better fit. On the other hand, if you want a managed platform for deploying applications without worrying about `infrastructure details`,` Elastic Beanstalk` is a more suitable choice.

### What are the kinds of security attacks that can occur on the cloud? And how can we minimize them?

- Common types of security attacks on the cloud include **data breaches**, **DoS/DDoS attacks**, **MitM attacks**, **insider threats**, **data loss**, **account hijacking**, **injection attacks**, **XSS**, **CSRF**, and **SSRF**.
- **To minimize these attacks:**
- Implement `strong access controls` and `encryption`.
- `Monitor` and `audit cloud activities` regularly.
- Keep software up to date with `security patches`.
- Use `firewalls` and `security groups` to `control traffic`.
- Deploy `intrusion detection/prevention` systems.
- Conduct `security testing` and `training for employees`.
- `Backup critical data` and have a `disaster recovery plan`.
- Leverage `cloud provider security services`.

### Can we recover the EC2 instance when we have lost the key?

- Yes, we can recover the **EC2 instance** when we have lost the key. We can do this by creating a `new key pair` and `attaching it to the instance`. We can also `create an AMI of the instance` and launch a new instance from the AMI with a `new key pair`.

### What is a gateway?

- A `gateway` is a `network node` that `connects two networks` using different protocols together. It is a `device` that `translates` the `protocols` used by `two different networks` that are `not directly connected`. It is also known as a `protocol converter`.

### What is the difference between the Amazon Rds, Dynamodb, and Redshift?

- **Amazon RDS:** Managed relational database service for traditional databases like MySQL, PostgreSQL, etc. Suitable for applications with structured data and SQL queries.

- **DynamoDB:** Fully managed NoSQL database for high-performance, low-latency, and scalable applications, ideal for real-time and IoT use cases.

- **Redshift:** Managed data warehousing service optimized for running complex analytical queries on large datasets, best suited for data warehousing and business intelligence.

### Do you prefer to host a website on S3? What's the reason if your answer is either yes or no?

- Yes, I would prefer to host a website on S3. It is a `cost-effective` and `scalable` solution for `static websites`. It also provides `high availability` and `reliability` with `99.99% uptime`. S3 also supports `custom domain names` and `SSL/TLS` certificates, which are essential for `hosting websites`.

---
