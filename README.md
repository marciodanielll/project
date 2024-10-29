
# Application Setup Guide

## Prerequisites

- **Docker**: Version 27.3.1
- **Docker Compose**: Version 2.29.7

> **Important**: This application should only be run within the Docker container to avoid environmental conflicts.

## Environment Variables

Create a `.env` file in the project root directory with the following configuration:

```env
HOST_PORT=3000
CONTAINER_PORT=3000
NODE_ENV=development
```

## Commands

1. **Build the Docker container (only required on the first setup):**

   ```bash
   docker-compose up --build -d
   ```

2. **Start the application (use this command after the initial build):**

   ```bash
   docker-compose up
   ```

3. **View the last 100 logs of the application:**

   ```bash
   docker-compose logs --tail=100
   ```

4. **Access the terminal inside the container:**

   ```bash
   docker exec -it nest-app /bin/sh
   ```

## Package Management

- All packages should be installed from within the container. Run the package installation commands inside the container using the terminal command provided above.

## Git Configurations

> Note: The container currently does not have Git configurations set up. Perform any Git-related tasks on the host machine terminal until further notice.
