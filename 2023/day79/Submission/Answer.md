# Day 79 : How to Install Prometheus and configure it with Grafana.

- In the Last Blog [Day 78](https://devops-rohit.hashnode.dev/day-78-prometheus-part-1) we have seen the basic introduction of Prometheus,its features,components and Architecture.

- In this Blog we will see **How to install Prometheus** and **configure it with Grafana.**

![diagram-export-16-01-2024-07_52_33](https://github.com/Rohit312001/GitDemo/assets/76991475/01ba2fee-a657-4633-8238-880707493070)

### What does Prometheus do and why do we integrate it with Grafana?
- Prometheus is a **monitoring tool** that is used to **collect metrics** from our **services** and **infrastructure**. It is a **time series database** that stores metrics in the form of **key-value pairs**. Prometheus has a **built-in query language** called **PromQL** that allows us to **query** the metrics that it collects. Prometheus also has a **built-in alerting system** that allows us to **create alerts** based on the metrics that it collects. Prometheus is **open-source** and **free** to use.
- Grafana is a **data visualization tool** that allows us to **create dashboards** and **visualize** the data that we send to it. Grafana is **open-source** and **free** to use.
- Prometheus and Grafana are **often used together**. Prometheus is used to **collect metrics** and Grafana is used to **visualize** the metrics that Prometheus collects. Grafana can also be used to **create alerts** based on the metrics that Prometheus collects.

### Prometheus Installation :

- You can obtain Prometheus as a precompiled binary directly from the GitHub repository. The Prometheus Downloads repository provides information on the latest released version of Prometheus.
- **Download the latest version of Prometheus :** [Prometheus Downloads](https://prometheus.io/download/)

- Use `wget` to download the latest version of Prometheus:
```sh
# wget https://github.com/prometheus/prometheus/releases/download/v[release]/prometheus-[release].linux-amd64.tar.gz

wget https://github.com/prometheus/prometheus/releases/download/v2.49.1/prometheus-2.49.1.linux-amd64.tar.gz
```

- Extract the downloaded archive:

```sh
# tar -xvf prometheus-[release].linux-amd64.tar.gz

tar -xvf prometheus-2.49.1.linux-amd64.tar.gz
```

- **(Optional)** Delete the downloaded archive:
```sh
# rm prometheus-[release].linux-amd64.tar.gz

rm prometheus-2.49.1.linux-amd64.tar.gz
```

- Establish `two fresh directories` to be utilized by Prometheus. The configuration files for Prometheus will be stored in the `/etc/prometheus` directory, while the application data will be housed in the `/var/lib/prometheus` directory.

```sh
sudo mkdir /etc/prometheus /var/lib/prometheus
```

- Now change directory into the directory prometheus-2.49.1.linux-amd64.

```sh
cd prometheus-2.49.1.linux-amd64
```

- Now move the `prometheus` and `promtool` binaries to the `/usr/local/bin` directory.

```sh
sudo mv prometheus promtool /usr/local/bin
```

- Now move the `consoles` and `console_libraries` directories to `/etc/prometheus`.

```sh
sudo mv consoles/ console_libraries/ /etc/prometheus
```

- Thus we have successfully installed Prometheus.

```sh
# verify the installation

prometheus --version
```

---

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

### Configure Prometheus with Grafana :

- **Step-01:** Now on the left side we see the `Settings icon` option which is **Configuration** click on it and then click on the **Data Sources**.

![Grafana-Configuration-Data-Source](https://github.com/Rohit312001/GitDemo/assets/76991475/50c98696-6c14-4796-9944-a24178c9680c)

- **Step-02:** Now click on the **Add data source** and search for the **Prometheus** and then click on the **select**.

![Grafana-Add-Data-Source](https://github.com/Rohit312001/GitDemo/assets/76991475/9a8ef1d7-5770-4d73-9c69-8f94ae204ef9)

- **Step-03:** Click on the **Prometheus** to add the data source.

![Prometheus-Data-Source](https://github.com/Rohit312001/GitDemo/assets/76991475/e68df936-68c3-4178-8466-a5a172b466c6)

- **Step-04:** Now enter the **name** of the data source and then enter the **URL** of the Prometheus and then click on the **save and test**.

```bash
Name : Prometheus
URL : http://localhost:9090
```

![Configure-Prometheus-Data-Source](https://github.com/Rohit312001/GitDemo/assets/76991475/6144b54f-1b0d-42fe-a7de-dc825f587166)

- **Step-05:** Check the Alerting and then click on the **save and test**.

![Save-Prometheus-Data-Source](https://github.com/Rohit312001/GitDemo/assets/76991475/42b98222-d901-45bf-8007-13df975ac1f4)

- Thus we have successfully configured **Prometheus with Grafana.**

![Data-Source-Working](https://github.com/Rohit312001/GitDemo/assets/76991475/fb5c0e2e-93bd-4685-8cfe-cb9ecb9e3e50)

---

## Thank You !!