# Use a Linux distribution as the base image
FROM ubuntu:latest

# Install curl and OpenJDK 8
RUN apt-get update && apt-get install -y curl openjdk-8-jdk

# Create a directory for the Tomcat installation
RUN mkdir /opt/tomcat

# Download and extract Tomcat version 8.5.87
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.87/bin/apache-tomcat-8.5.87.tar.gz \
    && tar xzf apache-tomcat-8.5.87.tar.gz -C /opt/tomcat --strip-components=1 \
    && rm apache-tomcat-8.5.87.tar.gz

# Copy the WAR file into the webapps folder
COPY web.war /opt/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Set the working directory to the Tomcat installation directory
WORKDIR /opt/tomcat

# Start Tomcat
CMD ["bin/catalina.sh", "run"]

