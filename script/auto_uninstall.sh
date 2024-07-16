#!/bin/bash

crontab -l | grep -v '/home/task/app_install.sh' | crontab -
crontab -l | grep -v '/home/task/app_install_zh.sh' | crontab -

rm -f /home/task/app_install.sh
rm -f /home/task/app_install_zh.sh
