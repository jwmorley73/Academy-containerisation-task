FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /src

COPY AdminComputer.class /src/AdminComputer.class
COPY AdminComputer.java /src/AdminComputer.java

COPY notes.txt /src/hidden/findme/notes.txt

# Expose the port your application listens on (if applicable)
EXPOSE 8080

# Define the command to run your Java application
CMD ["java", "AdminComputer"]
