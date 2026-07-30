# Shiori

Shiori 是一款用 Go 语言编写的简单书签管理器，旨在作为 Pocket 的简单克隆。

![Shiori](https://file.lifebus.top/imgs/shiori_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 基础书签管理，即添加、编辑、删除和搜索。
+ 从 Netscape 书签文件导入和导出书签。
+ 从 Pocket 导入书签。
+ 简洁明了的命令行界面。
+ 简洁美观的网页界面，专为那些不想使用命令行应用程序的用户设计。
+ 轻便便携，得益于其单一的二进制格式。
+ 数据库支持 sqlite3、PostgreSQL 和 MySQL。
+ 默认情况下，尽可能的， shiori 将解析可读内容并创建网页的离线存档。
+ [测试版] 支持 Firefox 和 Chrome 浏览器的 Web 扩展程序。

## 安装说明

> 默认用户名： `shiori`
> 默认密码： `gopher`

### `数据库链接 URL` 配置

> 名词解释
>
> `username` 数据库用户名
>
> `password` 数据库密码
>
> `localhost` 数据库地址
>
> `port` 数据库端口
>
> `database` 数据库名称

+ `mysql` 数据库链接 URL 配置

模板：`mysql://username:password@tcp(localhost:port)/database?charset=utf8mb4`
示例：`mysql://shiori:shiori@(mariadb)/shiori?charset=utf8mb4`

+ `postgresql` 数据库链接 URL 配置

模板：`postgres://username:password@localhost:port/database?sslmode=disable`
示例：`postgres://shiori:shiori@postgres/shiori?sslmode=disable`

## 反向代理

> Nginx

```nginx
location / {
    proxy_pass http://localhost:8080/;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
}
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
