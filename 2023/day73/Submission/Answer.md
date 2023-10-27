# Day 73: Grafana Setup on AWS EC2 Instance.

### 📊 What is Grafana, and why is it used for monitoring?

- **Grafana** is an 📈 `open-source` **analytics and monitoring** platform that allows users to `visualize`, `query`, and `analyze data` from various data sources. It's commonly used for monitoring because it provides a user-friendly interface for creating `interactive dashboards` and `alerts`, making it easier to track the performance of systems and applications.

### 📊 What are the features of Grafana?

- 🚀 **Data Visualization:** Grafana empowers users to design visually engaging and interactive dashboards, enabling the representation of data through charts, graphs, and other visual elements.

- 🔌 **Data Source Integration:** The flexibility of Grafana allows it to connect seamlessly with a wide array of data sources, including databases, cloud services, monitoring systems, and more. This capability enables the consolidation of data from multiple sources into a single dashboard.

- 📈 **Time Series Data:** Grafana excels at handling time series data, making it an ideal choice for monitoring and analyzing data that evolves over time, such as system metrics, performance data, and IoT-related information.

- 🚨 **Alerting:** Within Grafana, users can establish alerting rules, ensuring that they receive notifications when specific conditions are met. This feature is pivotal for proactive monitoring and the timely resolution of issues.

- 🧩 **Plugin Architecture:** Grafana's extensible plugin system offers numerous options for enhancing functionality, with a wide selection of plugins available for data sources, visualization types, and custom integrations.

- 📆 **Data Exploration:** Grafana simplifies the exploration of historical data, permitting users to focus on specific time ranges and conduct thorough data analysis, facilitating the identification of trends, anomalies, and historical context.

- 📧 **Notification Channels:** Grafana supports multiple notification channels, such as email and Slack, enabling users to configure channels for receiving alerts and updates from their dashboards.

- 🧑‍🤝‍🧑 **Collaboration:** The platform accommodates multiple users who can collaborate on dashboards and share them with team members. Access permissions can be set to control viewing and editing rights.

- 🧹 **Data Transformation:** Grafana offers the capability to manipulate and transform data before presentation on dashboards, aiding in data cleaning and ensuring meaningful data display.

- 🌐 **Integration:** Grafana seamlessly integrates with various other monitoring tools and services, including Prometheus, InfluxDB, Elasticsearch, and more, positioning itself as a central component within a comprehensive monitoring and observability stack.

- 📚 **Documentation and Community:** Grafana boasts an extensive repository of documentation and an active community, providing access to support, plugins, and resources for maximizing the potential of the platform.

- 📊 **Customization:** Grafana is highly customizable, allowing users to craft dashboards tailored to their specific requirements and branding.

### Why Grafana?

- **Grafana** is the top choice for monitoring and data visualization, and here's why: it's `open-source` and packed with powerful features.
- It **seamlessly connects to different data sources** and provides user-friendly dashboards for making data easy to understand.
- Grafana is particularly great with data that changes over time, making it ideal for tracking evolving **metrics**.
- It also has strong alerting capabilities to `catch issues` early and a **robust plugin system** that lets you customize and integrate with various tools.
- With Grafana, exploring **historical data** is a breeze, allowing for `deep analysis`. It's a versatile tool that encourages teamwork and can be tailored to your specific needs, making it perfect for teams and organizations looking for **effective monitoring** and **observability solutions.**

## Task-01

### Setup grafana on AWS EC2.

- **Step-01:** Launch an EC2 instance with `Ubuntu 22.04` AMI , `t2.micro` instance type and `8GB` storage.

