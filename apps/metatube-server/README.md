# MetaTube 服务端

为 Jellyfin/Emby/Plex 开发的超级好用的元数据插件

![MetaTube](https://file.lifebus.top/imgs/metatube.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 应用特性

+ 完整数据：包括标题、简介、演员、标签、评分等内容。
+ 完整搜索：支持通过众多的刮削源搜索影片和演员信息。
+ 预告功能：无需下载完整预告视频即可在线观看预告片。
+ 计划任务：自动整理影片标签以及在后台自动更新插件。
+ 人脸识别：内置的人脸识别以人脸为中心裁剪海报图像。
+ 自动翻译：支持将特定的元数据内容翻译成需要的语言。

## 应用说明

该应用为 MetaTube 服务端，用于为 Jellyfin/Emby/Plex 提供元数据插件。

优先推荐部署在: 云服务器(美国/日本)

如果您的网络环境不适合部署服务端，可以尝试配置网络代理。仅支持 HTTP 代理 / Socks5 代理。

## 插件安装

### Jellyfin

1. 进入 Jellyfin 控制台 > 插件目录/存储库 > 设置，点击添加
2. 输入存储库名称：MetaTube
3. 输入存储库

```url
# URL for GitHub
https://raw.githubusercontent.com/metatube-community/jellyfin-plugin-metatube/dist/manifest.json
```

4. 在插件目录下找到 MetaTube，点击安装
5. 重启 Jellyfin

> 适用于中国大陆的存储库
>
> ```url
> # URL for jsDelivr
> https://cdn.jsdelivr.net/gh/metatube-community/jellyfin-plugin-metatube@dist/manifest.json
> ```

### Emby

1. 从 Releases 下载 MetaTube 最新插件
2. 解压出 MetaTube.dll 文件
3. 将 dll 文件复制到 Emby 插件目录
4. 重启 Emby 服务

> PS：Emby 后续插件更新由计划任务在后台自动完成。

### Plex

1. 从 [GitHub](https://github.com/metatube-community/metatube-plex-plugins/archive/refs/heads/main.zip)
   或 [Releases](https://github.com/metatube-community/metatube-plex-plugins/releases) 下载最新的插件
   zip 文件
2. 将解压后的 MetaTube.bundle 文件夹移入 Plex 插件目录的根目录
3. 其中文件夹 MetaTubeHelper.bundle 为辅助插件，可选择性安装
4. 重启 Plex 服务

### 常见 Emby 插件应用目录

#### 群晖

`/volume1/Emby/plugins`

#### Windows

`emby\programdata\plugins`

#### Docker

`<配置文件夹>/plugins`

#### Linux（供参考）

`/var/lib/emby-server/plugins/`

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
