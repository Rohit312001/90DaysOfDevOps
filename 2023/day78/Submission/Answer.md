# Day 78 : Prometheus : 1

### What is Prometheus ?

- **Prometheus** is an `open-source monitoring` and `alerting toolkit` build by `SoundCloud` which is reliable and scalable.
- It is a part of the **Cloud Native Computing Foundation (CNCF)** and is widely used in `cloud-native environments`.
- Prometheus excels in **monitoring dynamic**, **containerized**, and **microservices-based architectures** with automatic service discovery and scalability.
- Its `multi-dimensional data model` and `time-series data` handling suit rapidly changing environments.
- Built-in alerting, **powerful query language (PromQL)**, and an active community make Prometheus a key tool for proactive issue resolution and insights into modern architectures.

---

### Features of Prometheus :

![tip 1 (2)](https://github.com/Rohit312001/GitDemo/assets/76991475/c4f099af-cd52-4172-8774-b52b4a0b6462)

- **Service Discovery:** Prometheus dynamically identifies and monitors services, adapting to changes in the environment without manual configuration.

- **Multi-dimensional Data Model:** Metrics are enriched with labels, allowing for detailed categorization and effective querying for insights.

- **Time Series Data Handling:** Captures and stores time-stamped data, enabling analysis of performance trends and historical behavior.

- **Alerting System:** Prometheus proactively alerts operators to potential issues by triggering notifications when predefined conditions are met.

- **Scalability:** Designed to handle large and dynamic deployments, Prometheus scales seamlessly to meet the demands of modern, evolving architectures.

---

### Architecture of Prometheus :

![diagram-export-27-12-2023-14_45_53](https://github.com/Rohit312001/GitDemo/assets/76991475/062b3749-4f9f-41f9-9894-a4460e907813)

- **Prometheus -> Service Discovery** `Prometheus` uses `service discovery`, like **DNS-based discovery**, to `dynamically find` and `monitor targets (services)`. Configured with mechanisms such as **DNS queries**, Prometheus updates its target list based on dynamic changes in the environment. This ensures `automatic adaptation` to evolving service landscapes without manual intervention.

- **Prometheus sends alerts to the Alertmanager** using a `push mechanism` when predefined conditions are met. The **Alertmanager** then handles and processes these alerts, `deduplicates them`, `applies grouping`, and forwards `notifications to configured receivers`, such as **email** or **webhooks**. This `push-based alerting` system enables timely response to `critical conditions` in a monitored environment.

- Prometheus uses a `time-series database` with a **Write-Ahead Log (WAL)** for durability. It employs `Snappy compression` and `leveled compaction` for efficient storage. **Data is organized in block-based storage**, and `retention policies` help manage `data expiration`. Periodic compaction operations `optimize performance`, and `snapshot backups` provide disaster recovery options.

- **Prometheus collects data**, **Grafana visualizes it**. Together, they create dynamic dashboards for monitoring and alerting. Integration allows seamless display of Prometheus metrics in Grafana's user-friendly interface, enhancing overall system observability.

---

### Components of Prometheus :

- **Prometheus Server:** The heart of the ecosystem, the Prometheus server scrapes metrics from instrumented applications and services via HTTP endpoints. It stores the collected data in its internal time series database, allowing you to analyze and visualize it later.

![tip2](https://github.com/Rohit312001/GitDemo/assets/76991475/8f5736e7-e175-45a8-b7b5-5d3650cc6222)

- **Client Libraries:** To expose metrics for Prometheus scraping, applications need to be instrumented using client libraries. Prometheus offers libraries for various programming languages like Go, Python, Java, and more. These libraries make it easy to add instrumentation code for collecting and exporting metrics.

![tip2 (1)](https://github.com/Rohit312001/GitDemo/assets/76991475/abc580d1-5520-4b92-9ea0-f41b64dacfc7)

- **Targets:** Prometheus discovers targets where metrics reside through static configuration files or service discovery mechanisms like **Kubernetes**. Based on these targets, the server schedules scraping jobs to collect data at regular intervals.

![Blog-Kubernetes-Monitoring-with-Prometheus-1-Featured-image](https://github.com/Rohit312001/GitDemo/assets/76991475/3037562c-b931-46d9-b165-8391a1d5f2d7)

- **Prometheus Query Language (PromQL):** A powerful query language specifically designed for analyzing Prometheus data. PromQL allows you to filter, aggregate, and manipulate time series data to gain insights into your system's behavior. You can use PromQL to create dashboards, generate alerts, and perform various other analyses.

![5e4ce051a53ace7c67b77a24_Xu-6bXBM7u8ZgVFggGM71t7DwnVQKo6DdoZfX6vDpsLCz1MEpaxpXwUf6W0CupsLbTxz5njHMK4NaF4amZdUt7cDqI-MrNXMUMrROt37-TCaLkZ4O38S3csykap0KCuGlE9q0Uih](https://github.com/Rohit312001/GitDemo/assets/76991475/8e7ad724-58da-4ca8-9876-cee1127cd7e2)

- **Alertmanager:** Prometheus can trigger alerts based on predefined rules when specific metrics breach certain thresholds. The Alertmanager component takes these alerts and routes them to various notification channels like email, Slack, or PagerDuty, ensuring timely action is taken on critical issues.

![prur_1801](https://github.com/Rohit312001/GitDemo/assets/76991475/758ae9ff-e152-421b-a4bf-1faa1cfaae35)

---

### Prometheus Concept:

- **Data Model:** Prometheus fundamentally `stores all data` as **time series:** streams of timestamped values belonging to the `same metric` and the `same set of labeled dimensions.` Besides stored time series, Prometheus may generate temporary derived time series as the result of queries.

![prometheus-data-model-c49187d58a88082bca9ca028d7b3fe4b](https://github.com/Rohit312001/GitDemo/assets/76991475/a7de294f-7d34-4640-a89f-dadfd3339c0f)

- **Metric Type:** The Prometheus `client libraries` offer four core metric types. These are currently only differentiated in the `client libraries` (to enable APIs tailored to the usage of the specific types) and in the wire protocol. The Prometheus server does not yet make use of the type information and flattens all data into untyped time series. This may change in the future.

![1200x520_Prometheus-Metrics-Types-1024x444](https://github.com/Rohit312001/GitDemo/assets/76991475/08505cff-4357-401b-97a4-83b9b0b71b97)

1. **Counters:** Counters are metrics that only increase over time.For example,the total number of HTTP requests served by a web server.

2. **Gauges:** Gauges represent a snapshot of a value at a specific point in time and can go up or down.For example,the current number of active connections to a database.

3. **Histograms:** Histograms provide a summary of the distribution of observed values, usually used for measuring request durations.For example,response time distribution for HTTP requests.

4. **Summaries:** Similar to histograms, summaries also provide a distribution of observed values, but with quantiles instead of buckets.For example, measuring the 95th percentile response time for a service.

- **Jobs and Instances:** In Prometheus terms, an endpoint you can scrape is called an `instance`, usually corresponding to a single process. A collection of instances with the same purpose, a process replicated for scalability or reliability for example, is called a **job**.

```bash
For example, an API server job with four replicated instances:

job: api-server
instance 1: 1.2.3.4:5670
instance 2: 1.2.3.4:5671
instance 3: 5.6.7.8:5670
instance 4: 5.6.7.8:5671
```

- **Prometheus Remote-Write Specification:** The remote write specification is intended to document the standard for how Prometheus and Prometheus remote-write-compatible agents send data to a Prometheus or Prometheus remote-write compatible receiver.

![tip2 (2)](https://github.com/Rohit312001/GitDemo/assets/76991475/667167f2-8d8a-4bc9-8d2d-9d1050eaf936)

### What are the Default Retention Period of Prometheus ?

- By default, Prometheus retains metrics data for 15 days. This retention period is controlled by the `--storage.tsdb.retention.time` configuration option. After this period, data older than the specified retention time is automatically deleted to manage storage space. Keep in mind that administrators can customize this retention period based on their specific requirements by adjusting the configuration accordingly.

![remote_integrations](https://github.com/Rohit312001/GitDemo/assets/76991475/56c5b527-5bee-4090-aaf9-a3badac0eb52)

---
