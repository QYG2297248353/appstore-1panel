# 盘搜 (PanSou)

PanSou是一个高性能的网盘资源搜索API服务，支持TG搜索和自定义插件搜索。系统设计以性能和可扩展性为核心，支持并发搜索、结果智能排序和网盘类型分类。

![PanSou](https://file.lifebus.top/imgs/pansou_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

### 高性能搜索

并发执行多个TG频道及异步插件搜索，显著提升搜索速度；工作池设计，高效管理并发任务

### 网盘类型分类

自动识别多种网盘链接，按类型归类展示

### 智能排序

基于插件等级、时间新鲜度和优先关键词的多维度综合排序算法

### 异步插件系统

支持通过插件扩展搜索来源，支持"尽快响应，持续处理"的异步搜索模式，解决了某些搜索源响应时间长的问题。详情参考插件开发指南

### 二级缓存

分片内存+分片磁盘缓存机制，大幅提升重复查询速度和并发性能

## 支持的网盘类型

| 网盘名称   | 标识符    |
|--------|--------|
| 百度网盘   | baidu  |
| 阿里云盘   | aliyun |
| 夸克网盘   | quark  |
| 天翼云盘   | tianyi |
| UC网盘   | uc     |
| 移动云盘   | mobile |
| 115网盘  | 115    |
| PikPak | pikpak |
| 迅雷网盘   | xunlei |
| 123网盘  | 123    |
| 磁力链接   | magnet |
| 电驴链接   | ed2k   |
| 其他     | others |

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
