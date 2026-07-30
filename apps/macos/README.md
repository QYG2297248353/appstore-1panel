# Mac OS

Docker 容器内的 Mac OS

![Mac OS](https://file.lifebus.top/imgs/macos_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

macOS是苹果公司推出的使用图形用户界面的操作系统，为麦金塔系列电脑的主操作系统。

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

### 安装步骤

启动容器，并使用您的网页浏览器连接到端口 8006。

选择 Disk Utility ，然后选择最大的 Apple Inc. VirtIO Block Media 磁盘。

点击 Erase 按钮进行磁盘格式化，并给它起一个您喜欢的易于识别的名字。

关闭当前窗口，然后通过点击 Reinstall macOS 继续安装。

当系统提示您选择安装位置时，请选择您之前创建的磁盘。

所有文件复制完成后，请选择您的区域、语言和账户设置。

## 常见问题

### kvm 模块加载失败

请检查是否开启了虚拟化功能，或者在 BIOS 中开启虚拟化功能。

### 如何通过 USB 设备进行数据传输

请修改 docker-compose.yml 参数配置

```yml
environment:
  ARGUMENTS: "-device usb-host,vendorid=0x1234,productid=0x1234"
devices:
  - /dev/bus/usb
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
