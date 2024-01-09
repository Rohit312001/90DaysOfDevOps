# Day 14 Task: Python Data Types and Data Structures for DevOps

### New day, New Topic.... Let's learn along 😉

## Data Types
- Data types are the classification or categorization of data items. It represents the kind of value that tells what operations can be performed on a particular data. 
- Since everything is an object in Python programming, data types are actually classes and variables are instance (object) of these classes.
- Python has the following data types built-in by default: Numeric(Integer, complex, float), Sequential(string,lists, tuples), Boolean, Set, Dictionaries, etc

To check what is the data type of the variable used, we can simply write:
```your_variable=100```
```type(your_variable)```

## Data Structures

- **Data Structures** are a way of organizing data so that it can be accessed more efficiently depending upon the situation.
- Data Structures are fundamentals of any programming language around which a program is built.
- Python helps to learn the fundamental of these data structures in a simpler way as compared to other programming languages.

## Lists
- Python Lists are just like the arrays, declared in other languages which is an ordered collection of data. It is very flexible as the items in a list do not need to be of the same type

## Tuple
- Python Tuple is a collection of Python objects much like a list but Tuples are **immutable in nature** i.e. the elements in the tuple cannot be **added** or **removed once created**.Just like a List, a Tuple can also contain elements of various types.

## Dictionary
- A `dictionary` in Python is an unordered collection of `data values`, used to store data values like a map, unlike other Data Types that hold only a single value as an element, a Dictionary holds a **key: value pair**. 
- Key-value is provided in the dictionary to make it more **optimized**. 

---
# Tasks

## Give the Difference between List, Tuple and set. 

**`list:`**
- **Lists** is just like an arrays,declared in other language which is an `ordered collection of data`.
```
# DataType Output: list
x = ["geeks", "for", "geeks"]
```

**`Tuples:`**
- Just like a **list**,a tuple is also an `ordered collection of Python objects`.The only **difference** between a **tuple** and **list** is that tuples are `immutable` i.e. tuples cannot be modified after it is created.
```
# DataType Output: tuple
x = ("geeks", "for", "geeks")
```

**`Set:`**
- A **Set** is an unordered collection of data types that is `iterable`, `mutable` and has no duplicate elements.
```
# DataType Output: set
x = {"geeks", "for", "geeks"}
```
---

## Create below Dictionary and use Dictionary methods to print your favourite tool just by using the keys of the Dictionary.

**Method 1:**

![Screenshot from 2023-03-22 21-38-22](https://user-images.githubusercontent.com/76991475/226980762-061eadc5-1510-406d-860e-a8037736347f.png)

**Method 2:**

![Screenshot from 2023-03-22 21-38-41](https://user-images.githubusercontent.com/76991475/226980783-282d526d-0cb6-48b5-b0bf-20e53f5ce800.png)

---

## Write a program to add `Digital Ocean` to the list of cloud_providers and sort the list in alphabetical order.


- ### Create a List of cloud service providers
```
cloud_providers = ["AWS","GCP","Azure"]
```

![Screenshot from 2023-03-22 22-26-06](https://user-images.githubusercontent.com/76991475/226980803-f133df04-1021-4281-988f-9e53d7038b46.png)

---