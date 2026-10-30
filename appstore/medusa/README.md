# Medusa

开源无头电商平台，内置 Admin 管理后台

![Medusa](https://file.lifebus.top/imgs/medusa_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Medusa 是一个开源的无头电商平台，提供商品、订单、库存、支付、促销、多区域等完整的 commerce 模块。本应用基于 [Medusa DTC Starter](https://github.com/QYG2297248353/dtc-starter) 构建，仅部署 **Medusa 后端 API 与 Admin 管理后台**（不含 storefront 前端）。

### 主要特性

- **商品与库存**：商品目录、多变体、库存与价格管理
- **订单与履约**：购物车、结算、订单、退货与履约流程
- **多区域**：多国家/区域、多币种、自动区域匹配
- **促销与支付**：促销码、支付提供商；内置 Manual 支付，可选支付宝（PC / H5 / 扫码）
- **客户账户**：注册登录、订单历史、地址管理
- **Admin 后台**：内置管理控制台，与 API 同端口提供

### 访问地址

- Admin 管理后台：`http://<服务器IP>:9000/app`
- 健康检查：`http://<服务器IP>:9000/health`
- Store API：`http://<服务器IP>:9000/store`
- Admin API：`http://<服务器IP>:9000/admin`

### 部署要求

- 外置 **PostgreSQL 15+**（数据库需提前创建，Medusa 只执行迁移，不会自动建库）
- 外置 **Redis**（可选，用于缓存与事件总线）

> 安装时会先运行一次性 `migrate` 服务执行数据库迁移与初始数据初始化，成功后再启动后端服务。

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

### 数据库连接

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `POSTGRES_HOST` | `127.0.0.1` | 数据库主机地址 |
| `POSTGRES_PORT` | `5432` | 数据库端口 |
| `POSTGRES_NAME` | `medusa` | 数据库名称（需提前创建） |
| `POSTGRES_USER` | `medusa` | 数据库用户名 |
| `POSTGRES_PASSWORD` | 随机 | 数据库密码 |
| `POSTGRES_SSLMODE` | `disable` | 自建 PostgreSQL 选择关闭；云数据库/已启用 SSL 选择开启 |

最终会拼接为：
`postgres://<用户>:<密码>@<主机>:<端口>/<数据库>?sslmode=<模式>`

> 密码包含 `@`、`#`、`/`、`:` 等特殊字符时需要 URL 编码（如 `@` → `%40`）。

### Redis 连接

格式：`redis://[:password@]host[:port][/database]`

```
# 无密码
redis://127.0.0.1:6379/0

# 有密码
redis://:password@127.0.0.1:6379/0

# TLS
rediss://:password@redis.example.com:6380/0
```

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

商品图片等上传文件由后端本地文件模块写入容器内 `/server/static`，并通过 `/static` 路径对外提供。

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `MEDUSA_ROOT_PATH` | `/home/medusa` | 数据持久化路径，上传文件保存在其下的 `static` 目录（即 `/home/medusa/static`） |

- 该目录由安装/升级脚本自动创建并授权给容器运行用户（UID `100` / GID `101`），容器重建不会丢失图片。
- 仅适用于单实例部署；多副本或多机部署时各容器本地磁盘不共享，生产环境建议改用 S3 等对象存储。
- `docker compose down -v` 之类的操作不会删除该目录，但请勿手工清空。

### 支付宝支付（可选）

默认支付方式只有 Manual（`pp_system_default`）。填写 `ALIPAY_APP_ID`、`ALIPAY_PRIVATE_KEY`、`ALIPAY_PUBLIC_KEY` 三项后，后端会自动注册三个独立支付 Provider：

| Provider ID | 商城显示名称 | 支付场景 |
| --- | --- | --- |
| `pp_alipay_pc` | Alipay (PC) | 电脑网站支付 |
| `pp_alipay_h5` | Alipay (H5) | 手机网站支付 |
| `pp_alipay_qr` | Alipay (QR) | 当面付（扫码预下单） |

| 变量 | 默认值 | 说明 |
| --- | --- | --- |
| `ALIPAY_APP_ID` | 空 | 支付宝应用 APPID，三项凭证任一为空则不启用支付宝 |
| `ALIPAY_PRIVATE_KEY` | 空 | 应用私钥，**单行粘贴**，去掉 `-----BEGIN/END-----` 行与换行 |
| `ALIPAY_PUBLIC_KEY` | 空 | **支付宝公钥**（不是应用公钥），单行粘贴 |
| `ALIPAY_SELLER_ID` | 空 | 商户 PID；填写后异步通知的 `seller_id` 必须一致，否则拒绝 |
| `ALIPAY_GATEWAY` | 空 | 留空使用生产网关；沙箱填 `https://openapi-sandbox.dl.alipaydev.com/gateway.do` |
| `ALIPAY_NOTIFY_URL` | 空 | 异步通知地址；留空为 `${BACKEND_URL}/webhooks/alipay`，**必须公网可达** |
| `ALIPAY_RETURN_URL` | 空 | 同步回跳地址；留空由商城前端按购物车自动生成 |
| `ALIPAY_SUBJECT_PREFIX` | `Order` | 支付宝订单标题前缀 |

配置步骤：

1. 在支付宝开放平台创建应用，按需开通「电脑网站支付」「手机网站支付」「当面付」，并配置 RSA2 密钥。
2. 在上面的表单中填入 APPID、应用私钥、支付宝公钥；`BACKEND_URL` 必须是公网可访问的地址。
3. 保存并重建应用后，到 **Admin → Settings → Regions → 编辑 Region → Payment providers** 勾选需要的支付宝方式。全新安装时 `migrate` 的初始化数据已自动勾选，可跳过此步。
4. 若数据库已存在（安装后才填写凭证，或升级前就在使用），需执行一次幂等脚本：

```sh
docker exec -it <容器名> ./node_modules/.bin/medusa exec ./src/scripts/enable-alipay.js
```

> - 密钥可直接粘贴完整 PEM（含 `-----BEGIN/END-----` 行）、单行 base64 或字面量 `\n` 写法；安装/升级脚本会自动规范化为单行，勿在 `.env` 中手工写成多行（多行值会破坏 compose 解析）。
> - 本应用只部署后端 API 与 Admin，不含 storefront。PC/H5 支付会跳转支付宝收银台；**扫码支付需要 storefront 展示二维码**，仅开 Admin 无法完成扫码付。
> - 支付宝以人民币（CNY）为主。初始化 Region 为 EUR，使用非 CNY 币种需商户号已开通跨境收单。
> - 退款通过 `alipay.trade.refund` 执行，以退款记录的 idempotency key 作为 `out_request_no`，重复调用不会重复退款。
> - 本应用未注册 Stripe Provider，只接支付宝时无需 `STRIPE_API_KEY`。

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

# 手动重新执行数据库迁移
docker run --rm --network 1panel-network \
  -e DATABASE_URL="postgres://<用户>:<密码>@<主机>:<端口>/<数据库>?sslmode=<模式>" \
  -e JWT_SECRET="<密钥>" -e COOKIE_SECRET="<密钥>" \
  qyg2297248353/medusa:v2.22.2 ./node_modules/.bin/medusa db:migrate

# 备份上传文件（商品图片等）
tar czf static-backup-$(date +%F).tar.gz -C /home/medusa static
```

> 升级前请先备份数据库。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
