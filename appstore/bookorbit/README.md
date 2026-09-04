# BookOrbit

一个自托管的图书馆和阅读平台，提供电子书、PDF、有声读物和漫画。

![APP_NAME](https://file.lifebus.top/imgs/bookorbit_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

BookOrbit 可以整理您的书籍，并随时随地为您朗读：网页阅读器、Kobo 阅读器或 KOReader
阅读器。阅读进度、标注和阅读状态会在三个平台之间同步，因此您可以在一个地方开始阅读章节，然后在另一个地方完成阅读。

围绕这个核心平台，坐落着 14 个元数据提供商、阅读统计和成就、OPDS 和发送至 Kindle 功能、支持 OIDC/SSO 的多用户帐户，以及自动同步到
Hardcover、Readwise 和 StoryGraph 的功能。所有这些都运行在您可控制的基础架构之上。

## 特征

### 内置网页阅读器

支持电子书（EPUB、KEPUB、MOBI、AZW3、AZW、FB2）、PDF、漫画（CBZ、CBR、CB7）和有声读物（M4B、MP3、M4A、OPUS、OGG、FLAC），无需额外插件。

### 三方同步（Kobo + KOReader + BookOrbit）

阅读进度和批注可在 Kobo 设备、KOReader 和 BookOrbit 网络阅读器之间双向同步。无论在哪个设备上，都能从上次中断的地方继续阅读，包括高亮和删除的内容。

### KOReader 插件

一个设备端目录浏览器，具有搜索、下载、状态和评分管理功能，以及完整的进度和注释同步功能。

### 注释与高亮

网页阅读器、KOReader 和 Kobo 中的高亮内容合并到一个可搜索的中心。可按颜色、样式和来源筛选；可导出为 Markdown、CSV 或 JSON 格式。

### Hardcover、Readwise 和 StoryGraph 同步

根据可配置的触发条件，将状态、进度、阅读日期和评分推送至 Hardcover；将状态和进度推送至
StoryGraph；并将您在网页阅读器和已同步设备上创建的新高亮和笔记同步至 Readwise。Hardcover 的阅读历史记录可以回溯，以填充
BookOrbit 中的空白条目。

### 统计数据、目标与成就

每日阅读时长、阅读热图、连续阅读天数和图书馆健康状况，以及年度目标、月度挑战和涵盖五大类别的 50 多项成就。阅读 DNA
会根据您的实际阅读记录分析您的阅读风格。

### 多用户和 SSO

细粒度的用户权限和隔离的读取数据，通过 OIDC 原生支持 Authentik、Keycloak 和 Authelia。

### 多语言界面

社区翻译由 Crowdin 管理。

### 内容分发

支持 OPDS 兼容应用程序、通过电子邮件发送到 Kindle 以及浏览器拖放上传。

### 自动导入

配置 Book Dock 文件夹，实现免手动导入。

## 安装

### 生成密钥

```sh
openssl rand -hex 24   # use for 数据库密码 POSTGRES_PASSWORD
openssl rand -hex 32   # use for 随机密钥 JWT_SECRET
openssl rand -hex 16   # use for 初始化密钥 SETUP_BOOTSTRAP_TOKEN
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
