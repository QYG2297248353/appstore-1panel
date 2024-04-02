# MoviePilot

NAS媒体库自动化管理工具

基于 NAStool 部分代码重新设计，聚焦自动化核心需求，减少问题同时更易于扩展和维护

### 安装配置

容器首次启动需要下载浏览器内核，根据网络情况可能需要较长时间。

#### 认证站点 （安装前确保至少有一个认证站点）

> 认证方式一：
>
> 认证站点：iyuu
>
> IYUU登录令牌：IYUUxxxxxx
>
> 不用填写 `认证用户ID` 与 `认证密钥`

=========================================

> 认证方式二：
>
> 认证站点：hdfans
>
> 认证用户ID：HDFANS_UID=xxxx
>
> 认证密钥：HDFANS_PASSKEY=xxxx
>
> 不用填写 `IYUU登录令牌`

支持配置多个认证站点，使用,分隔，如：iyuu,hhclub，会依次执行认证操作，直到有一个站点认证成功。
配置AUTH_SITE后，需要根据下表配置对应站点的认证参数。
认证资源v1.2.4+支持：iyuu/hhclub/audiences/hddolby/zmpt/freefarm/hdfans/wintersakura/leaves/ptba
/icc2022/ptlsp/xingtan/ptvicomo/agsvpt/hdkyl/qingwa

| 站点           | 参数                                                |
|--------------|---------------------------------------------------|
| iyuu         | `IYUU_SIGN`：IYUU登录令牌                              |
| hhclub       | `HHCLUB_USERNAME`：用户名 `HHCLUB_PASSKEY`：密钥         |
| audiences    | `AUDIENCES_UID`：用户ID `AUDIENCES_PASSKEY`：密钥       |
| hddolby      | `HDDOLBY_ID`：用户ID `HDDOLBY_PASSKEY`：密钥            |
| zmpt         | `ZMPT_UID`：用户ID `ZMPT_PASSKEY`：密钥                 |
| freefarm     | `FREEFARM_UID`：用户ID `FREEFARM_PASSKEY`：密钥         |
| hdfans       | `HDFANS_UID`：用户ID `HDFANS_PASSKEY`：密钥             |
| wintersakura | `WINTERSAKURA_UID`：用户ID `WINTERSAKURA_PASSKEY`：密钥 |
| leaves       | `LEAVES_UID`：用户ID `LEAVES_PASSKEY`：密钥             |
| ptba         | `PTBA_UID`：用户ID `PTBA_PASSKEY`：密钥                 |
| icc2022      | `ICC2022_UID`：用户ID `ICC2022_PASSKEY`：密钥           |
| ptlsp        | `PTLSP_UID`：用户ID `PTLSP_PASSKEY`：密钥               |
| xingtan      | `XINGTAN_UID`：用户ID `XINGTAN_PASSKEY`：密钥           |
| ptvicomo     | `PTVICOMO_UID`：用户ID `PTVICOMO_PASSKEY`：密钥         |
| agsvpt       | `AGSVPT_UID`：用户ID `AGSVPT_PASSKEY`：密钥             |
| hdkyl        | `HDKYL_UID`：用户ID `HDKYL_PASSKEY`：密钥               |
| qingwa       | `QINGWA_UID`：用户ID `QINGWA_PASSKEY`：密钥             |

#### WEB后台管理

通过设置的超级管理员用户登录后台管理界面
首次安装，密码请在日志中查看。

```shell
# 默认用户
admin
# 默认端口
3000
```

密码重置：删除配置目录下的`user.db`文件，重启服务后会重新生成密码

### 插件支持

#### 站点维护

需要安装 `CookieCloud` 应用实现。

+ 通过CookieCloud同步快速添加站点，不需要使用的站点可在WEB管理界面中禁用或删除，无法同步的站点也可手动新增。
+ 需要通过环境变量设置用户认证信息且认证成功后才能使用站点相关功能，未认证通过时站点相关的插件也会无法显示。

#### 文件整理

+ 默认通过监控下载器实现下载完成后自动整理入库并刮削媒体信息，需要后台打开下载器监控开关，且仅会处理通过MoviePilot添加下载的任务。
+ 使用目录监控等插件实现更灵活的自动整理。

部分插件功能基于文件系统监控实现（如目录监控等），需在宿主机上（不是docker容器内）执行以下命令并重启：

```shell
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
echo fs.inotify.max_user_instances=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

#### 通知交互

+ 支持通过微信/Telegram/Slack/SynologyChat/VoceChat等渠道远程管理和订阅下载，其中 微信/Telegram
  将会自动添加操作菜单（微信菜单条数有限制，部分菜单不显示）。

+

微信回调地址、SynologyChat传入地址地址相对路径均为：/api/v1/message/；VoceChat的Webhook地址相对路径为：/api/v1/message/?token=moviepilot，其中moviepilot为设置的API_TOKEN。

#### 反向代理

+ 代理配置

```shell
    location / {
        proxy_pass http://{ip}:{port};
        proxy_set_header Host $http_host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
```

+ 反代使用ssl时，需要开启http2，否则会导致日志加载时间过长或不可用

```shell
server {
    listen 443 ssl;
    http2 on;
    # ...
}
```

+ 新建的企业微信应用需要固定公网IP的代理才能收到消息

```shell
    location /cgi-bin/gettoken {
        proxy_pass https://qyapi.weixin.qq.com;
    }
    location /cgi-bin/message/send {
        proxy_pass https://qyapi.weixin.qq.com;
    }
    location  /cgi-bin/menu/create {
        proxy_pass https://qyapi.weixin.qq.com;
    }
```
