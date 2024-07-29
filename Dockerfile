# Use an official Maven image with OpenJDK 11 for both build and run stages
FROM maven:3.9.8-eclipse-temurin-17-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file and download dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline

# Copy the project source code
COPY src ./src

# Build the project
RUN mvn clean package -DskipTests

# Expose the application port
EXPOSE 9090

# Run the application
ENTRYPOINT ["java", "-jar", "target/keycloak-0.0.1-SNAPSHOT.jar"]
