# Outline

## 您团队的知识库

迷失在混乱的文档中？不太确定谁有权访问？同事在聊天中反复请求相同的信息？是时候整理团队的知识了。

#### 直观的编辑体

一个极快的编辑器，支持 Markdown、斜杠命令、交互式嵌入等等。

#### 多人协作演讲

与团队成员实时协作处理文档。评论和话题让对话井井有条。

#### 强大的搜索和问答功能

立即在您的工作空间中进行搜索，并提出有关文档的问题以获得直接的 AI 答案。

#### 与 Slack 集成

无需离开聊天即可搜索、共享文档并提出问题。文档更新时向频道发布通知。

#### 公开分享

通过链接公开共享文档，或与团队私下共享文档。使用您自己的品牌颜色、徽标和域名。

### 更多特点

+ 速度极快

Outline 速度很快，真的很快。我们努力确保毫秒级响应时间 - 文档立即加载、搜索快速、用户界面导航快捷。

+ 协作性

Outline 经过精心设计，功能强大、实时且易于使用。阅读和编写文档应该是一件令人愉快的事情。

+ 深色模式

对于夜猫子来说，我们已经为您提供了帮助。 Outline 具有漂亮的深色模式，既养眼又美观。

+ 安全和权限

通过读写权限、用户组、来宾用户、公共共享等管理知识库……

+ 20+ 集成

简单集成到您日常使用的工具中，例如 Slack、Figma、Loom 等。找不到您需要的集成？还有一个开放的API。

+ 用您的语言

Outline 支持 RTL，并包含 17 种语言的翻译，包括 🇫🇷 法语、🇪🇸 西班牙语、🇩🇪 德语、🇰🇷 韩语和 🇨🇳 中文。

+ 建于公共场所

Outline 会定期更新新功能和修复，请查看我们的公共变更日志以了解进展情况！

+ 开源

Outline的源代码是公开的，开发是公开完成的。更喜欢托管在您自己的基础设施上？没问题。

+ 可定制

自定义域允许您拥有docs.yourteam.com。带有您自己的品牌和颜色的白色标签。

## 安装说明

环境支持：

+ 数据库：PostgreSQL
+ 缓存：Redis

### `SECRET_KEY` 安全密钥

> 该密钥用于加密数据，丢失后将无法解密数据。

请填写 `十六进制编码的32字节` 密钥，例如 `fbad4f5da794acbc10f060cdfcf8673300f3302d87f076d7f6e781d4840e9c3d`。

生成方式：

SSH 进入服务器，执行 `openssl rand -hex 32`。

```shell
openssl rand -hex 32
```

### `UTILS_SECRET` 工具密钥

格式不重要，只要是一个长字符串即可。

当然，您可以使用 `openssl rand -hex 32` 生成。

### 'DATABASE_URL' 数据库链接

基本格式

```shell
postgres://username:password@hostname:port/database
```

示例

```shell
postgres://outline:outline@127.0.0.1:5432/outline
```

### 'REDIS_URL' 缓存链接

基本格式

```shell
redis://hostname:port
```

示例

```shell
redis://127.0.0.1:6379
```

含密码格式

```shell
redis://:password@hostname:port
```

示例
`outline` 为 密码 `:` 与 `@` 不可省略

```shell
redis://:outline@127.0.0.1:6379
```

### AUTHENTICATION 鉴权选择

至少选择一种鉴权方式，填写对应的配置信息。

#### `Slack` 集成

配置：`https://api.slack.com/apps`

回调地址：`https://<URL>/auth/slack.callback`

```shell
# Slack 客户端 ID (鉴权方式)
SLACK_CLIENT_ID=
# Slack 客户端 密钥 (鉴权方式)
SLACK_CLIENT_SECRET=
```

#### `Google Auth` 集成

配置：`https://console.cloud.google.com/apis/credentials`

回调地址：`https://<URL>/auth/google.callback`

```shell
# Google 客户端 ID (鉴权方式)
GOOGLE_CLIENT_ID=
# Google 客户端 密钥 (鉴权方式)
GOOGLE_CLIENT_SECRET=
```

#### `Microsoft/Azure` 集成

配置：`https://docs.getoutline.com/s/dfa77e56-d4d2-4b51-8ff8-84ea6608faa4`

回调地址：`https://<URL>/auth/azure.callback`

```shell
# Azure 客户端 ID (鉴权方式)
AZURE_CLIENT_ID=
# Azure 客户端 密钥 (鉴权方式)
AZURE_CLIENT_SECRET=
# Azure 资源应用 ID (鉴权方式)
AZURE_RESOURCE_APP_ID=
```

#### `GitHub` 集成

配置：`https://github.com/settings/apps`

回调地址：`https://<URL>/api/github.callback`

```shell
# GitHub 客户端 ID (鉴权方式)
GITHUB_CLIENT_ID=
# GitHub 客户端 密钥 (鉴权方式)
GITHUB_CLIENT_SECRET=
# GitHub 应用ID (鉴权方式)
GITHUB_APP_ID=
# GitHub 应用名称 (鉴权方式)
GITHUB_APP_NAME=
# GitHub 应用私钥 (鉴权方式)
GITHUB_APP_PRIVATE_KEY=
```

#### `OIDC` 集成

回调地址：`https://<URL>/auth/oidc.callback`

```shell
# OIDC 客户端 ID (鉴权方式)
OIDC_CLIENT_ID=
# OIDC 客户端 密钥 (鉴权方式)
OIDC_CLIENT_SECRET=
# OIDC 颁发者 (鉴权方式)
OIDC_AUTH_URI=
# OIDC 令牌颁发者 (鉴权方式)
OIDC_TOKEN_URI=
# OIDC 用户信息颁发者 (鉴权方式)
OIDC_USERINFO_URI=
# OIDC 登出颁发者 (鉴权方式)
OIDC_LOGOUT_URI=

# 可选配置
# OIDC 用户名声明 (鉴权方式)
OIDC_USERNAME_CLAIM=preferred_username
# OIDC 登录按钮名称 (鉴权方式)
OIDC_DISPLAY_NAME=OpenID
# OIDC 作用域 (鉴权方式)
OIDC_SCOPES=openid profile email
```

## Nginx 反向代理

```config
server {
  server_name docs.mycompany.com;
  listen 80;
  listen 443 ssl;

  location / {
    proxy_pass http://localhost:3000/;

    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $host;

    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;proxy_set_header Host $host;
    proxy_set_header Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Scheme $scheme;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_redirect off;
  }
}
```
