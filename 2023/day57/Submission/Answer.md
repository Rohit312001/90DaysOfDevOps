# Day 57: YAML Complete Tutorial

### What is a MarkUp language?

- For example, we have **HTML** which is a markup language.It has a sequence of things which has to be done in order.

likewise we can have steps for the same,

=> _first header will come._

=> _then we will have list inside body._

=> _Inside list we have bullet points._

=> _In bullet we have paragraph and other things._

- So this `relation` of `what goes inside` what is called **MarkUp language**,basically it stores `"Documents"`.

**Before:** YAML => `Yet Another MarkUp Language`.

- It's not a **programming language** basically a **data format used to exchange data**.

**After:** YAML => `YAML Ain't MarkUp language.`

### So Why YAML isn't MarkUp Language ?

- Basically a **simple human readable language** that can be used to `represent data`.Thus its called YAML
- In YAML, We can **store data** and can be used as `instruction set for the CLI`(Command Line Interface) to `perform specific task`.

### Data Serialization and Deserialization.

- For example, we have `data object of student` who will be having `name,roll.no and standard` so we have to `put that data in Android-iOS Phones or on Website` so for the **different apps we need to change code and syntax**.So we used **Serialization** and **Deserialization**.

**What is Data Serialization & Deserialization ?**

- `Data Serialization` is a process of `converting data objects into a complex data structure` in a `Stream of bytes` which are `encrypted`.
- `Data Deserialization` is a process `opposite to serialization` (Object turned into file) here `files are decrypted into objects`.
- For example,In JSON data when we get an API call where we get JSON data we convert that into JSON Objects.

