# DeepLX

DeepL Free API (No TOKEN required)

### Description 描述

DeepLX 默认监听 0.0.0.0:1188 。您可以自行修改监听端口。

DeepLX 正在使用 DeepL 免费 API。

DeepLX 不受请求数量限制。

### Usage 用法

> 请求参数

text: string

source_lang: string

target_lang: string

> 返回参数

```json
{
  "alternatives": [
    "Did you hear about this?",
    "You've heard about this?",
    "You've heard of this?"
  ],
  "code": 200,
  "data": "Have you heard about this?",
  "id": 8356681003,
  "method": "Free",
  "source_lang": "ZH",
  "target_lang": "EN"
}
```

### 配置

> 访问令牌

如果您已设置，则每个请求都需要在标头中包含 Authorization 或在 URL 参数中包含 token 参数。

> DeepL官方 AuthKey

如果设置了，在429响应后，会使用官方的AuthKey进行请求。如果同时使用多个authKey，需要用逗号分隔。
