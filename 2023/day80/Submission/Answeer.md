# Day 80 : How to Automate Script using Cron Job.

So From **80-90 Day** I will be sharing my upcoming DevOps Pipeline Project ranging from **Linux Monitoring**,**Shell Scripting**, **CI/CD**, **Docker**, **Kubernetes**, and many more.

### Project Overview
In this Linux Monitoring Project, I will be creating a Monitoring Script for Nginx which will be monitoring the status of the Nginx.

### What is Nginx ?
- Nginx, pronounced **engine-ex** began as a web server but has grown to also act as a reverse proxy, caching data from the web, and balancing loads between servers.

### How Does Nginx Works ?

![diagram-export-06-02-2024-14_30_28](https://github.com/rohit-rajput1/GitDemo/assets/76991475/1aa7b9a5-5dd0-491c-8807-1e6863b0f635)

- Nginx **minimizes memory usage** and **handles multiple requests** simultaneously. It adopts an `event-driven model`, avoiding the need for new processes per request.
- Nginx employs a **master-worker** setup where `one master` process `supervises multiple worker` processes. `Workers` handle actual **request processing**, coordinated by the master.
- Requests are processed asynchronously, allowing each worker to handle requests concurrently without blocking others.

**Key Features:**
- Acts as a **reverse proxy** with **caching**.
- Supports **IPv6** and **load balancing**.
- Provides **FastCGI** support with caching.
- Handles **WebSockets**.
- Efficiently **serves static files and indexes.**

---

### Project

- **Step 1:** Firstly we wil check if the **Nginx** is installed or not. If not then we will install it.
```bash
# Check if Nginx is installed or not if its installed then it will show the path of the Nginx.
which nginx
```

- **Step 2:** Now we will install **Nginx** on the **local machine.**
```bash
sudo apt install nginx -y
```

![Screenshot from 2024-02-05 23-03-10](https://github.com/rohit-rajput1/GitDemo/assets/76991475/caf581b2-6182-4503-9907-075d9537b4df)

- **Step 3:** Now check the version of Nginx installed.
```bash
nginx -v
```

![image](https://github.com/rohit-rajput1/GitDemo/assets/76991475/d666993d-2a94-46eb-8c96-407a1560020a)

- **Step 4:** Now we will see some system commands for Nginx.
```bash
# Start Nginx
sudo systemctl start nginx

# Stop Nginx
sudo systemctl stop nginx

# Restart Nginx
sudo systemctl restart nginx

# Check the status of Nginx
sudo systemctl status nginx
```

![Screenshot from 2024-02-05 23-14-16](https://github.com/rohit-rajput1/GitDemo/assets/76991475/70bcfb1d-e96c-497e-8145-947c147fc7e5)

- **Step 5:** Now we will create a **Monitoring Script** for Nginx.

```bash
#!/bin/bash
# This script is used to monitor the status of the Nginx service

# Specify the shell to be used for running the script
SHELL=/bin/bash

# Set the PATH variable to include essential directories
PATH=/sbin:/bin:/usr/sbin:/usr/bin

# Define color variables for output
Red=$'\e[1;31m'
Green=$'\e[1;32m'
Blue=$'\e[1;34m'

# Check the status of the Nginx service and redirect the output to a file
service nginx status > output_file.txt

# Check if the word "running" is present in the output file
if grep -q "running" output_file.txt; then
   echo $Blue "The Nginx Service is running"
   echo $Green $(date +%I)$(date +:%M)$(date +:%S) $(date +%p) $(date +%Z)
else
   # If Nginx is not running, start the service
   if service nginx start; then
      echo $Red  "Nginx Service is starting......"
      sleep .5s
   else
      echo "Failed to start Nginx Service."
   fi
fi

# Remove the temporary output file
sudo rm -f output_file.txt
```

![image](https://github.com/rohit-rajput1/GitDemo/assets/76991475/f60b574a-82fa-4e3a-9da9-77e6b8b44bca)

- **Step 7:** Now we will make the script executable and run it.
```bash
# Make the script executable
chmod 777 monitoring.sh 
# 777 means that the owner, group, and others have read, write, and execute permissions.
```

![Screenshot from 2024-02-05 23-31-51](https://github.com/rohit-rajput1/GitDemo/assets/76991475/da317938-fb3d-4edb-9d07-c9c9c92e3c6d)

- **Step 8:** Now we will run the script.
```bash
./monitoring.sh
```

![image](https://github.com/rohit-rajput1/GitDemo/assets/76991475/78b7e057-176f-4fd5-b180-ceab0b47e955)

- **Step 9:** Now if the Nginx Service is not running or stopped we get the output as below.

![image](https://github.com/rohit-rajput1/GitDemo/assets/76991475/f96b81d5-9fb1-430d-9c25-81037c1d3b01)


- **Step 10:** Now if the Nginx Service is not running then we will schedule the script to run every **2 minutes** using **Cron Job**.

```bash
# Open the crontab file
crontab -e
```

![Screenshot from 2024-02-05 23-56-42](https://github.com/rohit-rajput1/GitDemo/assets/76991475/fa0919fc-4d25-4249-a424-c2dee2fca1e7)

- **Step 11:** Now add the below line to the crontab file to run the script every 2 minutes.

```bash
# Run the monitoring script every 5 minutes
*/2 * * * * /home/rohit/monitoring.sh
```

![Screenshot from 2024-02-06 00-05-13](https://github.com/rohit-rajput1/GitDemo/assets/76991475/9b59b9ed-b8a4-4307-aebe-29fa1942ca1e)

### Thus we have successfully created a Monitoring Script for Nginx and scheduled it to run every 2 minutes using Cron Job using Shell Scripting Automation.
