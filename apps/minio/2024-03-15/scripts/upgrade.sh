#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  if grep -q "MINIO_IMAGE" ./.env; then
    echo "MINIO_IMAGE 已存在"
  else
    echo 'MINIO_IMAGE="minio/minio:RELEASE.2024-03-15T01-07-19Z"' >> ./.env
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi
