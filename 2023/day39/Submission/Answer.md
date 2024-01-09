# Day 39 : AWS EC2 Automation and Jenkins

### Why AWS ?
- **`AWS`** is one of the `most popular Cloud Provider` that has `free tier too for students and Cloud enthutiasts` for their `Handson` while `learning` (Create your free account today to explore more on it).

### What is AWS ?
- **Amazon Web Services (AWS)** is a comprehensive and widely-used **cloud computing platform provided by Amazon**. It offers a vast array of cloud services and solutions designed to enable `businesses`, `organizations`, and `individuals to build` and `manage their applications` and `infrastructure in a scalable`, `secure`, and `cost-effective manner`.

### User Data in AWS:
- When you launch an instance in **Amazon EC2**, you have the option of passing user data to the instance that can be used to perform common automated configuration tasks and even run scripts after the instance starts. You can pass two types of user data to Amazon EC2: **shell scripts** and **cloud-init directives**.
- You can also `pass this data` into the launch instance wizard as plain text, as a file (this is useful for launching instances using the command line tools), or as **base64-encoded text** (for API calls).
- This will `save time` and `manual effort` everytime you launch an instance and want to install any application on it like **apache**, **Docker**, **Jenkins** etc

### What is IAM ?
- AWS **Identity and Access Management (IAM)** is a web service that helps you `securely control access to AWS resources`. With **`IAM`**, you can `centrally manage permissions` that control which `AWS resources users` can access. You use IAM to control who is `authenticated` (signed in) and `authorized` (has permissions) `to use resources`.

### Key Features of IAM :
- Shared access to your AWS account.
- Temporary access through IAM roles for time-limited permissions.
- Identity federation (including Active Directory, Facebook, LinkedIn, SAML, and OpenID Connect).
- Multifactor authentication (MFA) .
- Provide temporary access for users/devices and services where necessary.
- Password rotation policy.
- Integrates with many different AWS services.

---

## Task 1 : 

### Launch EC2 instance with already installed Jenkins on it. Once server shows up in console, hit the IP address in browser and you Jenkins page should be visible.

- **Step1:** Open the AWS account as the root user.

