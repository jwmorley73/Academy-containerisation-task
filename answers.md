# Answers
These are just some of the ways of getting the answer. Containers are incredibly flexible so you can achieve similar results in many different ways.

## 1. Seize the Rebel Database

<details>
  <summary>a. Answer</summary>

  Pull the rebel database image from Dockerhub

  ```
  docker pull jwmorley73/rebel-database:latest
  ```
</details>
<details>
  <summary>b. Answer</summary>

  Run the database using docker run

  ```
  docker run -d --name rebel-database jwmorley73/rebel-database:latest
  ```

  Or create the container and start it with docker create and start

  ```
  docker create --name rebel-database jwmorley73/rebel-database:latest
  docker start -d rebel-database
  ```
</details>
<details>
  <summary>c. Answer</summary>

  List running containers either through ps or container ls
  ```
  docker ps
  ```
  ```
  docker container ls
  ```

  You can list all contianers, including ones that have stopped, through:

  ```
  docker container ls -a
  ```
</details>

## 2. Obtain a Rebel Communications Device

<details>
  <summary>a. Answer</summary>

  Build the image using the rebel_communications directory. You will need to point docker build command to the desired directory. The docker build command will automattically find the Dockerfile file if it is named as such.

  ```
  docker build -t rebel-communications ./services/rebel_communications
  ```
</details>
<details>
  <summary>b. Answer</summary>

  Launch the container for the image built previously. Ensure it is running using ls

  ```
  docker run --name rebel-device rebel-communications
  docker contianer ls
  ```
</details>
<details>
  <summary>c. Answer</summary>

  Relaunch the container for the image built previously but with a host port bound to the contianer 8000 port.

  Port binding is of the form: ```<host port>:<container port>```. This convention of host on the left and container on the right is the same for almost all commands in docker.

  ```
  docker run --name rebel-device -d -p 8000:8000 rebel-communications
  ```
</details>
<details>
  <summary>d. Answer</summary>

  You can use the UI accessed through your browser to the url ```http://loclahost:8000/docs```.

  Or by using curl, the message uuids are found from the generic endpoint:

  ```
  curl http://localhost:8000/messages/
  curl http://localhost:8000/messages/{message uuid}
  ```

  The database name should be `rebel-missions`
</details>

## 3. Breach the Secret Rebel Communications

<details>
  <summary>a. Answer</summary>

  Build the image using the rebel_secret_communications directory. 

  ```
  docker build -t rebel-secret-communications ./services/rebel_secret_communications
  ```
</details>
<details>
  <summary>b. Answer</summary>

  Launch as usual to connect the container to the default network. 

  ```
  docker run -d --name rebel-secret-device rebel-secret-communications
  ```

  Or create your own docker network and connect it to that. Remember to connect subsiquent containers to the same network if you want them to have access.
  
  ```
  docker network create -d bridge my-network
  docker run -d --name rebel-secret-device --network my-network rebel-secret-communications
  ```
</details>
<details>
  <summary>c. Answer</summary>

  You need to find the ip of the rebel secret communications container (or use its dns name which will be its docker name by default). That can be done by using docker inspect on the network or the contianer. Both will produce a lot of output but will include the ip that we are looking for.

  ```
  docker network inspect my-network
  docker container inspect rebel-secret-device
  ``` 
</details>
<details>
  <summary>d. Answer</summary>

  You can launch any container you want. I would recommend one that contains some kind of indefinitly running server and then exec into its terminal.

  ```
  docker run -it --user root postgresql:latest /bin/bash
  ```

  But you could also run the command every time and let the container stop.

  ```
  docker run --user root <my image> <commands>
  ``` 
</details>
<details>
  <summary>e. Answer</summary>

  You need to execute these commands from a sibling container. This container can be accessed either through exec into its terminal or spinning up the terminal every time and passing the commands into the run command (see previous answer). 
  
  As before the uuids can be found from the generic endpoint.

  ```
  curl <ip or name>:8001/secret_messages/
  curl <ip or name>:8001/secret_messages/{message uuid}
  ```
</details>

## 4. Infiltrate the Administrator's Computer

<details>
  <summary>a. Answer</summary>

  TODO
</details>
<details>
  <summary>b. Answer</summary>

  TODO
</details>
<details>
  <summary>c. Answer</summary>

  TODO
</details>

## 5. Identify the Rebel Captains

<details>
  <summary>a. Answer</summary>

  You can access the database through an interactive terminal with the aquired credentials.

  ```
  docker run -it --user root jwmorley73/rebel-database psql -U leia -w r2d2-123! -d rebel-missions
  ```
</details>
<details>
  <summary>b. Answer</summary>

  Answers are in the sql file [`./services/rebel_database/database.sql`](./services/rebel_database/database.sql)
</details>
<details>
  <summary>c. Answer</summary>

  First we need a volume:

  ```
  docker volume create database-data
  ```

  Then we can run the database with the volume attached:
  
  ```
  docker run -v database-data:/var/lib/postgresql/data -d --name rebel-database jwmorley73/rebel-database:latest
  ```
</details>