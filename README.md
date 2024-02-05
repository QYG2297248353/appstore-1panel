# 1Panel 应用商店

当前仓库由 [`新疆萌森软件开发工作室`](https://lifebus.top/) 维护，我们致力于为 1Panel 用户提供更多的应用程序。

## 维护应用

- [x] [Bark](https://bark.day.app/)
- [x] [Elastic](https://www.elastic.co/)
    - [x] [Elasticsearch](https://www.elastic.co/elasticsearch/)
    - [x] [Kibana](https://www.elastic.co/kibana/)
    - [ ] [Logstash](https://www.elastic.co/logstash/)
- [x] [Immich](https://immich.app/)
- [x] [Jellyfin](https://jellyfin.org/)
- [x] [Minio](https://min.io/)
- [x] [MySQL](https://www.mysql.com/)
    - [x] [MariaDB](https://mariadb.org/)
    - [ ] [Percona](https://www.percona.com/)
- [x] [Nacos](https://nacos.io/)
- [x] [PostgreSQL](https://www.postgresql.org/)
- [x] [QingLong](https://github.com/whyour/qinglong)
- [x] [Redis](https://redis.io/)
- [x] [Sentinel-Dashboard](https://sentinelguard.io/)
- [x] [SpeedTest](https://www.speedtest.net/)
- [x] [Uptime-Kuma](https://github.com/louislam/uptime-kuma)

## 脚本安装

温馨提示：当您安装其他第三方库时，如果存在目录冲突，脚本会主动删除冲突的第三方库应用，如果您不同意，请不要执行脚本。
我们建议您在安装之前备份您的数据，或手动安装。

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

## 联系我们

- [📮Email](mailto:qyg2297248353@gmail.com)
- [GitHub](https://github.com/qyg2297248353)
- [Blog](https://lifebus.top/)
- [✈️Telegram](https://t.me/qyg2297248353)
- [Twitter](https://twitter.com/qyg2297248353)
- [Facebook](https://www.facebook.com/qyg2297248353)
- [Instagram](https://www.instagram.com/qyg2297248353)
