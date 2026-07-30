# Prowlarr

终极索引器管理器。

![Prowlarr](https://file.lifebus.top/imgs/prowlarr_cover.png)

Prowlarr 是一个基于流行 *arr .net/reactjs 基础堆栈的索引器管理/代理工具，旨在与您的各种 PVR 应用集成，支持对磁贴跟踪器和
Usenet 索引器的管理。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

它与 Lidarr、Mylar3、Radarr、Readarr 和 Sonarr 无缝集成，提供对您的索引器的全面管理，无需为每个应用单独设置索引器（我们全部为您完成）。

+ 本地支持 24 个索引器的 Usenet，包括 Headphones VIP
+ 通过“通用 Newznab”对于任何 Newznab 兼容的索引器的 Usenet 支持
+ 对超过 500 个跟踪器的种子支持，且不断添加更多
+ 通过“通用 Torznab”支持任何与 Torznab 兼容的追踪器
+ 通过 Cardigann 支持自定义 YML 定义，包括 JSON 和 XML 解析
+ 索引器同步到 Lidarr/Mylar3/Radarr/Readarr/Sonarr，因此无需对其他应用程序进行手动配置
+ 索引器历史和统计
+ 手动在类别级别搜索追踪器和索引器
+ 基于参数的手动搜索
+ 支持一次直接将多个发布推送到您的下载客户端从 Prowlarr
+ 索引器健康和状态通知
+ 代理支持索引器（SOCKS4、SOCKS5、HTTP、Flaresolverr）

## 反向代理

> Nginx
>
> BaseUrl 为 `/prowlarr` 时的反向代理配置如下：

```nginx
    location /prowlarr {
        proxy_pass http://127.0.0.1:9696;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_redirect off;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection $http_connection;
    }
    
    # Allow the API/Indexer External Access via NGINX
    location ~ /prowlarr(/[0-9]+)?/api {
        auth_basic off;
        proxy_pass http://127.0.0.1:9696;
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

    proxy_pass http://127.0.0.1:9696;
  }
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
