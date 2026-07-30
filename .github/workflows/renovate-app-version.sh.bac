#!/bin/bash
# This script copies the version from docker-compose.yml to config.json.

app_name=$1
old_version=$2

echo "Processing app: $app_name, old version: $old_version"

# Find all docker-compose files under apps/$app_name (there should be only one)
docker_compose_files=$(find apps/$app_name/$old_version -name docker-compose.yml)

for docker_compose_file in $docker_compose_files
do
    echo "Processing docker-compose file: $docker_compose_file"

    # Assuming that the app version will be from the first docker image
    first_service=$(yq '.services | keys | .[0]' $docker_compose_file)

    image=$(yq .services.$first_service.image $docker_compose_file)

    echo "Found image: $image"

    # Only apply changes if the format is <image>:<version>
    if [[ "$image" == *":"* ]]; then
        version=$(cut -d ":" -f2- <<< "$image")

        echo "Extracted version: $version"

        # Trim the "v" prefix
        trimmed_version=${version/#"v"}

        echo "Trimmed version: $trimmed_version"

        # Remove any suffixes (like -ffmpeg) for versioning purposes
        cleaned_version=$(echo $trimmed_version | grep -oE '^[0-9]+(\.[0-9]+){0,4}')

        echo "Cleaned version: $cleaned_version"

        # Handle special versions with dates and other formats
        if [[ -z "$cleaned_version" && "$trimmed_version" =~ ^RELEASE\.[0-9]{4}-[0-9]{2}-[0-9]{2} ]]; then
            # Handle minio version format RELEASE.YYYY-MM-DDTHH-MM-SSZ
            cleaned_version=$(echo $trimmed_version | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}')
        fi

        echo "Final version: $cleaned_version"

        # Move to the new versioned directory
        if [[ -n "$cleaned_version" ]]; then
            mv apps/$app_name/$old_version apps/$app_name/$cleaned_version

            echo "Moved $old_version to $cleaned_version"
        else
            echo "Could not determine version for image: $image"
        fi
    fi
done
