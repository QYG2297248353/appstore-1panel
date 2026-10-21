# Keygate

开源软件许可证管理平台，可自托管的 Keygen、Cryptlex、LicenseSpring 替代方案

![Keygate](https://file.lifebus.top/imgs/keygate_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Keygate 是一个生产就绪的许可证服务器，部署在你自己的基础设施上，接入你自己的 Stripe，通过简洁的管理后台统一管理。从激活到催款，全部搞定，让你专注于构建产品。

### 主要特性

- **许可证密钥管理**：签发、吊销许可证密钥，支持激活限制与试用期
- **订阅计划**：定义不同功能集的计划与权限（Entitlements），追踪用量配额
- **Stripe 计费**：接入你自己的 Stripe，Webhook 自动配置，自动处理计费与催款
- **发布管理**：构件上传、更新源（Sparkle/Velopack/Tauri）、许可证门控下载
- **Webhook 通知**：事件驱动的出站 Webhook，支持重试
- **管理后台**：简洁的 Web 控制台，邮箱 OTP 登录

### 部署要求

- 外置 PostgreSQL 数据库
- 外置 Redis（可选，用于跨实例共享限流）

> 一个服务。一个数据库。完全掌控。永久免费。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
