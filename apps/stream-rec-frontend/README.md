# Stream-Rec

Stream-rec 是一个自动录制各种直播平台的工具。

![Stream-Rec](https://github.com/hua0512/stream-rec-front/blob/master/docs/zh/dashboard.png)

## 特性

基于 Kotlin, Ktor, 和 ffmpeg。

+ 自动录播，可配置录制质量，路径，格式，并发量，分段录制（时间或文件大小），分段上传，根据直播标题和开始时间自动命名文件。
+ 自动弹幕录制（XML格式），可使用 DanmakuFactory 进行弹幕转换，或配合AList来实现弹幕自动挂载。
+ 使用 SQLite 持久化存储录播和上传信息
+ 支持 Rclone 上传到云存储
+ 使用 Web 界面进行配置
+ 支持 Docker

## 直播平台支持列表

| 平台        | 录制 | 弹幕 | 链接格式                                          |
|-----------|----|----|-----------------------------------------------|
| 抖音        | ✅  | ✅  | `https://www.live.douyin.com/{抖音id}`          |
| 斗鱼        | ✅  | ✅  | `https://www.douyu.com/{直播间}`                 |
| 虎牙        | ✅  | ✅  | `https://www.huya.com/{直播间}`                  |
| PandaTV   | ✅  | ✅  | `https://www.pandalive.co.kr/live/play/{直播间}` |
| Twitch    | ✅  | ✅  | `https://www.twitch.tv/{直播间}`                 |
| AfreecaTv | ❌  | ❌  |                                               |
| Bilibili  | ❌  | ❌  |                                               |
| Niconico  | ❌  | ❌  |                                               |
| Youtube   | ❌  | ❌  |                                               |

## 安装说明

当前项目为 Stream-Rec 的前端部分，请配合后端使用。

获取后端部署主机ip,例如：`192.168.1.20`

获取后端部署API服务端口，默认值：`12555`，具体值为 `API 端口`

### `API 地址` 配置

```shell
# 协议 + 主机 + API端口 + /api
http://192.168.1.20:12555/api
```

### `WebSocket API 地址` 配置

```shell
# ws:// + 主机 + API端口 + /live/update
ws://192.168.1.20:12555/live/update
```

### `NextAuth 服务器地址` 配置

```shell
# 协议 + 主机 + Web端口 + /
http://localhost:15275/
```
