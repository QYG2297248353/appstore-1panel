# JProxy

介于 Sonarr / Radarr 和 Jackett / Prowlarr 之间的代理，主要用于优化查询和提升识别率

![Sonarr](https://file.lifebus.top/imgs/jproxy_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 使用说明

> 默认用户名: jproxy
>
> 默认密码: jproxy@2023

## 安装说明

### 开启代理服务

在运行参数添加以下配置：

> HTTP 代理

+ `-Dhttp.proxyHost` 代理服务器地址
+ `-Dhttp.proxyPort` 代理服务器端口

示例：

```shell
-Xms512m -Xmx512m -Dhttp.proxyHost=192.168.1.1 -Dhttp.proxyPort=7890
```

> SOCKS 代理

+ `-DsocksProxyHost` 代理服务器地址
+ `-DsocksProxyPort` 代理服务器端口

示例：

```shell
-Xms512m -Xmx512m -DsocksProxyHost=192.168.1.1 -DsocksProxyPort=7890
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
