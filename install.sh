#!/bin/bash

# Define installation paths
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.dotfiles"

# Create the config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy the golink script to the installation directory
cp bin/golink "$INSTALL_DIR/golink"
chmod +x "$INSTALL_DIR/golink"

# Create an initial configuration file if it doesn't exist
CONFIG_FILE="$CONFIG_DIR/golink_config"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "browser=firefox" > "$CONFIG_FILE"
fi

echo "Installation completed. You can use 'golink' command now."
