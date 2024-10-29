
# Application Setup Guide

## Index

1. [Prerequisites](#prerequisites)
2. [Environment Variables](#environment-variables)
3. [Commands](#commands)
4. [Package Management](#package-management)
5. [Git Configurations](#git-configurations)
6. [Git Hooks and Conventional Commits](#git-hooks-and-conventional-commits)

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

3. **View the last 100 logs of the application (continuously displaying logs):**

   ```bash
   docker-compose logs -f --tail=100
   ```

4. **Access the terminal inside the container:**

   ```bash
   docker exec -it nest-app /bin/sh
   ```

5. **Restart the container:**

   ```bash
   docker-compose restart
   ```

6. **Check container status:**

   ```bash
   docker-compose ps
   ```

7. **Stop all containers:**

   ```bash
   docker-compose stop
   ```

8. **Remove containers, networks, and volumes:**

   ```bash
   docker-compose down -v
   ```

9. **Remove unused volumes:**

   ```bash
   docker volume prune
   ```

10. **Update image and recreate container:**

    ```bash
    docker-compose pull && docker-compose up -d --build
    ```

## Package Management

- All packages should be installed from within the container. Run the package installation commands inside the container using the terminal command provided above.

## Git Configurations

> Note: The container currently does not have Git configurations set up. Perform any Git-related tasks on the host machine terminal until further notice.

## Git Hooks and Conventional Commits

This application uses **Husky** to set up Git hooks that ensure commits adhere to the Conventional Commits standard before they are applied. For more information about Conventional Commits and its configuration, refer to [the Conventional Commits documentation](https://www.conventionalcommits.org/).

If you need to add a scope for commit rules, go to the `commitlint.config.js` file and add the desired scope as follows:

```javascript
scopes.push(
  'core',
  'docs'
);
```
