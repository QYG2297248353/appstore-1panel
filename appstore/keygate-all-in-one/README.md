# Keygate All-in-One

开源软件许可证管理平台，可自托管的 Keygen、Cryptlex、LicenseSpring 替代方案（内置 PostgreSQL 与 Redis 一体化部署）

![Keygate](https://raw.githubusercontent.com/tabloy/keygate/main/web/public/screenshot.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%AF%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Keygate 是一个生产就绪的许可证服务器，部署在你自己的基础设施上，接入你自己的 Stripe，通过简洁的管理后台统一管理。从激活到催款，全部搞定，让你专注于构建产品。

本版本为 **All-in-One** 一体化部署，内置 PostgreSQL 数据库与 Redis 缓存，无需额外安装依赖，开箱即用。

### 主要特性

- **许可证密钥管理**：签发、吊销许可证密钥，支持激活限制与试用期
- **订阅计划**：定义不同功能集的计划与权限（Entitlements），追踪用量配额
- **Stripe 计费**：接入你自己的 Stripe，Webhook 自动配置，自动处理计费与催款
- **发布管理**：构件上传、更新源（Sparkle/Velopack/Tauri）、许可证门控下载
- **Webhook 通知**：事件驱动的出站 Webhook，支持重试
- **管理后台**：简洁的 Web 控制台，邮箱 OTP 登录

### 一体化说明

- 内置 **PostgreSQL 18**（数据持久化于数据目录 `postgres`）
- 内置 **Redis 7**（数据持久化于数据目录 `redis`，用于跨实例共享限流）

> 一个服务。一个数据库。完全掌控。永久免费。

## 配置填写说明

### 安全密钥 (Secrets)

所有密钥都应使用 `openssl rand -hex 32` 生成，并妥善保管。

```sh
openssl rand -hex 32
```

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `JWT_SECRET` | 必填 | 签名登录会话，至少 32 个字符 |
| `LICENSE_SIGNING_KEY` | 必填 | 签名离线令牌（由你的应用校验）的 Ed25519 密钥，**必须恰好为 64 个十六进制字符** |
| `RELEASE_KEY_ENCRYPTION_KEY` | 空 | 加密发布签名密钥、邮箱服务凭据与已存储的许可证密钥。启用发布存储（Release Storage），或在控制台保存 SMTP / Cloudflare 凭据时**必填** |

> ⚠️ **密钥丢失影响**：`RELEASE_KEY_ENCRYPTION_KEY` 一旦丢失或变更，已加密的发布签名密钥将无法解密，发布会签名失败。请备份所有密钥。

### 内置 Redis 说明

本版本**已内置 Redis 7**，容器内连接地址为 `redis://redis:6379/0`（无密码，仅在内部网络 `keygate-network` 可见，不对外暴露），无需手动配置。

> 若需改为外置 Redis（例如多实例共享限流），请使用 `Keygate` 标准版应用。

### SMTP 邮件配置（可选）

SMTP 用于发送登录 OTP 验证码、许可证密钥邮件、续费提醒等。**未配置时**，OTP 验证码将直接打印到容器日志中。

| 变量 | 说明 |
| --- | --- |
| `SMTP_HOST` | SMTP 服务器地址，例如 `smtp.example.com` |
| `SMTP_PORT` | SMTP 端口，默认 `587`（STARTTLS），SSL 通常为 `465` |
| `SMTP_USERNAME` | SMTP 用户名 |
| `SMTP_PASSWORD` | SMTP 密码 |
| `SMTP_FROM` | 发件人。支持裸地址 `noreply@example.com` 或显示名格式 `Acme Licensing <noreply@example.com>` |

### Stripe 支付配置（可选）

`STRIPE_SECRET_KEY`：从 [Stripe Dashboard](https://dashboard.stripe.com/apikeys) 获取，仅需配置此项，Webhook 将自动配置，自动处理订阅、续费与退款。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
