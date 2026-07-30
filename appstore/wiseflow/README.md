# Wiseflow 首席情报官

首席情报官（Wiseflow）是一个敏捷的信息挖掘工具，可以从网站、微信公众号、社交平台等各种信息源中按设定的关注点提炼讯息，自动做标签归类并上传数据库。

![Bark](https://file.lifebus.top/imgs/wiseflow_cover.png)

我们缺的其实不是信息，我们需要的是从海量信息中过滤噪音，从而让有价值的信息显露出来！

看看首席情报官是如何帮您节省时间，过滤无关信息，并整理关注要点的吧！

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

🚀 原生 LLM 应用

我们精心选择了最适合的 7B~9B 开源模型，最大化降低使用成本，且利于数据敏感用户随时完全切换至本地部署。

🌱 轻量化设计

不用任何向量模型，系统开销很小，无需 GPU，适合任何硬件环境。

🗃️ 智能信息提取和分类

从各种信息源中自动提取信息，并根据用户关注点进行标签化和分类管理。

WiseFlow尤其擅长从微信公众号文章中提取信息，为此我们配置了mp article专属解析器！

🌍 可以被整合至任意Agent项目

可以作为任意 Agent 项目的动态知识库，无需了解wiseflow的代码，只需要与数据库进行读取操作即可！

📦 流行的 Pocketbase 数据库

数据库和界面使用 PocketBase，除了 Web 界面外，目前已有 Go/Javascript/Python 等语言的SDK。

## 安装说明

> 数据库初始化
>
> 首次安装需要进入 `http://127.0.0.1:8090/_/` 进行数据库初始化。
>
> 初始化完成后，回到应用列表，填写 `PB数据库 账户密码` 配置
>
> 填写格式 `<email>|<password>`
>
> 例如 `test@example.com|1234567890`

### 配置大模型

由于本地部署的原生模型较大，不推荐普通用户自行搭建。

推荐使用 `SiliconFlow` 服务，我们提供了完整的模型服务，只需填写 `SiliconFlow` 的 `API` 地址即可。

账户申请：[SiliconFlow](https://cloud.siliconflow.cn?referrer=clzusc8v803r712nttz3gbfq5)

配置：`LLM API 地址` 填写 `SiliconFlow` 的 `API` 地址 `https://api.siliconflow.cn/v1`

配置密钥：可通过 [API密钥](https://cloud.siliconflow.cn/account/ak) 页面获取

## 常见问题

### 🔄 wiseflow 与常见的爬虫工具、LLM-Agent类项目有何不同与关联？

| 特点          | 首席情报官（Wiseflow） | Crawler / Scraper                     | LLM-Agent            |
|-------------|-----------------|---------------------------------------|----------------------|
| **主要解决的问题** | 数据处理（筛选、提炼、贴标签） | 原始数据获取                                | 下游应用                 |
| **关联**      |                 | 可以集成至WiseFlow，使wiseflow具有更强大的原始数据获取能力 | 可以集成WiseFlow，作为动态知识库 |

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
