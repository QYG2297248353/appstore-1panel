# Slink

Slink 是一个使用 Symfony 和 SvelteKit 构建的自托管图片分享平台。

![Slink](https://file.lifebus.top/imgs/slink_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

解决了与朋友、家人和同事分享图片而不依赖第三方服务的问题。它还为艺术家提供了一个平台，让他们可以与社区分享自己的作品。
此外，开发人员可能会发现将其用于托管个人项目屏幕截图很有用，然后可以在 GitHub、个人网站、博客等地方使用。

## 特性

+ 认证：用户可以注册并登录平台。
+ 用户批准：在用户可以上传图片之前需要获得他们的批准。
+ 图片上传：可以上传 SVG、PNG、JPG、WEBP、BMP、ICO 或 GIF 格式的图片。
+ 分享链接：用户可以分享上传的图片链接，并自定义图片大小。
+ 上传历史：提供了用户上传的所有图片的概览。
+ 存储提供商：支持本地和 SMB 存储提供商。
+ 探索图片：展示由其他用户上传的公共图片的列表页面。
+ 暗色模式：应用程序支持暗色和亮色模式。

## 安装说明

### 公共列表

> 只有标记为公共的图像才会在这里显示。

应用包含一个可选的图片列表页面，用户可以在该页面上浏览其他用户上传的图片。

### 存储提供商

应用支持两种存储提供者：本地和 SMB。本地存储提供者将图像存储在本地文件系统中，而 SMB 存储提供者将图像存储在远程 SMB
服务器上。默认情况下，应用使用本地存储提供者。

### 用户批准

默认情况下，应用程序在用户上传图片前需要获得批准。

您需要使用 CLI 命令手动激活用户

> 邮箱激活

```shell
docker exec -it slink slink user:activate --email=<user-email>
```

> 用户ID 激活

```shell
docker exec -it slink slink user:activate --uuid=<user-id>
```

### 安全

Slink 支持用户认证和用户审批以防止未经授权访问应用。然而，建议使用反向代理如 Nginx 或 Traefik 添加额外的安全功能，如
SSL、速率限制等。

如果不想将整个应用公开，仅可以通过反向代理公开 /image 路由。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
