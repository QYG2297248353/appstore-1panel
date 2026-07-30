# Bitmagnet

自托管的 BitTorrent 索引器，DHT 爬虫，内容分类器和带 Web UI，GraphQL API 以及 Servarr 堆栈集成的 torrent 搜索引擎。

![Bitmagnet](https://file.lifebus.top/imgs/bitmagnet_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

DHT 爬虫是 Bitmagnet 的杀手锏，使其独一无二。那么它是什么呢？ Translation:

你可能知道，可以在你的 BitTorrent 客户端中启用 DHT，这允许你找到正在向分布式哈希表（DHT）宣布磁贴哈希的对等方，而不是向集中式跟踪器。
DHT 的较不为人知的功能是，它允许您爬取它所知道的信息哈希。这就是 Bitmagnet 的 DHT 爬虫的工作方式 - 它爬取 DHT
网络，请求每个发现的信息哈希的元数据。然后通过尝试对其进行分类并将其与已知的内容关联（如电影和电视节目）进一步丰富这些元数据。
然后允许你搜索它所索引的一切。

这意味着 Bitmagnet 不依赖于任何外部跟踪器或磁力链接索引器。它是一个自包含、自托管的磁力链接索引器，通过 DHT
连接到全球网络中的对等节点，并不断发现新的内容。

## 功能与路线图

### 当前已实现的功能

- [x] DHT 爬虫和协议实现
- [x] 通用的 BitTorrent 索引器：bitmagnet 可以从任何来源索引磁力链接，而不仅仅是 DHT 网络——目前这仅可以通过 `/import`
  端点实现；更友好的方法正在开发中，请参见以下高优先级功能
- [x] 一个高度可定制的内容分类器，目前可以识别多种类型的内容，以及与之相关的关键属性，如语言、分辨率、来源（蓝光、网络翻录等），并从包括电影数据库在内的多个数据源补充信息。
- [x] [一个用于从任何来源摄入磁力链接的导入工具，例如 RARBG 备份](https://bitmagnet.io/guides/import.html)
- [x]  翻译文本： torrent 搜索引擎
- [x] GraphQL API：当前提供单个搜索查询；还包含一个嵌入式 GraphQL playground 在 `/graphql`
- [x] 在 Angular 中实现的网络用户界面：当前这是一个简单的单页应用，通过 GraphQL API 提供搜索查询的用户界面
- [x] [一个与 Torznab 兼容的端点，用于与 Serverr 堆栈集成](https://bitmagnet.io/guides/servarr- [ ]integration.html)

### 高优先级功能尚未实现

- [ ] 一个 WebUI 仪表板，显示诸如爬虫吞吐量、任务队列、数据库大小等信息。
- [ ] 认证，API 密钥，访问级别等。
- [ ] 管理员 API，一般来说，一个更完整的 GraphQL API
- [ ] 更完整的网络 UI
- [ ] 保存了对特定内容的搜索，以启用除以下功能外的自定义 feeds
- [ ] 与 Prowlarr 索引器代理的双向集成：目前，Bitmagnet 可以作为 Prowlarr 中的索引器添加；双向集成将允许 Bitmagnet 从
  Prowlarr 中配置的任何索引器爬取内容，解锁许多新的内容来源
- [ ] 更多文档和更多测试！

### 管道梦想特性

事情开始变得有些模糊。目前所有关注点都在实现上述核心功能，但这些想法在未来可能会被探索：

- [ ] 原地播种：在您的计算机上识别属于索引磁贴的文件，并在移动、重命名或删除磁贴的部分后，允许这些文件原地播种
- [ ] 与流行的 BitTorrent 客户端集成
- [ ] 某种联盟：允许朋友连接实例并汇集索引努力，可能涉及众包手动内容策展，以补充自动分类器
- [ ] 看起来像是去中心化的私人追踪器；我可能指的是部分基于个人信任，并手动剔除任何不良行为者的东西；我可能会对创建看起来有点像
  Tribler 的东西持谨慎态度，尽管这是一个有趣的研究项目，但似乎已经证明，在协议层面上实现信任、声誉和隐私的开销太大，无法成为与原始的
  BitTorrent 相比具有吸引力的替代方案，尽管 BitTorrent 存在一些缺陷
- [ ] BitTorrent v2 协议的支持：是否会有更广泛的采用使其成为有价值的功能还有待观察

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
