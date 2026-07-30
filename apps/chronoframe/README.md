# ChronoFrame

在线管理照片，多存储后端、LivePhoto、地球仪视图

![ChronoFrame](https://file.lifebus.top/imgs/chronoframe.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

> 默认邮箱: admin@chronoframe.com
>
> 默认密码: CF1234@!


### 会话密码

> 会话密码用于加密用户会话，建议使用 32 字符随机字符串

```sh
# Linux / macOS
openssl rand -base64 32

# Windows (pwsh)
[Convert]::ToBase64String((1..32|%{[byte](Get-Random -Max 256)}))
```

## ✨ 特性

🖼️ 强大的图片管理

+ 在线管理照片 - 通过 Web 界面轻松管理和浏览照片
+ 探索地图 - 在地图上浏览照片拍摄位置
+ 智能 EXIF 解析 - 自动提取拍摄时间、地理位置、相机参数等元数据
+ 地理位置识别 - 自动识别(Reverse Geocoding)照片拍摄地点
+ 多格式支持 - 支持 JPEG、PNG、HEIC/HEIF 等主流图片格式
+ 智能缩略图 - 基于 ThumbHash 技术的高效缩略图生成

🔧 现代技术栈

+ Nuxt 4 - 基于最新的 Nuxt 框架，提供 SSR/SSG 支持
+ TypeScript - 完整的类型安全保障
+ TailwindCSS - 现代化的 CSS 框架
+ Drizzle ORM - 类型安全的数据库 ORM

☁️ 灵活的存储方案

+ 多存储后端 - 支持 S3 兼容存储、本地文件系统
+ CDN 加速 - 可配置 CDN 地址加速图片访问

---o

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
