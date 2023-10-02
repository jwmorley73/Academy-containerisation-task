FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /src

COPY AdminComputer.jar /src/AdminComputer.jar

COPY notes.txt /src/hidden/findme/notes.txt

# Expose the port your application listens on (if applicable)
EXPOSE 8080

# Define the command to run your Java application
CMD ["java", "-jar", "AdminComputer.jar"]
