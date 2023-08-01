# Day-48 - ECS( Elastic Container Service)

## What is ECS ?

- **ECS (Elastic Container Service)** is a fully-managed `container orchestration service` provided by `Amazon Web Services (AWS)`. It allows you to `run` and `manage Docker containers` on a `cluster` of `virtual machines (EC2 instances)` without having to manage the `underlying infrastructure.`
- With ECS, you can easily `deploy`, `manage`, and `scale` your containerized applications using the AWS Management Console, the `AWS CLI`, or the `API`. ECS supports both `"Fargate"` and `"EC2 launch types"`, which means you can run your containers on `AWS-managed infrastructure` or your own EC2 instances.
- ECS also integrates with other `AWS services`, such as `Elastic Load Balancing`, `Auto Scaling`, and `Amazon VPC`, allowing you to build scalable and highly available applications. Additionally, ECS has support for `Docker Compose` and `Kubernetes`, making it easy to adopt existing container workflows.
- Overall, ECS is a `powerful` and `flexible` container orchestration service that can help simplify the deployment and management of containerized applications in AWS.

![Product-Page-Diagram_Amazon-Elastic-Container-Service march 2023 6ee17a3146661f893bf1ee674aceb65efdf864bd](https://github.com/Rohit312001/GitDemo/assets/76991475/a405db8d-f0c1-400e-98f8-9524400821aa)

## Difference between EKS and ECS ?

- `EKS (Elastic Kubernetes Service)` and `ECS (Elastic Container Service)` are both container orchestration platforms provided by Amazon Web Services (AWS). While both platforms allow you to run containerized applications in the `AWS cloud`, there are some differences between the two.
- **Architecture**: ECS is based on a `centralized architecture`, where there is a control plane that manages the scheduling of containers on `EC2 instances`. On the other hand, `EKS` is based on a distributed architecture, where the Kubernetes control plane is distributed across multiple EC2 instances.
- **Kubernetes Support**: EKS is a fully managed Kubernetes service, meaning that it supports Kubernetes natively and allows you to run your Kubernetes workloads on AWS without having to manage the Kubernetes control plane. ECS, on the other hand, has its own orchestration engine and does not support Kubernetes natively.
- **Scaling**: EKS is designed to automatically scale your Kubernetes cluster based on demand, whereas ECS requires you to configure scaling policies for your tasks and services.
- **Flexibility**: EKS provides more flexibility than ECS in terms of container orchestration, as it allows you to customize and configure Kubernetes to meet your specific requirements. ECS is more restrictive in terms of the options available for container orchestration.
- **Community**: Kubernetes has a large and active open-source community, which means that EKS benefits from a wide range of community-driven development and support. ECS, on the other hand, has a smaller community and is largely driven by AWS itself.

In summary,`EKS` is a good choice if you want to use Kubernetes to manage your containerized `workloads on AWS`, while ECS is a good choice if you want a simpler, more managed platform for running your containerized applications.

# Task :

**Set up ECS (Elastic Container Service) by setting up Nginx on ECS.**

- **Step 1**: Go to the `AWS Management Console` and `select ECS from the list of services`.

![Screenshot from 2023-08-01 19-09-11](https://github.com/Rohit312001/GitDemo/assets/76991475/f0734081-d09a-4756-8c59-71a89e1a2f8a)

- **Step 2**: Click on `Get Started` to create a new cluster.

![Screenshot from 2023-08-01 19-10-34](https://github.com/Rohit312001/GitDemo/assets/76991475/83ff4ed6-867f-419f-9358-3c9c8cd0c1a8)

- **Step 3**: Create `Cluster Name` and let the Networking be default and click on `Create`.

![Screenshot from 2023-08-01 19-11-48](https://github.com/Rohit312001/GitDemo/assets/76991475/edbbea0c-1f29-470d-8de7-99e3dde8b6ea)

- **Step 4**: Let the infrastructure be `default` with `AWS Fargate` and click on `Next`.

![Screenshot from 2023-08-01 19-12-40](https://github.com/Rohit312001/GitDemo/assets/76991475/b0e7dd5c-81eb-4878-8736-86a9e51a4222)

- Thus we have created a cluster.

![Screenshot from 2023-08-01 19-15-44](https://github.com/Rohit312001/GitDemo/assets/76991475/9736372f-074d-499f-a175-e0e33fb7b61f)

- **Step 5**: Now we will create a `Task Definition` for our cluster.

![Screenshot from 2023-08-01 19-16-06](https://github.com/Rohit312001/GitDemo/assets/76991475/6fd9dc21-48eb-4e1d-bb1e-de40e7f3220c)

- **Step 6**: Click on `Create new Task Definition` and naming it as `nginx-task-definition` and selecting `Fargate` as `Launch type compatibility` and click on `Next`.

![Screenshot from 2023-08-01 19-23-42](https://github.com/Rohit312001/GitDemo/assets/76991475/cbb5d814-a097-4267-b775-b2f2e255f3f8)

- **Step 7**: Now we will select the `container-1` for the `nginx deployment`.

![Screenshot from 2023-08-01 19-24-00](https://github.com/Rohit312001/GitDemo/assets/76991475/c2611a15-4fc9-4c14-801e-5211c02c40d6)

- For this nginx deployment we will use the `ECR image from gallery` and click on `Add`.

link: https://gallery.ecr.aws (for any images)

![Screenshot from 2023-08-01 19-19-00](https://github.com/Rohit312001/GitDemo/assets/76991475/9e11aec2-9690-496a-96f1-b7a9bcc8287a)

link: https://gallery.ecr.aws/nginx/nginx

![Screenshot from 2023-08-01 19-19-10](https://github.com/Rohit312001/GitDemo/assets/76991475/c6a9162e-3dcb-4a72-87f3-6da807715cfe)

- Thus we have created a `Task Definition`.

![Screenshot from 2023-08-01 23-55-11](https://github.com/Rohit312001/GitDemo/assets/76991475/194d6084-90b9-42ae-aa3c-575e3f0776e2)

- **Step 8**: Now we will create a `Service` for our `Task Definition` and let the environment be `default`.

![Screenshot from 2023-08-01 19-32-43](https://github.com/Rohit312001/GitDemo/assets/76991475/eda76a29-070e-4581-a278-5be60d311fee)

- **Step 9**: Now we will select the `Launch type` as `Fargate` and `Cluster` as `default` and `Service name` as `nginx-service` and `Number of tasks` as `1` and click on `Next`.

![Screenshot from 2023-08-01 19-34-14](https://github.com/Rohit312001/GitDemo/assets/76991475/58a7a9f7-f060-4d87-a786-285a6a76ba30)

- **Step 10**: Now we will select the `Network` as `default` and but creating new `Security Group` with the inbound rule as `HTTP` and click on `Next`.

![Screenshot from 2023-08-01 19-36-27](https://github.com/Rohit312001/GitDemo/assets/76991475/ce78457e-c602-4e39-8fa9-3c1ef3076e60)

- Thus we have created the `Service`.

- After the `Service` is created we will get the `Public IP` of the `nginx` deployment and we can check it in the `Task` section.

---
