#!/bin/bash

# Define the installation directory
INSTALL_DIR="/usr/local/bin"
COMMAND_NAME="ios-hot-reload"

# Check if the script has sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or using sudo"
  exit 1
fi

# Check if the command exists
if [ ! -f "$INSTALL_DIR/$COMMAND_NAME" ]; then
  echo "Error: $COMMAND_NAME is not installed in $INSTALL_DIR"
  exit 1
fi

# Remove the command
rm "$INSTALL_DIR/$COMMAND_NAME"

if [ $? -eq 0 ]; then
  echo "$COMMAND_NAME has been successfully uninstalled from $INSTALL_DIR"
else
  echo "Error: Failed to uninstall $COMMAND_NAME"
  exit 1
fi

# Optional: Remove any related configuration files or directories
# For example, if you have any config files in the user's home directory:
# rm -rf ~/.ios-hot-reload

echo "Uninstallation complete."
