# SPlayer

🎉 一个简约的音乐播放器，支持逐字歌词，下载歌曲，展示评论区，音乐云盘及歌单管理，音乐频谱，移动端基础适配

![SPlayer](https://file.lifebus.top/imgs/splayer_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

✨ 支持扫码登录

📱 支持手机号登录

📅 自动进行每日签到及云贝签到

💻 支持桌面歌词

💻 支持切换为本地播放器，此模式将不会连接网络

🎨 封面主题色自适应，支持全站着色

🌚 Light / Dark / Auto 模式自动切换

📁 本地歌曲管理及分类（建议先使用 音乐标签 进行匹配后再使用）

📁 简易的本地音乐标签编辑及封面修改

🎵 支持播放部分无版权歌曲（可能会与原曲不匹配，客户端独占功能）

⬇️ 下载歌曲 / 批量下载（ 最高支持 Hi-Res，需具有相应会员账号 ）

➕ 新建歌单及歌单编辑

❤️ 收藏 / 取消收藏歌单或歌手

🎶 每日推荐歌曲

📻 私人 FM

☁️ 云盘音乐上传

📂 云盘内歌曲播放

🔄 云盘内歌曲纠正

🗑️ 云盘歌曲删除

📝 支持逐字歌词

🔄 歌词滚动以及歌词翻译

📹 MV 与视频播放

🎶 音乐频谱显示

⏭️ 音乐渐入渐出

🔄 支持 PWA

💬 支持评论区

## 使用说明

### 音源

| 名称                       | 代号          | 默认启用 | 注意事项                                           |
|--------------------------|-------------|------|------------------------------------------------|
| QQ 音乐                    | `qq`        |      | 需要准备自己的 `QQ_COOKIE`（请参阅下方〈环境变量〉处）。必须使用 QQ 登录。  |
| 酷狗音乐                     | `kugou`     | ✅    |                                                |
| 酷我音乐                     | `kuwo`      |      |                                                |
| 波点音乐                     | `bodian`    | ✅    |                                                |
| 咪咕音乐                     | `migu`      | ✅    | 需要准备自己的 `MIGU_COOKIE`（请参阅下方〈环境变量〉处）。           |
| JOOX                     | `joox`      |      | 需要准备自己的 `JOOX_COOKIE`（请参阅下方〈环境变量〉处）。似乎有严格地区限制。 |
| YouTube（纯 JS 解析方式）       | `youtube`   |      | 需要 Google 认定的**非中国大陆区域** IP 地址。                |
| YouTube（通过 `youtube-dl`) | `youtubedl` |      | 需要自行安装 `youtube-dl`。                           |
| YouTube（通过 `yt-dlp`)     | `ytdlp`     | ✅    | 需要自行安装 `yt-dlp`（`youtube-dl` 仍在活跃维护的 fork）。    |
| B 站音乐                    | `bilibili`  |      |                                                |
| B 站音乐                    | `bilivideo` |      | 在大陆地区外的IP地址可能查询不到某些版权视频（如索尼音乐上传的MV等）           |
| 第三方网易云 API               | `pyncmd`    |      |                                                |

- 支持 `pyncmd` 的 API 服务由 GD studio <https://music.gdstudio.xyz> 提供。

### 配置项

| 变量名称                  | 类型   | 描述                                                                    | 示例                                                               |
|-----------------------|------|-----------------------------------------------------------------------|------------------------------------------------------------------|
| ENABLE_FLAC           | bool | 激活无损音质获取                                                              | `ENABLE_FLAC=true`                                               |
| ENABLE_LOCAL_VIP      | str  | 激活本地黑胶 VIP，可选值：`true`（等同于 CVIP）、`cvip` 和 `svip`                       | `ENABLE_LOCAL_VIP=svip`                                          |
| LOCAL_VIP_UID         | str  | 仅对这些 UID 激活本地黑胶 VIP，默认为对全部用户生效                                        | `LOCAL_VIP_UID=123456789,1234,123456`                            |
| ENABLE_HTTPDNS        | bool | 激活故障的 Netease HTTPDNS 查询（不建议）                                         | `ENABLE_HTTPDNS=true`                                            |
| BLOCK_ADS             | bool | 屏蔽应用内部分广告                                                             | `BLOCK_ADS=true`                                                 |
| DISABLE_UPGRADE_CHECK | bool | 禁用更新检测                                                                | `DISABLE_UPGRADE_CHECK=true`                                     |
| DEVELOPMENT           | bool | 激活开发模式。需要自己用 `yarn` 安装依赖 (dependencies)                               | `DEVELOPMENT=true`                                               |
| FOLLOW_SOURCE_ORDER   | bool | 严格按照配置音源的顺序进行查询                                                       | `FOLLOW_SOURCE_ORDER=true`                                       |
| JSON_LOG              | bool | 输出机器可读的 JSON 记录格式                                                     | `JSON_LOG=true`                                                  |
| NO_CACHE              | bool | 停用 cache                                                              | `NO_CACHE=true`                                                  |
| MIN_BR                | int  | 允许的最低源音质，小于该值将被替换                                                     | `MIN_BR=320000`                                                  |
| SELECT_MAX_BR         | bool | 选择所有音源中的最高码率替换音频                                                      | `SELECT_MAX_BR=true`                                             |
| LOG_LEVEL             | str  | 日志输出等级。请见〈日志等级〉部分。                                                    | `LOG_LEVEL=debug`                                                |
| LOG_FILE              | str  | 从 Pino 端设置日志输出的文件位置。也可以用 `*sh` 的输出重导向功能 (`node app.js >> app.log`) 代替 | `LOG_FILE=app.log`                                               |
| JOOX_COOKIE           | str  | JOOX 音源的 wmid 和 session_key cookie                                    | `JOOX_COOKIE="wmid=<your_wmid>; session_key=<your_session_key>"` |
| MIGU_COOKIE           | str  | 咪咕音源的 aversionid cookie                                               | `MIGU_COOKIE="<your_aversionid>"`                                |
| QQ_COOKIE             | str  | QQ 音源的 uin 和 qm_keyst cookie                                          | `QQ_COOKIE="uin=<your_uin>; qm_keyst=<your_qm_keyst>"`           |
| YOUTUBE_KEY           | str  | Youtube 音源的 Data API v3 Key                                           | `YOUTUBE_KEY="<your_data_api_key>"`                              |
| SIGN_CERT             | path | 自定义证书文件                                                               | `SIGN_CERT="./server.crt"`                                       |
| SIGN_KEY              | path | 自定义密钥文件                                                               | `SIGN_KEY="./server.key"`                                        |
| SEARCH_ALBUM          | bool | 在其他音源搜索歌曲时携带专辑名称（默认搜索条件 `歌曲名 - 歌手`，启用后搜索条件 `歌曲名 - 歌手 专辑名`）            | `SEARCH_ALBUM=true`                                              |
| NETEASE_COOKIE        | str  | 网易云 Cookie                                                            | `MUSIC_U=007554xxx`                                              |

### 网易云服务器IP

通过 `ping music.163.com` 获得网易云服务器的 IP 地址

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
