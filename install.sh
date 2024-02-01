#!/bin/bash

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

echo "$(date): Step 1 - Cloning repository..."
git clone -b localApps https://github.com/QYG2297248353/appstore-1panel /opt/1panel/resource/apps/local/appstore-localApps

apps_directory="/opt/1panel/resource/apps/local/appstore-localApps/apps"
local_directory="/opt/1panel/resource/apps/local/"

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

for app_directory in $apps_directory/*; do
    app_name=$(basename "$app_directory")

    if [ ! -d "$local_directory/$app_name" ]; then
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): Step 3 - Copied directory $app_directory to $local_directory/"
    fi
done

# 步骤 4: 删除appstore-localApps目录
echo "$(date): Step 4 - Deleting directory /opt/1panel/resource/apps/local/appstore-localApps..."
rm -rf "/opt/1panel/resource/apps/local/appstore-localApps"
echo "$(date): Step 4 - Deleted directory /opt/1panel/resource/apps/local/appstore-localApps"
