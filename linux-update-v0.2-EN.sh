#!/bin/bash

# Color definitions for messages
GREEN="\e[32m"       # Green color for informational messages
YELLOW="\e[33m"      # Yellow color for warning messages
RESET="\e[0m"        # Reset color to default

# A function to print informational messages
function print_message {
    echo -e "${GREEN}$1${RESET}"
}

# A function to print warning messages
function print_warning {
    echo -e "${YELLOW}$1${RESET}"
}

# Display the script title
echo "
   ______      __                                         
  / ____/_  __/ /_  ___  _______  ______  ____  ___  _____
 / /   / / / / __ \/ _ \/ ___/ / / / __ \/ __ \/ _ \/ ___/
/ /___/ /_/ / /_/ /  __/ /  / /_/ / / / / / / /  __/ /    
\____/\__, /_.___/\___/_/   \__,_/_/ /_/_/ /_/\___/_/     
     /____/                                               
"
sleep 1

# Start of the update process
print_message "Starting the Linux update process..."

# Update the package database
print_message "Updating the package database..."
sudo apt update

# Apply system upgrades
print_message "Applying system upgrades..."
sudo apt full-upgrade -y

# Clean up unused packages
print_message "Cleaning up unused packages..."
sudo apt autoremove -y

# Check for security updates
print_warning "Checking for security updates..."
sudo unattended-upgrade --dry-run --debug

# Completion of the update process
print_message "Linux update process completed successfully :D"
