# IYUUPlus `dev`

> ## About 公告
>
> 因旧项目维护难度较大，在不影响已有用户的前提下，于2024年初对项目架构重写重构，新创建的这个仓库。
>
> 至此 使用 `latest` 版本的用户，可以继续使用，但不再提供更新。也无法主动升级。以下文档为 `dev-latest` 新版文档请注意区分。
>
> 新用户请使用 `dev-latest` 版本，该分支为新项目的开发分支，会持续更新。

## 升级说明

### `2024/05/10` 发布 Nginx 版本

镜像增加 Nginx 配置，方便用户使用。移除原 `3131` 和 `8787` 端口， 增设 `8780` 端口，减少反向代理配置。

### `dev` 版本 发布

原使用 `latest` 版本的用户，可以继续使用，但不再提供更新。也无法主动升级。

非要升级的用户，可以参考以下步骤：

+ 再次安装 `iyuu-plus (本应用)` 即可，本应用支持重复安装，不会影响原有数据。
+ 数据迁移，请手动迁移数据，本应用不提供支持。

## 介绍

+ IYUUPlus项目运行在php-cli模式，常驻内存运行；集成webui界面、辅种、转移、下载、定时访问URL、动态域名ddns等常用功能，提供完善的插件机制。

+ IYUUPlus客户端完全开源，行为透明，安全可靠；根据源码可以自由定制。

+ IYUU自动辅种工具，目前能对国内大部分的PT站点自动辅种，支持下载器集群，支持多盘位，支持多下载目录，支持连接远程下载器等。

## 登录

> 爱语飞飞Token: 前往 [爱语飞飞-官网](https://iyuu.cn/) 获取授权Token
>
> 密码：首次登录填写为登录密码
>
> 站点认证：请提前准备相应站点

### 初始化

## 免责声明

在使用本工具前，请认真阅读《免责声明》全文如下：

使用IYUUAutoReseed或IYUUPlus自动辅种工具本身是非常安全的，IYUU脚本辅种时不会跟PT站点的服务器产生任何交互，只是会把下载种子链接推送给下载器，由下载器去站点下载种子。理论上，任何站点、任何技术都无法检测你是否使用了IYUUAutoReseed。危险来自于包括但不限于以下几点：

第一：建议不要自己手动跳校验，任何因为跳校验ban号，别怪我没提醒，出事后请不要怪到IYUU的头上；

第二：官方首发资源、其他一切首发资源的种子，IYUUAutoReseed自动辅种工具也无法在出种前辅种，如果因为你个人的作弊而被ban号，跟IYUU无关；

第三：您使用IYUU工具造成的一切损失，与IYUU无关。如不接受此条款，请不要使用IYUUAutoReseed，并立刻删除已经下载的源码。

## 原理

IYUU自动辅种工具（英文名：IYUUAutoReseed），是一款PHP语言编写的Private
Tracker辅种脚本，通过计划任务或常驻内存，按指定频率调用transmission、qBittorrent下载软件的API接口，提取正在做种的info_hash提交到辅种服务器API接口（辅种过程和PT站没有交互），根据API接口返回的数据拼接种子连接，提交给下载器，由下载器主动去站点下载种子、校验、做种，自动辅种各个站点。

## 支持的下载器

+ [transmission](https://transmissionbt.com/)
+ [qBittorrent](https://www.qbittorrent.org/)

### 下载器目录映射

当前默认为应用持久化目录，如需修改，请编辑`docker-compose.yml`。
替换方式：
替换 `${IYUUCN_ROOT_PATH}/bt/qBittorrent` 为 `qBittorrent` 下载器目录
替换 `${IYUUCN_ROOT_PATH}/bt/transmission` 为 `transmission` 下载器目录
新增路径格式： `{主机存放路径}:{容器存放路径}`

```shell
services:
  iyuuplus-dev:
    volumes:
      - ${IYUUCN_ROOT_PATH}/bt/qBittorrent:/qBittorrent
      - ${IYUUCN_ROOT_PATH}/bt/transmission:/transmission
```

## 运行要求

+ 数据库：`MySQL 5.7+` (可选)

## Nginx 配置

```shell
location ^~ / {
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header Host $host;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_http_version 1.1;
  proxy_set_header Connection "";
  if (!-f $request_filename){
    # demo
    # proxy_pass http://127.0.0.1:8787;
    proxy_pass http(s)://{host}:{port};
  }
}
```

## 站点认证

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
