#!/bin/bash

echo "$(date): Step init - Checking for required commands..."
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

BASE_DIR=$(which 1pctl|xargs grep '^BASE_DIR='| cut -d'=' -f2)
echo "1panel install directory: $BASE_DIR"

if [ -z "$BASE_DIR" ]; then
    echo "Error: 1panel install directory not found."
    exit 1
fi

echo "$(date): Step 1 - Cloning repository..."
git clone -b released https://github.com/QYG2297248353/appstore-1panel $BASE_DIR"/1panel/resource/apps/local/appstore-localApps"

apps_directory=$BASE_DIR"/1panel/resource/apps/local/appstore-localApps/apps"
local_directory=$BASE_DIR"/1panel/resource/apps/local"

echo "$(date): Step 2 - Checking for updated apps..."
for app_directory in $apps_directory/*; do
    app_name=$(basename "$app_directory")

    if [ -d "$local_directory/$app_name" ]; then
        rm -rf "$local_directory/$app_name"
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): Step 2 - Copied and replaced directory $app_directory to $local_directory/"
    else
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): Step 2 - Copied directory $app_directory to $local_directory/"
    fi
done

echo "$(date): Step 3 - Checking for new apps..."
for app_directory in $apps_directory/*; do
    app_name=$(basename "$app_directory")

    if [ ! -d "$local_directory/$app_name" ]; then
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): Step 3 - Copied directory $app_directory to $local_directory/"
    fi
done

echo "$(date): Step 4 - Clean installed Directory"
rm -rf $BASE_DIR"/1panel/resource/apps/local/appstore-localApps"
echo "$(date): Step 4 - Finish clean installed Directory"

echo "$(date): Step Tip - Done!"
