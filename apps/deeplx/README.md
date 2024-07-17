# DeepLX

强大的 DeepL 翻译 API

![DeepLX](https://static.deepl.com/img/appDownload/macos_app_download.svg)

## 简介

DeepLX 最初由 zu1k 命名并发布，尽管 zu1k 此后已停止维护它并删除了相关存储库。

感谢zu1k的贡献。

这是zu1k设计的DeepLX Docker镜像的备份，没有任何修改。

## 安装说明

### http代理服务器地址

> 基本格式

```shell
# 无鉴权代理
http://127.0.0.1:7890
# 有鉴权代理
http://<username>:<password>@127.0.0.1:7890
```

### 访问令牌以保护您的 API

> 请注意，如果您不使用访问令牌，您的 API 可能会被滥用。

接口调用时，您可以使用 `X-Access-Token` 请求头来传递访问令牌。

### DeepL官方提供的API Auth Key

开通DeepL API后，您将获得一个API Auth Key，您可以使用它来访问DeepL API。

### DeepL Pro 帐户 dl_session cookie

如果您有DeepL Pro帐户，您可以使用 `dl_session` cookie 来访问DeepL API。

## 接口简介

### 免费端点

模拟DeepL iOS客户端发起翻译请求。无限制，但在一定时间内频繁请求会导致429错误。

接口：`/translate`
请求方式：POST
请求头：

| Header          | Description                           | Value                      |
|:----------------|:--------------------------------------|:---------------------------|
| `Content-Type`  | The content type of the request body. | `application/json`         |
| `Authorization` | The access token to protect your API. | `Bearer your_access_token` |

> 如果无法使用 `Authorization` 请求头，您可以使用 `URL Params` 传递 `Authorization`。
>
> 例如：`/translate?token=your_access_token`

请求体：

| 参数名           | 字段类型     | 描述      | 是否必须   |
|:--------------|:---------|:--------|:-------|
| `text`        | `string` | 待翻译字段。  | `true` |
| `source_lang` | `string` | 源语言代码   | `true` |
| `target_lang` | `string` | 目标语言代码。 | `true` |

请求体 JSON 示例：

```json
{
  "text": "你听说过这个吗？",
  "source_lang": "ZH",
  "target_lang": "EN"
}
```

响应体：

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

### 专业端点

模拟 DeepL 专业版账户发起翻译请求。无限制，可有效避免 429 问题，但需要提供专业账户的 dl_session 参数，否则无法使用。

接口：`/v1/translate`
请求方式：POST

> 其他参数与免费端点相同。

### 官方端点

模拟 DeepL 官方 API 发起翻译请求。无限制，但在一定时间内频繁请求将导致 429 错误。

接口：`/v2/translate`
请求方式：POST

> 其他参数与免费端点相同。
>
> 更多官方API配置请参考 [DeepL 官方文档](https://developers.deepl.com/docs/api-reference/translate)
