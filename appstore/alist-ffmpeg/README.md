# OpenList (AList)

一个支持多种存储的文件列表程序

![OpenList](https://file.lifebus.top/imgs/alist_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

<div style="border: 1px solid #FFC107; padding: 10px; border-radius: 5px; color: #856404; background-color: #FFF3CD; display: inline-block; width: 100%; max-width: 60%; margin-top: 10px;">
    <div style="display: flex; align-items: center;">
        <span style="font-size: 24px; margin-right: 8px;">⚠️</span>
        <div>
            <strong style="font-size: 16px;">温馨提示</strong><br>
            <span style="font-size: 14px; color: #333;">该软件由于违背开源协议，导致现在管理混乱，请谨慎使用。</span>
        </div>
    </div>
</div>

## 版本说明

- `3.40.0` 源作者版 (已下线)
- `3.45.0` 被修改版 (已下线)
- `3.46.0 +` OpenList 社区版 (迁移版)

## 特性

+ 使用简单
    + AList 从一开始就设计为易于安装，并且可以在所有平台上使用。

+ 多种存储
    + AList 支持多个存储提供商，包括本地存储、阿里云盘、OneDrive、Google Drive 等，且易于拓展。

+ 支持 WebDAV
    + AList 支持所有 WebDAV 存储，这是一种用于访问文件的标准。

+ 黑暗模式
    + 自由切换明暗模式

+ 受保护的路由
    + 为特定路径添加密码保护和身份验证

+ 文件预览
    + 支持视频、音频、文档、PDF、图片预览等，甚至支持 ipa 安装

+ 打包下载/批量下载
    + 使用浏览器的 stream api 支持打包下载，无需使用服务器 / 使用Aria2进行批量下载支持文件夹

+ 单点登录
    + 使用单点登录快速登录AList

+ 自动注册AList帐号
    + 使用单点登录自动注册为AList帐号快速注册

+ 离线下载
    + 将种子内容离线下载到指定的目录內,需要苛刻的网络环境

+ 保险箱加密/解密 文件
    + 任何人都可以安全地将加密数据存储在远程存储提供商上。数据存储在保险箱中，提供商只能看到保险箱，看不到您的数据。

+ 更多新功能
    + 包括文本编辑器、README/HTML 渲染、文件永久链接、Cloudflare Workers 代理等

## 安装说明

当前版本预装 `ffmpeg` 用于封面截取

> 默认用户名：`admin`
>
> 默认密码：首次启动，可通过日志查询，或重置密码

### 重置密码

`4.0` 及以上请使用 `openlist` 替换 `alist`

+ 随机生成一个密码

```shell
alist admin random
```

+ 设置指定密码

```shell
alist admin set {PASSWORD}
```

### 反向代理

> Nginx 配置示例

```conf
location / {
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header Host $host:$server_port;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header Range $http_range;
  proxy_set_header If-Range $http_if_range;
  proxy_redirect off;
  proxy_pass http://127.0.0.1:5244;
  # 文件最大上传大小 20GB
  client_max_body_size 20000m;
}
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
