# Adguard Home

简短的介绍

![Adguard Home](https://file.lifebus.top/imgs/adguardhome_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

AdGuard Home 是一种基于网络的广告和跟踪器拦截解决方案。只需在您的路由器上安装一次，即可覆盖您家庭网络中的所有设备——无需额外的客户端软件。这对于各种经常威胁您隐私的物联网设备尤其重要。

## 安装说明

### 默认 DNS

需要提前关闭宿主机 `resolved` 功能，否则会导致 DNS 解析失败。

```sh
systemctl disable systemd-resolved
systemctl stop systemd-resolved
```

### 初始化配置

安装后进入页面后，必须将 80 端口改为 3000 否则，结束后 页面将无法访问。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
