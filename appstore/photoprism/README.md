# PhotoPrism

面向去中心化网络的人工智能照片应用程序

![PhotoPrism](https://file.lifebus.top/imgs/photoprism_cover.png)

PhotoPrism® 是一款适用于去中心化网络的人工智能照片应用程序。它利用最新技术自动标记和查找图片，而不会妨碍您。您可以在家中、私人服务器上或在云中运行它。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

我们的使命是提供对用户和隐私最友好的解决方案，让您的图片井然有序且易于访问。这就是为什么 PhotoPrism
是从头开始构建的，可以在您需要的任何地方运行，而不会影响自由、隐私或功能：

+ 浏览所有照片和视频，无需担心RAW 转换、重复或视频格式
+ 使用强大的搜索过滤器轻松查找特定图片
+ 认出家人和朋友的面孔
+ 根据图片内容和位置自动分类
+ 将鼠标悬停在相册和搜索结果中的实时照片上即可播放它们
+ 由于用户界面是渐进式 Web 应用程序，因此它提供了类似本机应用程序的体验，您可以方便地将其安装在所有主要操作系统和移动设备的主屏幕上
+ 包括四张高分辨率世界地图，带回您最喜欢的旅行的回忆
+ 元数据从 Exif、XMP 和其他来源（例如 Google Photos）中提取并合并
+ 还可以搜索更多图像属性，例如Colors 、 Chroma和Quality
+ 使用PhotoSync在后台安全备份 iOS 和 Android 手机
+ WebDAV 客户端（例如 Microsoft 的 Windows Explorer 和 Apple 的 Finder）可以直接连接到
  PhotoPrism，允许您从计算机中打开、编辑和删除文件，就像它们是本地文件一样

## 环境说明

由于 `PhotoPrism` 有依赖于 `FFmpeg`，所以需要在安装时进行自动安装。

`PhotoPrism` 会自动安装 `FFmpeg`，并且会在初始化时进行检测。

由于使用 `TensorFlow` 进行人脸识别，等相关数据处理，所以需要在安装时进行自动安装。

`PhotoPrism` 会自动安装 `TensorFlow`，并且会在初始化时进行检测。

建议用户开启 至少 `4GB` 交换分区，增大内存使用。

## 安装说明

推荐使用 `MariaDB` 数据库，作为 `PhotoPrism` 的数据库存储。

### `数据库 地址` 配置

格式：`host:port`

示例：`127.0.0.1:3306`

### `认证模式` 配置

默认值：`密码`

程序必须登录才能使用。

如果您选择: `公开`

那么任何人都将允许访问程序。

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

### `视频编码器` 配置

`PhotoPrism` 支持 `FFmpeg` 视频编码器，需要安装 `FFmpeg`。

初始化时，`PhotoPrism` 会自动进行 `FFmpeg` 的安装。

使用 `FFmpeg` 时，需要选择 `软解`。

如果您的设备存在其他硬件驱动，可以选择 `硬解` 的方式加速 `视频转码`。

很不幸的是 Windows 下不能很好的映射驱动程序，所以 `硬解` 选项在 Windows 下不可用。

### `视频分辨率限制` 配置

默认值： `1920`，表达为 `1920x1080`。

当转码低于此分辨率的视频时，`PhotoPrism` 会保持原始分辨率，不会将其放大处理。

### `视频比特率限制` 配置

默认值： `32`，单位为 `Mbit/s`。

如果有需要，可以根据自己的需求进行调整。

## 设备同步 PhotoSync

<div style="text-align: center; display: flex; justify-content: center; gap: 20px;">
  <div style="display: flex; flex-direction: column; align-items: center;">
    <img src="https://file.lifebus.top/imgs/photosync_app_store_qr.png" alt="App Store" style="width: 256px;">
    <a href="https://apps.apple.com/cn/app/photosync-%E4%BC%A0%E8%BE%93%E5%92%8C%E5%A4%87%E4%BB%BD%E7%85%A7%E7%89%87%E4%B8%8E%E8%A7%86%E9%A2%91/id415850124" style="text-align: center;">App Store</a>
  </div>
  <div style="display: flex; flex-direction: column; align-items: center;">
    <img src="https://file.lifebus.top/imgs/photosync_google_play_qr.png" alt="Google Play" style="width: 256px;">
    <a href="https://play.google.com/store/apps/details?id=com.touchbyte.photosync" style="text-align: center;">Google Play</a>
  </div>
</div>

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
