# Jellyseerr

满足您所有媒体需求的一站式平台

![Jellyseerr](https://file.lifebus.top/imgs/jellyseerr_cover.jpg)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

启动此项目的首要动力是为 Overseerr 增加对 Jellyfin 和 Emby 的支持。因为 Overseerr 是一个性能卓越且易于使用的应用程序，我们希望为
Jellyfin 和 Emby 用户带来同样的体验。因此，Jellyseerr 应运而生。

此应用旨在成为满足您所有媒体需求的一站式平台。它被设计为一个简单、易用的应用程序，允许用户请求将媒体添加到您的
Jellyfin/Emby/Plex 服务器。

## 特性

+ 完整的Jellyfin/Emby/Plex集成。使用Jellyfin/Emby/Plex登录和管理用户访问。
+ 同步到您的Jellyfin/Emby/Plex库以显示您已经拥有的标题。
+ 与Sonarr和Radarr集成。未来将提供更多服务。
+ 易于使用的请求系统允许用户在友好、干净的UI中请求各个季节或电影。
+ 简单的需求管理界面。不要通过应用程序来批准最近的请求。
+ 适合移动设备的设计，适用于您需要在旅途中批准请求时。
+ 粒度权限系统。
+ 本地化为其他语言。

## 反向代理

> Nginx

```nginx
    proxy_set_header Referer $http_referer;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Real-Port $remote_port;
    proxy_set_header X-Forwarded-Host $host:$remote_port;
    proxy_set_header X-Forwarded-Server $host;
    proxy_set_header X-Forwarded-Port $remote_port;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_set_header X-Forwarded-Ssl on;

    location / {
        proxy_pass http://127.0.0.1:5055;
    }
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
