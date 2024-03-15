# SpeedTest

针对 HTML5 等的自托管速度测试。设置简单、示例、可配置、移动友好。支持 PHP、Node、多服务器等

Self-hosted Speed Test for HTML5 and more. Easy setup, examples, configurable, mobile friendly. Supports PHP, Node,
Multiple servers, and more

### LibreSpeed 自由速度

没有 Flash，没有 Java，没有 Websocket，没有废话。
No Flash, No Java, No Websocket, No Bullshit.

这是一个用 Javascript 实现的非常轻量级的速度测试，使用 XMLHttpRequest 和 Web Workers。
This is a very lightweight speed test implemented in Javascript, using XMLHttpRequest and Web Workers.

### Compatibility 兼容性

支持所有现代浏览器：IE11、最新的 Edge、最新的 Chrome、最新的 Firefox、最新的 Safari。也适用于移动版本。

All modern browsers are supported: IE11, latest Edge, latest Chrome, latest Firefox, latest Safari. Works with mobile
versions too.

### Features 特征

+ Download 下载
+ Upload 上传
+ Ping 平
+ Jitter 抖动

# SpeedTest-X

本应用为 LibreSpeed 的延伸项目，LibreSpeed 是一个非常轻巧的网站测速工具。

speedtest-x 使用文件数据库来保存来自不同用户的测速结果，方便您查看全国不同地域与运营商的测速效果。

### 扩展细节

+ 用户测速会上传测速记录并保存至网站服务器
+ 不依赖 MySQL，使用文件数据库
+ IP 库改用 ip.sb，运营商记录更为精确

### 升级说明

x-{Date} 可忽略，只需关注版本号即可。

原版应用由于使用 `latest` 标签，因此升级列表不会出现此应用，请手动升级

1Panel
容器 >> 找到应用 >> 更多 >> 升级 >> 等待完成升级
注意：一定要勾选 `强制拉取镜像`

### 版本说明

+ `latest` 原版版本 (由于使用 `latest` 标签，因此升级列表不会出现此应用，请手动升级)
+ `x-{Date}` SpeedTest-X 版本 (原仓库扩展版本)
