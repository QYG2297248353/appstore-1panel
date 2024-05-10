# 哪吒监控 (nezha)

开源、轻量、易用的服务器监控、运维工具

## 准备工作

1. 准备服务器一台
2. 一个 Github 账号（或：Gitlab、Gitee）
3. 获取 OAuth2 配置信息, 用于登录
4. 一个域名，用于访问 (可选)

### OAuth2 配置

#### 获取 Github 的 Client ID 和密钥

哪吒监控接入 Github、Gitlab、Gitee 作为后台管理员账号

+ 新建一个验证应用
  以 Github 为例，登录 Github 后，打开 https://github.com/settings/developers
    + 依次选择 “OAuth Apps” - “New OAuth App”
    + Application name - 随意填写
    + Homepage URL - 填写面板的访问域名，如："http://dashboard.example.com" （你的域名）
    + Authorization callback URL - 填写回调地址，如："http://dashboard.example.com/oauth2/callback" （不要忘记/oauth2/callback）
+ 点击 “Register application”
+ 保存页面中的 Client ID，然后点击 “Generate a new client secret“，创建一个新的 Client Secret，新建的密钥仅会显示一次，请妥善保存

#### 获取 Cloudflare Access 作为 OAuth2 提供方

位于中国大陆的用户可能无法直接连接 Github，如您在使用 Github、Gitlab、Gitee 作为管理员账户登录时遇到问题，您可以优先考虑切换
使用 Cloudflare Access 作为 OAuth2 提供方作为登录方式

新建 SaaS-OIDC 应用流程

+ 前往 Zero Trust Dashboard，使用 Cloudflare 账号登录；
+ My Team -> Users -> <具体用户> -> 获取 User ID 并保存；
+ Access -> Application -> Add an Application；
+ 选择 SaaS，在 Application 中输入自定义的应用名称（例如 nezha），选择 OIDC 后点击 Add application；
+ Scopes 选择 openid, email, profile, groups；
+ Redirect URLs 填写你的 callback 地址，例如 https://dashboard.example.com/oauth2/callback；
+ 保存 Client ID、Client Secret、Issuer 地址中协议与域名的部分，例如 https://xxxxx.cloudflareaccess.com

> 使用此方式，安装 Dashboard，需要将 Endpoint 配置修改为之前保存的Issuer地址

## 配置反向代理 Nginx

```nginx
#PROXY-START/
location / {
    proxy_pass http://127.0.0.1:8008;
    proxy_set_header Host $http_host;
    proxy_set_header      Upgrade $http_upgrade;
}
location ~ ^/(ws|terminal/.+)$  {
    proxy_pass http://127.0.0.1:8008;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $http_host;
}
#PROXY-END/
```

## 关于 Agent 安装

Agent 是哪吒监控的数据采集工具，用于采集服务器的性能数据，Agent 会将数据发送到哪吒监控的服务端

### 通过管理面板安装 Agent

#### 在 Linux 中一键安装 (Ubuntu、Debian、CentOS)

+ 首先在管理面板中添加一台服务器
+ 点击新添加的服务器旁，绿色的 Linux 图标按钮，复制一键安装命令
+ 在被控端服务器中运行复制的一键安装命令，等待安装完成后返回到 Dashboard 主页查看服务器是否上线

#### 在 Windows 中一键安装

+ 首先在管理面板中添加一台服务器
+ 点击新添加的服务器旁，绿色的 Windows 图标按钮，复制一键安装命令
+ 进入 Windows 服务器，运行 PowerShell，在 PowerShell 中运行复制的安装命令
+ 如遇到确认「执行策略变更」请选择 Y
+ 等待安装完成后返回 Dashboard 主页查看服务器是否上线

> 如果在 Powershell 中运行一键安装命令时遇到错误，请尝试下方的在 Windows 中手动安装 Agent

### 通过命令行安装

1. 首先在管理面板中添加一台服务器
2. 执行下方的命令安装 Agent
3. 选择“安装监控 Agent”
4. 输入通信域名，如：”data.example.com“
5. 输入面板通信端口（gRPC 端口），默认为 5555
6. 输入 Agent 密钥，Agent 密钥在管理面板中添加服务器时生成，可以在管理面板中的“服务器”页中找到
7. 等待安装完成后返回 Dashboard 主页查看服务器是否上线

#### 在 Linux 中安装 Agent (Ubuntu、Debian、CentOS)

```shell
# Github 安装源
curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh  -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh

# 大陆镜像源
curl -L https://gitee.com/naibahq/nezha/raw/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && sudo CN=true ./nezha.sh
```

#### 在 Windows 中安装 Agent

参考文章： [哪吒探针 - Windows 客户端安装](https://nyko.me/2020/12/13/nezha-windows-client.html)

## DDNS 支持

哪吒监控支持 DDNS，可以在管理面板中添加 DDNS 配置即可修改配置文件。

如需手动修改配置文件，可以在 `/home/nezha/data/config.yaml` 中修改 `ddns` 配置。

其中 `/home/nezha` 为持久化路径，如果你的持久化路径不同，请自行替换。

## 常见问题

> Agent 有 Docker 镜像吗？

Agent 目前没有推出 Docker 镜像。
Agent 的设计思路和 Dashboard 相反，Dashboard 要尽可能不影响宿主机工作，但 Agent 则需要在宿主机中执行监控服务和运行命令。
将 Agent 放入容器中确实可以继续执行监控任务，但 WebShell 等功能无法正常运行，因此不提供 Docker 镜像。
