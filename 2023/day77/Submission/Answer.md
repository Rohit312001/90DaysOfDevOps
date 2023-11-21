# Day 77 : Grafana Alerting

### Introduction to Grafana Alerting

- Whether you're new to **Grafana Alerting** or have some experience, discover the basics and features that can assist you in `making`, `handling`, and `reacting` to **alerts**. This will enhance your team's capability to quickly address and solve problems.

### What is Grafana Alerting?

- **Grafana Alerting** allows you to **alert** on your **metrics and logs**, no matter where they are stored. `Create`, `manage`, and take action on your alerts in a single, `consolidated view`, and improve your team’s ability to identify and resolve issues quickly.

### Benefits of Grafana Alerting

1. **Easily manage your alerts:** No need to look at `multiple pages` for managing alerts in Grafana. A **single Grafana Alerting page consolidates** both Grafana-managed alerts and alerts that reside in your Prometheus-compatible data source in one single place.

2. **One alert rule, multiple alert instances:** Grafana Alerting can give you **system-wide visibility** with a `single multi-dimensional alert`. One alert rule can alert on many items at once, `creating one alert` instance for each entity that needs your attention. You can also group alert instances based on labels to not receive too many notifications!

### How Grafana Alerting works

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/62907214-5cc7-49e3-a7a3-86fdc45af2b3)

1. **Alerting rules** are defined in Grafana and are evaluated in the **Grafana backend**.

2. **Labels** are extracted from the **metric data** and added to the alert instance.Also match alert instances to notification policies and silences and can be used to group your alerts by `severity`.

3. **Severity=warning** is added to the alert instance.

4. **Notification Policy** is evaluated and the alert instance is sent to the **Slack channel** or **Email**.It is the set of rules for where, when, and how the alerts get routed. Notification policies have a tree structure, where each policy can also match `specific alert labels`.

5. **Contact Points** define how your contacts are notified when an alert fires. We support a multitude of ChatOps tools to ensure the alerts come to your team — not the other way around.

### Similar Diagram

![image](https://github.com/Rohit312001/GitDemo/assets/76991475/96055e94-5aa3-4a60-8cbd-5b4e2ed47092)

- Alerts are sent to the alert receiver where they are routed, grouped, inhibited, silenced and notified. In Grafana Alerting, the default alert receiver is the Alertmanager embedded inside Grafana, and is referred to as the Grafana Alertmanager.

---

- Before building the Grafana Alerting, we need to **install the Grafana in our system or on cloud.**
- For detailed installation steps, please visit my `Day 73 Blog` for complete steps on how to **Install Grafana on AWS EC2.**
- **Blog Link :** [Grafana Installation on AWS EC2 Instance](https://devops-rohit.hashnode.dev/day-73-grafana-on-aws-ec2-setup-tutorial)

- After installing Grafana, we need to configure **Grafana Loki and Promtail** to collect the logs from the system which I have already explained in my `Day 75 Blog.`
- **Blog Link :** [Grafana Loki and Promtail Setup](https://devops-rohit.hashnode.dev/day-75-grafana-loki-hands-on-tutorial)

## Task-01

- **Step-01:** Go to Grafana Dashboard and click on **Alerting** option.

![Screenshot from 2023-11-21 00-41-47](https://github.com/Rohit312001/GitDemo/assets/76991475/606f1fb9-c2f5-440f-89c7-e338ec70c159)

- **Step-02:** So in Alerting section, we have **Alert Rules** and add the data source which we have already configured in our previous blog **Loki-1**. So we will be using the same data source.

![Screenshot from 2023-11-21 01-20-06](https://github.com/Rohit312001/GitDemo/assets/76991475/d0faa774-6a1d-4594-95b7-1d8959311aca)

- **Step-03:** Now we will create a new alert rule for **Error Alerting**. So click on **New Alert Rule**.We can also add other Alert Rules like **Warning** and **Critical**.

![Screenshot from 2023-11-21 01-22-56](https://github.com/Rohit312001/GitDemo/assets/76991475/3d05dbde-7e0c-4a4e-ad89-5980008fbe24)

- **Step-04:** Now we will define the **Query** for the **Error Alerting**. So we will use the same query which we have used in our previous blog **Loki-1**.

![Screenshot from 2023-11-21 01-23-16](https://github.com/Rohit312001/GitDemo/assets/76991475/733f7791-5732-4661-b180-461c513585e2)

- **Step-05:** Here we will **Set the Evaluation Behavior** in which we will store the `Rule State` and we will also set the Evaluation Delay to **5 minute**.

![Screenshot from 2023-11-21 01-24-39](https://github.com/Rohit312001/GitDemo/assets/76991475/bc8b35bf-59c9-4636-8f90-43bf58ff8a93)

- **Step-06:** We will keep the Annotations and Notification as default and then click on **Save**.

![Screenshot from 2023-11-21 01-25-08](https://github.com/Rohit312001/GitDemo/assets/76991475/1b6a65e3-97da-4f3f-af27-a0d529ab77e0)

- Thus we have successfully created the **Error Alerting** in Grafana which will alert us if there is any error in the system.

![Screenshot from 2023-11-21 01-25-38](https://github.com/Rohit312001/GitDemo/assets/76991475/262b224b-6ea2-4164-b402-f318a8bc97b1)

- So we will be getting the **Error Alerting** report in every 5 minutes as we have set the Evaluation Delay to 5 minutes.

![Screenshot from 2023-11-21 01-26-16](https://github.com/Rohit312001/GitDemo/assets/76991475/6bcb8ddf-b463-4a7a-bea7-822759da2470)

---
