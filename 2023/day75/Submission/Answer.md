# Day 75: Grafana Loki Handson Tutorial

### 📊 What is Grafana, and why is it used for monitoring?

- **Grafana** is an 📈 `open-source` **analytics and monitoring** platform that allows users to `visualize`, `query`, and `analyze data` from various data sources. It's commonly used for monitoring because it provides a user-friendly interface for creating `interactive dashboards` and `alerts`, making it easier to track the performance of systems and applications.

### Why Grafana?

- **Grafana** is the top choice for monitoring and data visualization, and here's why: it's `open-source` and packed with powerful features.
- It **seamlessly connects to different data sources** and provides user-friendly dashboards for making data easy to understand.
- Grafana is particularly great with data that changes over time, making it ideal for tracking evolving **metrics**.
- It also has strong alerting capabilities to `catch issues` early and a **robust plugin system** that lets you customize and integrate with various tools.
- With Grafana, exploring **historical data** is a breeze, allowing for `deep analysis`. It's a versatile tool that encourages teamwork and can be tailored to your specific needs, making it perfect for teams and organizations looking for **effective monitoring** and **observability solutions.**

### Grafana Installation

- For detailed installation steps, please visit my Day 73 Blog for complete steps on how to install Grafana on AWS EC2.

- **Blog Link :** [Grafana Installation on AWS EC2 Instance](https://devops-rohit.hashnode.dev/day-73-grafana-on-aws-ec2-setup-tutorial)

- As we have already installed Grafana on AWS EC2, we will now move on to the next step.

### What is Grafana Loki?

- **Grafana Loki** is a `horizontally -scalable`,`highly-available`, multi-tenant **log aggregration** system inspired by **Prometheus.** It is designed to be `very cost effective` and `easy to operate`.
- Loki is bult around the idea of only indexing `labels for logs` and leaving the `originals logs messages unindexed`. This means that loki is cheaper to operate and can be order of magnitude more efficient.
- The loki project was started at Grafana labs in 2018. Loki is released under the `AGPLv3 license`.

### How does Grafana Loki Works?

![logs-loki-diagram](https://github.com/Rohit312001/GitDemo/assets/76991475/58d75238-617f-44c3-a075-607b411e1012)

- **Pull in any logs with Promtail:** Promtail is a `logs collector` built specifically for Loki. It uses the same service discovery as Prometheus and includes analogous features for labeling, transforming, and filtering logs before ingestion into Loki.

- **Store the logs in Loki:** Loki does not index the `text of logs`. Instead, entries are grouped into **streams and indexed** with labels.Not only does this `reduce costs`, it also means log lines are available to query within milliseconds of being received by `Loki`.

- **Use LogQL to explore:** Use Loki’s powerful query language, **LogQL**, to explore your `logs`. Run LogQL queries directly within Grafana to visualize your logs alongside other data sources, or with LogCLI, for those who prefer a command line experience.

- **Alert on your logs:** Set up `alerting rules` for `Loki to evaluate` on your incoming log data. Configure Loki to send the resulting alerts to a Prometheus Alertmanager so they can then get routed to the right team.

### What is Promtail?

- **Promtail** is an agent which ships the contents of local logs to a private `Grafana Loki instance or Grafana Cloud`. It is usually deployed to every machine that runs applications which need to be monitored.

1. **It primarily:**

- Discovers targets
- Attaches labels to log streams
- Pushes them to the Loki instance.

---

### Now let's install Grafana Loki on AWS EC2 Instance.

- **But before that, we need to install Docker on our EC2 Instance because Grafana Loki is a Dockerized Application.**

### Installing Docker on AWS EC2 Instance.

- **Step-01:** Update the instance.

```bash
sudo apt update
sudo apt-get install docker.io
```

![Screenshot from 2023-11-07 22-24-20](https://github.com/Rohit312001/GitDemo/assets/76991475/22d5e0bc-d12d-4691-888a-21921fc5db08)

- **Step-02:** Start the Docker Service.

```bash
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker
```

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/ecc70b22-0386-48b6-a007-6f2542ad7e48)

- **Step-03:** Giving Docker Privileges to the User.

```bash
sudo usermod -aG docker $USER
```

![Screenshot from 2023-11-07 22-30-00](https://github.com/Rohit312001/GitDemo/assets/76991475/c3faf810-5893-4df3-81cd-af24b3146f7d)

- **Step-04:** Now we will install Grafana Loki on our EC2 Instance in a folder names as `grafana-configs`

```bash
mkdir grafana-configs
cd grafana-configs
```

![Screenshot from 2023-11-07 22-32-17](https://github.com/Rohit312001/GitDemo/assets/76991475/559d0621-6662-4d15-8786-084b7828bed5)

- **Step-05:** Now we will Download **Grafana Loki Configuration File** inside the `grafana-configs` folder.

```bash
wget https://raw.githubusercontent.com/grafana/loki/v2.8.0/cmd/loki/loki-local-config.yaml -O loki-config.yaml
```

![Screenshot from 2023-11-07 22-34-23](https://github.com/Rohit312001/GitDemo/assets/76991475/244dc7ca-4a8a-4276-8a10-7516a24ece06)

- **Step-06:** Now we will run the Grafana Loki Docker Container which will run on port `3100` inside the `grafana-configs` folder.

```bash
docker run -d --name loki -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:2.8.0 --config.file=/mnt/config/loki-config.yaml
```

![Screenshot from 2023-11-07 22-37-04](https://github.com/Rohit312001/GitDemo/assets/76991475/2b491d35-dcad-4183-ae3c-ecaf41d0671e)

- **Step-07:** Now we will check the status of the Docker Container.

```bash
docker ps
```

![Screenshot from 2023-11-07 22-37-31](https://github.com/Rohit312001/GitDemo/assets/76991475/d898f7ce-cf21-49d8-ae28-c9713b445ed8)

- **Step-08:** Now we will check the logs of the Docker Container. So go to EC2 instance and in Security Group, add a new rule for port `3100` Selecting **ipv4 or My IP** and then open the port in the browser. You will see the logs of the **Docker Container.**

![Screenshot from 2023-11-07 22-47-46](https://github.com/Rohit312001/GitDemo/assets/76991475/42ee0a79-b009-4cf3-855f-4f07e70a0627)

- **Step-09:** Open the browser and enter the public IP of the instance with the port number `3100` and then click on the **enter**.

```
<Public-ip-address>:3100/ready
```

![Screenshot from 2023-11-07 22-48-09](https://github.com/Rohit312001/GitDemo/assets/76991475/3dabfb7f-d85b-4470-a257-116aa113dc2d)

- **Step-10:** To see the `metrics` of the Grafana Loki, enter the below command.

```
<Public-ip-address>:3100/metrics
```

![Screenshot from 2023-11-07 22-49-12](https://github.com/Rohit312001/GitDemo/assets/76991475/7ecb00ce-e80b-43f3-ab80-62446b4bc4a8)

---

### Now we will install Promtail on our EC2 Instance.

- **Step-01:** Download the Promtail Configuration File inside the `grafana-configs` folder.

```bash
wget https://raw.githubusercontent.com/grafana/loki/v2.8.0/clients/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml
```

![Screenshot from 2023-11-07 22-35-12](https://github.com/Rohit312001/GitDemo/assets/76991475/6db1d13b-37d7-4af5-807f-aa8d0ee745b2)

- **Step-02:** Now we will run the Promtail Docker Container inside the `grafana-configs` folder.

```bash
docker run -d --name promtail -v $(pwd):/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.8.0 --config.file=/mnt/config/promtail-config.yaml
```

![Screenshot from 2023-11-07 23-01-52](https://github.com/Rohit312001/GitDemo/assets/76991475/c27fa8a7-2bf5-426e-8bb5-1da6490aa56f)

- **Step-03:** Now we will check the status of the Docker Container.

```bash
docker ps
```

![Screenshot from 2023-11-07 23-02-10](https://github.com/Rohit312001/GitDemo/assets/76991475/87380d3e-12ea-4b25-862b-324b849acdee)

---

### Now we will add the Grafana Loki Data Source to Grafana.

- **Step-01:** Open Grafana Dashboard and then click on the **Configuration** and then click on the **Data Sources**.

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/01f78b89-405f-4aa1-b090-205beece8b11)

- **Step-02:** Now click on the **Add Data Source** and then select the **Loki** and do the connection settings of URL's as **Localhost (Because we yaml file has ip-address as localhost)** and then click on the **Save & Test**.

![imageedit_3_9339865756](https://github.com/Rohit312001/GitDemo/assets/76991475/ecb3c0b0-3b1f-427b-8688-f31723ec18f8)

- Rest all the settings will be default.

![Screenshot from 2023-11-07 23-08-29](https://github.com/Rohit312001/GitDemo/assets/76991475/10e99843-38df-47f2-a257-ba2efcf443ae)

- **Step-03:** Now we will explore data in Grafana Loki which is at the top right corner of the Grafana Dashboard.

![Screenshot from 2023-11-07 23-09-09](https://github.com/Rohit312001/GitDemo/assets/76991475/eeb5fb42-382a-4152-938b-f742789fdc7d)

- **Step-04:** Now in the query section, we will enter the below query.
- **For Example here i have job = varlogs and then click on the Run Query** for `last hour`.

![Screenshot from 2023-11-07 23-14-20](https://github.com/Rohit312001/GitDemo/assets/76991475/40da32b2-ba34-4576-b72f-4bbf664c650b)

---

### Let's see how can we create new log stream in Grafana Loki.

- **Step-01:** For example we want logs from **"grafana.logs"**

![Screenshot from 2023-11-07 23-16-08](https://github.com/Rohit312001/GitDemo/assets/76991475/3cf94d45-ab97-45f1-a1f4-112cf1ce5564)

- **Step-02:** So copy the path of `grafana.log`.

```bash
pwd
```

![Screenshot from 2023-11-07 23-17-03](https://github.com/Rohit312001/GitDemo/assets/76991475/3089cc90-dad5-491b-bff2-09e9429a329f)

- **Step-03:** Now we will add the path in the `promtail-config.yaml` file.

```bash
sudo vim promtail-config.yaml
```

![imageedit_5_7421684035](https://github.com/Rohit312001/GitDemo/assets/76991475/13ee39b8-17f0-4a6c-b837-3cef7d542b11)

- **Step-04:** Now we will restart the Promtail Docker Container.

```bash
docker restart <promtail-container-id>
```

![Screenshot from 2023-11-07 23-21-29](https://github.com/Rohit312001/GitDemo/assets/76991475/c9918a1c-2440-42a5-a214-d2696ae5a668)

- **Step-05:** Now in the query section, we will enter the below query.
- **For Example here i have job = grafanalogs and then click on the Run Query** for `last hour`.

![Screenshot from 2023-11-07 23-24-49](https://github.com/Rohit312001/GitDemo/assets/76991475/cd33cfa9-dae3-4856-a886-20461e056648)

- **Step-06:** Now Add this Query to the Dashboard.

![Screenshot from 2023-11-07 23-26-56](https://github.com/Rohit312001/GitDemo/assets/76991475/0d215be9-1963-41f8-be69-490c1328a0ae)

- **Step-07:** You can add more Vusialization to the Dashboard.

![Screenshot from 2023-11-07 23-27-17](https://github.com/Rohit312001/GitDemo/assets/76991475/2cbe2511-89f6-4388-bf32-6066a47f72c7)

---

### Now Let's install Nginx on our EC2 Instance and add this logs to Grafana Loki Dashboard.

- **Step-01:** Install Nginx on EC2 Instance.

```bash
sudo apt-get install nginx -y
```

![Screenshot from 2023-11-07 23-32-14](https://github.com/Rohit312001/GitDemo/assets/76991475/2627a0d2-ee92-470a-bdbe-9451547b089e)

- **Step-02:** Click on Add Visualizations and then select the **varlogs** and then click on the **Operation** and the select **Rate Count** and then click on the **Apply**.

- **Thus it show how many times Nginx is called in the last hour.**

![Screenshot from 2023-11-07 23-33-45](https://github.com/Rohit312001/GitDemo/assets/76991475/97982713-2faa-4ecd-8b23-6bfbee1b5200)

- **Step-03:** So Now we will add this Nginx logs to Visualization.

![Screenshot from 2023-11-07 23-43-46](https://github.com/Rohit312001/GitDemo/assets/76991475/5b3644c2-2140-4731-8d9f-a85a10adc282)

- **Step-04:** Now if we want logs from Docker.So do the similar steps as we did for Nginx.Thus we have **Docker logs to Visualization.**

![Screenshot from 2023-11-07 23-46-04](https://github.com/Rohit312001/GitDemo/assets/76991475/3df1ed3d-8371-4e7e-b7d8-2ee370ef3237)

- **Step-05:** See the Dashboard of Grafana Loki which have **varlogs**, **Nginx** and **Docker logs**.

![imageedit_10_2478461824](https://github.com/Rohit312001/GitDemo/assets/76991475/a9db56f0-a01e-4d9c-83a3-430199cd9896)

---

### Thus we have successfully installed Grafana Loki on AWS EC2 Instance and added Nginx and Docker logs to Grafana Loki Dashboard.
