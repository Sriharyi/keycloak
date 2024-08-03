# About
This Keycloak application using angular and spring boot

# Keycloak with Spring Boot Application

This project demonstrates the integration of Keycloak for authentication and authorization within a Spring Boot application. Follow the steps below to set up and run the application.

## Prerequisites

- Docker
- Docker Compose
- Curl or Postman for API testing

## Setup Instructions

### Step 1: Start Keycloak

Run the following command to start the Keycloak server using Docker Compose:

```bash
docker compose -f docker-compose-keycloak.yml up -d
```

### Step 2: Import Realm Settings

Import the realm settings using the `realm-export.json` file:

1. Log in to the Keycloak admin console using the admin credentials specified in your .env file by navigating to `http://localhost:8080/`
2. Navigate to the `Add realm` section
3. Choose `Import` and select the `realm-export.json` file

### Step 3: Create Users

Create two users:
1. **User 1**: Assign to the group `user`
2. **User 2**: Assign to the group `admin`

### Step 4: Obtain Access Token

To obtain an access token, use the following curl command:

```bash
curl -L -X POST 'http://localhost:8080/realms/security/protocol/openid-connect/token' -H 'Content-Type: application/x-www-form-urlencoded' -d 'username=dummy' -d 'password=dummy' -d 'client_id=secret-client' -d 'grant_type=password'
```

Replace `username` and `password` with the credentials of the users you created.

### Step 5: Access Secured Endpoints

Use the access token obtained in the previous step to access the secured endpoints.

**Endpoint 1:**

```bash
curl -L -X GET 'http://localhost:8081/api/v1/demo' -H 'Authorization: Bearer <access_token>'
```

**Endpoint 2:**

```bash
curl -L -X GET 'http://localhost:8081/api/v1/demo/hello-2' -H 'Authorization: Bearer <access_token>'
```

### Endpoint Access Control

- The first endpoint (`/api/v1/demo`) can be accessed by both users with `admin` and `user` groups.
- The second endpoint (`/api/v1/demo/hello-2`) can only be accessed by users with the `admin` group. Users with the `user` group will be denied access.

## Summary

This project showcases how to secure Spring Boot endpoints using Keycloak. Follow the steps to set up the Keycloak server, import realm settings, create users, and access the secured endpoints with the appropriate permissions.

Feel free to modify the steps according to your requirements. If you have any questions, please refer to the Keycloak and Spring Boot documentation for further details.

