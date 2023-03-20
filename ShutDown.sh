#!/bin/bash

clear

# Check if the system uses yum or apt-get and inform the user
if command -v yum >/dev/null 2>&1; then
    echo -e "\033[36mYum\033[0m package manager detected"
elif command -v apt-get >/dev/null 2>&1; then
    echo -e "\033[36mApt-get\033[0m package manager detected"
else
    echo -e "\033[31mNo package manager detected\033[0m"
fi

# Check for updates and inform the user
echo -e "\n\033[33mChecking for updates...\033[0m"
if command -v yum >/dev/null 2>&1; then
    sudo yum check-update
elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
fi

# Wait for 10 seconds and shut down
sleep 10
echo -e "\n\033[31mShutting down...\033[0m"
sudo shutdown now

# Exit the script
exit 0