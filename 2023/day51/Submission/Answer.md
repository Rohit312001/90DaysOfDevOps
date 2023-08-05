# Day 51: Your CI/CD pipeline on AWS - Part 2 🚀

In the Upcoming next 4 days, I will be making a `CI/CD pipeline` on **AWS** with these tools.

- _CodeCommit_
- _CodeBuild_
- _CodeDeploy_
- _CodePipeline_
- _S3 Bucket_

## What is CodeBuild ?

- **AWS CodeBuild** is a `fully managed build service in the cloud`. CodeBuild compiles your **source code**, runs **unit tests**, and produces **artifacts** that are ready to deploy. CodeBuild eliminates the need to `provision`,` manage`, and scale your own **build servers**. It provides prepackaged build environments for popular programming languages and build tools such as **Apache Maven**, **Gradle**, and more. You can also customize build environments in CodeBuild to use your own build tools. CodeBuild scales automatically to meet peak build requests.

- **CodeBuild provides these benefits:**

1. **`Fully managed`** – CodeBuild eliminates the need to `set up`, `patch`, `update`, and manage your own `build servers`.

2. **`On demand`** – CodeBuild scales on demand to meet your `build needs`. You **pay** only for the `number of build minutes you consume`.

3. **`Out of the box`** – CodeBuild provides `preconfigured build environments` for the most popular `programming languages`. All you need to do is point to your build script to start your first build.

## Why we use AWS CodeBuild:

- _Automated build process_
- _Scalable for any workload size_
- _Cost-effective pay-as-you-go pricing_
- _Seamless integration with AWS services and third-party tools_
- _Customizable build environments_
- _Secure build and testing environment_
- _Supports multiple programming languages and platforms_
- _Detailed logs and monitoring capabilities_

### Today I am sharing a Blog on **AWS CodeCommit** &**AWS CodeBuild**. I hope you will like it.

- _First we will make AWS Commit and then move to AWS CodeBuild but if have already watched my previous blog then you can skip this part._

# AWS CodeCommit

### Lets setup an IAM User for AWS CodeCommit.

- **`Step-01:`** Go to **IAM** service in `AWS Console` and click on **Users** and then click on **Add User**.

