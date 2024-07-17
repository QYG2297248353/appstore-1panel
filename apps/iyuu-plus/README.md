# IYUU Plus

IYUU 是一个基于种子特征码的交叉索引工具

![IYUU Plus](https://file.lifebus.top/imgs/iyuuplus_cover.png)

## 简介

使用php语言编写并使用php-cli常驻内存运行，通过计划任务，按用户设定的频率调用transmission、qBittorrent下载软件的API接口，提取正在做种的info_hash提交到IYUU辅种服务器的API接口https:
//api.iyuu.cn（辅种过程和PT站点没有交互，查询辅种压力由IYUU服务器承担），根据IYUU服务器的API接口https:
//api.iyuu.cn返回的数据拼接种子连接，提交给下载器，由下载器主动去站点下载种子、校验、做种，自动辅种各个站点。

集成webui界面、辅种、转移、下载、定时访问URL、动态域名ddns等常用功能，提供完善的插件机制。

支持下载器集群，支持多盘位，支持多下载目录，支持连接远程下载器等。

### 技术栈

| 组件          | 版本     | 官网                                          |
|:------------|:-------|:--------------------------------------------|
| Workerman   | 4.1.15 | https://www.workerman.net/doc/workerman/    |
| Webman      | 1.5.16 | https://www.workerman.net/doc/webman/       |
| WebmanAdmin | 0.6.24 | https://www.workerman.net/doc/webman-admin/ |
| PHP         | 8.3.7  | https://www.php.net/                        |
| MYSQL       | 5.7.26 | https://www.mysql.com/                      |
| Layui       | 2.8.12 | https://layui.dev/                          |
| Vue         | 3.4.21 | https://vuejs.org/                          |

## 安装说明

> 爱语飞飞Token: 前往 [爱语飞飞-官网](https://iyuu.cn/) 获取授权Token
>
> 密码：首次登录填写为登录密码
>
> 站点认证：请提前准备相应站点

## 支持的下载器

+ [transmission](https://transmissionbt.com/)

Transmission 是一个种子客户端，可以让您在互联置上下载和共享文件。该应用程序适用于多种操作系统，包括 Ubuntu、Fedora、Arch
Linux、Debian Raspberry Pi 等。您可以使用 terminal 中的 apt 或 yum 命令来安装它。使用
Transmission，您可以实时监测下载和上传情况，并显示连接一致性图表

+ [qBittorrent](https://www.qbittorrent.org/)

qBittorrent是一款免费的开源种子下载工具，作为µTorrent的替代品。它在所有平台上都提供相同的功能，包括Windows、Linux和macOS。该应用程序还配备了一个可扩展的搜索引擎以及Web
UI遠端，以最大化你的torrent体验。使用qBittorrent，你可以在多个平台上轻松下载你喜爱的内容。

## 反向代理

> Nginx 配置

```nginx
    location ^~ / {
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header Host $host;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_http_version 1.1;
      proxy_set_header Connection "";
      if (!-f $request_filename){
         proxy_pass http://127.0.0.1:8787;
      }
    }
```

## 绑定合作站点

只有绑定了合作站点的才可以完整的使用IYUUPlus

认证其一即可，绑定爱语飞飞Token并认证, 后续无需重复认证，未认证无法进行辅种

| 认证站点      | 别名     | 官网 |
|-----------|--------|----|
| pthome    | 铂金家    | 自查 |
| hdhome    | 家园     | 自查 |
| ourbits   | 我堡     | 自查 |
| chdbits   | 新岛/金钱岛 | 自查 |
| hdfans    | 红豆饭    | 自查 |
| audiences | 观众/奥迪  | 自查 |
| piggo     | 猪猪网    | 自查 |
| zhuque    | 朱雀     | 自查 |
| zmpt      | 织梦     | 自查 |
| agsvpt    | 末日种子库  | 自查 |
| 其他站点      | 未知     | 未知 |
