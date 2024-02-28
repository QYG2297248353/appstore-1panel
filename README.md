# 1Panel 应用商店

当前仓库由 [`新疆萌森软件开发工作室`](https://lifebus.top/) 维护，我们致力于为 1Panel 用户提供更多的应用程序。

## 维护应用

- [x] [Bark](https://bark.day.app/)
- [x] [Elastic](https://www.elastic.co/)
    - [x] [Elasticsearch](https://www.elastic.co/elasticsearch/)
    - [x] [Kibana](https://www.elastic.co/kibana/)
    - [ ] [Logstash](https://www.elastic.co/logstash/)
- [x] [GitLab](https://about.gitlab.com/)
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
- [x] [SftpGo](https://sftpgo.com/)
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

+ Tip 如果你只看到两行命令,说明执行失败

```sh
Downloading and executing script from https://github.com/QYG2297248353/appstore-1panel/releases/download/install/install.sh...
Script execution completed.
```

+ 给脚本配置网络代理 （插入到定义脚本URL之前即可）

```sh
# 定义代理服务器地址和端口
proxy_server="server address"
proxy_port="server port"
# 设置网络代理
export http_proxy="http://$proxy_server:$proxy_port"
export https_proxy="http://$proxy_server:$proxy_port"
```

当前使用 `http` 代理，如果你的代理服务器是 `socks5` 请修改 `http_proxy` 和 `https_proxy` 为 `socks5` 协议

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
