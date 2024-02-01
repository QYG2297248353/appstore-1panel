# 1Panel 应用商店

当前仓库由 [`新疆萌森软件开发工作室`](https://lifebus.top/) 维护，我们致力于为 1Panel 用户提供更多的应用程序。

## 维护应用

- [x] [Nacos](https://nacos.io/)
- [x] [Sentinel-Dashboard](https://sentinelguard.io/)
- [x] [Elastic](https://www.elastic.co/)
    - [x] [Elasticsearch](https://www.elastic.co/elasticsearch/)
    - [x] [Kibana](https://www.elastic.co/kibana/)
    - [ ] [Logstash](https://www.elastic.co/logstash/)
- [ ] [Immich](https://immich.app/)

## 脚本安装

> 方案一：使用 `curl` 安装，不会提示脚本下载异常

```shell
#!/bin/bash

# 定义脚本URL
script_url="https://github.com/QYG2297248353/appstore-1panel/releases/download/install/install.sh"

# 执行脚本
echo "Downloading and executing script from $script_url..."
bash <(curl -sL "$script_url")

# 输出执行结果
echo "Script execution completed."

```

> 方案二：复制 `install.sh` 脚本内容

[install.sh](install.sh)
