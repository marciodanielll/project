
# Application Setup Guide

## Index

1. [Prerequisites](#prerequisites)
2. [Environment Variables](#environment-variables)
3. [Running the Manager Script](#running-the-manager-script)
4. [Package Management](#package-management)
5. [Git Hooks and Conventional Commits](#git-hooks-and-conventional-commits)

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

## Running the Manager Script

A script named `manager.sh` is available within the `scripts` directory to manage various environment-related tasks. The script includes options for deploying, starting, restarting, cleaning, and logging the environment.

To run the script, use:

```bash
./scripts/manager.sh
```

### Script Menu Options

Once executed, the `manager.sh` script will display a menu with the following options:

- **1. Deploy Environment**  
  Builds and starts the application container(s) in the background.

- **2. Start Environment**  
  Starts the environment container(s) without rebuilding.

- **3. Restart Environment**  
  Restarts the application container(s) to apply any changes.

- **4. Clean Environment**  
  Stops and removes containers, networks, and volumes.

- **5. Run Seeds**  
  Executes database seed commands.

- **6. Clear Seeds**  
  Clears seeded data from the database.

- **7. View App Logs**  
  Shows real-time logs from the application container.

- **8. View Database Logs**  
  Shows real-time logs from the database container.

- **9. Open Shell in App Container**  
  Opens an interactive shell within the application container.

- **10. Exit**  
  Exits the script menu.

> **Note**: Committing from within the container is supported on Unix-like systems (Linux or macOS).

## Package Management

- All packages should be installed from within the container. Run the package installation commands inside the container using the terminal command provided above.

## Git Hooks and Conventional Commits

This application uses **Husky** to set up Git hooks that ensure commits adhere to the Conventional Commits standard before they are applied. For more information about Conventional Commits and its configuration, refer to [the Conventional Commits documentation](https://www.conventionalcommits.org/).

If you need to add a scope for commit rules, go to the `commitlint.config.js` file and add the desired scope as follows:

```javascript
scopes.push(
  'core',
  'docs'
);
```
