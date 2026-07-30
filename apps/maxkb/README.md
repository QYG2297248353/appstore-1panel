# MaxKB

一款基于大语言模型和 RAG 的开源知识库问答系统

![MaxKBo](https://file.lifebus.top/imgs/maxkb_cover.jpg)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 应用简介

MaxKB = `Max Knowledge Base`，是一款基于大语言模型和 RAG
的开源知识库问答系统，广泛应用于企业内部知识库、客户服务、学术研究与教育等场景。作为一款专注于知识库问答场景的软件产品，MaxKB
能够为企业的智能化进程注入新的动力，助力企业实现“提质增效”的目标。在知识库管理方面，MaxKB
帮助企业实现知识采集、知识入库、知识库构建的全流程自动化；在场景化智能搜索方面，MaxKB 能够解析用户输入的问题并匹配检索知识库；在回复准确性方面，MaxKB
采用了成熟的 LLM + RAG 技术，能够最大限度地降低大模型幻觉对知识搜索准确性的干扰，提高企业对业务数据的分类与召回能力；安全性方面，MaxKB
支持本地部署和调用本地大模型，有效管控企业使用知识库时越级访问的风险，以及公有模型在数据传输方面可能存在的安全隐患。借助
MaxKB，企业用户可以快速上线业务 AI 助手，将生成式 AI 能力应用于业务数据管理、内部资料查询、线上客户服务等领域，优化业务服务流程并切实提升用户体验。

### 整体架构

![MaxKBo](https://file.lifebus.top/imgs/maxkb_architecture.jpg)

### 实现原理

![MaxKBo](https://file.lifebus.top/imgs/maxkb_principle.jpg)

### 技术栈

+ 前端：Vue.js、logicflow
+ 后端：Python / Django
+ 架构：Langchain
+ 向量数据库：PostgreSQL / pgvector
+ 大模型：Ollama、Azure OpenAI、OpenAI、通义千问、Kimi、百度千帆、讯飞星火、Gemini、DeepSeek等。

---

## 安装说明

> 服务地址：http://127.0.0.1:8080。
>
> 默认的登录信息：
>
> 用户名：`admin`
>
> 默认密码：`MaxKB@123..`

### 安装环境

+ 操作系统：Ubuntu 22.04 / CentOS 7 64 位系统；
+ CPU/内存： 推荐 2C/4GB 以上；
+ 磁盘空间：100GB；
+ 浏览器要求：请使用 Chrome、FireFox、Safari、Edge等现代浏览器；
+ 可访问互联网。

### 社区版限制

+ 用户数量：2 个；
+ 知识库数量：50 个；
+ 应用数量：5 个；
+ 不支持 第三方应用（企业微信，钉钉，微信公众号）
+ 不支持自定义对话框的 AI 头像
+ 不支持自定义对话框的浮窗入口图标
+ 不支持对话框浮窗位置可拖拽
+ 不支持显示历史对话记录设置
+ 不支持自定义系统 Logo 和主题
+ 不支持 LDAP、OIDC、CAS 等单点登录协议
+ 不开放 API

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
