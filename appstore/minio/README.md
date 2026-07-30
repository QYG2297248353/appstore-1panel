# MinIO

MinIO 是一种高性能、S3 兼容的对象存储。它是为大规模 AI/ML、数据湖和数据库工作负载。它是软件定义的并在任何云或本地基础设施上运行。

![MinIO](https://file.lifebus.top/imgs/minio_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

<div style="border: 1px solid #FFC107; padding: 10px; border-radius: 5px; color: #856404; background-color: #FFF3CD; display: inline-block; width: 100%; max-width: 60%; margin-top: 10px;">
    <div style="display: flex; align-items: center;">
        <span style="font-size: 24px; margin-right: 8px;">⚠️</span>
        <div>
            <strong style="font-size: 16px;">温馨提示</strong><br>
            <span style="font-size: 14px; color: #333;">该软件由于违背开源协议，自2025-04-22后，不在提供管理界面服务,仅保留文件浏览，请谨慎使用。</span>
        </div>
    </div>
</div>

## 特性

+ 简单

简单性是百亿亿次数据基础设施的基础——无论是技术上还是操作上。没有其他对象存储可以让您在更短的时间内从下载到生产。

+ 高性能

MinIO 是世界上最快的对象存储，已发布的 GET/PUT 结果在 32 个 NVMe 驱动器节点和 100GbE 网络上超过 325 GiB/秒和 165 GiB/秒。

+ Kubernetes 原生

通过原生 Kubernetes 操作集成，MinIO 支持公共云、私有云和边缘云上的所有主要 Kubernetes 发行版。

+ 人工智能就绪

MinIO 专为 AI 打造，可与所有主要 AI/ML 技术一起开箱即用。从预测模型到 GenAI，MinIO 提供的性能和可扩展性为 AI 企业提供动力。

## 安装说明

### API 端口

MinIO API 端口默认是 9000。

| API 端口 (映射内部端口) | API 内部端口 |
|-----------------|----------|
| 9000            | 9000     |

+ `API 内部端口` 是容器内部使用的端口，一般无需改动。
+ `API 端口` 是容器外部实际访问的端口，可以根据自己的需要进行修改。

### 域名配置

假定 MinIO WebUI 服务的域名为 `web.minio.com`

假定 MinIO API 服务的域名为 `f.minio.com`

#### API 服务器 URL

默认情况为：`http://localhost:9000`

端口 `9000` 取决于 `API 内部端口` 的配置。

域名配置，可填写：`https://f.minio.com`

协议 `https` 取决于是否启用了 SSL/TLS, 是否配置了域名证书。

#### API 域名

默认情况为：`localhost`

域名配置，可填写：`f.minio.com`

#### WebUI 重定向 URL

默认情况为：`http://localhost:9001`

域名配置，可填写：`https://web.minio.com`

协议 `https` 取决于是否启用了 SSL/TLS, 是否配置了域名证书。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
