# Windows 系统

Docker 容器内的 Windows

![Windows](https://file.lifebus.top/imgs/windows_cover.jpg)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Microsoft Windows，或称Windows操作系统，是微软以图形用户界面为主推出的一系列专有商业软件操作系统。
它于1985年问世，起初为运行于MS-DOS之下的桌面环境，其后续版本逐渐发展成为主要为个人电脑和服务器用户设计的操作系统，并最终获得了世界个人电脑操作系统的垄断地位。

## 特性

+ 国际标准下载器
+ KVM 加速
+ 网络浏览器

## 安装说明

<div style="border: 1px solid #FFC107; padding: 10px; border-radius: 5px; color: #856404; background-color: #FFF3CD; display: inline-block; width: 100%; max-width: 60%; margin-top: 10px;">
    <div style="display: flex; align-items: center;">
        <span style="font-size: 24px; margin-right: 8px;">⚠️</span>
        <div>
            <strong style="font-size: 16px;">警告</strong><br>
            <span style="font-size: 14px; color: #333;">该应用申请使用 `网络特权模式`， 将允许应用在容器内部执行网络管理相关特权操作。</span>
        </div>
    </div>
</div>

由于需要下载系统镜像，安装过程的快慢取决于您的网络，请耐心等待。

部分系统不包含部分语言，如果无法安装系统，请尝试跟换系统语言，重建即可。

### 挂载自定义ISO

如果您有自己的 Windows 系统镜像。
你可以选择将其挂载至镜像并修改 docker-compose.yml 文件。

+ 自定义本地镜像地址

```yml
environment:
  VERSION: "/win.iso"
```

+ 自定义远程镜像地址

```yml
environment:
  VERSION: "https://example.com/win.iso"
```

## 常见问题

### kvm 模块加载失败

请检查是否开启了虚拟化功能，或者在 BIOS 中开启虚拟化功能。

### 挂载更多磁盘

请修改 docker-compose.yml 参数配置

```yml
environment:
  DISK2_SIZE: "32G"
  DISK3_SIZE: "64G"
volumes:
  - /home/example:/storage2
  - /mnt/data/example:/storage3
```

### 如何直通磁盘

请修改 docker-compose.yml 参数配置

```yml
devices:
  - /dev/sdb:/disk1
  - /dev/sdc:/disk2
```

### 如何通过 USB 设备进行数据传输

请修改 docker-compose.yml 参数配置

```yml
environment:
  ARGUMENTS: "-device usb-host,vendorid=0x1234,productid=0x1234"
devices:
  - /dev/bus/usb
```

### 如何使用 RDP 进行连接

通过网页访问，一般情况下适用于系统安装过程中使用，因为其画质较低，且没有音频或剪贴板等功能。

您可以使用任何 Microsoft 远程桌面客户端连接到容器的 IP 地址，使用用户名 Docker ，并且密码留空。

安卓设备可以从应用商店下载 RDP 客户端，iOS 设备则可在苹果商店找到对应的客户端。Linux 用户可以使用 FreeRDP，而 Windows
用户只需在搜索框中输入 mstsc 即可。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
