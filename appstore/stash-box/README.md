# Stash Box

视频索引和感知哈希元数据API

![Stash](https://file.lifebus.top/imgs/stasho_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Stash 是一个用 Go 语言编写的网页应用程序，用于为您存储和组织色情收藏。它是自托管的，并遵循 AGPL-3.0 许可协议发布。

+ Stash 从互联网收集您收藏中的视频信息，并通过使用社区构建的插件扩展，支持大量内容制作者和网站。

+ Stash 支持多种视频和图像格式。

+ 您可以标记视频，稍后找到它们。

+ Stash 提供关于表演者、标签、工作室等统计信息。

## 安装说明

> 默认用户名与密码，请通过日志查看

### 配置数据库

Stash 使用 PostgreSQL 作为数据库。您可以在安装后前往持久化目录下的 `data/stash-box-config.yml` 修改配置

基本格式：`username:password@host:port/database?sslmode=disable`

示例：`postgres:postgres@127.0.0.1:5432/stash?sslmode=disable`

```yml
database: "填写数据库配置"
jwt_secret_key: "系统生成"
session_store_key: "系统生成"
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
