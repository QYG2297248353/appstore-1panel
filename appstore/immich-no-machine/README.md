# Immich

Immich - 高性能自托管照片和视频备份解决方案

![Immich](https://file.lifebus.top/imgs/immich_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 硬件支持

+ RAM：最小 4GB，建议 6GB。
+ CPU：最少 2 核，建议 4 核。
+ 存储：推荐使用支持用户/组所有权和权限的 Unix 兼容文件系统（EXT4、ZFS、APFS 等）。
    + 缩略图和转码视频的生成可以使照片库的平均大小增加 10-20%。

## 简介

> 该版本无 `机器学习` 模块，适用于不具备硬件条件的用户。
>
> 您将无法使用 `机器学习` 功能，如 `CLIP`、`人脸识别` 等功能。
>
> 如果您需要 `机器学习` 模块，可通过配置远端 `机器学习` 服务来使用。

欢迎您
您好，很高兴您能来到这里。

我叫亚历克斯。我在学校时是一名电气工程师，后来因为工作和对解决问题的纯粹热爱而成为了一名软件工程师。

我们和新生儿躺在床上，我妻子说："我们开始积累大量宝宝的照片和视频，我不想再为 App-Which-Must-Not-Be-Name
付费了。你总是想为我建一些东西，为什么不为我建一个能做到这一点的应用程序呢？

就这样，这个想法开始在我脑海中萌生。之后，我开始在自助托管领域寻找具有类似备份功能和 "非命名应用程序 "
性能水平的现有解决方案。我发现目前的解决方案主要集中在画廊类型的应用程序上。然而，我想要的是一个简单易用的备份工具，并带有一个能高效查看照片和视频的本地移动应用程序。于是，我作为一名如饥似渴的工程师踏上了寻找之旅。

另一个促使我执行 "不可名状的应用程序 "替代方案的动机是，我希望能为开源社区做出贡献，多年来我从这个社区中受益匪浅。

我很荣幸能与大家分享这一作品，它重视隐私、回忆，以及在易用、友好的界面中回顾这些时刻的喜悦。

如果您喜欢这款应用程序，或者它在某些方面对您有帮助，请考虑支持这个项目。这将有助于我继续开发和维护应用程序。

## 环境准备

+ `Redis` 服务

Immich 使用 Redis 作为缓存服务，所以需要安装 Redis 服务。

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

## 升级说明

+ **大版本** `v1.106.2`

`2024/06/12` 上线，升级需要注意：

1. 移除 `immich-microservices` 服务
2. 环境变量发生了合并
3. 底层API发生了变化
    4. 移动端需要同步更新

## 安装说明

### 机器学习 预加载模型(CLIP)

可选模型列表，粘贴时输入 `immich-app/` 之后的内容即可。

[immich-app's Collections - CLIP](https://huggingface.co/collections/immich-app/clip-654eaefb077425890874cd07)

[immich-app's Collections - Multilingual CLIP](https://huggingface.co/collections/immich-app/multilingual-clip-654eb08c2382f591eeb8c2a7)

默认模型

中文支持较好的模型 `XLM-Roberta-Large-Vit-B-16Plus`

### 人脸识别 预加载模型

`buffalo_l`, `buffalo_m`, `buffalo_s`, `antelopev2`

## 常见问题

+ 安装失败
    + 网络问题，可以尝试使用代理
+ 升级失败
    + 请查看升级说明
    + 请查看日志，查看具体错误信息
    + 记录安装参数，进行卸载重装
    + 升级1Panel后,提示容器找不到
        + 请删除容器,重新安装
        + 提示文件或目录不存在
            + 可手动创建不存在的文件和目录，然后重试
            + 创建的文件可为空文件
    + 每次都升级失败
        + 很抱歉，官方应用不支持编排式应用(一个应用包含多个容器)的安装与升级，您可以尝试手动卸载安装最新版
+ 无法访问
    + 请检查是否安装了 `Redis` 服务
    + 请检查是否正确配置了 `Redis` 服务
    + 请检查是否正确配置了 `域名` 和 `SSL`
    + 请检查是否正确配置了 `端口`
    + 请检查是否正确配置了 `防火墙` 并开放了 `端口`
    + 请检查是否正确配置了 `Nginx` 服务

## 移动端应用

<div style="text-align: center; display: flex; justify-content: center; gap: 20px;">
  <div style="display: flex; flex-direction: column; align-items: center;">
    <img src="https://file.lifebus.top/imgs/immich_app_store_qr.png" alt="App Store" style="width: 256px;">
    <a href="https://apps.apple.com/sg/app/immich/id1613945652" style="text-align: center;">App Store</a>
  </div>
  <div style="display: flex; flex-direction: column; align-items: center;">
    <img src="https://file.lifebus.top/imgs/immich_google_play_qr.png" alt="Google Play" style="width: 256px;">
    <a href="https://play.google.com/store/apps/details?id=app.alextran.immich" style="text-align: center;">Google Play</a>
  </div>
</div>

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
