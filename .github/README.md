> [!IMPORTANT]
> 本仓库已停止更新，文档与安装脚本已迁移至 [MengSenStudio/AppStore-1panel](https://github.com/MengSenStudio/AppStore-1panel)。
> 请前往新仓库查看最新文档、提交 Issue 与获取安装脚本。

# 1Panel 应用商店

面向 [1Panel](https://1panel.cn/) 的第三方 Docker 应用商店，由 [`新疆萌森软件开发工作室`](https://blog.lifebus.top/) 维护。

仓库中的每个应用均为 `docker-compose` 形式，按 `apps/<应用名>/<版本>/` 组织，可直接被 1Panel 识别为本地应用。

> [!NOTE]
> 仓库地址：[https://github.com/MengSenStudio/AppStore-1panel](https://github.com/MengSenStudio/AppStore-1panel)
>
> 问题反馈：[Issues](https://github.com/MengSenStudio/AppStore-1panel/issues)

## 仓库信息

| 项目 | 说明 |
|---|---|
| 仓库 | `MengSenStudio/AppStore-1panel` |
| 默认分支 | `custom`：应用源文件与安装脚本 |
| 发布分支 | `released`：由 `custom` 定时同步，安装脚本克隆该分支 |
| 安装脚本 | [install.lifebus.top](https://install.lifebus.top/) |
| Release | [install](https://github.com/MengSenStudio/AppStore-1panel/releases/tag/install)：存放安装脚本副本 |
| 自动化 | Renovate 定时检查镜像版本并提交更新 PR |

### 目录结构

```
apps/        应用源文件（应用名/版本/docker-compose.yml）
script/      安装与卸载脚本
dockge/      Dockge 使用的应用列表
appstore/    应用商店数据（自动生成）
envs/        应用公共环境变量
```

> 应用清单请直接浏览 [`apps`](https://github.com/MengSenStudio/AppStore-1panel/tree/custom/apps) 目录。

## 快速开始（1Panel）

安装脚本会自动把应用同步到 1Panel 的本地应用目录，执行后在应用商店点击 `更新应用列表` 即可看到应用。

```sh
curl -sSL https://install.lifebus.top/auto_install.sh | bash
```

> 每三小时自动更新一次应用列表；卸载自动化脚本（不会卸载应用）：

```sh
curl -sSL https://install.lifebus.top/auto_uninstall.sh | bash
```

更多安装方式（手动执行、计划任务、网络代理、Pre 尝鲜版、清理本地应用）请见下文。

---

## 1Panel 导入应用商店

> 温馨提示：
> 当您已安装其他第三方库时并且存在应用冲突，安装过程中会主动删除冲突的第三方库应用，如果您不同意，请不要执行脚本。
>
> 我们建议您在安装之前备份您的数据，或手动安装。
>
> 如果您不使用 `curl` 命令，可以使用 `wget` 命令代替。
>
> 将 `curl -sSL` 替换为 `wget -qO-` 即可。
>
> 脚本执行成功后，会自动将应用添加到 `1Panel` 应用商店中，在应用商店页执行 `更新应用列表` 即可看到新应用。

### 自动化安装

一键式安装，无需手动操作，自动完成 1Panel应用 上架应用商店。

每三小时自动更新一次应用列表。

```sh
curl -sSL https://install.lifebus.top/auto_install.sh | bash
```

> 卸载自动化脚本 (不会卸载应用)

```sh
curl -sSL https://install.lifebus.top/auto_uninstall.sh | bash
```

如需卸载应用列表，您可以手动删除以下目录：

+ 应用目录：`${1panel应用目录}/resource/apps/local`

+ 应用公共文件目录：`/etc/1panel/envs`

+ 应用数据目录：`${应用持久化目录}`

### 手动安装模式

更新时机由自己把握，手动执行命令。

```sh
curl -sSL https://install.lifebus.top/app_install.sh | bash
```

### 计划任务模式

将内容写入Shell计划任务中，设定定期执行。

```sh
#!/bin/bash

# 此处可以定义代理方案

script_url="https://install.lifebus.top/app_install.sh"

echo "Downloading and executing script from $script_url..."
bash <(curl -sL "$script_url")

echo "Script execution completed."

```

#### 配置脚本网络代理

如果您的网络环境需要代理，请在脚本执行前配置代理。

可将以下脚本插入到 `计划任务模式` 的脚本中。

```sh
proxy_protocols="http"
proxy_server="server address"
proxy_port="server port"
export http_proxy="$proxy_protocols://$proxy_server:$proxy_port"
export https_proxy="$proxy_protocols://$proxy_server:$proxy_port"
```

---

### 安装 `Pre 尝鲜版` 应用 (不推荐)

> 说明：
>
> `Pre 尝鲜版` 应用为测试版本，可能存在未知问题，我们建议您在测试环境中使用。

#### 安装尝鲜版应用

```sh
curl -sSL https://install.lifebus.top/pre_app_install.sh | bash
```

#### 卸载尝鲜版应用

```sh
curl -sSL https://install.lifebus.top/pre_app_uninstall.sh | bash
```

---

### 卸载所有本地应用

通过此脚本，您可以卸载所有本地应用(包含您从其他三方库中导入的应用)，但是不会删除数据。

可能您的库中遗留了一些无用的应用，您可以通过此脚本进行清理。该脚本不影响 `自动化脚本` 的应用更新。

**此脚本必须`root`用户执行**

```sh
curl -sSL https://install.lifebus.top/local_app_uninstall.sh | bash
```

## 1Panel v2 (自动同步)

由于官方不支持自动同步本地应用，每次都需要用户手动去点击同步按钮。我们多次提交过意见，奈何没有得到官方重视。因此出了这个折中方案。

### 前置条件

1. API 密钥
   请前往 `面板设置` >> `API 接口` 中生成 `接口密钥` 有效期填写 `0` 长期有效，白名单可以填写 `127.0.0.1`

### 创建计划任务

请将 `API_KEY` `PANEL_PORT` 填写为正确的值即可

```bash
#!/bin/bash

#############################################
# 用户需填写的变量
#############################################

API_KEY="面板API密钥"
PANEL_HOST="127.0.0.1"
PANEL_PORT="面板访问端口"

# 两个接口地址（不用动）
API_SYNC_LOCAL="/api/v2/apps/sync/local"
# 如果您使用v2旧版，这里应该使用 /api/v2/files/read
API_READ_FILE="/api/v2/files/read/task"

#############################################
# 工具函数
#############################################

# 生成 UUID（Linux 通用方法）
gen_uuid() {
    cat /proc/sys/kernel/random/uuid
}

# 生成 token
gen_token() {
    local ts=$(date +%s)
    local tk=$(echo -n "1panel${API_KEY}${ts}" | md5sum | awk '{print $1}')
    echo "${tk},${ts}"
}

# 判断系统是否有 jq
HAS_JQ=0
if command -v jq >/dev/null 2>&1; then
    HAS_JQ=1
fi

#############################################
# 主逻辑开始
#############################################

TASK_ID=$(gen_uuid)
echo "📌 生成 Task ID: ${TASK_ID}"
echo ""

TOKEN_INFO=$(gen_token)
TOKEN=$(echo "$TOKEN_INFO" | cut -d',' -f1)
TIMESTAMP=$(echo "$TOKEN_INFO" | cut -d',' -f2)

echo "📌 时间戳: $TIMESTAMP"
echo "📌 Token: $TOKEN"
echo ""

#################################################
# STEP 1 — 触发同步任务
#################################################
echo "🚀 STEP 1: 调用接口 1 开始同步任务..."
echo "POST http://${PANEL_HOST}:${PANEL_PORT}${API_SYNC_LOCAL}"

RESP1=$(curl -s -X POST "http://${PANEL_HOST}:${PANEL_PORT}${API_SYNC_LOCAL}" \
    -H "1Panel-Token: ${TOKEN}" \
    -H "1Panel-Timestamp: ${TIMESTAMP}" \
    -H "Content-Type: application/json" \
    -d "{\"taskID\":\"${TASK_ID}\"}")

echo "返回内容：$RESP1"
echo ""

CODE1=$(echo "$RESP1" | grep -o '"code":[0-9]*' | cut -d: -f2)
if [ "$CODE1" != "200" ]; then
    echo "❌ 启动任务失败，停止执行！"
    exit 1
fi

echo "✅ 任务启动成功！"
echo ""

#################################################
# STEP 2 — 轮询任务日志接口（含 jq / 无 jq 双模式）
#################################################
echo "🚀 STEP 2: 查询任务执行状态..."
echo "POST http://${PANEL_HOST}:${PANEL_PORT}${API_READ_FILE}"
echo ""

LAST_LINE_COUNT=0

while true; do
    TOKEN_INFO=$(gen_token)
    TOKEN=$(echo "$TOKEN_INFO" | cut -d',' -f1)
    TIMESTAMP=$(echo "$TOKEN_INFO" | cut -d',' -f2)

    RESP2=$(curl -s -X POST "http://${PANEL_HOST}:${PANEL_PORT}${API_READ_FILE}" \
        -H "1Panel-Token: ${TOKEN}" \
        -H "1Panel-Timestamp: ${TIMESTAMP}" \
        -H "Content-Type: application/json" \
        -d "{\"id\":0,\"type\":\"task\",\"name\":\"\",\"page\":1,\"pageSize\":500,\"latest\":true,\"taskID\":\"${TASK_ID}\",\"taskType\":\"\",\"taskOperate\":\"\",\"resourceID\":0}")

    #############################################
    # 有 jq：强力 JSON 解析模式
    #############################################
    if [ $HAS_JQ -eq 1 ]; then

        mapfile -t LINES < <(echo "$RESP2" | jq -r '.data.lines[]')

        TOTAL_LINES=${#LINES[@]}
        if [ $TOTAL_LINES -gt $LAST_LINE_COUNT ]; then
            for ((i=LAST_LINE_COUNT; i<TOTAL_LINES; i++)); do
                echo "${LINES[$i]}"
            done
            LAST_LINE_COUNT=$TOTAL_LINES
        fi

        if echo "$RESP2" | jq -e '.data.lines[] | select(contains("[TASK-END]"))' >/dev/null; then
            STATUS=$(echo "$RESP2" | jq -r '.data.taskStatus')
            echo ""
            echo "🎉🎉🎉 任务已结束！检测到 [TASK-END]"
            echo "执行状态：$STATUS"
            echo ""
            exit 0
        fi

    #############################################
    # 无 jq：兼容模式（grep + sed + awk）
    #############################################
    else
        LINES_BLOCK=$(echo "$RESP2" | sed -n '/"lines": \[/,/\]/p' | sed '1d;$d')

        mapfile -t LINES < <(
            echo "$LINES_BLOCK" |
            sed 's/^[[:space:]]*"//;s/"[[:space:]]*,\?$//' 
        )

        TOTAL_LINES=${#LINES[@]}

        if [ $TOTAL_LINES -gt $LAST_LINE_COUNT ]; then
            for ((i=LAST_LINE_COUNT; i<TOTAL_LINES; i++)); do
                echo "${LINES[$i]}"
            done
            LAST_LINE_COUNT=$TOTAL_LINES
        fi

        echo "$LINES_BLOCK" | grep -q "\[TASK-END\]"
        if [ $? -eq 0 ]; then
            STATUS=$(echo "$RESP2" | grep -o '"taskStatus"[[:space:]]*:[[:space:]]*"[^"]*' | sed 's/.*"//')
            echo ""
            echo "🎉🎉🎉 任务已结束！检测到 [TASK-END]"
            echo "执行状态：${STATUS:-Unknown}"
            echo ""
            exit 0
        fi
    fi

    sleep 3
done
```

## Dockge 导入应用商店

> 温馨提示：
> 导入应用列表可能会出现应用冲突，请注意备份数据。

### 手动安装

下载 `dockge` 目录，将 `dockge` 目录内应用列表放置到 `Dockge` 持久化目录下的 `stacks` 目录中。

打开 `Dockge` 面板，点击 `扫描堆栈`，完成导入应用列表。


---

## 常见问题

+ 安装脚本提示
    + 没有权限
        + 请使用 `root` 用户执行脚本
    + `curl: command not found`
        + 请安装 `curl` 命令
        + `apt install curl -y`
        + `yum install curl -y`
    + 由于安装脚本的网络问题导致安装失败
        + 请检查网络状况
        + 请尝试重新执行安装脚本
        + 请尝试使用 `wget` 命令代替 `curl` 命令
+ 升级失败
    + 检查网络状况与磁盘空间
    + 配置镜像地址
    + 尝试重新升级
    + 进行卸载重装
    + 多次升级依旧失败，请提交 Issue
+ 安装提示
    + `Error: /xxx/xxx/.env file does not exist`
        + 请手动创建 `.env` 文件，不需要填写任何内容的空文件
        + 重新点击安装
+ 前置检查
    + `前置检查` 是利用 `1Panel` 的应用特性，进行安装前的环境检查，如果您的环境不符合要求，将无法安装应用。
    + 关于 `前置检查` 依旧需要填写 `数据库` 相关连接信息，是因为其提供的能力并不是完全可靠，避免后期出现问题，我们采用持久化的方式存储。
    + 如果您的环境符合要求，但是依旧无法安装，请提交 Issue。

---

## 数据更新说明

+ 应用镜像版本由 Renovate 定时检查，小版本自动合并，大版本保留 PR 由人工审核。
+ `custom` 分支的变更每小时同步到 `released` 分支，安装脚本始终拉取 `released`。
+ 安装脚本本体位于 [install.lifebus.top](https://install.lifebus.top/)，与仓库 `script/` 目录内容保持一致。

---

## 温馨提示

安装应用前请查看应用说明，了解应用的使用方法和注意事项。
当前第三方库应用均为开源应用，我们不对应用的安全性和稳定性负责。
如果您在使用过程中遇到问题，请查看应用的官方文档或社区，或提交 Issue。

---

## 联系我们

> [!TIP]
> <img src="https://file.lifebus.top/imgs/google_gmail_logo.png" alt="Gmail" width="30"/>
>
> [Gmail 邮箱](mailto:qyg2297248353@gmail.com)
>
> 通过邮箱反馈您所遇到的问题

> [!TIP]
> <img src="https://file.lifebus.top/imgs/ms_studio_logo.png" alt="博客" width="30"/>
>
> [人生足迹 · 博客](https://blog.lifebus.top/)
> 技术分享的博客平台

> [!TIP]
> <img src="https://file.lifebus.top/imgs/github_logo.png" alt="GitHub" width="30"/>
>
> [GitHub](https://github.com/MengSenStudio/AppStore-1panel)
>
> 应用商店仓库，欢迎提交 Issue 与 PR

> [!TIP]
> <img src="https://file.lifebus.top/imgs/google_youtube_logo.png" alt="YouTube" width="30"/>
>
> [YouTube](https://www.youtube.com/@cn_ms_studio)
>
> Google旗下的视频分享网站
