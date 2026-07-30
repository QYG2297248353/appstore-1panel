# Emby

Emby是一个主从式架构的媒体服务器软件，可以用来整理服务器上的视频和音频，并将音频和视频流式传输到客户端设备。

![Emby](https://file.lifebus.top/imgs/emby_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Emby（原名Media Browser）是一个主从式架构的媒体服务器软件，可以用来整理服务器上的视频和音频，并将音频和视频流式传输到客户端设备。

Emby服务器端支持Microsoft Windows、Linux、MacOS、FreeBSD，客户端支持HTML5网页，Android和IOS等移动操作系统，Roku、Amazon Fire
TV、Chromecast和Apple TV等流媒体设备，LG智能电视和三星智能电视等智能电视，以及PlayStation3、PlayStation4、Xbox 360和Xbox
One等游戏机。

Emby原本是大部分源代码是开源的，带有部分闭源工具，但是自从3.5.3版本开始变为闭源软件，Jellyfin为Emby开源分支基础上发展来的。

## 安装说明

### 开启 `投屏服务(DLNA)` 与 `网络唤醒服务(WOL)` 功能

开启后，可以在局域网内的设备上投屏观看视频。 需要选择主机网络(host)模式。

### 硬件驱动挂载

默认仅挂载: `/dev/dri`,如果您的设备不存在硬件驱动，请使用删除完整 `devices` 配置。

可以通过 `ls /dev/` 查看存在的设备驱动。

```yml
devices:
  - /dev/dri:/dev/dri
  # - /dev/nvidia0:/dev/nvidia0
  # - /dev/nvidiactl:/dev/nvidiactl
  # - /dev/nvidia-modeset:/dev/nvidia-modeset
  # - /dev/nvidia-nvswitchctl:/dev/nvidia-nvswitchctl
  # - /dev/nvidia-uvm:/dev/nvidia-uvm
  # - /dev/nvidia-uvm-tools:/dev/nvidia-uvm-tools
  # - /dev/video11:/dev/video11
```

如果您的设备存在其他硬件驱动，可以选择挂载。删除 `# ` 号即可。格式为：`宿主机路径:容器路径`。

格式请与 `- /dev/dri:/dev/dri` 保持一致。

## 特别版说明

### 插件支持

#### emby-erx Emby 增强/美化 插件

> 开启请在 `{持久化目录}/config/config/ext.sh` 添加媒体库ID

![emby-erx 插件](https://file.lifebus.top/imgs/emby_erx_plugin.png)

#### dd-danmaku Emby 弹幕库插件

> 开启请在 `{持久化目录}/config/config/ext.sh` 中设置

![dd-danmaku 插件](https://file.lifebus.top/imgs/emby_dd_danmaku_plugin.png)

#### embyExternalUrl Emby 调用外部播放器

> 开启请在 `{持久化目录}/config/config/ext.sh` 中设置

![embyExternalUrl 插件](https://file.lifebus.top/imgs/emby_external_url_plugin.png)

### 使用说明

#### 激活 Emby Premiere

密钥：`疯狂星期四V我50`

#### 电视直播

添加直播源后,再手动刷新一下指南数据

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
