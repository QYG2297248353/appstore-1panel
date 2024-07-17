# 哪吒监控

开源、轻量、易用的服务器监控、运维工具

![哪吒监控](https://file.lifebus.top/imgs/nezha_logo.svg)

## OAuth2 配置

推荐使用 `Gitee` 或 `Gitea` 作为管理员账号登录，因为 `Github` 在中国大陆访问速度较慢。

### 获取 Github 的 Client ID 和密钥

哪吒监控接入 Github、Gitlab、Gitee 作为后台管理员账号

+ 新建一个验证应用
  以 Github 为例，登录 Github 后，打开 https://github.com/settings/developers
    + 依次选择 “OAuth Apps” - “New OAuth App”
    + Application name - 随意填写
    + Homepage URL - 填写面板的访问域名，如："http://dashboard.example.com" （你的域名）
        + Authorization callback URL - 填写回调地址，如："http://dashboard.example.com/oauth2/callback"
          （不要忘记/oauth2/callback）
+ 点击 “Register application”
+ 保存页面中的 Client ID，然后点击 “Generate a new client secret“，创建一个新的 Client Secret，新建的密钥仅会显示一次，请妥善保存

### 获取 Cloudflare Access 作为 OAuth2 提供方

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

## 反向代理

> Nginx

```nginx
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
```

## 关于 Agent 安装

Agent 是哪吒监控的数据采集工具，用于采集服务器的性能数据，Agent 会将数据发送到哪吒监控的服务端

### 在 Linux(Ubuntu、Debian、CentOS) 中安装 Agent

+ 首先在管理面板中添加一台服务器
+ 点击新添加的服务器旁，绿色的 Linux 图标按钮，复制一键安装命令
+ 在被控端服务器中运行复制的一键安装命令，等待安装完成后返回到 Dashboard 主页查看服务器是否上线

### 在 Windows 中安装 Agent

参考文章： [哪吒探针 - Windows 客户端安装](https://nyko.me/2020/12/13/nezha-windows-client.html)

## DDNS 支持

哪吒监控支持 DDNS，可以在管理面板中添加 DDNS 配置即可修改配置文件。

如需手动修改配置文件，可以在 `/home/nezha/data/config.yaml` 中修改 `ddns` 配置。

其中 `/home/nezha` 为持久化路径，如果你的持久化路径不同，请自行替换。

## 常见问题

+ 修改配置重建不生效

请前往持久化目录下的 `data` 目录中的 `config.yaml` 修改配置后，然后重启容器
