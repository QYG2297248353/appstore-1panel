# Garage HQ

Garage 是一种与 S3 兼容的分布式对象存储服务，专为中小规模的自托管而设计。

![Garage HQ](https://file.lifebus.top/imgs/garage-hq_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 简介

Garage 专为由运行在不同物理位置的节点组成的存储集群而设计，旨在轻松提供存储服务，该服务可在这些不同位置复制数据，即使某些服务器无法访问也能保持可用。Garage
还注重轻量级、易于操作以及对机器故障的高弹性。

## 安装说明

通过宿主机初始化：

1. 通过 `docker ps` 命令查看正在运行的容器, 获取当前部署的容器名称 `CONTAINER ID`
2. 注册 `garage` 命令

```sh
alias garage="docker exec -ti <container name> /garage"
```

3. 查看集群状态

```sh
garage status
```

输出结果，获得集群 `ID`:3df3882525930828

```shell

[root@mechrevmini ~]# garage status
2025-07-18T09:10:09.202519Z INFO garage_net::netapp: Connected to 127.0.0.1:3901, negotiating handshake...    
2025-07-18T09:10:09.243660Z INFO garage_net::netapp: Connection established to 3df3882525930828    
==== HEALTHY NODES ====
ID Hostname Address Tags Zone Capacity DataAvail Version
3df3882525930828 a2bc48d5c8ab 127.0.0.1:3901 NO ROLE ASSIGNED v2.0.0
```

4. 创建节点

```sh
garage layout assign -z dc1 -c 1G <node_id>

## demo
garage layout assign -z dc1 -c 1G 3df3882525930828
```

5. 将节点添加到集群

```sh
garage layout apply --version 1
```

无论是集群部署，还是单节点部署，都需要初始化节点。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
