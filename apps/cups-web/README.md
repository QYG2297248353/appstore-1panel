# CUPS Web — 网页打印管理

基于 CUPS 的网页版打印管理工具。通过浏览器上传文件、远程提交打印任务，支持多用户管理与打印记录追踪，适合家庭和小型办公室使用。

![Cups Web](https://file.lifebus.top/imgs/cups_web_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

### AirPrint 支持

需要宿主机安装 avahi-daemon 包，用于 AirPrint 支持。

#### 安装 avahi-daemon 包

```bash
# debian/ubuntu
sudo apt install avahi-daemon

# redhat/centos
sudo dnf install -y avahi
```

#### 启动 avahi-daemon 服务

```bash
sudo systemctl enable --now avahi-daemon

systemctl status avahi-daemon
```

#### 防火墙

```bash
sudo firewall-cmd --zone=public --add-service=mdns --permanent
sudo firewall-cmd --reload
```

## 简介

把家用 USB 打印机变成随时可访问的网络打印服务

把家用 USB 打印机变成随时可访问的网络打印服务，你可以通过浏览器访问 USB 打印机变成随时可访问的网络打印服务。

## 特性

### 打印能力

- **多格式支持**：PDF、图片（JPG/PNG/GIF/HEIC）、Office 文档（doc/docx/xls/xlsx/ppt/pptx）、OFD、纯文本
- **自动转换**：Office 文档通过 LibreOffice 转 PDF；OFD 通过内置 Java 转换器（基于 ofdrw）转 PDF；文本/图片在服务端渲染为 PDF
- **多图片合并打印**：一次选择多张图片自动合并为一份 PDF
- **打印选项**：份数、单双面、彩色/黑白、纸张大小、纸张类型、页面方向、页码范围、缩放、镜像打印
- **实时预览**：支持 PDF 预览、纸张方向的可视化预览、页数估算

### 打印机驱动

镜像内预装了 Debian `printer-driver-all` 等通用驱动包，覆盖大部分常见打印机。对于特定品牌打印机，提供**按需手动安装**的驱动脚本和 Web 管理界面：

**预装通用驱动**（开箱即用）：

- `printer-driver-all`：Debian 维护的驱动 meta 包，包含 splix、c2050、m2300w、ptouch 等
- `printer-driver-cups-pdf`：虚拟 PDF 打印机
- `printer-driver-escpr`：Epson ESC/P-R 标准款（大部分 Epson 喷墨老机型）
- `printer-driver-foo2zjs`：ZjStream / Hiperc / OAKT 协议（部分 HP / Konica / Minolta 老款激光机）
- `printer-driver-brlaser`：Brother 老款激光机
- `foomatic-db-compressed-ppds` + `openprinting-ppds`：海量 PPD 库
- `hplip` + `hpijs-ppds` + `hp-ppd`：HP 全系打印套件
- `ipp-usb` + CUPS 内置 driverless：IPP Everywhere / AirPrint / Mopria 自动识别

**可选厂商驱动**（通过 Web 界面或命令行按需安装，安装后自动持久化）：

| 驱动                  | 命令名             | 架构                  | 适用机型                                     |
| --------------------- | ------------------ | --------------------- | -------------------------------------------- |
| Canon UFR II          | `canon-ufr2`       | amd64 / arm64         | i-SENSYS LBP/MF、imageCLASS、imageRUNNER 等  |
| Canon CAPT            | `canon-capt`       | 全架构 🔧             | LBP2900 / LBP2900B                           |
| HP LaserJet 1020 固件 | `hp-laserjet1020`  | 全架构                | HP LaserJet 1020 / 1020 Plus                 |
| HP foo2zjs 固件       | `foo2zjs-firmware` | 全架构 🔧             | HP LaserJet 1000/1005/1018/P1005/P1006/P1505 |
| Epson ESC/P-R 2       | `escpr2`           | amd64 / armhf / arm64 | ET-18100, L8050, L8160, WF-7840 等           |
| Epson 国行驱动        | `epson-cn`         | 仅 amd64              | L380, L455 等国行机型                        |
| Konica Minolta bizhub | `konica-bizhub`    | amd64 / arm64         | bizhub 3000MF                                |
| Sharp PostScript      | `sharp`            | 全架构                | MX-C2622R 等 PostScript 打印机               |
| Gutenprint            | `gutenprint`       | amd64 / arm64         | 大量 Epson/Canon/HP 老机型                   |

### 驱动管理（Web 界面）

驱动管理页面**仅管理员可见**（登录后导航栏的「驱动」入口）：

- **自动检测**：扫描 USB / 网络打印机，自动匹配推荐驱动
- **一键安装**：检测到打印机后一键安装驱动，并自动 `lpadmin` 添加到 CUPS（默认纸张设为 A4）
- **驱动列表**：查看所有可用驱动的安装状态、安装时间与支持架构，一键安装 / 卸载
- **上传自定义驱动**：支持上传 PPD 文件（`.ppd`）或 Debian 包（`.deb`），仅这两种扩展名
- **驱动持久化**：安装的驱动文件自动快照到 `.drivers` 持久卷，容器重建后自动恢复

### 用户与权限

- **多用户系统**：支持 `admin` / `user` 两种角色
- **默认管理员**：首次启动自动创建 `admin/admin`，`admin` 账号受保护无法被删除或重命名
- **打印记录**：完整保存每次打印的文件、页数、份数、双面/彩色选项、状态等

### 管理后台

- **用户管理**：创建、编辑、删除用户；修改角色与联系信息
- **打印记录查询**：可按用户名、时间范围过滤
- **数据保留策略**：按天数自动清理过期打印记录和对应文件（每小时巡检一次）

### 安全

- **Session 认证**：基于 Gorilla `securecookie`（加密 + 签名），密钥自动生成并持久化到数据库
- **CSRF 防护**：对所有非 GET/HEAD/OPTIONS 请求校验 `X-CSRF-Token`
- **密码安全**：bcrypt 加密存储

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
