# Day 76 : Build a own Grafana Dashboard.

### What is Grafana Dashboard ?

- A **Grafana dashboard** is a `web-based visualization tool` that allows you to visualize data from a variety of sources, including **metrics**, **logs**, and **traces.** Dashboards are made up of panels, which are individual visualizations that display data in different ways, such as **graphs**, **charts**, and **tables.**
- Grafana dashboards are `highly customizable`, and you can use them to create dashboards that meet your specific needs. For example, you can create dashboards to `monitor your infrastructure`, track your `application performance`, or `analyze your business data.`

### Why do we need Grafana Dashboard ?

- **Easy to use:** Grafana dashboards are easy to create and use, even for users with no prior experience with data visualization.
- **Powerful:** Grafana dashboards offer a wide range of features and functionality, including the ability to create complex visualizations, drill down into data, and set alerts.
- **Flexible:** Grafana dashboards can be used to visualize data from a variety of sources, including metrics, logs, and traces.
- **Open source:** Grafana is an open source project, which means that it is free to use and modify.

### Dashboard Components

<img width="1300" alt="screenshot-dashboard-annotated-9-5-0" src="https://github.com/Rohit312001/GitDemo/assets/76991475/58350adb-5f3c-46aa-9af8-cfa745ff7d87">

1. **Grafana Home:** Click **Home** to return to the Grafana home page.

2. **Dashboard Name:** The name of the dashboard and current folder.

3. **Shared Dashboard:** Click the **Share** icon to share the dashboard with other users.

4. **Add Panel:** Click the **Add Panel** icon to add a new panel to the dashboard.

5. **Save Dashboard:** Click the **Save** icon to save the dashboard.

6. **Dashboard Insights:** Click the **Insights** icon to view insights for the dashboard.

7. **Dashboard Settings:** Click the **Settings** icon to view and edit the dashboard settings.

8. **Time Picker:** Use the time picker to select the time range for the dashboard.

9. **Zoom Out time range:** Click the **Zoom Out** icon to zoom out the time range.

10. **Refresh Dashboard:** Click the **Refresh** icon to refresh the dashboard.

11. **Refresh Dashboard Time Interval:** Click the **Refresh** icon to set the refresh interval for the dashboard.

12. **View Mode:** Click the **View** icon to switch to view mode.

13. **Dashboard Panels:** The panels that make up the dashboard and display the data.

14. **Graph Legend:** The legend for the graph panel that displays the name of each time series.

15. **Dashboard Row:** The row that contains the panels that make up the dashboard.

## Task : Build your own Grafana Dashboard.

- Before building the Grafana Dashboard, we need to **install the Grafana in our system or on cloud.**
- For detailed installation steps, please visit my `Day 73 Blog` for complete steps on how to **Install Grafana on AWS EC2.**
- **Blog Link :** [Grafana Installation on AWS EC2 Instance](https://devops-rohit.hashnode.dev/day-73-grafana-on-aws-ec2-setup-tutorial)

- After installing Grafana, we need to configure **Grafana Loki and Promtail** to collect the logs from the system which I have already explained in my `Day 75 Blog.`
- **Blog Link :** [Grafana Loki and Promtail Setup](https://devops-rohit.hashnode.dev/day-75-grafana-loki-hands-on-tutorial)

### Let's create a Nginx & Docker Visualization in Grafana Dashboard.

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

### Thank You !!!
