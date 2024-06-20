#!/bin/bash

echo "$(date): 感谢使用[中国特供版]"
echo "$(date): [初始化] - 基础命令检查..."
check_command() {
    command -v "$1" > /dev/null 2>&1 || {
        echo >&2 "Error: $1 is not installed. Please install it and try again."
        exit 1
    }
}

check_command "git"
check_command "cp"
check_command "rm"
check_command "echo"
check_command "which"
check_command "xargs"
check_command "grep"
check_command "cut"

BASE_DIR=$(which 1pctl|xargs grep '^BASE_DIR='| cut -d'=' -f2)
echo "$(date): [初始化] 查找到1Panel安装目录: $BASE_DIR"

if [ -z "$BASE_DIR" ]; then
    echo "$(date): [初始化][异常]: 没有找到1Panel安装目录，退出应用安装"
    exit 1
fi

echo "$(date): [步骤一] - 开始下载应用仓库..."
git clone --depth 1 -b released https://gitee.com/qyg2297248353/appstore-1panel $BASE_DIR"/1panel/resource/apps/local/appstore-localApps"

apps_directory=$BASE_DIR"/1panel/resource/apps/local/appstore-localApps/apps"
local_directory=$BASE_DIR"/1panel/resource/apps/local"

echo "$(date): [步骤二] - 检查应用更新并安装应用..."
for app_directory in $apps_directory/*; do
    app_name=$(basename "$app_directory")

    if [ -d "$local_directory/$app_name" ]; then
        rm -rf "$local_directory/$app_name"
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): [步骤二] - 更新应用 $app_directory 到 $local_directory/"
    else
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): [步骤二] - 安装应用 $app_directory 到 $local_directory/"
    fi
done

echo "$(date): [步骤三] - 安装新的应用..."
for app_directory in $apps_directory/*; do
    app_name=$(basename "$app_directory")

    if [ ! -d "$local_directory/$app_name" ]; then
        cp -r "$app_directory" "$local_directory/"
        echo "$(date): [步骤三] - 安装新应用 $app_directory 到 $local_directory/"
    fi
done

echo "$(date): [步骤四] - 清理产生的垃圾文件"
rm -rf $BASE_DIR"/1panel/resource/apps/local/appstore-localApps"
echo "$(date): [步骤四] - 清理完成"

echo "$(date): [提示] - Done!"
echo "$(date): [新疆萌森软件开发工作室] 致力于此项目的维护和更新，感谢您的支持！"
echo "$(date): [新疆萌森软件开发工作室] 企业官网：https://lifebus.top/"
echo "$(date): [新疆萌森软件开发工作室] 项目地址：https://gitee.com/qyg2297248353/appstore-1panel"
echo "$(date): [提示] - 感谢您的使用!"
