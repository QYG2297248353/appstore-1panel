# Medusa All-in-One

开源无头电商平台，内置 Admin 管理后台（内置 PostgreSQL 与 Redis 一体化部署）

![Medusa](https://file.lifebus.top/imgs/medusa_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Medusa 是一个开源的无头电商平台，提供商品、订单、库存、支付、促销、多区域等完整的 commerce 模块。本应用基于 [Medusa DTC Starter](https://github.com/QYG2297248353/dtc-starter) 构建，仅部署 **Medusa 后端 API 与 Admin 管理后台**（不含 storefront 前端）。

本版本为 **All-in-One** 一体化部署，内置 PostgreSQL 数据库与 Redis 缓存，无需额外安装依赖，开箱即用。

### 主要特性

- **商品与库存**：商品目录、多变体、库存与价格管理
- **订单与履约**：购物车、结算、订单、退货与履约流程
- **多区域**：多国家/区域、多币种、自动区域匹配
- **促销与支付**：促销码、支付提供商、Stripe 集成
- **客户账户**：注册登录、订单历史、地址管理
- **Admin 后台**：内置管理控制台，与 API 同端口提供

### 访问地址

- Admin 管理后台：`http://<服务器IP>:9000/app`
- 健康检查：`http://<服务器IP>:9000/health`
- Store API：`http://<服务器IP>:9000/store`
- Admin API：`http://<服务器IP>:9000/admin`

### 一体化说明

- 内置 **PostgreSQL 16**（数据持久化于数据目录 `postgres`，数据库 `medusa`，用户 `medusa`）
- 内置 **Redis 7**（数据持久化于数据目录 `redis`，开启 AOF）
- 上传文件（商品图片等）持久化于数据目录 `static`（默认 `/home/medusa/static`）
- 安装时先运行一次性 `migrate` 服务执行数据库迁移与初始数据初始化，成功后再启动后端服务

> 若需使用外置 PostgreSQL / Redis，请使用 `Medusa` 标准版应用。

## 配置填写说明

### 安全密钥 (Secrets)

所有密钥建议使用 `openssl rand -base64 32` 生成并妥善保管。

```sh
openssl rand -base64 32
```

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `JWT_SECRET` | 必填 | JWT 签名密钥 |
| `COOKIE_SECRET` | 必填 | Session Cookie 签名密钥 |
| `POSTGRES_PASSWORD` | 随机 | 内置数据库 `medusa` 用户的密码 |

### 内置数据库说明

本版本**已内置 PostgreSQL 16**，容器内连接串固定为：

```
postgres://medusa:<POSTGRES_PASSWORD>@postgres:5432/medusa?sslmode=disable
```

该数据库仅在内部网络 `medusa-network` 可见，不对外暴露，无需手动配置主机与端口。

### 内置 Redis 说明

本版本**已内置 Redis 7**，容器内连接地址为 `redis://redis:6379`（无密码，仅在内部网络 `medusa-network` 可见，不对外暴露）。

### 跨域配置 (CORS)

Admin 后台与 API 的访问地址必须加入对应的 CORS 列表，多个地址用英文逗号分隔。

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `STORE_CORS` | `http://127.0.0.1:8000` | Store API 允许来源，通常填写 storefront 地址 |
| `ADMIN_CORS` | `http://127.0.0.1:9000` | Admin 允许来源，填写管理后台访问地址 |
| `AUTH_CORS` | `http://127.0.0.1:9000` | 认证接口允许来源，填写管理后台访问地址 |

> 前端来源无限制：`STORE_CORS=/^https?:\/\/.+$/`

### 后端地址 (BACKEND_URL)

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `BACKEND_URL` | `http://127.0.0.1:9000` | 后端对外访问地址（含协议、主机、端口，无尾斜杠），用于为上传文件生成绝对 URL |

本地文件模块会以 `${BACKEND_URL}/static` 作为上传文件的公开前缀。必须填写用户实际访问后端的地址，否则商品图片等资源会指向 `127.0.0.1` 而无法加载；若修改了 WebUI 端口，这里也要同步带上端口。

### Session Cookie 配置

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `COOKIE_SECURE` | `false` | 纯 HTTP 访问（`http://IP:9000/app`）选 `false`；HTTPS 反向代理后选 `true` |
| `COOKIE_SAME_SITE` | `lax` | Cookie SameSite 属性，可选 `lax` / `strict` / `none` |

> ⚠️ 通过 `http://IP:9000/app` 访问时，若 `COOKIE_SECURE=true`，浏览器会拒绝写入 Secure Cookie，表现为登录成功但持续跳回登录页。

### 上传文件存储

商品图片等上传文件由后端本地文件模块写入容器内 `/server/static`，并通过 `/static` 路径对外提供，已挂载到数据目录下的 `static` 子目录（默认 `/home/medusa/static`）。

- 该目录由安装/升级脚本自动创建并授权给容器运行用户（UID `100` / GID `101`），容器重建不会丢失图片。
- 仅适用于单实例部署；多副本或多机部署时各容器本地磁盘不共享，生产环境建议改用 S3 等对象存储。

## 创建管理员账号

安装完成后执行以下命令创建管理员：

```sh
docker exec -it <容器名> ./node_modules/.bin/medusa user -e admin@example.com -p your-password
```

其中 `<容器名>` 为应用安装时显示的容器名称。

## 常用运维命令

```sh
# 查看日志
docker logs -f <容器名>

# 备份内置数据库
docker exec <容器名>-postgres pg_dump -U medusa medusa > backup-$(date +%F).sql

# 备份上传文件（商品图片等）
tar czf static-backup-$(date +%F).tar.gz -C /home/medusa static
```

> 升级前请先备份数据库。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
