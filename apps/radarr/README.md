# Radarr

电影组织者/管理员，适用于 Usenet 和 torrent 用户。

![Radarr](https://file.lifebus.top/imgs/radarr_cover.png)

Radarr 是为 Usenet 和 BitTorrent 用户设计的电影收藏管理器。它可以监控多个 RSS 源，寻找新电影，并与客户端和索引器接口，抓取、排序和重命名它们。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 添加包含大量信息的新电影，如预告片、评分等。
+ 主要平台支持：Windows，Linux，macOS，Raspberry Pi 等。
+ 可以监控您拥有的电影质量，并自动升级。例如，从 DVD 升级到蓝光。
+ 自动失败下载处理将在一个失败时尝试另一个版本
+ 手动搜索，以便您可以选择任何版本或查看未自动下载版本的原因
+ 与 SABnzbd 和 NZBGet 的全面整合
+ 自动搜索发布内容以及 RSS 同步
+ 自动导入下载的电影
+ 识别特别版、导演剪辑版等。
+ 识别具有硬编码字幕的发布
+ 识别带有别名电影名的发布
+ SABnzbd，NZBGet，QBittorrent，Deluge，rTorrent，Transmission，uTorrent 和其他下载客户端被支持并集成
+ 与 Kodi 和 Plex 的全面整合（通知，库更新）
+ 导入元数据，如预告片或字幕
+ 为 Kodi 和其他人添加元数据，如海报和信息
+ 高级配置文件自定义，使得 Radarr 总是下载您想要的副本
+ 美观的 UI

## 反向代理

> Nginx
>
> BaseUrl 为 `/radarr` 时的反向代理配置如下：

```nginx
    location ^~ /radarr {
        proxy_pass http://127.0.0.1:7878;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $http_connection;
    }
    # Allow the API External Access via NGINX
    location ^~ /radarr/api {
        auth_basic off;
        proxy_pass http://127.0.0.1:7878;
    }
```

> Nginx
>
> BaseUrl 为 `/` 时的反向代理配置如下：

```nginx
  location / {
    proxy_set_header   Host $host;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host $host;
    proxy_set_header   X-Forwarded-Proto $scheme;
    proxy_set_header   Upgrade $http_upgrade;
    proxy_set_header   Connection $http_connection;

    proxy_redirect     off;
    proxy_http_version 1.1;

    proxy_pass http://127.0.0.1:7878;
  }
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
