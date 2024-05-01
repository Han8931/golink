#!/bin/bash

# Define installation paths
INSTALL_DIR="/usr/local/bin"
CONFIG_DIR="$HOME/.dotfiles"

# Function to check and install dependencies
check_dependencies() {
    # Check if dmenu is installed
    if ! command -v dmenu >/dev/null 2>&1; then
        echo "dmenu is not installed."

        # Detect the OS type and configure package installation commands
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case $ID in
                ubuntu|debian)
                    PKG_CMD="sudo apt update && sudo apt install -y"
                    ;;
                fedora|centos|rhel)
                    PKG_CMD="sudo dnf install -y"
                    ;;
                arch|manjaro)
                    PKG_CMD="sudo pacman -Syu --noconfirm"
                    ;;
                *)
                    echo "Unsupported distribution: $ID"
                    exit 1
                    ;;
            esac
        else
            echo "Cannot identify the OS. Manual installation required."
            exit 1
        fi

        # Prompt the user for permission to install dmenu
        read -p "Do you want to install dmenu using $PKG_CMD? (y/n) " yn
        case $yn in
            [Yy]* )
                eval $PKG_CMD dmenu
                if [ $? -ne 0 ]; then
                    echo "Failed to install dmenu. Please install it manually."
                    exit 1
                fi
                ;;
            [Nn]* )
                echo "dmenu is required for golink to work. Please install it and rerun this script."
                exit 1
                ;;
            * )
                echo "Please answer yes or no."
                check_dependencies  # Recursive call if invalid input
                ;;
        esac
    fi
}

# Create the config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Check and install dependencies
check_dependencies

# Copy the golink script to the installation directory
cp bin/golink "$INSTALL_DIR/golink"
chmod +x "$INSTALL_DIR/golink"

# Create an initial configuration file if it doesn't exist
CONFIG_FILE="$CONFIG_DIR/golink_config"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "browser=firefox" > "$CONFIG_FILE"
fi

echo "Installation completed. You can use 'golink' command now."
