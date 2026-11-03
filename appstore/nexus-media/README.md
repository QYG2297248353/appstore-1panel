# Nexus Media

Nexus Media 是一个功能强大的 PT 站点媒体库自动化管理工具，支持站点管理、资源搜索、RSS 订阅、刷流任务、下载管理、媒体整理、媒体服务器联动、AI 助手等功能。

![Nexus Media](https://raw.githubusercontent.com/linyuan0213/nexus-media/master/docs/assets/images/home/dashboard.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

本应用包含 **前端 Web UI** 与 **后端服务** 两个容器，并内置 **Redis** 缓存。本版本使用 **SQLite** 数据库（数据保存在数据目录 `data/db/` 下），无需外部数据库，开箱即用。

> 数据库迁移由后端容器启动时自动执行（`alembic upgrade head`，幂等），无需独立迁移操作。

### 主要特性

- **站点管理**：PT 站点 Cookie 维护、连通性测试、站点数据统计
- **资源搜索与订阅**：聚合搜索、RSS 订阅、刷流任务（支持 cron 与删种规则）
- **下载管理**：qBittorrent / Transmission / Aria2 等下载器联动，下载完成自动转移
- **媒体整理**：自动识别刮削（TMDB）、硬链接转移、媒体库管理
- **媒体服务器**：Emby / Jellyfin / Plex 联动
- **AI 助手**：消息中心对话式操作、知识库检索
- **通知渠道**：Telegram、企业微信、Bark、ServerChan 等多种通知方式

### 访问地址

- 前端 Web UI：`http://<服务器IP>:<WebUI 端口>`（默认 8080）
- 后端 API：`http://<服务器IP>:<后端 API 端口>`（默认 3000）

### 默认账号

| 项目 | 默认值 |
| --- | --- |
| 用户名 | `admin` |
| 密码 | `password` |

> **首次登录后请立即修改默认密码**（设置 → 用户与权限）。

## 安装说明

### 目录挂载

| 容器路径 | 说明 |
| --- | --- |
| `/data` | 配置文件、SQLite 数据库、插件数据、Redis 持久化（必须挂载，已自动映射到数据持久化路径） |
| `/media` | 媒体库目录（映射到填写的媒体库路径，下载转移/硬链接依赖该目录） |

> 若需硬链接转移，下载器的保存目录与本应用的媒体库路径必须在同一磁盘分区，建议映射共同的上级目录。

### PUID / PGID

默认为 `0`（root）。若与 Emby / Jellyfin / qBittorrent 等容器共享媒体目录，建议保持 PUID / PGID 一致（宿主机执行 `id -u` 和 `id -g` 获取）。

### inotify 限制

目录监控文件较多时可能超出系统默认句柄限制，需在宿主机执行：

```sh
echo fs.inotify.max_user_watches=5242880 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

## 首次使用

1. 访问前端页面，使用默认账号 `admin / password` 登录并修改密码
2. 进入 **设置 → 基础设置 → 媒体** 配置 TMDB API Key（必须）
3. 进入 **设置 → 下载器** 添加下载器
4. 进入 **设置 → 媒体服务器** 添加 Emby / Jellyfin / Plex
5. 进入 **站点 → 站点维护** 添加 PT 站点

## 反向代理

通过 Nginx 挂到域名下时，只需代理**前端端口**，且必须配置 WebSocket 转发头，否则日志、进度等实时推送不可用：

```nginx
location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    client_max_body_size 100m;
    proxy_read_timeout 300s;
}
```

> 子路径部署（如 `/nexus`）暂不支持，请使用独立域名或端口。

## 可选组件

官方还提供两个可选组件（本应用未内置，可按需单独部署）：

| 组件 | 镜像 | 作用 |
| --- | --- | --- |
| nexus-verify | `linyuan0213/nexus-verify` | OCR 验证码识别（站点自动签到） |
| nexus-chrome | `linyuan0213/nexus-chrome` | 浏览器自动化（Cookie 更新、网页抓取） |

部署后在 **系统设置 → 基础设置 → 实验室** 中填写对应地址启用。

> 若需使用 MySQL / PostgreSQL 数据库，请使用 `Nexus Media MySQL版` 或 `Nexus Media PostgreSQL版` 应用。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
