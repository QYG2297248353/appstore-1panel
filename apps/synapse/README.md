# Synapse

Synapse 是一个开源的 Matrix 家庭服务器实现，由 Element 开发和维护。Matrix 是安全且可互操作实时通信的开放标准。

![Synapse](https://file.lifebus.top/imgs/synapse_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

<div style="border: 1px solid red; padding: 10px; border-radius: 5px; color: #D8000C; background-color: #FFD2D2; display: inline-block; width: 100%; max-width: 60%;">
    <div style="display: flex; align-items: center;">
        <span style="font-size: 24px; margin-right: 8px;">⚠️</span>
        <div>
            <strong style="font-size: 16px;">配置初始化</strong><br>
            <span style="font-size: 14px; color: #333;">该应用需要生成前置配置文件，如果首次生成失败，请删除持久化目录重试</span>
        </div>
    </div>
</div>

### 快捷命令

#### 查看帮助

```sh
register_new_matrix_user http://localhost:8008 -c /data/homeserver.yaml --help
```

#### 生成管理员用户

> 请替换以下参数
>
> adminName: 管理员用户名
>
> password: 管理员密码

```sh
register_new_matrix_user http://localhost:8008 -c /data/homeserver.yaml -u adminName -p password -a
```

#### 生成普通用户

> 请替换以下参数
>
> userName: 用户名
>
> password: 密码

```sh
register_new_matrix_user http://localhost:8008 -c /data/homeserver.yaml -u userName -p password
```

## 反向代理

> Nginx

```nginx
    location ~ ^(/_matrix|/_synapse/client) {
        # note: do not add a path (even a single /) after the port in `proxy_pass`,
        # otherwise nginx will canonicalise the URI and cause signature verification
        # errors.
        proxy_pass http://localhost:8008;
        proxy_set_header X-Forwarded-For $remote_addr;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $host;
    
        # Nginx by default only allows file uploads up to 1M in size
        # Increase client_max_body_size to match max_upload_size defined in homeserver.yaml
        client_max_body_size 50M;
    
        # Synapse responses may be chunked, which is an HTTP/1.1 feature.
        proxy_http_version 1.1;
    }
```

### 移动客户端

[![Download on the App Store](http://www.tananaev.com/badges/app-store.svg)](https://apps.apple.com/us/app/element-messenger/id1083446067) [![Get it on Google Play](http://www.tananaev.com/badges/google-play.svg)](https://play.google.com/store/apps/details?id=im.vector.app) [![Get it on F-Droid](http://www.tananaev.com/badges/f-droid.svg)](https://f-droid.org/packages/im.vector.app/)

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
