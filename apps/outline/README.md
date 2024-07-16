# Outline

您团队的知识库

![Outline](https://file.lifebus.top/imgs/outline_cover.png)

迷失在乱七八糟的文档中？无法确定谁有访问权限？同事在聊天中反复询问相同的信息？是时候整理团队知识了。

## 安装说明

### 参数 `加密密钥` 与 `工具密钥` 配置

`加密密钥` 与 `工具密钥` 为必填项，且必须为 32 位长度的字符串。

可在终端使用 `openssl` 生成

```sh
openssl rand -hex 32
```

### 参数 `Redis 链接` 配置

由于Redis特殊性，需要按照格式填写，格式如下：

格式：`redis://[:password@]host[:port][/database][?option=value]`

```
# 无密码
redis://127.0.0.1:6379

# 有密码 password
redis://password@127.0.0.1:6379

# 有用户名 username，有密码 password
redis://username:password@127.0.0.1:6379

# 有密码，指定数据库 1
redis://password@127.0.0.1:6379/1

# 有密码，指定数据库，指定超时时间
redis://password@127.0.0.1:6379/1?timeout=10

# 有密码，指定数据库，指定超时时间，指定连接池大小
redis://password@127.0.0.1:6379/1?timeout=10&pool_size=10
```

同时，支持使用 `ioredis://` 协议，格式如下：

> 示例：
> `ioredis://eyJzZW50aW5lbHMiOlt7Imhvc3QiOiJzZW50aW5lbC0wIiwicG9ydCI6MjYzNzl9LHsiaG9zdCI6InNlbnRpbmVsLTEiLCJwb3J0IjoyNjM3OX1dLCJuYW1lIjoibXltYXN0ZXIifQ==`
>
> 对应的解码后的内容为：
> {"sentinels":[{"host":"sentinel-0","port":26379},{"host":"sentinel-1","port":26379}],"name":"mymaster"}

格式：`ioredis://Base64({})`

## 反向代理

> Nginx

```nginx
  location / {
    proxy_pass http://localhost:3000/;

    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
    proxy_set_header Host $host;

    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;proxy_set_header Host $host;
    proxy_set_header Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Scheme $scheme;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_redirect off;
  }
```
