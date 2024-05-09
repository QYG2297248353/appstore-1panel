# Immich

Immich - 高性能自托管照片和视频备份解决方案

## 默认账户

Grafana 默认账户：`admin`
Grafana 默认密码：`admin`

## 应用说明

Immich 提供各种性能指标，以便进行本地监控和深入分析。这种集成主要采用 Prometheus 指标的形式。不过，由于使用了 OpenTelemetry
仪器，也可以导出跟踪。

### Prometheus

Prometheus 是一种从您配置的多个来源收集指标的工具。它采用 "拉动 "策略运行，即定期从每个定义的源请求指标。这意味着源在收到请求之前不会发送任何信息。
这也意味着源（在本例中为 immich）必须暴露一个端点，以便 Prometheus 在请求指标时将其作为目标。

### 衡量标准

这些指标的形式多种多样：

+ 计数器，只能增加。例如：端点被调用的次数。
+ 仪表，可在一定范围内增减。例如：CPU 使用率：CPU 利用率。
+ 直方图：每个观测值都被分配到一定数量的 "桶 "中。例如：响应时间，每个 "桶 "代表毫秒数。这个比较复杂。
    + 在这种情况下，桶是累积的；也就是说，一个观测值不仅会被放入包含它的最小桶中，也会被放入比它更大的所有桶中。例如，如果直方图有
      1 毫秒、5 毫秒和 10 毫秒三个分区，那么 3 毫秒的观测值就会被分入 5 毫秒和 10 毫秒两个分区。

immich 中的指标分为 API（端点调用和响应时间）、主机（内存和 CPU 利用率）和 IO（内部数据库查询、图像处理等）。每组指标都可以独立启用或禁用。

## 部署

安装应用 `Immich` 并启用 `指标监控`

## 修改配置

无法连接到 `Immich` 服务时

进入安装目录，修改持久化目录下 `config/prometheus.yml` 文件，配置 `targets` 为 `immich` 服务的 `IP:端口` 即可。

默认路径：`/home/immich-app/config/prometheus.yml`

```yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: immich_server
    static_configs:
      - targets: [ 'immich-server:8081' ]

  - job_name: immich_microservices
    static_configs:
      - targets: [ 'immich-microservices:8081' ]
```

您可以保留 `immich-server` 与 `immich-microservices` 主机名，由DNS自动解析，前提是您未修改网络模式。

`immich_server` 对应服务端口 `指标监控服务 端口` 默认值：`8081`。

`immich_microservices` 对应服务端口 `指标监控微服务 端口` 默认值：`8082`。
