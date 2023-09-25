# Imperial Mission Log

<p align="center">
    <img src="./images/empire-logo.png" width="50%" style="text-align: center;">
</p>

## Imperial Directive: Infiltrate Rebel Networks

Greetings, loyal servants of the Galactic Empire. Our mission is to acquire vital intelligence from the Rebel Alliance and bring them to justice. Remember, the Force is with us as we embark on this mission. There are many tasks at hand.

### 1. Seize the Rebel Database

**Objective:** Procure the Rebel Alliance database without delay.

The rebel alliance organise their missions through a central databse. We have determined its location but now need to download and deploy it to investigate further. We have yet to aquire the credentials so just need to ensure the container is running for now...

**Execution:**

- Download the database image from DockerHub. It is known under the tag `rebel-database:latest`
- Launch the database with default settings
- Verify the database's status, ensuring it is running as intended

In the absence of credentials, we must proceed to the next phases to secure them. We must determine the `<database name>`, `<database admin username>` and the `<database admin password>`.

### 2. Obtain a Rebel Communications Device

**Objective:** Construct and deploy a Rebel Communications Device for intelligence gathering.

We have found a rebel communications api! It may contain secrets relating to the name of the rebel database. We must deploy it immediatly and begin probing. 

**Execution:**

- Construct the Rebel Communications image from the local files in the directory [`./services/rebel_communications`](./services/rebel_communications/)
- Launch the Rebel device and ensure the contianer is operational
- Securely bind the device to your host and access the api. The api is running on the port 8000.
- Intercept Rebel transmissions via the API and uncover any traces leading to the database's identity. You can do this by accessing the device's API endpoint using a web browser (`<host>:<port>/docs`) or tools like `curl` or `wget`. The endpoints of interest are `/messages/` and `/messages/{message uuid}`.

### 3. Breach the Secret Rebel Communications

**Objective:** Gain unauthorized access to the Rebel's secret communication network.

Those sneeky rebels have an even more secure communications api. This time they have setup checks to only allow requests from a specific network. We must crack their security to find the username of the database admin.

**Execution:**

- Construct the Rebel Communications image from the local files in the directory [`./services/rebel_secret_communications`](./services/rebel_secret_communications/)
- Launch the communications device into the default docker network (or a custom one if you are feeling adventurous)
- Determine the ip or hostname of the launched communications device
- Access the device from another container launched on the same network
- Extract the name of the elusive database administrator from within the secret device's environment. These can be found from the endpoints `/secret_messages/` and `/secret_messages/{message uuid}` on port 8001.

### 4. Infiltrate the Administrator's Computer

**Objective:** Gain access to the Rebel Administrator's terminal.

Now we know the name of the admin user we can try to gain access to their files and see if they have left their password lying arround. We must build a container of their computer and find this password. 

The previous troopers did a sloppy job, there are errors everywhere! Rest assured this incopetance has been dealt with, but the error logs the machine now produces may be insightfull...

**Execution:**

- Assemble the Administrator's computer
- Exfiltrate critical data logs to locate the precise address of the password file
- Copy the passwords file from the logs directory to uncover the elusive database access key.

### 5. Identify the Rebel Captains

**Objective:** Unearth the identities of the Rebel Captains using acquired credentials.

Now we have all the credential we can finally put the pieces together and find those pesky captains. 

**Execution:**

- Utilize the credentials secured earlier to infiltrate the Rebel database. You can access the postgres terminal by running ```psql -U <username> -w <password> -d <name>``` from within the database container
- Employ the dark arts of SQL to execute queries and unearth the Rebel Captain's identities.

May the Emperor's guidance be with you as we strive to crush the Rebel scum and maintain order in the galaxy. Your unwavering loyalty to the Empire will be rewarded.