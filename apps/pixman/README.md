# Pixman

IPTV、M3U8 流媒体代理方案

<img height="128" src="https://file.lifebus.top/apps/pixman/logo.png" width="128"/>

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 免责声明

本程序仅供学习或测试设备，禁止 `中国大陆用户` 使用，不得用于商业用途，否则后果自负

## 使用说明

除内置资源外，可自行挂载 `.m3u` 文件。

可挂载到 持久化目录 `m3u` 目录下，并通过 `http://{host_ip}:{port}/<文件名>.m3u` 使用。

可在 媒体库中，通过添加电视直播源，使用 `http://{host_ip}:{port}/m3u/<文件名>.m3u` 使用。

访问 `http://{host_ip}:{port}/` 查看内置资源文档。

## 快捷操作

> 清理缓存

```shell
flask clean_cache
```

> 更新 mytvsuper_tivimate.m3u 文件

```shell
flask mytvsuper_tivimate
```

## 支持的直播源

### `四季線上 4GTV`

文件地址 `http://127.0.0.1:5000/4gtv.m3u`

+ `四季線上 4GTV` 解析播放代码 第一弹
+ `四季線上 4GTV` 无需解锁代理播放 第二弹
+ `四季線上 4GTV` 免费播放全部频道 第三弹
+ `LITV 直播源` 已合并到 `四季線上 4GTV`

### 江苏移动魔百盒 TPTV

文件地址 `http://127.0.0.1:5000/tptv.m3u` 或 `http://127.0.0.1:5000/tptv_proxy.m3u`

+ 江苏移动魔百盒 全国 CDN 版本
+ Nginx 代理 TPTV 和 iTV
+ 江苏移动 IPTV 频道更新

### 央视频直播源

文件地址 `http://127.0.0.1:5000/ysp.m3u`

+ 抛砖引玉 央视频直播源已发布

### YouTube 直播源

文件地址 `http://127.0.0.1:5000/youtube/{VIDEO_ID}`

+ pixman 已支持 YouTube 直播源拉取
+ YouTube 直播支持通过播放列表生成 M3U

### MytvSuper 直播源

文件地址 `http://127.0.0.1:5000/mytvsuper.m3u`

+ pixman 已支持 MytvSuper 直播源

### Beesport 直播源

文件地址 `http://127.0.0.1:5000/beesport.m3u`

+ pixman 新增一批体育频道

### 中国移动 iTV 平台

文件地址 `http://127.0.0.1:5000/itv.m3u` 或 `http://127.0.0.1:5000/itv_proxy.m3u`

+ 无需 IPV6，三网通看移动 iTV 直播源
+ Nginx 代理 TPTV 和 iTV

### TheTV

文件地址 http://127.0.0.1:5000/thetv.m3u

### 自定义直播源

文件地址 `http://127.0.0.1:5000/<file_name>.m3u`

## 代理规则

常见的 Clash 内核软件或 Surge 软件的规则配置如下：

```yaml
rules:
  # 国内
  - DOMAIN-SUFFIX,dnsany.com,DIRECT
  - DOMAIN-SUFFIX,cmvideo.cn,DIRECT
  - DOMAIN-SUFFIX,chinamobile.com,DIRECT
  - DOMAIN-SUFFIX,mobaibox.com,DIRECT
  - DOMAIN-SUFFIX,gitv.tv,DIRECT
  - DOMAIN-SUFFIX,cctv.cn,DIRECT
  - DOMAIN-SUFFIX,yangshipin.cn,DIRECT
  - DOMAIN-SUFFIX,gcable.cn,DIRECT
  - IP-CIDR,183.206.0.0/15,DIRECT,no-resolve
  - IP-CIDR,223.5.5.5/32,DIRECT,no-resolve
  - IP-CIDR,27.36.0.0/14,DIRECT,no-resolve
  - IP-CIDR,183.238.66.0/24,DIRECT,no-resolve

  # 自行测试当地是否能够直连，不能直连删掉下面这行
  - DOMAIN,beesport.livednow.com,DIRECT

  # 海外
  - DOMAIN-SUFFIX,livednow.com,Proxy
  - DOMAIN-SUFFIX,orz-7.com,Proxy
  - DOMAIN-SUFFIX,4gtv.tv,Proxy
  - DOMAIN-SUFFIX,hinet.net,Proxy
  - DOMAIN-SUFFIX,ofiii.com,Proxy
  - DOMAIN-SUFFIX,googlevideo.com,Proxy
  - DOMAIN-SUFFIX,youtube.com,Proxy
  - DOMAIN-SUFFIX,mytvsuper.com,Proxy
  - DOMAIN-SUFFIX,thetvapp.to,Proxy
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
