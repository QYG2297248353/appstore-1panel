#!/bin/bash

if [[ -f ./.env ]]; then
  source .env

  BASE_URL="https://f.lifebus.top/public/1panel/appstore/jellyfin/"

  DEJAVU_FILES=(
    "DejaVuSans"
    "DejaVuSans-Bold"
    "DejaVuSansMono"
    "DejaVuSansMono-Bold"
    "DejaVuSerif"
    "DejaVuSerif-Bold"
  )

  FONT_FILES=(
    "NotoSansCJKsc-Black"
    "NotoSansMonoCJKsc-Bold"
    "NotoSansCJKsc-Bold"
    "NotoSansCJKsc-Light"
    "NotoSansMonoCJKsc-Regular"
    "NotoSansCJKsc-Regular"
    "NotoSansCJKsc-DemiLight"
    "NotoSansCJKsc-Medium"
    "NotoSansCJKsc-Thin"
    "NotoSansCJKsc-Black"
    "NotoSansMonoCJKsc-Bold"
    "NotoSansCJKsc-Bold"
    "NotoSansCJKsc-Medium"
    "NotoSansMonoCJKsc-Regular"
    "NotoSansCJKsc-Regular"
    "NotoSansCJKsc-DemiLight"
    "NotoSansCJKsc-Light"
    "NotoSansCJKsc-Thin"
  )

  if [ ! -d "$JELLYFIN_ROOT_PATH/config/font" ]; then
    mkdir -p "$JELLYFIN_ROOT_PATH/config/font"
    for FILE in "${FONT_FILES[@]}"; do
      wget -q "${BASE_URL}font/${FILE}" -P "$JELLYFIN_ROOT_PATH/config/font/" || echo "Failed to download $FILE, continuing..."
    done
  fi

  if [ ! -d "$JELLYFIN_ROOT_PATH/config/dejavu" ]; then
    mkdir -p "$JELLYFIN_ROOT_PATH/config/dejavu"
    for FILE in "${DEJAVU_FILES[@]}"; do
      wget -q "${BASE_URL}dejavu/${FILE}" -P "$JELLYFIN_ROOT_PATH/config/dejavu/" || echo "Failed to download $FILE, continuing..."
    done
  fi

  echo "Check Finish."

else
  echo "Error: .env file not found."
fi
