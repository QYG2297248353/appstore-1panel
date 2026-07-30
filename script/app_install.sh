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

if [ ! -w "$BASE_DIR" ]; then
    echo "Error: No write permission to the 1panel install directory."
    echo "Please run as a superuser."
    exit 1
fi

TARGET_DIR="${BASE_DIR}/1panel/resource/apps/local/appstore-localApps"
if [ ! -d "$TARGET_DIR" ]; then
    mkdir -p "$TARGET_DIR"
fi

if [ ! -w "$TARGET_DIR" ]; then
    echo "Error: No write permission to the target directory."
    echo "Please run as a superuser."
    exit 1
fi

echo "$(date): Step 1 - Cloning repository..."
repos=(
    'https://github.com/QYG2297248353/appstore-1panel'
    'https://gitee.com/qyg2297248353/appstore-1panel'
    'https://gitea.com/QYG2297248353/appstore-1panel'
)

if [ -d "${BASE_DIR:?}/1panel/resource/apps/local/appstore-localApps" ]; then
    rm -rf "${BASE_DIR:?}/1panel/resource/apps/local/appstore-localApps"
fi

for repo in "${repos[@]}"; do
    echo "$(date): Step 1 - Cloning repository: $repo"
    git clone --depth 1 -b released "$repo" "${BASE_DIR:?}/1panel/resource/apps/local/appstore-localApps" && break
done

if [ ! -d "${BASE_DIR:?}/1panel/resource/apps/local/appstore-localApps" ]; then
    echo "Error: Failed to clone repository."
    exit 1
fi

APPS_DIR="$BASE_DIR/1panel/resource/apps/local/appstore-localApps/apps"
LOCAL_DIR="$BASE_DIR/1panel/resource/apps/local"
ENVS_DIR="$BASE_DIR/1panel/resource/apps/local/appstore-localApps/envs"
DEST_ENVS_DIR="/etc/1panel/envs"

echo "$(date): Step 2 - Checking for updated apps..."

if [ ! -w "$LOCAL_DIR" ]; then
    echo "Error: No write permission to $LOCAL_DIR."
    echo "Please run as a superuser."
    exit 1
fi

if [ ! -d "$DEST_ENVS_DIR" ]; then
    mkdir -p "$DEST_ENVS_DIR"
fi

if [ ! -w "$DEST_ENVS_DIR" ]; then
    echo "Error: No write permission to $DEST_ENVS_DIR."
    echo "Please run as a superuser."
    exit 1
fi

for app_directory in "${APPS_DIR:?}"/*; do
    app_name=$(basename "$app_directory")

    if [ -d "${LOCAL_DIR:?}/$app_name" ]; then
        rm -rf "${LOCAL_DIR:?}/$app_name"
        cp -r "${app_directory:?}" "${LOCAL_DIR:?}/"
        echo "$(date): Step 2 - Upgraded applications $app_name"
        echo "$(date): Step 2 - Copied and replaced directory $app_directory to $LOCAL_DIR/"
    else
        cp -r "${app_directory:?}" "${LOCAL_DIR:?}/"
        echo "$(date): Step 2 - Installed applications $app_name"
        echo "$(date): Step 2 - Copied directory $app_directory to $LOCAL_DIR/"
    fi
done

echo "$(date): Step 3 - Copying envs directory..."
if [ -d "${ENVS_DIR:?}" ]; then
    rm -rf "${DEST_ENVS_DIR:?}"
    mkdir -p "${DEST_ENVS_DIR:?}"
    cp -r "${ENVS_DIR:?}/"* "${DEST_ENVS_DIR:?}/"
    echo "$(date): Step 3 - Copied envs directory to $DEST_ENVS_DIR/"
else
    echo "$(date): Step 3 - Envs directory not found, skipping."
fi

echo "$(date): Step 4 - Cleaning installed directory..."
rm -rf "${BASE_DIR:?}/1panel/resource/apps/local/appstore-localApps"
echo "$(date): Step 4 - Finished cleaning installed directory"

echo "$(date): Step Tip - Installation completed!"
echo "$(date): Step Tip - Copyright© 2024 Xinjiang Mengsen Software Development Studio."
echo "$(date): Step Tip - https://blog.lifebus.top/"
echo "$(date): Step Tip - Done!"
