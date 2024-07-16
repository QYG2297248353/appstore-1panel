# MoviePilot

MoviePilot 基于 NAStool 部分代码重新设计，聚焦自动化核心需求，减少问题同时更易于扩展和维护

> 仪表盘

![MoviePilot-Dashboard](https://file.lifebus.top/imgs/movie_pilot_cover.png)

> 插件库

![MoviePilot-Plugin](https://file.lifebus.top/imgs/movie_pilot_plugin.png)

## 安装环境

### 网络

MoviePilot通过调用 TheMovieDb 的Api来读取和匹配媒体元数据，通过访问 Github 来执行程序升级、安装插件等。

### Linux 系统

部分功能基于文件系统监控实现（如目录监控等），监控的文件较多时，往往会因为操作系统默认允许的文件句柄数太小导致报错，相关功能失效。
需在宿主机操作系统上（不是docker容器内）执行以下命令并重启生效：

```shell
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

### 站点

MoviePilot包括两大部分功能：文件整理刮削、资源订阅下载，其中资源订阅下载功能需要有可用的PT站点。

#### 用户认证

为了控制用户数量避免大规范泛滥使用，MoviePilot引入了PT用户认证机制，你需要有认证站点范围内的账号才能使用软件的资源搜索、订阅及下载功能，出此下策与利益无关，属NAStool一路走来，吸取失败经验的无奈之举。

> 站点配置参数
>
> 安装应用时(除IYUU外)，填写格式为 参数名=值，例如：
>
> `HHCLUB_USERNAME=xxxxx`
>
> `HHCLUB_PASSKEY=xxxxx`

|      站点      |     用户名(用户ID)      | 密钥(授权码)                |
|:------------:|:------------------:|------------------------|
|     iyuu     |    `IYUU_SIGN`     | `无`                    |
|    hhclub    | `HHCLUB_USERNAME`  | `HHCLUB_PASSKEY`       |
|  audiences   |  `AUDIENCES_UID`   | `AUDIENCES_PASSKEY`    |
|   hddolby    |    `HDDOLBY_ID`    | `HDDOLBY_PASSKEY`      |
|     zmpt     |     `ZMPT_UID`     | `ZMPT_PASSKEY`         |
|   freefarm   |   `FREEFARM_UID`   | `FREEFARM_PASSKEY`     |
|    hdfans    |    `HDFANS_UID`    | `HDFANS_PASSKEY`       |
| wintersakura | `WINTERSAKURA_UID` | `WINTERSAKURA_PASSKEY` |
|    leaves    |    `LEAVES_UID`    | `LEAVES_PASSKEY`       |
|     ptba     |     `PTBA_UID`     | `PTBA_PASSKEY`         |
|   icc2022    |   `ICC2022_UID`    | `ICC2022_PASSKEY`      |
|   xingtan    |   `XINGTAN_UID`    | `XINGTAN_PASSKEY`      |
|   ptvicomo   |   `PTVICOMO_UID`   | `PTVICOMO_PASSKEY`     |
|    agsvpt    |    `AGSVPT_UID`    | `AGSVPT_PASSKEY`       |
|    hdkyl     |    `HDKYL_UID`     | `HDKYL_PASSKEY`        |
|    qingwa    |    `QINGWA_UID`    | `QINGWA_PASSKEY`       |
|   discfan    |   `DISCFAN_UID`    | `DISCFAN_PASSKEY`      |

### 配套软件

MoviePilot只是媒体库自动化管理的一环，需要通过调用下载器来完成资源的下载，需要通过媒体服务器来管理和展示媒体资源，同时通过媒体服务器Api来查询库存情况控制重复下载，通过CookieCloud来快速同步站点Cookie和新增站点。安装前需要先完成配套软件的安装。

#### 下载器

+ Qbittorrent `^4.3.9`
+ Transmission `^3.0`

#### 媒体服务器

+ Emby `^4.8.0.45`
+ Jellyfin `新版`
+ Plex `新版`

#### CookieCloud

+ CookieCloud服务端 `可选`

MoviePilot已经内置了CookieCloud服务端，如需独立安装可参考 easychen/CookieCloud 说明

+ CookieCloud浏览器插件

不管是使用CookieCloud独立服务端还是使用内置服务，都需要安装浏览器插件。

## 安装说明

+ 用户初始密码

前往 `日志` 页面查看初始密码，首次登录后请及时修改密码

## 反向代理

如需开启域名访问MoviePilot，则需要搭建反向代理服务。以nginx为例，需要添加以下配置项。

```nginx
location / {
    proxy_pass http://${Host}:${Port};
    proxy_set_header Host $http_host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

反向代理使用SSL时，还需要开启http2，否则会导致日志加载时间过长或不可用。

```nginx
server {
    listen 443 ssl;
    http2 on;
    # other settings
}
```
