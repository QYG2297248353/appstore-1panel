# Stream-Rec

由 Kotlin 协程、flow、序列化、sqldelight 和 ktor 提供支持的自动流记录工具。

虎牙/抖音/斗鱼/Twitch/PandaTV直播，弹幕自动录制

## 默认账户

| 用户名        | 密码         |
|------------|------------|
| stream-rec | stream-rec |

## 流录制

Stream-rec是一个用于各种流媒体服务的自动流媒体录制工具。

它由 Kotlin、Ktor 和 ffmpeg 提供支持。

### 录制存储

+ 本地文件系统
  默认情况下，流媒体文件将保存在容器内的`/app`目录中。请修改为 `/download`

外部映射地址 `/home/stream-rec/download`。

## 特征

+ 自动流录制，具有可配置的质量和格式。
+ 根据流标题和开始时间自动命名文件。
+ 自动弹幕录制
+ 流和上传信息的持久存储（使用SQLite）
+ 与 Rclone 集成以上传到云存储
+ 可通过网络界面进行配置。
+ Docker 支持

# 支持的流媒体服务

| Service   | Recording | Danmu | 网址格式                                           |
|-----------|-----------|-------|------------------------------------------------|
| Douyin    | ✅         | ✅     | `https://www.live.douyin.com/{douyinId}`       |
| Douyu     | ✅         | ✅     | `https://www.douyu.com/{room}`                 |
| Huya      | ✅         | ✅     | `https://www.huya.com/{room}`                  |
| PandaTV   | ✅         | ✅     | `https://www.pandalive.co.kr/live/play/{room}` |
| Twitch    | ✅         | ✅     | `https://www.twitch.tv/{room}`                 |
| AfreecaTv | ❌         | ❌     |                                                |
| Bilibili  | ❌         | ❌     |                                                |
| Niconico  | ❌         | ❌     |                                                |
| Youtube   | ❌         | ❌     |                                                |

- 未来会支持更多的服务

## 参数说明

`DNS默认` 与 `默认` 是容器默认值，无特殊说明，默认值即为容器默认值。请勿修改。
