#!/bin/bash

mkdir -p /home/task

urls=(
    'https://install.lifebus.top/app_install.sh'
    'https://another.url/app_install.sh'
    'https://yet.another.url/app_install.sh'
)

for url in "${urls[@]}"; do
    wget -O /home/task/app_install.sh "$url" && break
done

if [[ -f /home/task/app_install.sh ]]; then
    chmod +x /home/task/app_install.sh

    crontab -l | grep -v '/home/task/app_install.sh' | crontab -
    crontab -l | grep -v '/home/task/app_install_zh.sh' | crontab -

    (crontab -l ; echo "0 */3 * * * /bin/bash /home/task/app_install.sh") | crontab -

    /bin/bash /home/task/app_install.sh
else
    echo "网络异常，请检查您的网络状态。"
fi
