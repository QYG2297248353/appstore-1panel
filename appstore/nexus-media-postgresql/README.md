# Nexus Media PostgreSQL版

Nexus Media 是一个功能强大的 PT 站点媒体库自动化管理工具，支持站点管理、资源搜索、RSS 订阅、刷流任务、下载管理、媒体整理、媒体服务器联动、AI 助手等功能。

![Nexus Media](https://raw.githubusercontent.com/linyuan0213/nexus-media/master/docs/assets/images/home/dashboard.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

本应用包含 **前端 Web UI** 与 **后端服务** 两个容器，并内置 **Redis** 缓存。本版本连接 **外置 PostgreSQL 数据库**，适合数据量较大或多应用共享数据库的场景。

> 数据库迁移由后端容器启动时自动执行（`alembic upgrade head`，幂等），无需独立迁移操作。

### 访问地址

- 前端 Web UI：`http://<服务器IP>:<WebUI 端口>`（默认 8080）
- 后端 API：`http://<服务器IP>:<后端 API 端口>`（默认 3000）

### 默认账号

| 项目 | 默认值 |
| --- | --- |
| 用户名 | `admin` |
| 密码 | `password` |

> **首次登录后请立即修改默认密码**。

## 安装说明

### 数据库配置（外置 PostgreSQL）

安装前请先在 1Panel 中安装 PostgreSQL 应用（前置检查会自动验证），并提前创建好数据库与用户：

```sql
CREATE USER nexus_media WITH PASSWORD '你的密码';
CREATE DATABASE nexus_media OWNER nexus_media;
```

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `DB_HOSTNAME` | `127.0.0.1` | 数据库主机地址。**容器内无法通过 127.0.0.1 访问宿主机数据库**，使用 1Panel 部署的数据库时请填写其容器名（如 `1Panel-postgresql-XXXX`，可在数据库应用详情中查看），或填写宿主机内网 IP |
| `DB_PORT` | `5432` | 数据库端口 |
| `DB_USERNAME` | `nexus_media` | 数据库用户名 |
| `DB_PASSWORD` | 随机 | 数据库密码 |
| `DB_DATABASE_NAME` | `nexus_media` | 数据库名称 |

### 目录挂载

| 容器路径 | 说明 |
| --- | --- |
| `/data` | 配置文件、插件数据、Redis 持久化（已自动映射到数据持久化路径） |
| `/media` | 媒体库目录（映射到填写的媒体库路径） |

### PUID / PGID

默认为 `0`（root）。若与 Emby / Jellyfin / qBittorrent 等容器共享媒体目录，建议保持 PUID / PGID 一致。

## 首次使用

1. 访问前端页面，使用默认账号 `admin / password` 登录并修改密码
2. 进入 **设置 → 基础设置 → 媒体** 配置 TMDB API Key（必须）
3. 进入 **设置 → 下载器** 添加下载器
4. 进入 **设置 → 媒体服务器** 添加 Emby / Jellyfin / Plex
5. 进入 **站点 → 站点维护** 添加 PT 站点

## 故障排查

- 后端反复重启、日志提示数据库连接失败：确认 `DB_HOSTNAME` 已改为数据库容器名或内网 IP（不能是 127.0.0.1），并核对数据库密码。
- 目录监控失效：在宿主机执行 `echo fs.inotify.max_user_watches=5242880 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p`。

> 若无需外部数据库，可使用内置 SQLite 的 `Nexus Media` 标准版应用。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
