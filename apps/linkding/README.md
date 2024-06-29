# linkding

链接是一个简单的书签服务，您可以自己托管。

![linkding](https://github.com/sissbruecker/linkding/blob/master/docs/linkding-screenshot.png)

## 特性

+ 用于组织书签的标签
+ 按文本或标签搜索
+ 批量编辑
+ 书签存档
+ 深色模式
+ 在 Internet Archive Wayback Machine 上自动创建已添加书签的网站的快照
+ 自动提供已添加书签的网站的标题和描述
+ 以 Netscape HTML 格式导入和导出书签
+ Firefox 和 Chrome 的扩展程序，以及应该在大多数浏览器中工作的书签
+ 用于开发第三方应用程序的 REST API
+ 用于用户自助服务和原始数据访问的管理面板
+ 使用Docker易于设置，使用SQLite作为数据库

## 安装说明

### 网站图标提供商

+ 默认供应商 Google
  `https://t1.gstatic.com/faviconV2?client=SOCIAL&type=FAVICON&fallback_opts=TYPE,SIZE,URL&url={url}&size=32`
+ 可选供应商 DuckDuckGo
  `https://icons.duckduckgo.com/ip3/{domain}.ico`

> 自定义供应商规则

+ 参数 `{url}`

包括网站的方案和主机名，例如 https://example.com

+ 参数 `{domain}`

仅包含网站的主机名，例如 example.com

## 插件应用

+ [Firefox 书签同步](https://addons.mozilla.org/de/firefox/addon/linkding-extension/)
+ [Chrome 书签同步](https://chrome.google.com/webstore/detail/linkding-extension/beakmhbijpdhipnjhnclmhgjlddhidpe)
