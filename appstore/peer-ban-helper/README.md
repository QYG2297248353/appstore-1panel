# PeerBanHelper

PeerBanHelper 是一个开放源代码的个人网络防火墙安全软件

![PeerBanHelper](https://file.lifebus.top/imgs/peerbanhelper_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

所有安装在 Docker 中的下载器，必须使用 host 网络驱动程序。PBH 需要下载器能获得 Peer 的真实 IP，不能使用 bridge 桥接模式！

+ qBittorrent/qBitorrent，4.5.0 或更高版本，不支持 XDown
+ BiglyBT（需要安装插件）
+ Deluge（需要安装插件）
+ Transmission (4.1.0-beta2 或更高版本)
+ BitComet v2.10 Beta6 [20240928] 或更高版本 (不支持 P2SP LTSeed 长效种子反吸血，因为 BitComet 暂时无法封禁长效连接)

PeerBanHelper 仅支持对传统 IPv4 或 IPv6 地址的反吸血，如遇 I2P 或者 Tor 连接将主动忽略。

## 简介

PeerBanHelper 是一个开放源代码的个人网络防火墙安全软件。通过连接支持的应用程序（如：BitTorrent 客户端软件）的 Web API
接口获取受保护应用的连接信息，识别其中可能包含潜在安全威胁的连接并通知对应的应用程序主动断开其连接。

## 特性

+ PeerID 黑名单
+ Client Name 黑名单
+ IP/GeoIP/IP 类型 黑名单
+ 虚假进度检查器（提供启发式客户端检测功能）
+ 自动连锁封禁
+ 多拨追猎
+ Peer ID/Client Name 伪装检查；通过 AviatorScript 引擎 实现
+ 主动监测（提供本地数据分析功能）
+ 网络 IP 集规则订阅
+ WebUI （目前支持：活跃封禁名单查看，历史封禁查询，封禁最频繁的 Top 50 IP，规则订阅管理，图表查看，Peer 列表查看）

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
