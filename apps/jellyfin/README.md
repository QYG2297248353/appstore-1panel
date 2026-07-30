# JellyFin

**Jellyfin** 是一个免费开源的媒体服务器软件，用于组织、管理和流媒体共享您的音频、视频和图片等媒体内容。

![JellyFin](https://file.lifebus.top/imgs/jellyfin_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

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

## 中文字幕支持 (启用备用字体)

请在设置中添加备用字体路径
默认路径：`/home/jellyfin/config/font`

`/home/jellyfin` 为安装根路径，请在应用参数中查询具体参数

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
