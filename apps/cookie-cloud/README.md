# CookieCloud

CookieCloud 是一个用于将 cookie 与您的自托管服务器同步的小工具，允许您将浏览器 cookie
和本地存储同步到您的手机和云端。它具有内置的端到端加密功能，并允许您设置同步间隔。

![CookieCloud](https://github.com/easychen/CookieCloud/blob/master/images/20230121092535.png)

## 浏览器插件

+ [Edge Store](https://microsoftedge.microsoft.com/addons/detail/cookiecloud/bffenpfpjikaeocaihdonmgnjjdpjkeo)

+ [Chrome Store](https://chrome.google.com/webstore/detail/cookiecloud/ffjiejobkoibkjlhjnlgmcnnigeelbdl)

## FAQ 常问问题

+ 目前，同步只是单向的，这意味着一个浏览器可以上传，而另一个浏览器可以下载。
+ 该浏览器扩展正式支持 Chrome 和 Edge。其他基于 Chromium 的浏览器可能可以工作，但尚未经过测试。使用源代码 cd extension &&
  pnpm build --target=firefox-mv2 自行编译Firefox版本。
+ 请注意，Firefox 的 cookie 格式与 Chrome 的不同，并且它们不能混合。
