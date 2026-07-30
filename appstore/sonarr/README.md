# Sonarr

智能 PVR 适用于新闻组和 BT 用户。

![Sonarr](https://file.lifebus.top/imgs/sonarr_cover.png)

Sonarr 是为 Usenet 和 BitTorrent 用户设计的 PVR。它能够监控多个 RSS 订阅，寻找你喜爱的节目的新集，并抓取、整理和重命名它们。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 主要平台支持：Windows，Linux，macOS，Raspberry Pi 等。
+ 自动检测新集
+ 可以扫描您的现有库并下载任何缺失的剧集
+ 可以观看你已有的剧集的更高质量版本，并自动进行升级。例如，从 DVD 升级到蓝光。
+ 自动失败下载处理将在一个失败时尝试另一个版本
+ 手动搜索，以便您可以选择任何版本或查看未自动下载版本的原因
+ 完全可配置的集名重命名
+ 与 SABnzbd 和 NZBGet 的全面整合
+ 与 Kodi、Plex（通知、库更新、元数据）的全面整合
+ 全面支持特别节目和多集发布
+ 美观的 UI

## 反向代理

> Nginx
>
> BaseUrl 为 `/sonarr` 时的反向代理配置如下：

```nginx
    location ^~ /sonarr {
        proxy_pass http://127.0.0.1:8989;
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
    location ^~ /sonarr/api {
        auth_basic off;
        proxy_pass http://127.0.0.1:8989;
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

    proxy_pass http://127.0.0.1:8989;
  }
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
