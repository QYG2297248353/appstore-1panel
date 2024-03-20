# 默认账户密码

```
username：admin
password：admin
```

# JumpServer

JumpServer 是广受欢迎的开源堡垒机，是符合 4A 规范的专业运维安全审计系统。JumpServer 堡垒机帮助企业以更安全的方式管控和登录各种类型的资产，包括：

- **SSH**: Linux / Unix / 网络设备 等；
- **Windows**: Web 方式连接 / 原生 RDP 连接；
- **数据库**: MySQL / Oracle / SQLServer / PostgreSQL 等；
- **Kubernetes**: 支持连接到 K8s 集群中的 Pods；
- **Web 站点**: 各类系统的 Web 管理后台；
- **应用**: 通过 Remote App 连接各类应用。

## 产品特色：

- **开源**: 零门槛，线上快速获取和安装；
- **无插件**: 仅需浏览器，极致的 Web Terminal 使用体验；
- **分布式**: 支持分布式部署和横向扩展，轻松支持大规模并发访问；
- **多云支持**: 一套系统，同时管理不同云上面的资产；
- **多租户**: 一套系统，多个子公司或部门同时使用；
- **云端存储**: 审计录像云端存储，永不丢失；

## 安装说明：

### 数据库支持

| 名称    | 版本    | 默认字符集 | 默认字符编码       | TLS/SSL |
| ------- | ------- | ---------- | ------------------ | ------- |
| MySQL   | >= 5.7  | utf8       | utf8_general_ci    | 支持    |
| MariaDB | >= 10.6 | utf8mb3    | utf8mb3_general_ci | 支持    |

#### 创建数据库

```sql
create database jumpserver default charset 'utf8';
```

### 缓存数据库支持

| 名称  | 版本   | Sentinel | Cluster | TLS/SSL |
| ----- | ------ | -------- | ------- | ------- |
| Redis | >= 6.0 | 支持     | 不支持  | 支持    |



### 端口映射说明

由于端口映射较多，1Panel安装时不会对所有端口检查，造成安装失败。安装前请检查对应端口是否被占用

| 端口        | 作用                       | 说明                                                         | 支持 |
| :---------- | :------------------------- | :----------------------------------------------------------- | ---- |
| 22          | SSH                        | 安装、升级及管理使用                                         | 可选 |
| 80          | Web HTTP 服务              | 通过 HTTP 协议访问 JumpServer 前端页面                       | 支持 |
| 443         | Web HTTPS 服务             | 通过 HTTPS 协议访问 JumpServer 前端页面                      | 可选 |
| 3306        | 数据库服务                 | MySQL 服务使用                                               | 可选 |
| 6379        | 数据库服务                 | Redis 服务使用                                               | 可选 |
| 3389        | Razor 服务端口             | RDP Client 方式连接 Windows 资产                             | 支持 |
| 2222        | SSH Client                 | SSH Client 方式使用终端工具连接 JumpServer，比如 Xshell、PuTTY、MobaXterm 等终端工具 | 支持 |
| 33061       | Magnus MySQL 服务端口      | DB Client 方式连接 MySQL 数据库资产                          | 支持 |
| 33062       | Magnus MariaDB 服务端口    | DB Client 方式连接 MariaDB 数据库资产                        | 支持 |
| 54320       | Magnus PostgreSQL 服务端口 | DB Client 方式连接 PostgreSQL 数据库资产                     | 支持 |
| 63790       | Magnus Redis 服务端口      | DB Client 方式连接 Redis 数据库资产                          | 支持 |
| 30000-30100 | Magnus Oracle 服务端口     | DB Client 方式连接 Oracle 数据库资产，该端口范围可自定义     | 可选 |



## 常见问题

#### 安装失败

请前往 `容器` 找到已创建的容器，启动容器，根据日志排查问题。
