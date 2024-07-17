# PostgreSQL

### PostgreSQL：世界上最先进的开源关系数据库

![PostgreSQL](https://file.lifebus.top/imgs/postgresql_logo.png)

## 简介

PostgreSQL 是一个功能强大的开源对象关系型数据库系统，它使用并扩展了 SQL 语言，并结合了多种功能，可以安全地存储和扩展最复杂的数据工作负载。PostgreSQL
起源于 1986 年加州大学伯克利分校的 POSTGRES 项目，在核心平台上已有超过 35 年的活跃开发历史。

PostgreSQL 因其成熟的架构、可靠性、数据完整性、强大的功能集、可扩展性，以及该软件背后的开源社区为持续提供高性能和创新解决方案所做出的奉献而赢得了良好的声誉。
PostgreSQL 可在所有主流操作系统上运行，自 2001 年以来一直符合 ACID 标准，并拥有强大的附加功能，如广受欢迎的 PostGIS
地理空间数据库扩展器。因此，PostgreSQL 成为许多人和组织首选的开源关系数据库也就不足为奇了。

开始使用PostgreSQL从未如此简单--选择一个你想建立的项目，让PostgreSQL安全稳健地存储你的数据。

### 为什么使用 PostgreSQL

PostgreSQL 具有许多功能，旨在帮助开发人员构建应用程序，帮助管理员保护数据完整性和构建容错环境，并帮助您管理数据，无论数据集大小。除了免费和开源之外，PostgreSQL
还具有高度可扩展性。例如，您可以定义自己的数据类型，创建自定义函数，甚至可以使用不同的编程语言编写代码，而无需重新编译数据库！

在不违背传统功能或可能导致架构决策失误的情况下，PostgreSQL 会尽量符合 SQL 标准。SQL 标准所要求的许多功能都得到了支持，尽管有时语法或功能略有不同。
随着时间的推移，有望进一步实现一致性。截至 2023 年 9 月发布的第 16 版，PostgreSQL 至少符合 SQL:2023 核心一致性 179 个强制功能中的
170 个。
截至目前，还没有关系型数据库完全符合这一标准。

## 版本选择

- `vectors` - 内置 vectors 插件。

    + 插件名称：vectors

    + 插件描述：vectors 插件用于存储和查询矢量数据，如地理坐标、几何图形等。

    + 插件链接：[https://github.com/tensorchord/pgvecto.rs](https://github.com/tensorchord/pgvecto.rs)

- `alpine` - 基于 Alpine Linux 发行版。

    + 精简版 PostgreSQL，基于 Alpine Linux 发行版，提供了更小的镜像体积和更快的启动速度。

- `{version}` 默认版

    + 官方默认 PostgreSQL 版本，基于 Debian Linux 发行版。
