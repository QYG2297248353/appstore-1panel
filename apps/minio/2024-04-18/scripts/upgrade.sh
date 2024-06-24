#!/bin/bash

if [[ -f ./.env ]]; then
  source ./.env

  if grep -q "MINIO_IMAGE" ./.env; then
    echo "MINIO_IMAGE 已存在"
  else
    echo 'MINIO_IMAGE="minio/minio:RELEASE.2024-03-15T01-07-19Z"' >> ./.env
  fi

  if grep -q "MINIO_BROWSER_REDIRECT_URL" ./.env; then
    echo "MINIO_BROWSER_REDIRECT_URL 已存在"
  else
    echo 'MINIO_BROWSER_REDIRECT_URL="http://127.0.0.1:9001"' >> ./.env
  fi

  if grep -q "MINIO_SERVER_URL" ./.env; then
    echo "MINIO_SERVER_URL 已存在"
  else
    echo 'MINIO_SERVER_URL="http://127.0.0.1:9000"' >> ./.env
  fi

  echo "Check Finish."

else
  echo ".env not found."
fi