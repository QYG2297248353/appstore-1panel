# NocoDB

NocoDB 是一个无代码数据库平台，允许团队通过熟悉且直观的电子表格界面轻松协作和构建应用程序。

![NocoDB](https://file.lifebus.top/imgs/nocodb_cover.png)

NocoDB 的工作原理是连接到任何关系数据库并将其转换为智能电子表格界面！这使您可以与团队协作构建无代码应用程序。 NocoDB 目前可与
MySQL、PostgreSQL 和 SQLite（仅限开源）数据库配合使用。

此外，NocoDB 的应用程序商店允许您结合 Slack、Microsoft Teams、Discord、Twilio、Whatsapp、电子邮件和任何第三方 API
的组合在视图上构建业务工作流程。

另外，NocoDB 提供对 API 的编程访问，以便您也可以构建与 Zapier / Integromat 和自定义应用程序的集成。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

> 丰富的电子表格

⚡ 基本操作：表、字段和记录的创建、读取、更新和删除

⚡ 字段操作：排序、过滤、隐藏/取消隐藏字段

⚡ 多种视图类型：网格（默认）、图库、表单视图和看板视图

⚡ 查看权限类型：协作视图和锁定视图

⚡ 共享基础/视图：公共或私有（受密码保护）

⚡ 变体单元格类型：ID、链接、查找、汇总、单行文本、附件、货币、公式等

⚡ 角色访问控制：不同级别的细粒度访问控制

⚡ 还有更多...

> 用于工作流程 应用商店

我们在三个主要类别中提供不同的集成。

⚡ 聊天：Slack、Discord、Mattermost 等等

⚡ 电子邮件：AWS SES、SMTP、MailerSend 等

⚡ 存储：AWS S3、Google Cloud Storage、Minio 等

> 程序化

我们提供以下方法让用户以编程方式调用操作。您可以使用令牌（JWT 或社交身份验证）来签署 NocoDB 授权请求。

⚡ REST API

⚡ NocoDB SDK

⚡ SQL Access：从 NocoDB UI 本身对数据源运行 SQL 查询（即将推出！）

> 同步

如果您在 NocoDB GUI 之外进行了更改，我们允许您同步架构更改。但是，必须注意的是，您将必须携带自己的架构迁移才能从环境迁移到其他环境。

## 安装说明

数据支持：MySQL、PostgreSQL 和 `SQLite（仅限开源）` 数据库，由于 SQLite 的限制，我们建议在生产环境中使用 MySQL 或 PostgreSQL。

缓存支持：Redis（可选），未配置 Redis 时，NocoDB 将使用内存作为缓存。

> `Redis 缓存地址` 配置

如果您想要使用 Redis 作为缓存，请填写对应配置。

格式：`redis://:password@host:port/cache_index`

示例：`redis://:password@localhost:6379/0`

> '域名' 配置

当您在生产环境中使用 NocoDB 时，我们建议您配置域名。

这是用于在电子邮件模板中构建 URL、生成 Swagger 文档 URL 以及处理后端 URL 要求的基本 URL。

示例：`https://your-domain.com`

## 维护说明

> 彻底禁用 `Redis 缓存` 功能

您可以通过设置环境变量 `NC_DISABLE_CACHE` 为 `true` 来彻底禁用此功能。

默认状态下会更具配置自动启用或禁用。

> 默认情况下，我们关闭了 `webhook` 调用本地网络功能

您可以通过设置环境变量 `NC_ALLOW_LOCAL_HOOKS` 为 `true` 来启用此功能。

> 默认情况下，我们关闭了 `遥测` 功能

您可以通过设置环境变量 `NC_DISABLE_TELE` 为 `false` 来启用此功能。

> 默认情况下，我们开启了 SMTP 插件 `安全身份验证` 功能

您可以通过设置环境变量 `NC_SMTP_SECURE` 为 `false` 来禁用此功能。

> 默认情况下，我们关闭了 `忽略 SMTP 插件的 TLS` 功能

您可以通过设置环境变量 `NC_SMTP_IGNORE_TLS` 为 `true` 来启用此功能。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