![Screenshot from 2023-10-27 16-16-45](https://github.com/Rohit312001/GitDemo/assets/76991475/a8f0d4c1-d66a-44f8-b4ca-6ccc08986d83)

- **Step-02:** Now connect to the instance using SSH.

![Screenshot from 2023-10-27 16-17-29](https://github.com/Rohit312001/GitDemo/assets/76991475/c8fefa78-5bef-4676-8b49-86d9c51dcb06)

- **Step-03:** Now update the instance.

```bash
sudo apt update
```

- **Step-04:** Install the Pre-requisites Packages of Grafana.

```bash
sudo apt-get install -y apt-transport-https software-properties-common wget
```

![Screenshot from 2023-10-27 16-18-28](https://github.com/Rohit312001/GitDemo/assets/76991475/d87275b3-aa6f-450f-8db9-3af2b29a68f9)

- **Step-05:** Add the GPG key for the official Grafana repository to your system.

```bash
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
```

![Screenshot from 2023-10-27 16-18-48](https://github.com/Rohit312001/GitDemo/assets/76991475/98a94e9e-2120-4844-9e70-bd60f4422a0f)

- **Step-06:** Add the Grafana repository to the sources list for stable releases.

```bash
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```

![Screenshot from 2023-10-27 16-19-07](https://github.com/Rohit312001/GitDemo/assets/76991475/2b71f2a4-0507-40c6-965f-9802737c4db8)

- **Step-07:** Update the apt package list and install the latest version of Grafana.

```bash
sudo apt-get update
sudo apt-get install grafana
```

![Screenshot from 2023-10-27 16-20-21](https://github.com/Rohit312001/GitDemo/assets/76991475/95d1bccb-fa54-406b-b59f-256f1c2e5125)

- **Step-08:** Start the Grafana service and enable it to start at boot time.

```bash
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

![Screenshot from 2023-10-27 16-21-32](https://github.com/Rohit312001/GitDemo/assets/76991475/766f91e1-0719-4740-a18e-6041ad26d8cd)

- **Step-09:** Now let's configure the port `3000` in the security group of the instance first select the instance and then click on the **security group**.

![imageedit_4_2199517771](https://github.com/Rohit312001/GitDemo/assets/76991475/1f4f7a83-36ae-4bd6-8420-718da0bc5686)

- **Step-10:** Now click on the **inbound rules** and then click on the **edit inbound rules**.

![imageedit_8_9899671076](https://github.com/Rohit312001/GitDemo/assets/76991475/aa0a11b8-56d5-40ac-b249-e144c44902f8)

- **Step-11:** Now click on the **add rule** and then select the **custom TCP** and then enter the port number `3000` and then click on the **save rules**.

![imageedit_13_5968381780](https://github.com/Rohit312001/GitDemo/assets/76991475/441dad34-4e20-4367-8c38-d99a031266bc)

- **Step-12:** Now open the browser and then enter the public IP of the instance with the port number `3000` and then click on the **enter**.

![imageedit_18_7898423376](https://github.com/Rohit312001/GitDemo/assets/76991475/7b02938b-0598-4ba3-a560-1cf54864f628)

- **Step-13:** Now you see the **Grafana Dashboard.**

![imageedit_21_7021632194](https://github.com/Rohit312001/GitDemo/assets/76991475/6bfc03f9-0328-487e-b667-2a1cf49f5770)

---

## Task-02

### Grafana Dashboard Overview.

- Here we have **home** and **general settings** with **Koisk Mode** (To hide home panel) and use **ESC** to get original view.

![Screenshot from 2023-10-13 14-04-38](https://github.com/Rohit312001/GitDemo/assets/76991475/4671e199-d45c-42c0-a1ee-7c801d4f0621)

- **This option is used when you have 100s of dashboard and you query the important to filter you want to use.**

![Screenshot from 2023-10-13 14-11-38](https://github.com/Rohit312001/GitDemo/assets/76991475/9f4d5004-15bd-4dcd-85fc-1b7aa2687877)

- This is the place where we can create **Dashboards** and **folders**.

![Screenshot from 2023-10-13 14-12-34](https://github.com/Rohit312001/GitDemo/assets/76991475/b31a7494-ff59-4853-a1d1-cb30e186fc75)

![Screenshot from 2023-10-13 14-14-28](https://github.com/Rohit312001/GitDemo/assets/76991475/6588ce0d-33d5-464c-9386-8e63417dd8ce)

- From here we can create Dashboards where we can add different type of visualisations by adding new panels. **(I will ber Covering this in Future this is just an Overview)**

![Screenshot from 2023-10-13 14-20-14](https://github.com/Rohit312001/GitDemo/assets/76991475/5ae7733c-c252-41c8-8484-eee12587c77c)

- We can also add **multiple panel** in it.

![Screenshot from 2023-10-13 14-25-33](https://github.com/Rohit312001/GitDemo/assets/76991475/4db695bb-be9d-4f4c-a95b-4c0c9353be82)

- **Alerting** is the option where we can define all the alerting rules. For example, we have server utilization under server utilization we have:
- 1. **CPU Utilization.**
- 2. **Memory Utilization.**
- 3. **File system utilization.**

![Screenshot from 2023-10-13 14-29-18](https://github.com/Rohit312001/GitDemo/assets/76991475/9314abcc-9404-4493-9f19-fdf85281cd29)

- **Administration** refer to the configuration where we have most of the settings. For example, we have two data sources so we need to create a Grafana Dashboard by connecting to it **MySQL** and configure the Data Sources.

![Screenshot from 2023-10-13 14-37-01](https://github.com/Rohit312001/GitDemo/assets/76991475/df477823-c741-4899-abfa-76f7d1bfec14)

---
