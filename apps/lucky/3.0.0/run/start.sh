#!/bin/sh

DEFAULT_PORT=16601
PORT_FILE="/app/conf/port"
WAIT_SECONDS=30
DELAY_AFTER_PORT_UP=5

if [ -f "$PORT_FILE" ]; then
    DETECT_PORT=$(cat "$PORT_FILE")
    echo "Loaded last port: ${DETECT_PORT}"
else
    DETECT_PORT=$DEFAULT_PORT
    echo "No previous port found, using default port: ${DETECT_PORT}"
fi

/app/lucky -c /app/conf/lucky.conf -runInDocker &
MAIN_PID=$!

echo "Lucky main started with PID $MAIN_PID"

echo "Waiting for lucky to listen on port ${DETECT_PORT} (timeout ${WAIT_SECONDS}s)..."
SECONDS_WAITED=0
while ! nc -z 127.0.0.1 "${DETECT_PORT}" 2>/dev/null; do
    sleep 1
    SECONDS_WAITED=$((SECONDS_WAITED + 1))

    if [ "$SECONDS_WAITED" -ge "$WAIT_SECONDS" ]; then
        echo "Timeout waiting for port ${DETECT_PORT}, continue startup..."
        break
    fi
done

if nc -z 127.0.0.1 "${DETECT_PORT}" 2>/dev/null; then
    echo "Port ${DETECT_PORT} is up. Waiting extra ${DELAY_AFTER_PORT_UP}s..."
    sleep ${DELAY_AFTER_PORT_UP}
else
    echo "Port ${DETECT_PORT} still not open, continuing anyway."
fi

echo "Running: /app/lucky -rSetHttpAdminPort=${PANEL_APP_PORT_HTTP}"
/app/lucky -rSetHttpAdminPort="${PANEL_APP_PORT_HTTP}"

echo "Running: /app/lucky -rSetHttpsAdminPort=${PANEL_APP_PORT_HTTP}"
/app/lucky -rSetHttpsAdminPort="${PANEL_APP_PORT_HTTP}"

DIR=$(dirname "$PORT_FILE")
mkdir -p "$DIR"

echo "${PANEL_APP_PORT_HTTP}" > "$PORT_FILE"
echo "Saved admin port ${PANEL_APP_PORT_HTTP} to ${PORT_FILE}"

wait $MAIN_PID
