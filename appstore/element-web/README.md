# Element Web

一个用于Web的光泽Matrix协作客户端

![Element Web](https://file.lifebus.top/imgs/element_web_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Element (formerly known as Vector and Riot) 是一个基于 Matrix JS SDK 构建的 Matrix 网络客户端。

## 反向代理

> Nginx
>
> 在无特殊需求的情况下，您需要添加如下参数

- `X-Frame-Options: SAMEORIGIN` 标头，用于防止 Element Web 被嵌入框架，以保护免受点击劫持攻击。
- `Content-Security-Policy` 标头，添加 `frame-ancestors 'self'` 指令，作为 X-Frame-Options
  的现代替代方案（建议同时包含两者，因为并非所有浏览器都支持该指令。
- `X-Content-Type-Options: nosniff` 标头，用于禁用 MIME 类型嗅探。
- `X-XSS-Protection: 1; mode=block;` 标头，为旧版浏览器提供基础的 XSS 保护。

```nginx
add_header X-Frame-Options SAMEORIGIN;
add_header X-Content-Type-Options nosniff;
add_header X-XSS-Protection "1; mode=block";
add_header Content-Security-Policy "frame-ancestors 'self'";
```

### 移动客户端

[![Download on the App Store](http://www.tananaev.com/badges/app-store.svg)](https://apps.apple.com/us/app/element-messenger/id1083446067) [![Get it on Google Play](http://www.tananaev.com/badges/google-play.svg)](https://play.google.com/store/apps/details?id=im.vector.app) [![Get it on F-Droid](http://www.tananaev.com/badges/f-droid.svg)](https://f-droid.org/packages/im.vector.app/)

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
