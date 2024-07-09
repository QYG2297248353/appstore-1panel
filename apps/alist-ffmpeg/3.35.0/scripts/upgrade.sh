#!/bin/bash

if [ -f .env ]; then
  source ./.env

  if [ -f custom.env ]; then
    while IFS= read -r line; do
      key=$(echo "$line" | cut -d'=' -f1)
      if grep -q "^$key=" custom.env; then
        sed -i "/^$key=/c\\$line" custom.env
      else
        echo "$line" >> custom.env
      fi
    done < .env
  else
    echo -e "\n# Start of .env content\n" >> custom.env
    cat .env >> custom.env
    echo -e "\n# End of .env content\n" >> custom.env
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
