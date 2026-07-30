# Umami MySQL版本

为速度和效率而构建的网站分析

Umami 网站分析提供您实时做出决策所需的数据。

![Umami](https://file.lifebus.top/imgs/umami_cover.jpg)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 提示

版本自 `v3` 起，不在支持 `MySQL`, 仅使用 `PostgreSQL`，建议用户提前进行数据迁移。

## 简介

Umami 让您轻松分析数据

+ 便于使用

Umami 功能强大而简单，易于使用和理解，不需要复杂的设置或标签配置。

+ UTM 和自定义事件

Umami 会自动理解带有 UTM 参数的链接，并让您根据 UTM 查看和过滤您的网站数据。此外，您还可以跟踪网站上的任何事件，例如按钮点击、表单提交、购买、新闻通讯注册等。

+ 没有 Cookie 横幅

所有数据均经过 Umami 匿名处理，并且不会收集您网站用户的任何个人信息。您无需选择加入 Cookie
横幅即可跟踪网站的性能，从而为您的用户提供更好、更值得信赖的体验。
默认情况下，Umami 符合 GDPRP 和 CCPA。

## 环境准备

+ 数据库支持
    + `MySQL` 版本：`5.7+`
    + `PostgreSQL` 版本：`12.14+`

## 安装说明

> 默认管理员帐户
>
> 用户名： admin
>
> 密码： umami

## 反向代理

> Nginx

如果您的请求头中存在自定义字段，请修改：

```text
add_header Access-Control-Allow-Headers '*'
```

以下配置修复 ipv6 地址无法收集的问题：

```nginx
server {
    ...
    
    add_header Content-Security-Policy 'frame-ancestors *';
    add_header Access-Control-Allow-Origin '*';
    add_header Access-Control-Allow-Methods 'GET, POST, OPTIONS';
    add_header Access-Control-Allow-Headers 'x-umami-cache,DNT,X-Mx-ReqToken,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Authorization';
    if ($request_method = 'OPTIONS') {
        return 204;
    }
    
    location /api/send {
        content_by_lua_block {
            local cjson = require "cjson"

            local function is_ipv6_address(hostname)
                local match = hostname:match("^[%x:]+$")
                return match ~= nil
            end

            ngx.req.read_body()
            local data = ngx.req.get_body_data()

            if data then
                local decoded_data = cjson.decode(data)
                local hostname = decoded_data.payload.hostname

                if is_ipv6_address(hostname) then
                    local new_hostname = "127.0.0.1"
                    decoded_data.payload.hostname = new_hostname

                    local modified_data = cjson.encode(decoded_data)
                    ngx.req.set_body_data(modified_data)
                end
            end

            ngx.exec("@proxy")
        }
    }
    
    location / {
        proxy_hide_header 'Access-Control-Allow-Origin';
        proxy_hide_header 'Content-Security-Policy';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://127.0.0.1:3000; 
    }
    
    location @proxy {
        proxy_hide_header 'Access-Control-Allow-Origin';
        proxy_hide_header 'Content-Security-Policy';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_pass http://127.0.0.1:3000;
    }
}
```

极简配置：

```nginx
add_header Content-Security-Policy 'frame-ancestors *';
add_header Access-Control-Allow-Origin '*';
add_header Access-Control-Allow-Methods '*';
add_header Access-Control-Allow-Headers '*';
if ($request_method = 'OPTIONS') {
    return 204;
}

location / {
    proxy_hide_header 'Access-Control-Allow-Origin';
    proxy_hide_header 'Content-Security-Policy';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_pass http://127.0.0.1:3000; 
}
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
