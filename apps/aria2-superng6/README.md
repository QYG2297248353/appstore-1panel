# Aria2 Superng6版

一个支持多种存储的文件列表程序

![Aria2](https://file.lifebus.top/imgs/aria2_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 优化亮点

+ 全平台架构x86-64、arm64、armhf,统一latest tag
+ 做了usermapping，使用你自己的账户权限来运行，这点对于群辉来说尤其重要
+ `a2b-latest镜像` 可屏蔽迅雷、qq旋风、影音先锋、百度网盘等吸血客户端A2B=true(集成自@makeding/aria2b，感谢)
+ 纯aria2，没有包含多于的服务
+ 超小镜像体积 10.77 MB
+ 可以自定义任意二级目录
+ 开放了BT下载DTH监听端口、BT下载监听端口（TCP/UDP 6881），加快下载速度
+ 默认开启DHT并且创建了DHT文件，加速下载
+ 包含了下载完成后自动删除.aria2文件脚本
+ 包含了执行删除正在下载任务事时自动执行删除文件
+ 内置最优的aria2配置文件
+ 内置400多条最新trackers
+ 每天自动更新trackers，不需要重启aria2即可生效
+ 默认上海时区 `Asia/Shanghai`
+ 直接设置token，不需要在配置文件里修改
+ 最新静态编译版的 `aria2c1.3.5`
+ 解除aria2c下载线程限制
+ 支持自动更新tracker，每次启动容器时会自动更新tracker
+ 手动设置磁盘缓存CACHE，默认参数128M
+ 可选则开启回收站，删除文件后移动至回收站，防止丢失文件
+ 可选下载任务完成后，保留目录结构移动文件
+ 相对来说最完善的任务处理脚本
+ 更多可手动调节参数，大量选项不需要修改conf文件
+ 全平台镜像统一tag

## 使用说明

### 初始化

首次启动，请前往 `AriaNg设置` 中修改RPC地址与密钥。

### 修改配置

请前往持久化目录：`config` 目录下修改配置文件

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
