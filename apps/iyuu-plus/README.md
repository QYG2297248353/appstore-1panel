# IYUUPlus `dev`

> ## About 公告
>
> 因旧项目维护难度较大，在不影响已有用户的前提下，于2024年初对项目架构重写重构，新创建的这个仓库。
>
> 至此 使用 `latest` 版本的用户，可以继续使用，但不再提供更新。也无法主动升级。以下文档为 `dev-latest` 新版文档请注意区分。
>
> 新用户请使用 `dev-latest` 版本，该分支为新项目的开发分支，会持续更新。

## 升级说明

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

PHP版本：`v8.3.0+`
数据库：`MySQL`

必须开启的扩展

```shell
extension=curl
extension=fileinfo
extension=gd
extension=mbstring
extension=exif
extension=mysqli
extension=openssl
extension=pdo_mysql
extension=pdo_sqlite
extension=sockets
extension=sodium
extension=sqlite3
extension=zip
```

## 支持情况

```shell
+------+--------------+------+---------+----------------+--------------+--------------------------------------------+
| 序号 | 站点名称     | 爬虫 | RSS订阅 | 下载种子元数据 | 拼接种子链接 | 类名                                       |
+------+--------------+------+---------+----------------+--------------+--------------------------------------------+
| 1    | 1ptba        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\Driver1ptba        |
| 2    | 52pt         | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\Driver52pt         |
| 3    | audiences    | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverAudiences    |
| 4    | beitai       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverBeitai       |
| 5    | btschool     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverBtschool     |
| 6    | carpt        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverCarpt        |
| 7    | chdbits      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverChdbits      |
| 8    | cyanbug      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverCyanbug      |
| 9    | dajiao       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverDajiao       |
| 10   | discfan      | Yes  |         | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverDiscfan      |
| 11   | dragonhd     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverDragonhd     |
| 12   | eastgame     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverEastgame     |
| 13   | haidan       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHaidan       |
| 14   | hares        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHares        |
| 15   | hd4fans      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHd4fans      |
| 16   | hdatmos      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdatmos      |
| 17   | hdcity       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdcity       |
| 18   | hdfans       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdfans       |
| 19   | hdhome       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdhome       |
| 20   | hdmayi       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdmayi       |
| 21   | hdpost       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdpost       |
| 22   | hdpt         | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdpt         |
| 23   | hdsky        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdsky        |
| 24   | hdtime       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdtime       |
| 25   | hdvideo      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHdvideo      |
| 26   | hhanclub     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHhanclub     |
| 27   | hitpt        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHitpt        |
| 28   | hudbt        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverHudbt        |
| 29   | joyhd        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverJoyhd        |
| 30   | keepfrds     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverKeepfrds     |
| 31   | m-team       |      | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverMTeam        |
| 32   | monikadesign | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverMonikadesign |
| 33   | nanyangpt    | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverNanyangpt    |
| 34   | nicept       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverNicept       |
| 35   | opencd       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverOpencd       |
| 36   | oshen        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverOshen        |
| 37   | ourbits      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverOurbits      |
| 38   | pandapt      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPandapt      |
| 39   | piggo        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPiggo        |
| 40   | pt0ffcc      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPt0ffcc      |
| 41   | pt2xfree     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPt2xfree     |
| 42   | ptchina      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPtchina      |
| 43   | pter         | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPter         |
| 44   | pthome       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPthome       |
| 45   | ptlsp        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPtlsp        |
| 46   | ptsbao       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPtsbao       |
| 47   | pttime       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverPttime       |
| 48   | qhstudio     | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverQhstudio     |
| 49   | redleaves    | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverRedleaves    |
| 50   | rousi        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverRousi        |
| 51   | sharkpt      | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverSharkpt      |
| 52   | soulvoice    | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverSoulvoice    |
| 53   | ssd          | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverSsd          |
| 54   | tjupt        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverTjupt        |
| 55   | torrentccf   | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverTorrentccf   |
| 56   | ttg          | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverTtg          |
| 57   | ubits        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverUbits        |
| 58   | upxin        | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverUpxin        |
| 59   | wintersakura | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverWintersakura |
| 60   | zhuque       | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverZhuque       |
| 61   | zmpt         | Yes  | Yes     | Yes            | Yes          | Iyuu\SiteManager\Driver\DriverZmpt         |
+------+--------------+------+---------+----------------+--------------+--------------------------------------------+
```

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

location /app/d9422b72cffad23098ad301eea0f8419
{
  # demo
  # proxy_pass http://127.0.0.1:3131;
  proxy_pass http(s)://{host}:{port};
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection "Upgrade";
  proxy_set_header X-Real-IP $remote_addr;
}
```
