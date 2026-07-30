#!/bin/bash
# This script copies the version from docker-compose.yml to config.json.

app_name=$1
old_version=$2

# 定义关联数组，将应用名称与其对应的 keys 关联起来
declare -A app_keys
app_keys=(["immich"]="immich-server immich-machine-learning" ["immich-no-machine"]="immich-server" ["stream-rec"]="stream-rec-backend stream-rec-frontend" ["rsshub"]="rsshub")

# 定义保留alpine版本的应用名称
app_alpine_names=("postgresql")

echo "Processing app: $app_name, old version: $old_version"

# Find all docker-compose files under apps/$app_name (there should be only one)
docker_compose_files=$(find apps/$app_name/$old_version -name docker-compose.yml)

process_image() {
    local image=$1 app_name=$2

    # Only apply changes if the format is <image>:<version>
    if [[ "$image" == *":"* ]]; then
        version=$(cut -d ":" -f2- <<< "$image")

        echo "Extracted version: $version"

        # Trim the "v" prefix
        trimmed_version=${version/#"v"}

        echo "Trimmed version: $trimmed_version"

        found_alpine=false
        for item in "${app_alpine_names[@]}"; do
            if [[ "$item" == "$app_name" ]]; then
                if [[ "$trimmed_version" == *"alpine"* ]]; then
                    found_alpine=true
                    echo "Found alpine version"
                fi
                break
            fi
        done

        # Match date version
        date_version=$(echo "$trimmed_version" | grep -oE '[0-9]{4}-[0-9]{2}-[0-9]{2}')
        if [[ -n "$date_version" ]]; then
            if [[ "$old_version" == "$date_version" ]]; then
                echo "Skipping $app_name:$old_version"
                return
            fi
            if [[ "$found_alpine" == true ]]; then
              cleaned_version="$date_version-alpine"
              echo "Date alpine version: $date_version"
            else
              cleaned_version=$date_version
              echo "Date version: $date_version"
            fi
            return
        fi

        # Match date version
        date_version=$(echo "$trimmed_version" | grep -oE '[0-9]{2}-[0-9]{2}-[0-9]{2}')
        if [[ -n "$date_version" ]]; then
            if [[ "$old_version" == "$date_version" ]]; then
                echo "Skipping $app_name:$old_version"
                return
            fi
            if [[ "$found_alpine" == true ]]; then
              cleaned_version="$date_version-alpine"
              echo "Mini Date alpine version: $date_version"
            else
              cleaned_version=$date_version
              echo "Mini Date version: $date_version"
            fi
            return
        fi

        # Match number version
        number_version=$(echo "$trimmed_version" | grep -oE '[0-9]+(\.[0-9]+){0,3}' | head -n1)
        if [[ -n "$number_version" ]]; then
            if [[ "$old_version" == "$number_version" ]]; then
                echo "Skipping $app_name:$old_version"
                return
            fi
            if [[ "$found_alpine" == true ]]; then
              cleaned_version="$number_version-alpine"
              echo "Number alpine version: $number_version"
            else
              cleaned_version=$number_version
              echo "Number version: $number_version"
            fi
            return
        fi

        echo "Could not determine version for image: $image"
    fi
}

for docker_compose_file in $docker_compose_files
do
    echo "Processing docker-compose file: $docker_compose_file"

    if [[ -n "${app_keys[$app_name]}" ]]; then
        echo "$app_name is in the app_keys list."
        IFS=' ' read -r -a keys <<< "${app_keys[$app_name]}"
        for key in "${keys[@]}"; do
            echo "Processing key: $key"
            first_service=$(yq ".services | keys | .[] | select(. == \"$key\")" $docker_compose_file)

            if [[ -n "$first_service" ]]; then
                image=$(yq .services.$first_service.image $docker_compose_file)
                echo "Found image for service $first_service: $image"

                process_image "$image" "$app_name"
            else
                echo "Key $key not found in $docker_compose_file"
            fi
        done

        if [[ -n "$cleaned_version" ]]; then
            mv apps/$app_name/$old_version apps/$app_name/$cleaned_version
            echo "Moved apps/$app_name/$old_version to apps/$app_name/$cleaned_version"
        else
            echo "Could not determine version for image: $image"
        fi
    else
        echo "$app_name is not in the app_keys list. Processing first service normally."
        first_service=$(yq '.services | keys | .[0]' $docker_compose_file)

        image=$(yq .services.$first_service.image $docker_compose_file)
        echo "Found image: $image"

        process_image "$image" "$app_name"

        if [[ -n "$cleaned_version" ]]; then
            mv apps/$app_name/$old_version apps/$app_name/$cleaned_version
            echo "Moved apps/$app_name/$old_version to apps/$app_name/$cleaned_version"
        else
            echo "Could not determine version for image: $image"
        fi
    fi
done
