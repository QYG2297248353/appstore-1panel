#!/bin/bash

if [[ -f ./.env ]]; then
  source ./.env

  mkdir -p "$JELLYFIN_ROOT_PATH"
  mkdir -p "$JELLYFIN_ROOT_PATH/cache"
  mkdir -p "$JELLYFIN_ROOT_PATH/config"
  mkdir -p "$JELLYFIN_ROOT_PATH/config/config"
  mkdir -p "$JELLYFIN_ROOT_PATH/media"

  if [ ! -f "$JELLYFIN_ROOT_PATH/config/config/network.xml" ]; then
    cp -f ./config/network.xml "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/{PANEL_APP_PORT_HTTP}/$PANEL_APP_PORT_HTTP/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/{PANEL_APP_PORT_HTTPS}/$PANEL_APP_PORT_HTTPS/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/{JELLYFIN_IPV6_ENABLE}/$JELLYFIN_IPV6_ENABLE/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
  else
    echo "network.xml already exists."
    cp -f ./config/network.xml "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<PublicPort>[0-9]\{1,5\}<\/PublicPort>/<PublicPort>$PANEL_APP_PORT_HTTP<\/PublicPort>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<HttpServerPortNumber>[0-9]\{1,5\}<\/HttpServerPortNumber>/<HttpServerPortNumber>$PANEL_APP_PORT_HTTP<\/HttpServerPortNumber>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<PublicHttpsPort>[0-9]\{1,5\}<\/PublicHttpsPort>/<PublicHttpsPort>$PANEL_APP_PORT_HTTPS<\/PublicHttpsPort>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<HttpsPortNumber>[0-9]\{1,5\}<\/HttpsPortNumber>/<HttpsPortNumber>$PANEL_APP_PORT_HTTPS<\/HttpsPortNumber>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
    sed -i "s/<EnableIPV6>[a-z]\{4,5\}<\/EnableIPV6>/<EnableIPV6>$JELLYFIN_IPV6_ENABLE<\/EnableIPV6>/g" "$JELLYFIN_ROOT_PATH/config/config/network.xml"
  fi

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
