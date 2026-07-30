# 阅读3

阅读是一款提供网络文学搜索的工具，为广大网络文学爱好者提供一种方便、快捷舒适的试读体验。

![阅读3](https://file.lifebus.top/imgs/reader3_cover.jpg)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 免责声明

阅读是一款提供网络文学搜索的工具，为广大网络文学爱好者提供一种方便、快捷舒适的试读体验。

当您搜索一本书的时，阅读会将该书的书名以关键词的形式提交到各个第三方网络文学网站。各第三方网站返回的内容与阅读无关，阅读对其概不负责，亦不承担任何法律责任。任何通过使用阅读而链接到的第三方网页均系他人制作或提供，您可能从第三方网页上获得其他服务，阅读对其合法性概不负责，亦不承担任何法律责任。第三方搜索引擎结果根据您提交的书名自动搜索获得并提供试读，不代表阅读赞成或被搜索链接到的第三方网页上的内容或立场。您应该对使用搜索引擎的结果自行承担风险。

阅读不做任何形式的保证：不保证第三方搜索引擎的搜索结果满足您的要求，不保证搜索服务不中断，不保证搜索结果的安全性、正确性、及时性、合法性。因网络状况、通讯线路、第三方网站等任何原因而导致您不能正常使用阅读，阅读不承担任何法律责任。阅读尊重并保护所有使用阅读用户的个人隐私权，您注册的用户名、电子邮件地址等个人资料，非经您亲自许可或根据相关法律、法规的强制性规定，阅读不会主动地泄露给第三方。

阅读致力于最大程度地减少网络文学阅读者在自行搜寻过程中的无意义的时间浪费，通过专业搜索展示不同网站中网络文学的最新章节。阅读在为广大小说爱好者提供方便、快捷舒适的试读体验的同时，也使优秀网络文学得以迅速、更广泛的传播，从而达到了在一定程度促进网络文学充分繁荣发展之目的。阅读鼓励广大小说爱好者通过阅读发现优秀网络小说及其提供商，并建议阅读正版图书。任何单位或个人认为通过阅读搜索链接到的第三方网页内容可能涉嫌侵犯其信息网络传播权，应该及时向阅读提出书面权力通知，并提供身份证明、权属证明及详细侵权情况证明。阅读在收到上述法律文件后，将会依法尽快断开相关链接内容。

## 服务地址说明

> 1. 全功能web端
>
> 访问地址：`http://{host_ip}:{port}`
>
> 用户需要自行注册账号
>
> 2. 适配kindle的 simple-web (收费)
>
> 访问地址：`http://{host_ip}:{port}/simple-web`
>
> 3. WebDAV同步配置
>
> 访问地址：`http://{host_ip}:{port}/reader3/webdav/`
>
> 用户名 `default` 或 用户名
>
> 密码 `123456` 或 用户密码

## 安装说明

> `远程 WebView API 地址 (插件)` 配置

此配置为远程 WebView API 地址，用于阅读3加载订阅源文章使用。

此项配置非强制配置，如果遇到无法加载订阅源文章的情况，可以尝试配置此项。

请先在应用商店搜索安装 `阅读3 Webview插件` 插件，然后配置 `远程 WebView API 地址`。

```yaml
http://host_ip:port
```

## 数据存储树

```yaml
storage
├── assets                                        # 静态资源
│   ├── hector                                    # 用户 hector 的资源目录
│   |   |── covers                                # 本地 epub 书籍的封面图片目录
│   │   ├── background                            # 自定义阅读背景图片保存目录
│   │   │   └── 6.jpg
│   └── reader.css                                # 自定义CSS样式文件
├── cache                                         # 缓存目录
│   ├── 6190ac40068e74c2c82624e91a5f8a0c.jpg      # 书籍封面缓存
│   ├── bookInfoCache                             # 书籍搜索缓存 ACache 目录
│   └── ea11967236129bdae6133c3c9ff8c2dd.jpg
├── data                                          # 数据目录
│   ├── default                                   # 系统默认用户的数据目录 (reader.app.secure为false时)
│   │   ├── bookSource.json                       # 书源列表
│   │   ├── bookshelf.json                        # 书架书籍列表
│   │   ├── 斗罗大陆_唐家三少                        # 书籍缓存目录
│   │   │   ├── 5d01bc88d6b19ebbe974acaac1675811         # A书源章节缓存目录
│   │   │   ├── 5d01bc88d6b19ebbe974acaac1675811.json    # A书源目录列表
│   │   │   ├── 7e5ca1cc2a1ea2e09fdec4ee2e150f02         # B书源章节缓存目录
│   │   │   ├── 7e5ca1cc2a1ea2e09fdec4ee2e150f02.json    # B书源目录列表
│   │   │   └── bookSource.json                          # 书籍书源列表
│   ├── hector                                    # 用户 hector 的数据目录 (reader.app.secure为true时的用户目录)
│   │   ├── bookSource.json                       # 书源列表
│   │   ├── bookshelf.json                        # 书架书籍列表
│   │   ├── webdav                                # webdav 存储目录 可能会存在 legado 子目录
│   │   │   ├── backup2021-09-15.zip              # 阅读3备份文件
│   │   │   └── bookProgress                      # 阅读3书籍进度备份目录
│   │   │       └── 斗罗大陆_唐家三少.json           # 阅读3书籍进度
│   │   └── 斗罗大陆_唐家三少                        # 书籍缓存目录
│   │       |── 2d44d0ec2397b6c1d4010b97d914031e       # A书源章节缓存目录
│   │       └── 2d44d0ec2397b6c1d4010b97d914031e.json  # A书源目录列表
│   └── users.json                                # 用户列表
├── localStore                                    # 本地书仓，所有用户共享(用户需要开启书仓权限，才能访问)
│   |── 斗破苍穹.txt                               # 本地书仓书籍
│   └── 斗罗大陆.txt                               # 本地书仓书籍
└── windowConfig.json                             # 窗口配置文件
```

## 获取激活码

已知付费功能

- 适配kindle的 simple-web
- 用户数量限制 (默认最大值为 50 个)

如果需要付费功能，请联系作者获取 `激活密钥` 。

<img src="https://file.lifebus.top/imgs/reader3_author_wechat_official_accounts.png" width="100%"/>

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
