# ZTNet

简短的介绍

![ZTNet](https://file.lifebus.top/imgs/ztnet_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

ZTNet是一个支持多用户和组织的ZeroTier Web UI。

## 安装说明

### 首位用户

> The first registered user automatically gains admin privileges. As an administrator, you possess unique capabilities not available to regular > users. This includes the ability to view all registered accounts on the controller.

首位注册用户将自动获得管理员权限。作为管理员，您拥有普通用户所不具备的独特权限，包括查看控制器上所有已注册帐户的权限。

> Please note that while admins have visibility over registered accounts, they cannot interact with or modify other users' networks directly. > > Each network's configuration and data remain exclusive to the respective user account, maintaining privacy and security for all users.

请注意，管理员虽然可以查看已注册账户，但无法直接与其它用户的网络进行交互或修改。每个网络的配置和数据都仅限于相应的用户账户，从而保障所有用户的隐私和安全。

### 开启远程ZeroTier网络

在主机上二进制部署的ZeroTier服务，需要在ZeroTier控制器上开启远程ZeroTier网络。

否则 ZTNet 无法正常工作。

#### 在主机系统上安装 ZeroTier One：

``` sh
curl -s https://install.zerotier.com | sudo bash
```

#### 在ZeroTier控制器上开启远程ZeroTier网络：

编辑 `/var/lib/zerotier-one/local.conf` 文件以允许远程管理ZeroTier网络。


``` json
{
  "settings": {
    "allowManagementFrom": ["0.0.0.0/0"]
  }
}
```

> 0.0.0.0/0 设置允许从任何 IP 地址进行管理。对于生产环境，建议将其限制为特定的 IP 地址范围。

### 安装配置说明

以下配置项需要您根据实际部署环境手动填写，模板无法自动获取宿主机的 IP 或访问地址。

#### ZeroTier 地址（ZT_ADDR）

ZeroTier 控制器的访问地址。ZTNet 运行在 Docker 容器中，容器内的 `127.0.0.1` 指向容器自身，**无法访问宿主机上的 ZeroTier 服务**，因此必须填写宿主机的实际 IP 地址。

例如宿主机 IP 为 `192.168.1.100`，则填写：

```
http://192.168.1.100:9993
```

> 请根据您的实际环境填写，不能使用 `127.0.0.1` 或 `localhost`。

#### ZeroTier 密钥（ZT_SECRET）

ZeroTier 控制器的 API 密钥，即宿主机 `/var/lib/zerotier-one/authtoken.secret` 文件的**内容**（而非文件名）。

执行以下命令获取：

``` sh
cat /var/lib/zerotier-one/authtoken.secret
```

将输出的内容复制到 `ZeroTier 密钥` 输入框中即可。

#### WebUI 访问地址（NEXTAUTH_URL）

ZTNet（NextAuth）用于生成登录回调的地址，**必须与您实际访问 ZTNet 页面的地址完全一致**。模板无法得知您使用 IP 还是域名访问，以及是否配置了反向代理，请按实际情况填写：

- 直接通过 IP 访问：`http://192.168.1.100:3000`（端口为您填写的 WebUI 端口）
- 通过域名 + 反向代理访问：`https://ztnet.example.com`

> 如果填写错误，可能导致登录后跳转失败或提示回调地址不匹配。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
