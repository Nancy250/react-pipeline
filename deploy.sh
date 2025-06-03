#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define variables
APP_DIR="/var/www/html/dino-game"  #actual app directory
REPO_BRANCH="main"  # Change if your branch is different

# Navigate to the application directory
cd "$APP_DIR"

# Pull the latest changes from the repository
git pull origin "$REPO_BRANCH"

# Install dependencies
npm install

# Build the React application for production
npm run build

# Copy the build files to the Nginx HTML directory
sudo mkdir -p /var/www/html/dino-game/build
sudo cp -r build/* /var/www/html/dino-game/build/

# Restart Nginx to apply the changes
sudo systemctl restart nginx
