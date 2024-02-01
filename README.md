# 1Panel 应用商店

当前仓库由 `新疆萌森软件开发工作室` 维护，我们致力于为 1Panel 用户提供更多的应用程序。

## 上线应用

- [x] [Nacos](https://nacos.io/)
- [x] [Sentinel-Dashboard](https://sentinelguard.io/)
- [x] [Elastic](https://www.elastic.co/)
    - [x] [Elasticsearch](https://www.elastic.co/elasticsearch/)
    - [x] [Kibana](https://www.elastic.co/kibana/)
    - [ ] [Logstash](https://www.elastic.co/logstash/)
- [ ] [Immich](https://immich.app/)

## 脚本安装

```shell
git clone -b localApps https://github.com/QYG2297248353/appstore-1panel /opt/1panel/resource/apps/local/appstore-localApps

cp -rf /opt/1panel/resource/apps/local/appstore-localApps/apps/* /opt/1panel/resource/apps/local/

rm -rf /opt/1panel/resource/apps/local/appstore-localApps
```
