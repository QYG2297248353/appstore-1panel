# FlareSolverr

用于绕过Cloudflare保护的代理服务器

<img height="128px" src="https://file.lifebus.top/apps/flaresolverr/logo.png" width="128px"/>

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

FlareSolverr 启动一个代理服务器，并使用少量资源在空闲状态下等待用户请求。当有请求到达时，它使用 Selenium。 未检测到
chromedriver 创建一个网页浏览器（Chrome）。它使用用户参数打开 URL，并等待 Cloudflare 挑战 已解决（或超时）。HTML 代码和 cookie
被发送回用户，这些 cookie 可以被用于 绕过 Cloudflare 使用其他 HTTP 客户端。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
