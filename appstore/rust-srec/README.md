# Rust Srec

自动化直播录制解决方案 (Stream Rec 迭代版)

基于 Rust 构建的高性能多平台直播录制系统

![Rust-Rec](https://file.lifebus.top/imgs/rust_rec_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

### JWT 签名密钥 生成

```shell
openssl rand -hex 32
```

### 会话密钥 生成

```shell
openssl rand -hex 32
```

### 持久化路径

目前使用 `应用持久化路径` 与 `数据持久化路径` 配置，分别用于存储应用数据和录制数据。

+ `数据持久化路径`: 是指录制数据存放的路径，占用空间较多，请自行配置。
+ `应用持久化路径`: 存放应用配置文件，如：JWT 签名密钥、会话密钥、数据库配置、日志配置、DAG 配置等。

## 特性

### 🎬 多平台支持

支持 Bilibili、抖音、斗鱼、虎牙、Twitch、TikTok 等平台

### ⚡ 高性能

Rust 构建，高效且资源占用低

### 🔄 DAG 管道

强大的后处理工作流（有向无环图）

### 🎯 灵活配置

4 层配置层级，精细化控制

### 💬 弹幕支持

同步录制弹幕

### 🐳 容器化部署

支持 Docker 和 docker-compose 快速部署

### 📅 自定义录制计划

定时录制，自动管理文件名，便于组织归档

### 🔧 FLV 修复

自动修复损坏的 FLV 流，包括时间戳校正和元数据修复

## 直播平台支持列表

| 平台                                                                                      | URL 格式                                                | 协议      | 弹幕 |
|:----------------------------------------------------------------------------------------|:------------------------------------------------------|:--------|:---|
| [Bilibili](https://hua0512.github.io/rust-srec/zh/platforms/bilibili.html)              | `live.bilibili.com/{room_id}`                         | FLV/HLS | ✅  |
| [抖音](https://hua0512.github.io/rust-srec/zh/platforms/douyin.html)                      | `live.douyin.com/{room_id}`                           | FLV/HLS | ✅  |
| [斗鱼](https://hua0512.github.io/rust-srec/zh/platforms/douyu.html)                       | `douyu.com/{room_id}`                                 | FLV     | ✅  |
| [虎牙](https://hua0512.github.io/rust-srec/zh/platforms/huya.html)                        | `huya.com/{room_id}`                                  | FLV/HLS | ✅  |
| [AcFun](https://hua0512.github.io/rust-srec/zh/platforms/others.html#acfun)             | `acfun.cn/live/{room_id}`                             | HLS     | ❌  |
| [PandaTV](https://hua0512.github.io/rust-srec/zh/platforms/others.html#pandatv)         | `pandalive.co.kr/play/{id}`                           | HLS     | ❌  |
| [小红书](https://hua0512.github.io/rust-srec/zh/platforms/others.html#redbook-小红书)         | `xiaohongshu.com/user/profile/{id} or xhs.link/{id}`  | HLS     | ❌  |
| [微博](https://hua0512.github.io/rust-srec/zh/platforms/others.html#weibo)                | `weibo.com/u/{uid} or weibo.com/l/wblive/p/show/{id}` | HLS     | ❌  |
| [Twitch](https://hua0512.github.io/rust-srec/zh/platforms/twitch.html)                  | `twitch.tv/{channel}`                                 | HLS     | ✅  |
| [TikTok](https://hua0512.github.io/rust-srec/zh/platforms/others.html#tiktok)           | `tiktok.com/@{user}/live`                             | HLS     | ❌  |
| [Twitcasting](https://hua0512.github.io/rust-srec/zh/platforms/others.html#twitcasting) | `twitcasting.tv/{user}`                               | HLS     | ✅  |
| [Picarto](https://hua0512.github.io/rust-srec/zh/platforms/others.html#picarto)         | `picarto.tv/{user}`                                   | HLS/MP4 | ❌  |

## 安装说明

> 默认账户
>
> 用户名：admin
>
> 密码：admin123! 或 `登录密码 (初始化)` 配置

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
