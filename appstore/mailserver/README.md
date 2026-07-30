# Docker Mailserver

docker-mailserver，简称 DMS，是一个可用于生产的全栈但简单的邮件服务器（SMTP、IMAP、LDAP、反垃圾邮件、反病毒等）。它只使用配置文件，不使用
SQL 数据库。其形象以 "保持简单和版本化 "为口号。

<img height="128" src="https://file.lifebus.top/apps/mailserver/logo.png" width="128"/>

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 前置准备

- `域名`
- `DNS 解析`
- `服务器`
    - `Docker` 服务
    - `推荐配置`: 1核2G内存 容器已启用交换功能
    - `最小配置`: 1核512M内存 (禁用 ClamAV 服务)

### DNS 配置

假设你的域名是 `example.com`

邮件服务器的完全限定域名 (FQDN) 是 mail.example.com，你需要配置以下记录：

- `A` 记录: `mail.example.com` 指向你的服务器 IP 地址
    - MX 记录告诉每个人哪个 (DNS) 名称负责您域中的电子邮件。
- `MX` 记录: `example.com` 指向 `mail.example.com`
    - A 记录告诉每个人 DNS 名称
- `PTR` 记录(可选): 你的服务器 IP 地址指向 `mail.example.com`
    - PTR 记录是 A 记录的对应记录

当然，您也可以完全在 example.com 上配置，您需要更改您的 MX 记录：

- `MX` 记录: `example.com` 指向 `example.com`
- `A` 记录: `example.com` 指向您的服务器 IP 地址

什么是 PTR 记录？[请参阅](https://en.wikipedia.org/wiki/Reverse_DNS_lookup)

此项服务在 DNS 解析商中可能存在收费，如您不想使用此项服务，可以不配置 PTR 记录。

### 证书准备

您需要一个有效的 SSL 证书，您可以使用 `Let's Encrypt` 或者其他证书颁发机构颁发的证书。

将证书文件放置在 持久化目录的 `certs` 目录下，文件名为 `public.crt` 和 `private.key`。

### 端口占用检查

- `25` SMTP 端口

```sh
netstat -tuln | grep 25
```

停止Linux 邮件服务 `postfix` 服务, 释放 25 端口, 避免端口占用。

```sh
systemctl status postfix.service
systemctl stop postfix.service
systemctl disable postfix.service
```

## 安装完成

首次启动至少要添加一个账户，您有两分钟的时间来执行此操作。请在容器终端中运行以下命令。

如果您错过了这个时间，您可以通过删除容器并重新启动来重新启动此过程。

> 创建 用户
>
> `setup email add <NEW ADDRESS>`

```sh
setup email add user@example.com
```

> 设置别名
>
> `setup alias add <ALIAS> <EMAIL>`

```sh
setup alias add postmaster@example.com user@example.com
```

> 更新证书

将证书文件放置在 持久化目录的 `certs` 目录下，文件名为 `public.crt` 和 `private.key`。

重启容器，即可更新证书。

## 通过 中继服务器 发送邮件

如果您的 ISP 阻止了 25 端口，您可以使用中继服务器发送邮件。

### `SMTP 中继主机` 配置

常见的 SMTP 服务器配置如下：

- `Gmail`: `smtp.gmail.com`
- `QQ`: `smtp.qq.com`
- `163`: `smtp.163.com`
- `126`: `smtp.126.com`

### `SMTP 中继端口` 配置

常见的 SMTP 服务器端口配置如下：

- `Gmail`: `587`
- `QQ`: `465`
- `163`: `465`
- `126`: `465`
- `25` 通常也可以使用

### `SMTP 中继用户名` 配置

常见的 SMTP 服务器用户名配置如下：

- `Gmail`: `邮箱地址`
- `QQ`: `qq账户`
- `163`: `邮箱地址`
- `126`: `邮箱地址`

### `SMTP 中继密码` 配置

常见的 SMTP 服务器密码配置如下：

> `授权码` 是指在邮箱设置中生成的授权码，不是邮箱密码。
>
> `应用密码` 是指在邮箱设置中生成的应用密码，不是邮箱密码。

- `Gmail`: `应用密码`
- `QQ`: `授权码`
- `163`: `授权码`
- `126`: `授权码`

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
