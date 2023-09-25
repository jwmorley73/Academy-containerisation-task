# Tasks

## 1. Aquire rebel database
 - Pull the rebel database from dockerhub
 - Launch the database
 - Check the database is running using ls

We dont have the credentials, move onto the next sections to aquire them

## 2. Aquire a rebel communications device
 - Build the rebel communications image
 - Launch the device
 - Bind the device to your host (the rebel device uses port 8000)
 - Read the rebel messages from the api, see if you can find the database name

## 3. Tap into the secret rebel communications
 - Build the secret communications image
 - Launch the device
 - Access the device from another container on the same network
 - Find the username of the database admin

## 3. Infiltrate the admins computer
 - Build the admins computer
 - Copy out the logs to find the password files address
 - Copy out the passwords file to find the databases password

## 4. Find the rebel captains
 - Use the credentials found previously to log into the database
 - Use SQL to find the rebel captains