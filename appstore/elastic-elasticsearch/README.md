# Elasticsearch

搜索并分析您的数据

<img src="https://file.lifebus.top/imgs/elasticsearch_logo.svg" width="100%"/>

Elasticsearch 是 Elastic Stack 核心的分布式搜索和分析引擎。 Logstash 和 Beats 有助于收集、聚合和丰富您的数据并将其存储在
Elasticsearch 中。
Kibana 使您能够以交互方式探索、可视化和分享对数据的见解，并管理和监控堆栈。 Elasticsearch 是索引、搜索和分析魔法发生的地方。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

当前应用为主节点，仅首次部署有效。集群节点请使用 `Elasticsearch 节点` 应用。

### 宿主机配置

+ `vm.max_map_count` 配置

Elasticsearch 需要设置 `vm.max_map_count` 为至少 `262144`。可以通过以下命令设置：

```sh
grep vm.max_map_count /etc/sysctl.conf

# 如果输出为空，表示没有设置，需要手动添加
vm.max_map_count=262144
```

添加配置

```sh
# 临时生效
sysctl -w vm.max_map_count=262144

# 永久生效
echo "vm.max_map_count=262144" >>/etc/sysctl.conf
sysctl -p
```

### 集群主节点安装

> `集群名称` 配置

用于标识集群的名称。默认为 `elasticsearch-cluster`。

> `节点名称` 配置

用于标识节点的名称。默认为 `elasticsearch-node`。

> `Elasticsearch 密码 (elastic)` 配置

内置用户 `elastic` 的密码。默认情况下，密码是随机生成的。

> `Kibana 密码 (kibana_system)` 配置

内置用户 `kibana_system` 的密码。默认情况下，密码是随机生成的。

用于保护内置用户 `kibana_system` 的密码。默认情况下，密码是随机生成的。

> `Java 启动参数 (可选)` 配置

Java 启动参数。默认为空。

推荐参数：`-Xms1g -Xmx1g`

小内存推荐参数：`-Xms512m -Xmx512m`

## 快捷操作

> 重置密码

```sh
/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```

> 创建 `节点` 注册令牌

注册令牌的有效期为30分钟。

```sh
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s node
```

> 创建 `kibana` 注册令牌

注册令牌的有效期为30分钟。

```sh
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```

> 导出证书

<容器名称> 为容器名称或容器 ID，可以通过 `docker ps` 命令查看。

导出 `http_ca.crt` 证书到当前目录

```sh
docker cp <容器名称>:/usr/share/elasticsearch/config/certs/http_ca.crt .
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
