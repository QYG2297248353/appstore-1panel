#!/bin/bash

# 创建脚本目录
mkdir -p /home/task

# 下载脚本
wget -O /home/task/app_install_zh.sh https://install.lifebus.top/app_install_zh.sh

# 赋予执行权限
chmod +x /home/task/app_install_zh.sh

# 添加到 crontab
(crontab -l ; echo "0 */6 * * * /bin/bash /home/task/app_install_zh.sh") | crontab -

# 执行一次
/bin/bash /home/task/app_install_zh.sh
