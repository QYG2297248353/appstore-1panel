#!/bin/bash

# 删除定时任务
crontab -l | grep -v '/home/task/app_install_zh.sh' | crontab -

# 删除脚本文件
rm -f /home/task/app_install_zh.sh
