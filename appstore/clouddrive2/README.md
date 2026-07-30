# CloudDrive

CloudDrive是一个强大的多云盘管理工具，为用户提供包含云盘本地挂载的一站式的多云盘解决方案。

![CloudDrive](https://file.lifebus.top/imgs/clouddrive2_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

+ CloudDrive是一个全方位的云存储管理平台，旨在无缝集成多个云存储服务，将它们统一整合到一个界面中。 使用CloudDrive，您可以轻松管理和访问所有云存储服务，无需在不同的应用程序和界面之间来回切换。
+ CloudDrive最引人注目的特点是其能够将多个云存储服务挂载为本地磁盘，直接访问文件而无需预先下载。想象一下，您可以将云存储服务当作本地文件系统的一部分来使用，带来的便利性不言而喻。
+ 但这还不是全部 - CloudDrive还提供了高级功能，如快速的云端文件传输、实时的云文件通知和应用级别的权限控制。无论您是高级用户还是普通云存储用户，CloudDrive都能以卓越的效率和易用性让您充分发挥云存储资源的潜力。

## 运行前准备
Clouddrive 使用 fuse3 来挂载云存储服务，使用fuse3在Docker容器中挂载云存储服务时，需要在主机系统上启用共享挂载。这可以通过在Docker服务配置中设置MountFlags选项或在主机系统上使用mount
--make-shared命令来实现。这是因为FUSE3需要共享挂载才能正常工作，如果没有共享挂载，挂载将会失败并显示“权限被拒绝”的错误。通过启用共享挂载，FUSE3挂载可以在Docker容器和主机系统之间共享，从而实现对云存储服务的无缝访问。

为了在 Docker 容器中启用 fuse 并将挂载分享给主机，需要在主机上设置以下选项之一：

选项 1：当Docker是以systemd service运行时，在 Docker 服务中启用 MountFlags
```sh
sudo mkdir -p /etc/systemd/system/docker.service.d/
sudo cat <<EOF > /etc/systemd/system/docker.service.d/clear_mount_propagation_flags.conf
[Service]
MountFlags=shared
EOF
sudo systemctl restart docker.service
```

选项 2：当Docker不是以systemd service运行时，在主机上启用共享挂载选项
```sh
sudo mount --make-shared $(df -P /path/to/dir | tail -1 | awk '{ print $6 }')
```

> 注意：mount --make-shared 命令只在当前运行的系统中生效，重启后需要重新执行。如需重启后自动运行CloudDrive，请将该命令添加到系统启动项中。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
