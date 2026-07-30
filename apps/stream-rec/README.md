# Stream-Rec

Stream-rec 是一个自动录制各种直播平台的工具。

![Stream-Rec](https://file.lifebus.top/imgs/stream_rec_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

基于 Kotlin, Ktor, 和 ffmpeg。

+ 自动录播，可配置录制质量，路径，格式，并发量，分段录制（时间或文件大小），分段上传，根据直播标题和开始时间自动命名文件。
+ 自动弹幕录制（XML格式），可使用 DanmakuFactory 进行弹幕转换，或配合AList来实现弹幕自动挂载。
+ 使用 SQLite 持久化存储录播和上传信息
+ 支持 Rclone 上传到云存储
+ 使用 Web 界面进行配置
+ 支持 Docker

## 直播平台支持列表

| 平台      | 录制 | 弹幕 | 链接格式                                          |
|---------|----|----|-----------------------------------------------|
| 抖音      | ✅  | ✅  | `https://www.live.douyin.com/{抖音id}`          |
| 斗鱼      | ✅  | ✅  | `https://www.douyu.com/{直播间}`                 |
| 虎牙      | ✅  | ✅  | `https://www.huya.com/{直播间}`                  |
| PandaTV | ✅  | ✅  | `https://www.pandalive.co.kr/live/play/{直播间}` |
| Twitch  | ✅  | ✅  | `https://www.twitch.tv/{直播间}`                 |

## 安装说明

> 默认账户
>
> 用户名：stream-rec
>
> 密码：stream-rec 或 `登录密码 (初始化)` 配置

### 必须修改配置

+ `WebSocket API 地址`

默认值：`ws://stream-rec-backend:12555/live/update` 或 `ws://127.0.0.1:12555/live/update`

需要获取：

+ 宿主机 IP 地址
+ 配置项 `API 端口`, 默认值：`12555`

填写格式：`ws://{宿主机 IP 地址}:{API 端口}/live/update`

+ `访问域名`

服务跳转地址，用于跳转到 Web 界面

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
