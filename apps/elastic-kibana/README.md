# Kibana

Kibana 是一个用户界面，可让您可视化 Elasticsearch 数据并导航 Elastic Stack。通过本教程了解可视化数据的基础知识。

![Kibana](https://file.lifebus.top/imgs/kibana_cover.png)

Kibana 适合管理员、分析师和业务用户。作为管理员，您的角色是管理 Elastic Stack，从创建部署到将 Elasticsearch 数据导入
Kibana，然后管理数据。
作为分析师，您希望发现数据中的见解、在仪表板上可视化您的数据并分享您的发现。作为业务用户，您希望查看现有仪表板并深入了解详细信息。

Kibana 适用于所有类型的数据。您的数据可以是结构化或非结构化文本、数字数据、时间序列数据、地理空间数据、日志、指标、安全事件等。无论您的数据是什么，Kibana
都可以帮助您发现模式和关系并可视化结果。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 搜索、观察和保护您的数据

从发现文档到分析日志再到查找安全漏洞，Kibana 是您访问这些功能及其他功能的门户。

+ 分析您的数据

搜索隐藏的见解，可视化您在图表、仪表、地图、图形等中发现的内容，并将它们组合在仪表板中。

+ 管理、监控和保护 Elastic Stack

管理您的数据、监控 Elastic Stack 集群的运行状况并控制哪些用户可以访问哪些功能。

## 安装说明

> 首次安装 日志中获得初始化界面的地址，访问该地址进行初始化配置。
>
> http://127.0.0.1:5601/?code=xxxxxx

### 注册令牌

可通过以下方式获取注册令牌：

在 `ElasticSearch` 容器中执行以下命令：

```sh
cd /usr/share/elasticsearch/bin
./elasticsearch-create-enrollment-token -s kibana

# 或
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```

### 登录账户

> 默认账户: `elastic`
>
> 密码: 自行查看 ElasticSearch 参数配置

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