![Screenshot from 2023-06-20 20-13-22](https://github.com/Rohit312001/GitDemo/assets/76991475/e17b8f49-cc4d-44a1-875b-55ded7029144)

- **Step2:** Now we will the Console Home of AWS.

![Screenshot from 2023-06-20 20-13-42](https://github.com/Rohit312001/GitDemo/assets/76991475/40c9c3a9-6d90-4521-b345-4fffb7503bd1)

- **Step3:** Now we will go to the IAM service. So Search for IAM in the search bar and click on the IAM service.

![Screenshot from 2023-06-20 20-14-02](https://github.com/Rohit312001/GitDemo/assets/76991475/910faa9a-eb9b-431b-9784-3e9f1dfa2176)

- **Step4:** Now you will see the IAM Dashboard. Now click on the Users tab.

![Screenshot from 2023-06-20 20-14-22](https://github.com/Rohit312001/GitDemo/assets/76991475/13b8f467-30eb-45ef-93bf-03cf4ee7973a)

- **Step5:** (Dashboard > Access Management > User > Create User)Now click on the Add User button.Also while creating the user make sure that you have selected the Programmatic Access and AWS Management Console Access.

![Screenshot from 2023-06-20 20-33-11](https://github.com/Rohit312001/GitDemo/assets/76991475/161e7271-f510-4a66-b5a5-ffd5522f31f7)

- **Step6:** After entering the username of your choice and click on the Next: Permissions button and give the **EC2FullAccess permission** to the user.

![Screenshot from 2023-06-20 20-33-47](https://github.com/Rohit312001/GitDemo/assets/76991475/01ac6d3b-7809-42bb-95d2-37ece3ecca88)

- **Step7:** Now click on the Next: Tags button and then click on the Next: Review button.

![Screenshot from 2023-06-20 20-34-45](https://github.com/Rohit312001/GitDemo/assets/76991475/b1f3046a-e0c5-4df7-bb6e-9c54e9df4d3d)

- **Step8:** You can `view` and `download the user's password` below or email the user's instructions for signing in to the AWS Management Console. **This is the only time you can view and download this password.**

![imageedit_2_8330114522](https://github.com/Rohit312001/GitDemo/assets/76991475/d4c64b79-e385-4605-ac38-dc7a7a990ff1)

- **Step9:** Now we can see the downloaded csv file which contains the username and password of the user.

![imageedit_4_5476602365](https://github.com/Rohit312001/GitDemo/assets/76991475/58ac7972-a0d9-4485-a51f-c866de59bacd)

- **Step10:** Verify that the user has been created named as **"Student_Access"** successfully.

![Screenshot from 2023-06-20 20-36-00](https://github.com/Rohit312001/GitDemo/assets/76991475/758fd199-bd49-4757-9364-67a765eae667)

- **Step11:** Now we will login to the AWS account as the **"Student_Access"** user using the password that we have downloaded in the csv file.

![Screenshot from 2023-06-20 21-22-37](https://github.com/Rohit312001/GitDemo/assets/76991475/8c293d9a-e555-47b6-b146-e1d2c21ecd5a)

- **Step12:** Now we will the Console Home of IAM User named "Student_Access".

![imageedit_6_5709073436](https://github.com/Rohit312001/GitDemo/assets/76991475/d4043cd9-b2a3-42a4-bdec-44c773215002)

### Take screenshot of Userdata and Jenkins page, this will verify the task completion.

- **Step1:** Now we will go to the EC2 service. So Search for EC2 in the search bar and click on the EC2 service.

![Screenshot from 2023-06-20 21-56-17](https://github.com/Rohit312001/GitDemo/assets/76991475/05a55d0f-e5eb-4b77-a4ec-8981485f9784)

- **Step2:** Now we will launch the EC2 instance. So click on the Launch Instance button and verify if the instances is running or not.

![Screenshot from 2023-06-20 21-56-57](https://github.com/Rohit312001/GitDemo/assets/76991475/17b8402e-6066-4a09-bc09-af9bb27c5218)

**(*Note that you can't connect to the instance using "EC2 Instance Connect" as you have not given the user access to ec2:InstanceConnect. So log in using ssh.*)**

- **Step3:** Now we will connect the terminal and EC2 instance using ssh. So click on the Connect button and copy the ssh command.

![Screenshot from 2023-06-21 00-01-51](https://github.com/Rohit312001/GitDemo/assets/76991475/9be555d8-2342-458c-aa0b-53f96425aa0a)

**(*so copy the 3rd command and example from the above image of your terminal and paste it in the terminal.*)**

![Screenshot from 2023-06-20 22-12-52](https://github.com/Rohit312001/GitDemo/assets/76991475/f7e73a37-eba6-420f-bb46-10fd4e818865)

- **Step4:** Now we will create a shell script named **"install.sh"** and copy the below code in it.

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

![Screenshot from 2023-06-21 00-11-51](https://github.com/Rohit312001/GitDemo/assets/76991475/706c640d-15be-452a-885f-452d8124daa1)

- **Step5:** Now we will give the permission of the shell script to the user. So run the below command.

```
chmod +x install.sh
./install.sh
```

![Screenshot from 2023-06-20 22-29-47](https://github.com/Rohit312001/GitDemo/assets/76991475/a4efbd69-9d2f-4080-adb7-2aed1a11ef30)

- **Step6:** Now we will check the status of the jenkins and docker. So run the below commands.

```
sudo systemctl status docker
```
![Screenshot from 2023-06-20 22-31-38](https://github.com/Rohit312001/GitDemo/assets/76991475/a03b104b-4107-4e66-8893-e0559e10735d)

```
sudo systemctl status jenkins
```
![Screenshot from 2023-06-20 22-48-59](https://github.com/Rohit312001/GitDemo/assets/76991475/a9c5a183-d97e-466b-940e-815ca2006a3e)

- **Step7:** Now go to your browser, open PublicIP:8080 and you must be able to see the Unlock Jenkins page.

![Screenshot from 2023-06-20 22-55-50](https://github.com/Rohit312001/GitDemo/assets/76991475/93ad3a78-ae49-41d6-ba1a-b54b2c30c4eb)

---

## Task 2:

### IAM Roles or explain the IAM Users, Groups.

- An **IAM role is an IAM identity** that you can create in your account that has `specific permissions`. An IAM role is similar to an `IAM user`, in that it is an `AWS identity` with permission policies that determine what the identity can and cannot do in AWS. However, instead of being uniquely associated with one person, **a role is intended to be assumable by anyone who needs it**. Also, a role `does not have standard long-term credentials` such as a **password** or **access keys** associated with it. Instead, when you assume a role, it provides you with temporary security credentials for your role session.

- **Groups** are a way to `group together collections` of users **under one name**. `Instead of attaching policies to individual users`, you can attach the policies to a **group** and then any user that is a member of that group will inherit those policies. This makes it `easier to manage permissions for a set of users`, rather than having to `manage permissions for each individual user`.

### Create three Roles named: DevOps-User, Test-User and Admin.

- **Step1:** Goto **IAM service** and click on the **Roles** tab and `Create a new role`.

![Screenshot from 2023-06-22 23-30-21](https://github.com/Rohit312001/GitDemo/assets/76991475/6af2d6ec-bd6f-41c5-a519-2d6a06c95f5f)

- **Step2:** Now select the **AWS service** and click on the **EC2** service.

![Screenshot from 2023-06-22 23-30-34](https://github.com/Rohit312001/GitDemo/assets/76991475/e4dc815f-cb9e-4d9e-b504-a82a0fe73c9d)

- **Step3:** Add Permissions and attach the **AmazonEC2FullAccess** policy to it and we have created first Role named as **"DevOps-User"** 

![Screenshot from 2023-06-22 23-31-28](https://github.com/Rohit312001/GitDemo/assets/76991475/57194d60-6102-470e-80ce-600efd464540)

- **Step4:** Do the same for the **Test-User** and **Admin** Role.

![Screenshot from 2023-06-22 23-33-28](https://github.com/Rohit312001/GitDemo/assets/76991475/a3e748b4-d8c8-4828-9dd6-a9be45082bcb)

![Screenshot from 2023-06-22 23-34-19](https://github.com/Rohit312001/GitDemo/assets/76991475/2a35ba1f-b4ec-4f80-91af-f41c322e2b12)

- **At we can verify that we have created three Roles.**

![imageedit_4_3404522158](https://github.com/Rohit312001/GitDemo/assets/76991475/8e435ed4-0538-413f-b616-bec591140954)

---