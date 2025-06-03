#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Navigate to the application directory
cd /var/www/html/dino-game/build

# Pull the latest changes from the main branch
git pull origin main

# Install backend dependencies (if applicable)
npm install

# Navigate to the React frontend directory
cd client

# Install frontend dependencies
npm install

# Build the React application for production
npm run build

# Return to the root directory
cd ..

# Copy the build files to the Nginx HTML directory
sudo cp -r client/build/* /var/www/html/

# Restart Nginx to apply the changes
sudo systemctl restart nginx
