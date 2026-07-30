#!/bin/bash

echo "$(date): Step Tip - Start installing the 1Panel third-party app store"
echo "$(date): Step Init - Checking for required commands..."

check_command() {
    command -v "$1" > /dev/null 2>&1 || {
        echo >&2 "Error: $1 is not installed. Please install it and try again."
        exit 1
    }
}

check_command "git"
check_command "cp"
check_command "rm"
check_command "echo"
check_command "which"
check_command "xargs"
check_command "grep"
check_command "cut"

BASE_DIR=$(which 1pctl | xargs grep '^BASE_DIR=' | cut -d'=' -f2)
echo "Step Init - 1panel install directory: $BASE_DIR"

if [ -z "$BASE_DIR" ]; then
    echo "Error: 1panel install directory not found."
    exit 1
fi

LOCAL_DIR="$BASE_DIR/1panel/resource/apps/local"

echo "$(date): Step 1 - Uninstalling applications..."
for app in "$LOCAL_DIR"/*; do
    if [ -d "$app" ]; then
        echo "$(date): Step 1 - Uninstalling $(basename "$app")..."
        rm -rf "$app"
    fi
done

echo "$(date): Step Tip - Uninstalling the 1Panel third-party app store completed!"
echo "$(date): Step Tip - Copyright© 2024 Xinjiang Mengsen Software Development Studio."
echo "$(date): Step Tip - https://blog.lifebus.top/"
echo "$(date): Step Tip - Done!"
