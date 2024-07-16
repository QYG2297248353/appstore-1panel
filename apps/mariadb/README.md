# MariaDB

MariaDB 服务器是社区开发的 MySQL 服务器分支。

MariaDB 由原始 MySQL 团队的核心成员发起，积极与外部开发人员合作，提供业界功能最丰富、最稳定且许可合理的开放 SQL 服务器。

![MariaDB](https://file.lifebus.top/imgs/mariadb_logo.png)

## 简介

MariaDB是MySQL关系数据库管理系统的一个分叉，由社区开发，有商业支持，旨在继续保持在GNU GPL下开源。
MariaDB的开发是由MySQL的一些原始开发者领导的，他们担心甲骨文公司收购MySQL后会有一些隐患。

MariaDB打算保持与MySQL的高度兼容性，与MySQL API和命令精确匹配。MariaDB自带了一个新的存储引擎Aria，它可以替代MyISAM，成为默认的事务和非事务引擎。
它最初使用XtraDB作为默认存储引擎，并从10.2版本切换回InnoDB。

MariaDB的API和协议兼容MySQL，另外又添加了一些功能，以支持原生的非阻塞操作和进度报告。这意味着，所有使用MySQL的连接器、程序库和应用程序也将可以在MariaDB下工作。
在此基础上，由于担心甲骨文MySQL的一个更加封闭的软件项目，Fedora等Linux发行版已经在最新版本中以MariaDB取代MySQL，维基媒体基金会的服务器同样也使用MariaDB取代了MySQL。
