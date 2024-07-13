#!/bin/bash

# Define the installation directory
INSTALL_DIR="/usr/local/bin"

# Check if the script has sudo privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or using sudo"
  exit 1
fi

# Copy the ios-hot-reload script to the installation directory
cp ios-hot-reload "$INSTALL_DIR"

# Make the script executable
chmod +x "$INSTALL_DIR/ios-hot-reload"

echo "ios-hot-reload has been installed to $INSTALL_DIR"
echo "You can now use it by running 'ios-hot-reload' in any Xcode project directory."
