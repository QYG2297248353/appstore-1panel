# Iframely

当今互联网的富媒体平台

<img height="128px" src="https://file.lifebus.top/imgs/iframely_logo.png" width="128px"/>

iframely 是针对所有各种富媒体嵌入和 URL 数据的统一交付服务。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特点

🚀 最佳富媒体

iframely 了解来自 1900 多家出版商的富媒体，并且还在不断增加。视频、音频、应用程序、照片和图像、幻灯片、播放列表、播客、地图、3D、表格、文档、谜题、测验、图表和信息图表。您会自动获得所有新的发布商。

## 安装说明

由于 `api_key` 属于 Iframely云托管服务，使用自托管服务，将无法配置 `api_key`，保障接口的安全性。

> API 端点: '/oembed' and '/iframely'
>
> Debugger UI: '/debug'

### 其他配置

自行修改 `config/config.local.js` 配置文件，重启生效

## API 说明

### 请求示例

端点：`/oembed`

```http request
${domain}/oembed?url={URL}
```

端点：`/iframely`

```http request
${domain}/iframely?url={URL}
```

### 响应示例

> 官方

```json
{
  "url": "https://vimeo.com/141567420",
  "type": "video",
  "version": "1.0",
  "title": "Input/Output",
  "description": "A new short from Terri Timely and Park Pictures",
  "author": "Terri Timely",
  "author_url": "https://vimeo.com/user1946955",
  "provider_name": "Vimeo",
  "thumbnail_url": "https://i.vimeocdn.com/…5aebf015a6472-d_295x166",
  "thumbnail_width": 295,
  "thumbnail_height": 166,
  "html": "<div style=\"left: 0px; width: 100%; height: 0px; position: relative; padding-bottom: 56.25%;\"><iframe src=\"https://player.vimeo.com/video/141567420\"style=\"top: 0px; left: 0px; width: 100%; height: 100%; position: absolute;\"></iframe></div>"
}
```

> 百度一下

```json
{
  "type": "link",
  "version": "1.0",
  "title": "百度一下，你就知道",
  "url": "http://www.baidu.com/",
  "description": "全球领先的中文搜索引擎、致力于让网民更便捷地获取信息，找到所求。百度超过千亿的中文网页数据库，可以瞬间找到相关的搜索结果。"
}
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
