# Telegram Bot API 服务器

Telegram Bot API 提供了一个 HTTP API 用于创建电报机器人。

机器人是小应用程序完全在 Telegram 应用程序中运行。用户通过以下方式与机器人交互灵活的接口可以支持任何类型的任务或服务。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 下载文件没有大小限制。
+ 上传最多 2000 MB 的文件。
+ 使用本地路径上传文件并文件 URI 方案。
+ 使用 Webhook 的 HTTP URL。
+ 使用 Webhook 的任何本地 IP 地址。
+ 使用 Webhook 的任何端口。
+ 放最大网络钩子连接数最多 100000。
+ 接收绝对本地路径作为值文件路径字段，无需下载文件后获取文件要求。

Telegram Bot API 服务器仅接受 HTTP 请求，因此需要使用 TLS 终止代理来处理远程 HTTPS 请求。

## 使用说明

### 获取 `api_id`

为了获得API ID并使用 Telegram API 开发您自己的应用程序，您需要执行以下操作：

+ 使用任何应用程序注册 Telegram。
+ 登录您的 Telegram 核心： [https://my.telegram.org](https://my.telegram.org) 。
+ 去《API开发工具》并填写表格。
+ 您将获得基本地址以及 `api_id` 和 `api_hash` 用户授权所需的参数。
+ 目前每个号码只能有一个 `api_id` 连接到它。

我们将向您在此过程中使用的电话号码发送重要的开发者通知，因此请使用连接到您的活跃 Telegram 帐户的最新号码。

### 使用 `api_id`

在使用 MTProto Telegram API 之前，请注意，所有 API 客户端库都受到严格监控，以防止滥用。

如果您使用 Telegram API 进行洪泛、垃圾邮件、伪造订阅者和查看频道计数器，您将被 `永久禁止`。

由于过度滥用 Telegram API，所有帐户使用非官方 Telegram API 客户端注册或登录的用户会自动放入在监视下以避免违反规定服务条款。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
