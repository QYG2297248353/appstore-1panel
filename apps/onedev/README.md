# OneDev

DevOps 平台

![OneDev](https://file.lifebus.top/imgs/onedev_cover.png)

## 简介

OneDev 可以在 2 核 2GB 盒子上愉快地运行。

OneDev 是迄今为止我在软件工程师职业生涯中使用过的最好的工具。
它使我和我的团队能够轻松跟踪任务和代码，为我们的 CI/CD 创建深入的可重用管道，实施（可选）基于角色的分支保护，为拉取请求提供高度详细的代码审查。

### 功能特性

🔎 开箱即用的代码搜索和导航

任何提交中的语言感知符号搜索和导航。单击符号可显示当前文件中出现的情况。使用正则表达式进行快速代码搜索。

👮‍ 灵活的安全性和合规性扫描

扫描代码依赖项、构建的二进制文件或容器映像，以查找安全漏洞、许可证违规或秘密泄露。

🚦 用覆盖率和问题注释代码

代码将标注覆盖率信息以及 CI/CD 管道中发现的问题，以方便代码审查。

💬 随时随地代码讨论

选择任何代码或差异以开始讨论。建议并应用更改。讨论集中在代码上，以帮助理解代码。

🔒 多功能的代码保护规则

设置规则，当某些用户触摸某些分支中的某些文件时，要求进行审查或 CI/CD 验证。

📋 自动化看板以保持团队井井有条

在看板中手动移动任务，或定义规则以在提交/测试/发布/部署相关工作时自动移动任务。

🛠 可定制且灵活的问题工作流程

自定义问题状态和字段。手动或自动状态转换规则。发布同步操作和状态的链接。公共项目中的机密问题。

📨 服务台将电子邮件与问题链接起来

使用问题作为票证系统通过电子邮件为客户提供支持，无需他们注册帐户。为不同的项目或客户分配不同的支持联系人。

⏰ 时间跟踪和报告

跟踪任务上的估计/花费时间。自动聚合子任务的时间。生成工作统计和计费的时间表。

💡 CI/CD 作为代码，无需编写代码

用于创建 CI/CD 作业的直观 GUI。典型框架的模板。键入参数。矩阵作业。 CI/CD 逻辑重用。缓存管理。

🚀 从简单到规模化的多功能 CI/CD 执行器

在容器中或裸机上开箱即用地运行 CI/CD。与 Kubernetes 或代理同时运行大量作业。

🛠 调试 CI/CD 作业的工具

暂停作业执行的命令。用于检查作业执行环境的Web终端。针对未提交的更改在本地运行作业。

📦 内置包注册表

内置注册表来管理二进制包。将包与 CI/CD 作业链接。

🧩 深度融合、信息交叉引用

通过提交、CI/CD 或拉取请求传输问题状态。显示问题的修复版本。查询构建/包版本之间的已修复问题或代码更改。

🌲 项目树，方便维护

使用树形结构清晰有效地组织项目。在父项目中定义通用设置并在子项目中继承。

🐒 智能查询，可保存、订阅

强大而直观的查询功能。保存查询以便快速访问。订阅查询以获取有趣事件的通知。

🎛️ 团队和用户的仪表板

在自定义仪表板中排列小工具，以便一目了然地获取重要信息。与用户或组共享仪表板，或将其公开给所有人。

👯 轻松的高可用性和可扩展性

轻松的集群设置。跨不同服务器复制项目以实现高可用性，或分发项目以实现水平可扩展性。

🛸 用于快速访问的命令面板

使用 cmd/ctrl-k 从任何地方调出命令面板。搜索任何内容并跳转到它，而无需翻阅菜单。

📈 各语言的 SLOC 趋势

检查主分支的 git 历史记录，以有效计算按语言划分的源代码行趋势

🕊️ 快速、轻便、可靠

精心设计时考虑了资源使用和性能。通过适用于中型项目的 1 核 2G 内存盒获得上述所有功能。密集使用超过5年，可靠性经过实战验证。

## 安装说明

### 无人值守

通过填写必须的环境变量来配置 OneDev，无需通过 Web 界面进行配置。

+ `管理员帐户` - 管理员帐户的用户名
+ `管理员密码` - 管理员帐户的密码
+ `管理员电子邮件` - 管理员帐户的电子邮件地址
+ `服务端地址` - OneDev 服务端的地址 (例如 `https://onedev.io`)
+ `SSH 服务端地址` - (可选) 用于 SSH 克隆的地址 (例如 `ssh://onedev.io`)

不填写 `SSH 服务端地址` 时，将从 `服务端地址` 派生。

### 使用外部数据库

OneDev 默认使用嵌入式数据库存储数据。使用外部数据库需要前往应用安装目录下的 `config` 目录，编辑 `onedev.env` 文件，配置数据库连接信息。

填写 `onedev.env` 时，请删除对应 `#` 开头的注释行。数据库只能选择一种，填写多个数据库配置信息将导致启动失败。

外部数据库类型，支持 `MySQL`、`PostgreSQL`、`MariaDB`、`MS SQL Server`

> 数据库配置信息
>
> `hibernate_dialect` - 数据库方言 (固定值)
>
> `hibernate_connection_driver_class` - 数据库驱动 (固定值)
>
> `hibernate_connection_url` - 数据库连接地址 (请根据数据库类型填写)
>
> `hibernate_connection_username` - 数据库用户名 (请根据数据库类型填写)
>
> `hibernate_connection_password` - 数据库密码 (请根据数据库类型填写)

| Database      | Hibernate Dialect                              | Driver Class                                 | Connection URL                                                                                                            | Username | Password | Notes                   |
|---------------|------------------------------------------------|----------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|----------|----------|-------------------------|
| MySQL         | org.hibernate.dialect.MySQL5InnoDBDialect      | com.mysql.cj.jdbc.Driver                     | jdbc:mysql://localhost:3306/onedev?serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false&disableMariaDbDriver=true | root     | root     |                         |
| PostgreSQL    | io.onedev.server.persistence.PostgreSQLDialect | org.postgresql.Driver                        | jdbc:postgresql://localhost:5432/onedev                                                                                   | postgres | postgres | 请确保在此处使用 OneDev 自己版本的方言 |
| MariaDB       | org.hibernate.dialect.MySQL5InnoDBDialect      | org.mariadb.jdbc.Driver                      | jdbc:mariadb://localhost:3306/onedev                                                                                      | root     | root     |                         |
| MS SQL Server | org.hibernate.dialect.SQLServer2012Dialect     | com.microsoft.sqlserver.jdbc.SQLServerDriver | jdbc:sqlserver://localhost:1433;databaseName=onedev                                                                       | sa       | sa       |                         |

#### 示例

> MySQL

```env
hibernate_dialect=org.hibernate.dialect.MySQL5InnoDBDialect
hibernate_connection_driver_class=com.mysql.cj.jdbc.Driver
hibernate_connection_url=jdbc:mysql://localhost:3306/onedev?serverTimezone=UTC&allowPublicKeyRetrieval=true&useSSL=false&disableMariaDbDriver=true
hibernate_connection_username=root
hibernate_connection_password=root
```

> PostgreSQL

```env
hibernate_dialect=io.onedev.server.persistence.PostgreSQLDialect
hibernate_connection_driver_class=org.postgresql.Driver
hibernate_connection_url=jdbc:postgresql://localhost:5432/onedev
hibernate_connection_username=postgres
hibernate_connection_password=postgres
```

> MariaDB

```env
hibernate_dialect=org.hibernate.dialect.MySQL5InnoDBDialect
hibernate_connection_driver_class=org.mariadb.jdbc.Driver
hibernate_connection_url=jdbc:mariadb://localhost:3306/onedev
hibernate_connection_username=root
hibernate_connection_password=root
```

> MS SQL Server

```env
hibernate_dialect=org.hibernate.dialect.SQLServer2012Dialect
hibernate_connection_driver_class=com.microsoft.sqlserver.jdbc.SQLServerDriver
hibernate_connection_url=jdbc:sqlserver://localhost:1433;databaseName=onedev
hibernate_connection_username=sa
hibernate_connection_password=sa
```

## 反向代理

假设您的 OneDev 实例在端口 6610 上运行，并且您希望通过 http://onedev.example.com 访问它。

请注意不要使用 `localhost` 作为 `proxy_pass` 的目标，Docker 容器内的 `localhost` 是容器本身，而不是宿主机。

### Nginx

```nginx
server {
    listen 80;
    listen [::]:80;

    server_name onedev.example.com;

    # 上传文件大小不限制
    client_max_body_size 0;

    location /wicket/websocket {
            proxy_pass http://localhost:6610/wicket/websocket;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
    }

    location /~server {
            proxy_pass http://localhost:6610/~server;
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
    }

    location /~api/streaming {
            proxy_pass http://localhost:6610/~api/streaming;
            proxy_buffering off;
    }

    location / {
            proxy_pass http://localhost:6610/;
    }
}
```

### Caddy Server

```caddy
    caddy reverse-proxy --from onedev.example.com --to localhost:6610
```
