# 1Panel 应用商店

本仓库中的所有应用不会与 1Panel 官方应用商店冲突(存在相同应用并不影响后续的安装与升级,择优选择你需要的版本即可)
，我们会定期更新应用，如果您有任何问题，请联系我们。
当前仓库由 [`新疆萌森软件开发工作室`](https://lifebus.top/) 维护，我们致力于为 1Panel 用户提供更多的应用程序。

## 维护应用

- [x] [Bark](https://bark.day.app/)
- [x] [Cookie-Cloud](https://github.com/easychen/CookieCloud)
- [x] [Elastic](https://www.elastic.co/)
    - [x] [Elasticsearch](https://www.elastic.co/elasticsearch/)
    - [x] [Kibana](https://www.elastic.co/kibana/)
    - [ ] [Logstash](https://www.elastic.co/logstash/)
- [x] [Emby](https://emby.media/)
- [x] [Gitea](https://gitea.io/)
    - [ ] [Gogs](https://gogs.io/)
- [x] [GitLab](https://about.gitlab.com/) `不推荐`
- [x] [Halo](https://halo.run/)
- [x] [Immich](https://immich.app/)
- [x] [Jellyfin](https://jellyfin.org/)
- [x] [LinkDing](https://github.com/sissbruecker/linkding)
- [x] [Minio](https://min.io/)
- [x] [MySQL](https://www.mysql.com/)
    - [x] [MariaDB](https://mariadb.org/)
    - [ ] [Percona](https://www.percona.com/)
- [x] [MoviePilot](https://github.com/jxxghp/MoviePilot)
- [x] [Nacos](https://nacos.io/)
- [x] [OneDev](https://onedev.io/)
- [x] [PostgreSQL](https://www.postgresql.org/)
- [x] [qBittorrent](https://www.qbittorrent.org/)
- [x] [QingLong](https://github.com/whyour/qinglong/)
- [x] [Redis](https://redis.io/)
- [x] [Sentinel-Dashboard](https://sentinelguard.io/)
- [x] [SftpGo](https://sftpgo.com/)
- [x] [SpeedTest](https://www.speedtest.net/)
    - [x] [SpeedTest-X](https://github.com/BadApple9/speedtest-x/)
- [x] [SpeedTest-Tracker](https://docs.speedtest-tracker.dev/)
- [x] [Transmission](https://transmissionbt.com/)
- [x] [Uptime-Kuma](https://github.com/louislam/uptime-kuma/)
- [x] [ZeroTier](https://www.zerotier.com/) `客户端`
    - [x] [Ztncui](https://www.zerotier.com/) `服务端`

## 脚本安装

温馨提示：当您同时安装其他第三方库时，如果存在目录冲突，脚本会主动删除冲突的第三方库应用，如果您不同意，请不要执行脚本。
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

## 常见问题

### 升级失败

请检查您的网络是否正常
请检查您的磁盘空间是否充足

#### 解决方案：

卸载重装

- 备份参数，记录软件安装参数
- 卸载软件
- 再次安装升级版本
- 填写之前保留参数
- 安装成功
  历史数据问题：由于使用持久化目录，卸载软件不会删除数据，请不要误删持久化目录，默认为 `/home/data/{appname}`

## 温馨提示

安装应用前请查看应用说明，了解应用的使用方法和注意事项。
当前第三方库应用均为开源应用，我们不对应用的安全性和稳定性负责。
如果您在使用过程中遇到问题，请查看应用的官方文档或社区，或者联系我们。

## 联系我们

- [📮Email](mailto:qyg2297248353@gmail.com)
- [GitHub](https://github.com/qyg2297248353)
- [Blog](https://lifebus.top/)
- [✈️Telegram](https://t.me/qyg2297248353)
- [Twitter](https://twitter.com/qyg2297248353)
- [Facebook](https://www.facebook.com/qyg2297248353)
- [Instagram](https://www.instagram.com/qyg2297248353)
