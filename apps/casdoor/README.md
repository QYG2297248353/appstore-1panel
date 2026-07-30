# Casdoor

Casdoor 是一个 UI 优先的身份访问管理 (IAM)/单点登录 (SSO) 平台，其 Web UI 支持 OAuth
2.0、OIDC、SAML、CAS、LDAP、SCIM、WebAuthn、TOTP、MFA、RADIUS、Google Workspace、活动目录和 Kerberos。

![Casdoor](https://file.lifebus.top/imgs/casdoor_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Casdoor是一个基于OAuth 2.0、OIDC、SAML 和 CAS 的，UI-first的身份和访问管理(IAM)/单点登录(SSO)平台。

Casdoor是由Casbin社区通过Golang和React进行开发。

Casdoor旨在提供一个强大的认证平台来处理用户管理问题。

+ ⚡️ 强大的功能和极简的配置。 支持使用 登录和传统的用户名/密码登录，只需几个步骤，Casdoor即可帮助您构建您的用户管理系统。

+ 💥 前后端分离架构。 Casdoor提供可随心所欲的网页界面并支持高并发。

+ 🥂 活跃的开源社区。 Casdoor是开源的，并有专业团队积极维护中。

+ 🌐 多语言支持。 Casdoor支持多种语言，包括中文、英文、法文、以及更多语言。

## 特性

+ Casdoor 遵循前后端分离架构，采用 Golang 进行开发。 它支持高同步，提供基于网页的用户界面管理，并支持10多种语言的本地化。

+ Casdoor 支持第三方应用登录，如 GitHub、谷歌、QQ、微信等，并支持通过插件扩展第三方登录。

+ Casdoor 支持基于 Cassbin 的授权管理。 它支持 ACL、RBAC、ABAC 和 RESTful鉴权管理模式。

+ Casdoor 提供了手机验证码、电子邮件验证码以及重置密码的功能。

+ Casdoor 支持日志的审计和记录。

+ Casdoor 可以使用阿里云、腾讯云、七牛云提供的图片CDN云存储功能。

+ Casdoor 允许自定义注册、登录以及找回密码页面。

+ 通过数据库同步支持与现有系统的集成，从而能够顺利过渡到 Casdoor。

+ Casdoor 支持主流数据库: MySQL、PostgreSQL、SQL Server 等, 并支持扩展插件以支持新的数据库。

## 安装说明

> 全局管理员账户：'built-in/admin'
> 解释：'built-in' 是内置的组织名，'admin' 是内置的用户名。
>
> 默认用户名：`admin`
> 默认密码：`123`

### 数据库支持

当前仅支持 `MySQL` 和 `PostgreSQL` 数据库。

官方支持使用 'SQLite' 数据库，但不建议在生产环境中使用。因此，我们放弃了 'SQLite' 数据库的配置选项。

同时还有一些其他数据库的支持，但是这些数据库的支持并不完善，因此我们也放弃了这些数据库的配置选项。

### 存储 `本地文件系统`

Casdoor 支持将用户头像等文件存储在本地文件系统中。默认情况下，Casdoor 会将文件存储在容器内部 `/home/user/casdoor/files`
目录下。

我们将其挂载在 持久化目录 `/home/casdoor` 下，以便于数据的持久化。

### `Socks5 代理 (地区网络限制)` 配置

如果您的网络环境受到地区网络限制，您可以通过配置 `Socks5 代理` 来解决这个问题。

格式：host:port

socks5Proxy 是 SOCKS 代理服务器 IP 地址。
设置代理端口，因为我们有与Google相关的服务，或者使用Google、GitHub、Facebook、LinkedIn或Steam作为OAuth提供商，这在某些地区可能会受到网络限制。

### 数据初始化 `init_data.json` 配置

Casdoor 会在第一次启动时，自动初始化数据库。您可以通过配置 `init_data.json` 文件来初始化数据库。

配置自定义的 `init_data.json` 文件，需要挂载到容器中。

需要修改 `docker-compose.yml` 文件中的 `volumes` 部分，添加自定义配置的挂载，将 `init_data.json` 文件挂载到容器中，覆盖默认配置。

```yaml
volumes:
  - ./config/init_data.json:/init_data.json
```

其中 `./config/init_data.json` 为默认配置文件所在路径，您可以根据实际情况进行修改为自定义绝对文件路径即可。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
