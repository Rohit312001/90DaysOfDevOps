# Day 27 Task: Jenkins Declarative Pipeline with Docker

## Docker Build and Docke Run

**docker build:** You can use `sh 'docker build . -t <tag>' ` in your pipeline stage block to run the docker build command. (Make sure you have docker installed with correct permissions.)

**docker run :** You can use `sh 'docker run -d  <image>'` in your pipeline stage block to build the container.

**How will the stages look** 
````groovy
stages {
        stage('Build') {
            steps {
                sh 'docker build -t trainwithshubham/django-app:latest'
            }
        }
    }
````

# Task-01

### Create a docker-integrated Jenkins declarative pipeline.

**`Creation of Declarative Pipeline`**

![Screenshot from 2023-04-12 00-22-33](https://user-images.githubusercontent.com/76991475/231261055-fa257649-5909-4bca-9b89-c55425e660ce.png)

**`You can give Description to this of what you have created`**

![Screenshot from 2023-04-11 01-46-30](https://user-images.githubusercontent.com/76991475/231260775-93b82435-5869-43ec-a275-d4ee1f5c46c7.png)

### Use the above-given syntax using `sh` inside the stage block.

![Screenshot from 2023-04-11 01-46-50](https://user-images.githubusercontent.com/76991475/231260789-816ba5f9-0276-412f-a5b9-d90be17bdbcd.png)

**Console Output**

![Screenshot from 2023-04-12 00-14-31](https://user-images.githubusercontent.com/76991475/231260803-357a5c85-856b-44fc-91a3-de1a377dc2b6.png)

**Snapshot of Pipeline Success**

![Screenshot from 2023-04-11 01-46-17](https://user-images.githubusercontent.com/76991475/231260746-1e664944-5316-41a5-8e3c-0a50a9d97a98.png)

---

# Task-02

### Create a docker-integrated Jenkins declarative pipeline using the `docker` groovy syntax inside the stage block.

**Description of Declarative Pipeline using Docker**

![Screenshot from 2023-04-12 00-15-28](https://user-images.githubusercontent.com/76991475/231260809-fab0b0a0-7815-4378-b887-f20abd13352d.png)

**Pipeline Script**

![Screenshot from 2023-04-12 00-15-42](https://user-images.githubusercontent.com/76991475/231260817-5df33d6c-a48b-4a5a-83fd-25565ca6a2f6.png)

![Screenshot from 2023-04-12 00-15-49](https://user-images.githubusercontent.com/76991475/231260835-f87eafd9-3328-4c28-ab7f-5b97ab75e1f6.png)

**Console Output**

![Screenshot from 2023-04-12 00-16-37](https://user-images.githubusercontent.com/76991475/231260842-e3eff588-5d91-49db-ad47-052a45d7b18a.png)

**Snapshot of Pipeline Success**

![Screenshot from 2023-04-12 00-17-06](https://user-images.githubusercontent.com/76991475/231260849-04107caf-2b67-46b9-964f-1ab83f71889f.png)

---
