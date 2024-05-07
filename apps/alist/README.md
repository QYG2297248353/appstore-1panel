# AList

> 新版本（V3 及更高版本）与 V2 不兼容，因此如果您从 V2 升级，我们建议您完全重新安装 Alist。

一个支持多种存储，支持网页浏览和 WebDAV 的文件列表程序，由 gin 和 Solidjs 驱动。

## 查看管理员信息

3.25.0以上版本将密码改成加密方式存储的hash值，无法直接反算出密码，如果忘记了密码只能通过重新 随机生成 或者 手动设置

```sh
# 随机生成一个密码
docker exec -it alist ./alist admin random
# 手动设置一个密码,`NEW_PASSWORD`是指你需要设置的密码
docker exec -it alist ./alist admin set {NEW_PASSWORD}
```

## 版本说明

### `{version}` 版本号

正常版本

### `{version}-aria2` aria2

增加离线下载功能，支持 aria2 下载，需要配合 aria2 使用

### `{version}-ffmpeg` ffmpeg

增加本地存储视频封面功能，需要配合 ffmpeg 使用

## 反向代理

程序默认监听 5244 端口。如有修改，请一并修改下列配置中的端口号。如果你使用反向代理，建议你设置site_url，以帮助alist更好的工作。

### Nginx

```config
location / {
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header Host $http_host;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header Range $http_range;
	proxy_set_header If-Range $http_if_range;
  proxy_redirect off;
  proxy_pass http://127.0.0.1:5244;
  # the max size of file to upload
  client_max_body_size 20000m;
}
```

> 如果使用宝塔面板，请务必删除以下默认配置
> ```config
> - location ~ ^/(\.user.ini|\.htaccess|\.git|\.svn|\.project|LICENSE|README.md
> - location ~ .\*\.(gif|jpg|jpeg|png|bmp|swf)$
> - location ~ .\*\.(js|css)?$
> ```

### Apache

在 VirtualHost 字段下添加配置项 ProxyPass

```xml

<VirtualHost *:80>
        ServerName myapp.example.com
        ServerAdmin webmaster@example.com
        DocumentRoot /www/myapp/public

        AllowEncodedSlashes NoDecode
        ProxyPass "/" "http://127.0.0.1:5244/" nocanon
        </VirtualHost>
```

### Caddy

在 Caddyfile 文件下添加 reverse_proxy

```text
:80 {
  reverse_proxy 127.0.0.1:5244
}
```

如果部署在 443 端口正常使用的服务器上且使用域名进行访问，建议使用这种配置让 Caddy 自动申请证书

```text
example.com {
  reverse_proxy 127.0.0.1:5244
}
```

## 修改配置

> config.json内配置文件修改后都需要重启 AList 才会生效
>
> Docker：进入 Docker 容器内data/config.json
> 相当于挂载目录 {持久化目录：/home/alist}/data/config.json

不建议修改端口类配置，如需修改端口请使用面板修改后，重启或重建容器