![Screenshot from 2023-08-05 10-01-56](https://github.com/Rohit312001/GitDemo/assets/76991475/2db8882e-164a-44ad-8bda-da20e53c678e)

- **`Step-02:`** Click on **`Next:Permissions`** and then click on **`Attach existing policies directly`** and then select **`AWSCodeCommitFullAccess`** then click on **`Next:Tags`**.

![Screenshot from 2023-08-05 10-03-43](https://github.com/Rohit312001/GitDemo/assets/76991475/5d0b0767-40a8-4380-b4fc-34184b2ee58a)

- **`Step-03:`** Click on **`Next:Review`** and then click on **`Create User`** and thus we have created an **IAM User** for `AWS CodeCommit`.

![Screenshot from 2023-08-05 10-04-24](https://github.com/Rohit312001/GitDemo/assets/76991475/cf2cc8f8-85cd-4e4e-9d84-836f4f1950e5)

---

### Now we will see how to add HTTP GitCredentials in your AWS IAM.

- **`Step-01:`** Go to **IAM** > **Users** > **Security Credentials** .

![Screenshot from 2023-08-05 11-32-30](https://github.com/Rohit312001/GitDemo/assets/76991475/0620021b-bda7-4837-bd93-ddff91fbba52)

- **`Step-02:`** Scroll down to **`HTTPS Git credentials for AWS CodeCommit`** and then click on **`Generate credentials`**

- **HTTPS Git credentials for AWS CodeCommit** > **Generate** > **Download Credentials**.

![Screenshot from 2023-08-05 11-32-50](https://github.com/Rohit312001/GitDemo/assets/76991475/6d5301a0-7220-430b-a136-b492a5711775)

- Thus we have `Generated Credentials` for our `IAM User` saved it in a safe place it will be used in future.

![Screenshot from 2023-08-02 23-29-40](https://github.com/Rohit312001/GitDemo/assets/76991475/57b09c8b-b5e1-4751-903c-ec39ee9a5ba6)

---

### Now we will see how to create a repository in AWS CodeCommit.

- **`Step-01:`** Go to **CodeCommit** service in `AWS Console` and click on **Create repository**.

![Screenshot from 2023-08-05 11-34-53](https://github.com/Rohit312001/GitDemo/assets/76991475/9dfe1e8c-a9c5-4c6e-9af4-2ca346fc062b)

- **`Step-02:`** Enter the **`Repository name`** and then click on **`Create repository`**.

![Screenshot from 2023-08-05 11-35-57](https://github.com/Rohit312001/GitDemo/assets/76991475/807b6337-6c24-418a-8484-5bab881f9646)

- Thus we have created a **Repository** in **AWS CodeCommit**.

![Screenshot from 2023-08-05 11-36-25](https://github.com/Rohit312001/GitDemo/assets/76991475/e5027f51-475c-45a8-a21e-23315f34fa06)

---

### Let's create an EC2 Instance where will clone our CodeCommit Repository.

- **`Step-01:`** Go to **EC2** service in `AWS Console` and click on **Launch Instance** and then select **Ubuntu Server 22.04** and then click on **Select**.

![Screenshot from 2023-08-05 11-38-36](https://github.com/Rohit312001/GitDemo/assets/76991475/66539063-b249-49fc-902d-c4ab9ebdf77b)

- **`Step-02:`** Select **t2.micro** and then use existing `key-pair` or create new `key-pair`.

![Screenshot from 2023-08-05 11-38-54](https://github.com/Rohit312001/GitDemo/assets/76991475/60d62cfe-7dac-4cb3-8805-ca6355f30757)

- **`Step-03:`** Click on **`Network Settings`**.

![Screenshot from 2023-08-05 11-39-10](https://github.com/Rohit312001/GitDemo/assets/76991475/e16854f4-4c05-4328-812f-9269a5d41429)

- **Now Login the EC2 instance via SSH and open Terminal.**

![Screenshot from 2023-08-05 11-41-31](https://github.com/Rohit312001/GitDemo/assets/76991475/ecc05ba5-78a6-427c-9f6d-eaaea50c6c82)

---

### Now Before moving forward Go to CodeCommit and click on **Clone URL** and copy the **HTTPS URL**.

![imageedit_3_7964211194](https://github.com/Rohit312001/GitDemo/assets/76991475/d4091919-7ff6-4258-b3a2-2e3bf6d6bdce)

---

- **`Step-01:`**Now we will `clone the CodeCommit Repository` in our `EC2 Instance.`

```
git clone <HTTPS URL>
# The URL which is copied from CodeCommit
# Enter the UserName and Password which we downloaded for HTTP and git credentials.
```

![Screenshot from 2023-08-05 11-51-10](https://github.com/Rohit312001/GitDemo/assets/76991475/22c55bbd-7bb5-4375-97ad-2886fa2b1796)

- After this we can see that the `repository` is `cloned` in our `local machine`.

```
ls
cd <repository which we have cloned>
```

![Screenshot from 2023-08-05 11-52-21](https://github.com/Rohit312001/GitDemo/assets/76991475/845a326e-7cc7-4ef7-b93c-0d748f6cd60a)

- Let's create a file in out repository and then push it to CodeCommit.

```
vim index.html
```

![Screenshot from 2023-08-05 12-04-47](https://github.com/Rohit312001/GitDemo/assets/76991475/801319e3-1bab-4780-a1f7-c9d929a2558f)

- Thus we have created an `index.html` file in our repository or you can use your own.

![Screenshot from 2023-08-05 12-05-40](https://github.com/Rohit312001/GitDemo/assets/76991475/d806a39f-a72a-49ef-aceb-97328ebf49ba)

- Now we will push our code to `AWS CodeCommit.`

```
git add .
git commit -m "Added index.html file"
```

![Screenshot from 2023-08-05 12-08-05](https://github.com/Rohit312001/GitDemo/assets/76991475/55de26ce-66c2-4584-9fe8-f1b465048db9)

```
git push origin master
```

![Screenshot from 2023-08-05 12-09-44](https://github.com/Rohit312001/GitDemo/assets/76991475/1636ec75-cd2b-4d1c-84da-ed365b5038c4)

- Thus we have pushed our code to `AWS CodeCommit`.

![Screenshot from 2023-08-05 12-10-55](https://github.com/Rohit312001/GitDemo/assets/76991475/b0273251-df83-48fe-b6b0-b020152bc3d5)

---

- **(_So this is what we have learn in Day50 of #90DaysofDevOps.Now we will see how to use AWS CodeBuild._)**

---

# Task-01 :

### Read about Buildspec file for Codebuild it can be written YAML or JSON.

- **version:** `Specifies the version` of the `BuildSpec file`. The **current version** is **0.2**.
- **phases:** This section defines the `different phases` of the **`build process`**, such as `install`, `pre_build`, `build`, `post_build`, and `finalize`. Each phase can have a `series of commands` that will be `executed in order`.
- **artifacts:** In this section, you **`specify the files`** and **`directories`** that should be `packaged` and made available as `build artifacts` after the `build process is complete`. These artifacts `can be used in the subsequent deployment stages.`
- **cache:** If you want to `speed up` the` build process` by caching certain dependencies or build artifacts, you can `specify caching settings` in this section.
- **environment:** Here, you can `define environment variables` that will be available `during the build process`. You can set variables specific to `each build phase` or `shared across all phases`.
- **source:** Defines the `source code` location for the `build`. You specify the repository type (e.g., `GitHub, Bitbucket`), the `source code location`, and any `authentication credentials` if needed.
- **logs:** Specifies the configuration for s`toring build logs`, such as the `AWS S3 bucket `and optional `encryption settings.`

# Task-02 :

### Let's create a `buildspec.yml` file in our repository for our index.html file.

```
version: 0.2

phases:
  install:
    commands:
      - echo Installing NGINX
      - sudo apt-get update
      - sudo apt-get install nginx -y
  build:
    commands:
      - echo Build started on 'date'
      - cp index.html /var/www/html/
  post_build:
    commands:
      - echo Configuring NGINX

artifacts:
  files:
    - /var/www/html/index.html
```

- Create `vim buildspec.yml` file in your repository.

![Screenshot from 2023-08-05 13-55-17](https://github.com/Rohit312001/GitDemo/assets/76991475/5650f4b8-c0c9-4824-b4cd-5f246b483124)

- Now we will push this file to our repository.

```
git add .
git commit -m "Added buildspec.yml file"
```

![Screenshot from 2023-08-05 13-56-29](https://github.com/Rohit312001/GitDemo/assets/76991475/8e54cd27-40eb-48c9-9698-4bc0f920e794)

```
git push origin master
```

![Screenshot from 2023-08-05 13-59-35](https://github.com/Rohit312001/GitDemo/assets/76991475/8ee59884-de30-422c-bd12-dcd49d01e6cb)

---

- Now let's create a `CodeBuild` project in `AWS Console`.

![Screenshot from 2023-08-05 14-00-40](https://github.com/Rohit312001/GitDemo/assets/76991475/3255c3a1-8863-43bf-9f46-1e7cf481d637)

- **Step-01:** `Create a CodeBuild Project`.

![Screenshot from 2023-08-05 14-01-58](https://github.com/Rohit312001/GitDemo/assets/76991475/afd8d297-ae10-43eb-8a48-c950845f6be4)

- **Step-02:** `Give a name` to your `CodeBuild Project`.

![Screenshot from 2023-08-05 14-04-36](https://github.com/Rohit312001/GitDemo/assets/76991475/f12b3532-e0ee-4eef-a25f-e6b71be86e96)

- **Step-03:** `Select your source provider` and `repository`.

![Screenshot from 2023-08-05 14-04-59](https://github.com/Rohit312001/GitDemo/assets/76991475/dc57256c-046a-4d72-9481-b955bb64b626)

- **Step-04:** `Select your environment` and `operating system`.

![Screenshot from 2023-08-05 14-07-28](https://github.com/Rohit312001/GitDemo/assets/76991475/2b75bd14-c25c-44bc-82aa-e79f849a337e)

- Thus we have created our `CodeBuild Project`.

- Now we will `start the build` so click on `Start Build`.

![Screenshot from 2023-08-05 14-08-28](https://github.com/Rohit312001/GitDemo/assets/76991475/ffa47661-36b3-407b-a386-c5490fba77aa)

- Wait Untill the `Build is finished`.

![Screenshot from 2023-08-05 14-27-27](https://github.com/Rohit312001/GitDemo/assets/76991475/068272c3-10aa-4a09-ab7d-fba652e4f065)

---

### Now we will create a AWS S3 bucket to add our build artifacts.

- **Step-01:** Go to `AWS S3` and `create a bucket`.

![Screenshot from 2023-08-05 14-45-08](https://github.com/Rohit312001/GitDemo/assets/76991475/938a01fa-d0a1-4363-85fa-a1f91d9ec901)

- **Step-02:** `Give a name` to your `bucket` and `create it`.

![Screenshot from 2023-08-05 14-45-51](https://github.com/Rohit312001/GitDemo/assets/76991475/27da9e4c-d3e9-4d88-8c0c-23612738f0c7)

- Thus we have created our `S3 bucket`.

![Screenshot from 2023-08-05 14-46-36](https://github.com/Rohit312001/GitDemo/assets/76991475/00e022e2-0256-4e74-9810-c7e35c6fde07)

---

### Now go to `CodeBuild` and `edit` your `CodeBuild Project` and `edit artifacts`.

- **Step-01:** Go to `CodeBuild` and `edit` your `CodeBuild Project` and `edit artifacts`.

![Screenshot from 2023-08-05 14-49-00](https://github.com/Rohit312001/GitDemo/assets/76991475/0fc0722f-0d06-48cf-b3dc-e165d166dc08)

- **Step-02:** `Select` your `S3 bucket` and `give a name` to your `build artifacts`.

![Screenshot from 2023-08-05 14-51-47](https://github.com/Rohit312001/GitDemo/assets/76991475/4c25f592-1f26-4be8-8f5a-2733944693d1)

- **Step-03:** `Save` your `changes` and `start the build` again so that the `artifacts` are `uploaded` to your `S3 bucket`.

![Screenshot from 2023-08-05 14-58-36](https://github.com/Rohit312001/GitDemo/assets/76991475/69ea6f69-ed8f-42a8-9cd8-096c6d09ec08)

- **Step-04:** `Wait` untill the `build is finished` and after this check `build is finished` go to your `S3 bucket` and `check` if the `artifacts` are `uploaded` or not.

![Screenshot from 2023-08-05 14-59-09](https://github.com/Rohit312001/GitDemo/assets/76991475/bb0ba644-c98a-4312-8bab-88284e18cae3)

- **Step-05:** Now go to inside your `artifacts` and then /var/www/html/ and check if the `index.html` file is present or not.

![imageedit_6_9485105158](https://github.com/Rohit312001/GitDemo/assets/76991475/4b9441c0-bb09-493c-a16b-bad7be52c7b0)

- **Step-06:** Click on the open button and check if the `index.html` file is present or not.

![imageedit_8_5023200972](https://github.com/Rohit312001/GitDemo/assets/76991475/8dd252cf-46b6-4f28-8a1a-668e55a413a3)

---
