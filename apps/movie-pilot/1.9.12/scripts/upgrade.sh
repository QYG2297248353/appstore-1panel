#!/bin/bash

if [ -f .env ]; then
  source ./.env

  if [ -d "env" ]; then
    env_files=$(ls env/*.env)
  else
    env_files=""
  fi
  temp_file=$(mktemp)
  while IFS= read -r line; do
    echo "$line" >> "$temp_file"
    if [[ "$line" =~ ^[[:space:]]+[a-zA-Z0-9_-]+: ]]; then
      app_name_line="$line"
      in_service_section=1
    fi
    if [[ "$in_service_section" -eq 1 && "$line" =~ ^[[:space:]]+image: ]]; then
      echo "    env_file:" >> "$temp_file"
      if [ -n "$env_files" ]; then
        for file in $env_files; do
          echo "      - ./$file" >> "$temp_file"
        done
      fi
      echo "      - ./.env" >> "$temp_file"
      in_service_section=0
    fi
  done < docker-compose.yml
  mv "$temp_file" docker-compose.yml

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
