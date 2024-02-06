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
