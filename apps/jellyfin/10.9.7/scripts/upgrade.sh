#!/bin/bash

if [[ -f .env ]]; then
  source .env

  BASE_URL="https://f.lifebus.top/public/1panel/appstore/jellyfin/"

  DEJAVU_FILES=(
    "DejaVuSans.ttf"
    "DejaVuSans-Bold.ttf"
    "DejaVuSansMono.ttf"
    "DejaVuSansMono-Bold.ttf"
    "DejaVuSerif.ttf"
    "DejaVuSerif-Bold.ttf"
  )

  FONT_FILES=(
    "NotoSansMonoCJKsc-Bold.woff2"
    "NotoSansMonoCJKsc-Regular.otf"
    "NotoSansCJKsc-Regular.woff"
    "NotoSansMonoCJKsc-Regular.woff"
    "NotoSansMonoCJKsc-Regular.woff2"
    "NotoSansMonoCJKsc-Bold.otf"
    "NotoSansMonoCJKsc-Bold.woff"
    "NotoSansCJKsc-Medium.otf"
    "NotoSansCJKsc-Regular.otf"
    "NotoSansCJKsc-Thin.woff2"
    "NotoSansCJKsc-Thin.woff"
    "NotoSansCJKsc-Regular.woff2"
    "NotoSansCJKsc-Thin.otf"
    "NotoSansCJKsc-Medium.woff"
    "NotoSansCJKsc-Medium.woff2"
    "NotoSansCJKsc-Light.woff"
    "NotoSansCJKsc-Light.woff2"
    "NotoSansCJKsc-Bold.otf"
    "NotoSansCJKsc-Black.otf"
    "NotoSansCJKsc-Light.otf"
    "NotoSansCJKsc-Bold.woff"
    "NotoSansCJKsc-DemiLight.otf"
    "NotoSansCJKsc-Black.woff"
    "NotoSansCJKsc-DemiLight.woff"
    "NotoSansCJKsc-Black.woff2"
    "NotoSansCJKsc-DemiLight.woff2"
    "NotoSansCJKsc-Bold.woff2"
    "font.css"
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