![Untitled-2023-07-18-1920](https://github.com/Rohit312001/GitDemo/assets/76991475/2707b075-ac3d-4553-ae90-10de5622e4bd)

### What is YAML is used for?

- **YAML** (short for `"YAML Ain't Markup Language"` or sometimes `"Yet Another Markup Language"`) is a **human-readable data serialization format**. It's often used for `configuration files` and `data exchange between languages` with different data structures. YAML files use `indentation to represent nesting and hierarchy`, making it`easily readable` by both `humans` and `computers`.

- **`Configuration Files:`** Many software applications use YAML files to `store configuration settings`. This can include settings for `web servers`, `databases`, `continuous integration pipelines`, and more. The human-readable nature of YAML makes it well-suited for configuration files, as it's `easy for developers` to `understand` and `modify`.

- **`API Documentation:`** Some **APIs** and `web services` use YAML to `define` and `document their endpoints`, `request parameters`, and `responses`. This approach, often known as **`"Swagger"`** or **`"OpenAPI Specification"`** provides a clear and standardized way to describe **API functionality**.

- **`Docker Compose:`** **Docker Compose**, a tool for `defining` and `running multi-container Docker applications`, uses YAML files to define the `services`, `networks`, and `volumes` that make up a **containerized application**.

- **`Automation and Orchestration:`** **YAML** is often used in `configuration management tools` like **Ansible** and **SaltStack** to define the `desired state of systems` and `automate deployment` and `management tasks`.

- **`CI/CD Pipelines:`** **Continuous Integration and Continuous Deployment (CI/CD) pipelines** are often defined using **YAML**. Tools like `Jenkins`, `GitLab CI/CD`, and `GitHub Actions` use YAML to describe the sequence of steps required to **build**, **test**, and **deploy software**.

- **`Configuration Files for Kubernetes:`** **Kubernetes**, a popular `container orchestration platform`, uses **YAML files** to define resources like **pods**, **services**, **deployments**, and more.

### Benefits of YAML:

- _Simple and Easy to read._
- _It has strict syntax (Indetation is Important)_
- _Easily Convertible to JSON,XML._
- _Most language use YAML._
- _More Powerful when representing complex data._
- _Parsing is easy (reading a data)._
- _file of YAML will be `.yaml` or `.yml`._

---

## Key-Value Pair, listform and blockform.

### Key-Value Pair in YAML.

- In YAML we can store file in the form of `Key : value` pairs.

```
"apple" : "I am Red Fruit."

1 : "This is my roll.no."
```

### listform in YAML

- Here we will `store file` in the `form of list` and for that we will use **'-'**.

```
---
 -apple
 -mango
 -banana
 -cherries
 -watermelon
...

# YAML is case sensitive (Apple and apple are two different things.)

---
 -Apple
 -Mango
...

```

### Blockform in YAML.

- Here we will see how to use **`list in block`** form which is akind of **Array** in other language.

```
---
# Listform of collection city name under `cities` in Blockform.
cities :
     -Mumbai
     -New Delhi
     -Chennai
     -Kolkata
     -Bangalore
     -Surat
...

---
#Another way of writing blockform.
cities : [Mumbai,New Delhi,Chennai,Kolkata,Bangalore,Surat]
...

```

### How to write the Blockform file into JSON file.

```
{
    "cities" : [
        "Mumbai",
        "New Delhi",
        "Chennai",
        "Kolkata",
        "Bangalore",
        "Surat"
    ],

    "Cities" :["Mumbai","New Delhi","Chennai","Kolkata","Bangalore","surat"]
}
```

## Basic Datatype in YAML.

- In YAML, data types refer to the `different types of value`s that can be represented in a `YAML document`. YAML supports several basic data types, and these data types are used to represent various kinds of values, such as **strings**, **numbers**, **booleans**, **lists**, **dictionaries**, and more. Here are some common data types in YAML:

- **`Strings:`** `Textual data` can be represented as `strings`. Strings can be `enclosed` in **single** or **double quotes**, or **left unquoted**.

```
# string_example is a string.

string_example_0: Hello, World!
string_example_1: 'Hello, Rohit!'
string_example_2: "Hello, VScode!"
```

- **`Numbers:`** YAML supports `integer` and `floating-point numbers`, which can be `written without quotes`.

```
# integer_example is an integer.
integer_example: 42

# float_example is a floating-point number.
float_example: 3.14
```

- **`Booleans:`** **Boolean values** are represented as `true or false (without quotes)`.

```
# boolean_example is a boolean.
boolean_example: true
```

- **`Null:`** The absence of a value is represented as `null` (without quotes).

```
# null_example represents a null value.
null_example: null
null_example_1: ~
```

## Advanced Datatype in YAML.

### Sequences in YAML

- **`Sequences:`** It is used to create a sequence of Array and for that we use **"!!seq"**

```
#Here we will see how to write Sequence in Datatype.
#for that we use "!!seq"

---
Student : !!seq
     -marks
     -name
     -roll_no

...

#If some of the key of the sequence will be empty.

Sparse Seq :
      -how
      -are
      -you
      -
      -Null
      -sup
...

#Here we will see nested mapping : which is map within  map
---
name : Rohit Rajput
roll_no :
     age : 21
     job : student
...

---
#Same as,
Name : Rohit Rajput
role : { age : 21 , job : student}
...

```

### Pair in YAML for Array of Hashtable.

- **`Pair:`** In YAML, the `!!pair` tag is not a widely used construct, and its usage might not be supported in all YAML parsers and applications.However, if you're interested in creating an array of hashtables using this tag, you can follow this approach:

```
array_of_hashtables:
  !!pair
    key1: value1
    key2: value2
  !!pair
    key1: another_value1
    key2: another_value2

```

### Dictionaries in YAML.

- **`Dictionaries:`** In YAML, `dictionaries` are often referred to as **"maps"** or **"associative arrays"** and for that we use **"!!omap"**.

```
---
People : !!omap
  -Rohit :
     name : Rohit Rajput
     age : 21
     height : 678
  -Rahul :
    name : Rahul Op
    age : 26
    height : 786

...

#Here we will use reusing properties using anchor.
#we use "&" for function call at that instance.
---
liking : &like
    favfruit : Mango
    dislike : Grapes

Person 1 :
    name : Kunal
    << : *like

Person 2 :
    name : Rahul
    << : *like
    dislike : berries
    # this will overwrite like so my dislike will change from grapes to berries.
```

## Happy Learning :)

---
