# 白虎面板

🐯轻量级定时任务管理系统

![白虎面板](https://file.lifebus.top/imgs/baihu-panel_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

> 默认用户名：admin
>
> 默认密码：首次安装后在日志中打印 12位随机密码

## 简介

白虎面板 (Baihu Panel) 是一款极致轻量、高性能的自动化任务调度平台。采用 Go + Vue3 架构，专注于高性能与低系统开销。通过深度集成
Mise 运行时管理，它原生支持 Python、Node.js、Go、Rust、PHP 等所有主流语言环境的动态安装（几乎所有的版本）与统一依赖管理。支持
Docker/Docker-Compose 一键部署，开箱即用，是您理想的轻量化脚本托管与任务调度解决方案。

## 特色

### 轻量级

docker/compose部署，无需复杂配置，开箱即用

### 任务调度

支持标准 Cron 表达式，常用时间规则快捷选择。日志不落文件，没有磁盘频繁io的问题

### 脚本管理

在线代码编辑器，支持文件上传、压缩包解压

### 在线终端

WebSocket 实时终端，命令执行结果实时输出

### 消息推送

内置强大消息推送与通知引擎，无缝兼容主流渠道，支持系统级事件告警

### 机密管理

(New) 类似 GitHub Secrets 的安全存储，支持 AES-GCM 加密，日志自动打码，仅在调度时注入

### 环境变量

存储普通配置，任务执行时自动注入

### 现代UI

响应式设计，深色/浅色主题切换

### 移动端

适配移动小屏样式

### 远程执行

支持远程agent执行任务，展示执行结果

### 多语言支持

深度集成 Mise，支持几乎所有主流编程语言的动态安装、多版本切换及依赖管理

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
