# Day 15 Task: Python Libraries for DevOps

### Reading JSON and YAML in Python

- As a DevOps Engineer you should be able to parse files, be it txt, json, yaml, etc. 
- You should know what all libraries one should use in Pythonfor DevOps.
- Python has numerous libraries like `os`, `sys`, `json`, `yaml` etc that a DevOps Engineer uses in day to day tasks.

### What is `os` module in python?
- The `os` module is a built-in Python library that provides a way of using operating system dependent functionality like **reading** or **writing** to the file system,
**creating** and **deleting files** and **directories**, **accessing environment variables**, and **executing system commands**.

### What is `sys` module in python?
- The `sys` module is a built-in module in Python that provides access to some **variables** and **functions** that interact with the Python interpreter.

### What is `json` module in python?
- The `json module` in Python is a built-in module that allows you to encode and decode JSON (JavaScript Object Notation) data. JSON is a lightweight data interchange format that is easy for humans to read and write, and easy for machines to **parse** and generate.

**`json.dumps()`**: This function is used to encode Python objects into a JSON formatted string.

### What is `yaml` module in python?
- `YAML` is a **human-readable data serialization format** that is often used for **configuration files**, **data exchange**, and other applications where data needs to be easily readable by humans.

**`yaml.safe_load(stream)`**: This function reads YAML data from the given input stream and returns a Python object that corresponds to the data.

## Tasks

- Create a Dictionary in Python and write it to a json File.

![Screenshot from 2023-03-25 00-29-52](https://user-images.githubusercontent.com/76991475/227637187-4adbd366-58d0-4ae4-9398-571ed8379e3d.png)

---
- Read a json file `services.json` kept in this folder and print the service names of every cloud service provider.

![Screenshot from 2023-03-25 00-30-15](https://user-images.githubusercontent.com/76991475/227637203-9bad5cad-dda8-477e-834f-1d645883fbd7.png)

---
- Read YAML file using python, file `services.yaml` and read the contents to convert yaml to json.

Before Coversion of files we need to check parsing of file.
```pip install pyyaml```
          or
```pip3 install PyYAML```

![Screenshot from 2023-03-25 02-04-03](https://user-images.githubusercontent.com/76991475/227637218-931a1ee3-eecc-4fd0-ba5f-11cfa445c1cf.png)

**`Output:`**

![Screenshot from 2023-03-25 02-35-17](https://user-images.githubusercontent.com/76991475/227641261-07f4fa8b-6f25-424b-9dca-cdfac22a9e98.png)
![Screenshot from 2023-03-25 02-35-30](https://user-images.githubusercontent.com/76991475/227641296-4cd6a041-5f65-404a-b69d-79f8a044eea1.png)

---

