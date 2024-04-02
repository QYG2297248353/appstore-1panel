# IYUUPlus

IYUUAutoReseed项目的升级版，常驻内存运行；集成webui界面、辅种、转移、下载、定时访问URL、动态域名ddns等常用功能，提供完善的插件机制。

IYUUPlus客户端完全开源，行为透明，安全可靠；根据源码可以自由定制。

IYUU自动辅种工具，目前能对国内大部分的PT站点自动辅种，支持下载器集群，支持多盘位，支持多下载目录，支持连接远程下载器等。

### 登录

> 爱语飞飞Token: 前往[官网](https://iyuu.cn/)获取 IYUU+Key
> 密码：首次登录填写为登录密码

#### 站点认证

仅支持：

+ pthome
+ hdhome
+ ourbits
+ audiences
+ piggo
+ zhuque
+ zmpt

### 免责声明

在使用本工具前，请认真阅读《免责声明》全文如下：

使用IYUUAutoReseed或IYUUPlus自动辅种工具本身是非常安全的，IYUU脚本辅种时不会跟PT站点的服务器产生任何交互，只是会把下载种子链接推送给下载器，由下载器去站点下载种子。理论上，任何站点、任何技术都无法检测你是否使用了IYUUAutoReseed。危险来自于包括但不限于以下几点：

第一：建议不要自己手动跳校验，任何因为跳校验ban号，别怪我没提醒，出事后请不要怪到IYUU的头上；

第二：官方首发资源、其他一切首发资源的种子，IYUUAutoReseed自动辅种工具也无法在出种前辅种，如果因为你个人的作弊而被ban号，跟IYUU无关；

第三：您使用IYUU工具造成的一切损失，与IYUU无关。如不接受此条款，请不要使用IYUUAutoReseed，并立刻删除已经下载的源码。

### 原理

IYUU自动辅种工具（英文名：IYUUAutoReseed），是一款PHP语言编写的Private
Tracker辅种脚本，通过计划任务或常驻内存，按指定频率调用transmission、qBittorrent下载软件的API接口，提取正在做种的info_hash提交到辅种服务器API接口（辅种过程和PT站没有交互），根据API接口返回的数据拼接种子连接，提交给下载器，由下载器主动去站点下载种子、校验、做种，自动辅种各个站点。

### 优势

全程自动化，无需人工干预；
支持多盘位，多做种目录，多下载器，支持远程下载器；
辅种精确度高，精度可配置；
支持微信通知，消息即时达；
自动对合集包，进行拆包辅种（暂未开发）
安全：所有隐私信息只在本地存储，绝不发送给第三方。
拥有专业的问答社区和交流群

### 支持的下载器

+ transmission
+ qBittorrent

### 支持自动辅种的站点

学校、杜比、家园、天空、朋友、馒头、萌猫、我堡、猫站、铂金家、烧包、北洋、TCCF、南洋、TTG、映客、城市、52pt、brobits、备胎、SSD、CHD、ptmsg、leaguehd、聆音、瓷器、hdarea、eastgame(
TLF)、1ptba、hdtime、hd4fans、opencd、hdbug、hdstreet、joyhd、u2、upxin(HDU)、oshen、discfan(GZT)、cnscg圣城(已删除)
、北邮、CCFBits、dicmusic、天雪、葡萄、HDRoute、伊甸园hdbd、海胆haidan、HDfans、龙之家、百川PT、HDPOST、蝴蝶、蒲公英。

### 更新

应用内更新，无需二次升级
