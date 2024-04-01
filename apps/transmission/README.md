# Transmission

Transmission是一种BitTorrent客户端，特点是一个跨平台的后端和其上的简洁的用户界面。Transmission以MIT许可证和GNU通用公共许可证双许可证授权，因此是一款自由软件。

### 安装说明

如果是使用 `Host` 主机网络 模式：
请检查，端口：`9091` 是否被占用。避免安装失败。
因为 `9091` 是 Transmission Web 管理端口。且无法在安装时更改。
修改方式：应用启动后，停止应用，修改文件`{root_path}/config/settings.json`

`root_path` 为应用的持久化根目录。

### 文件夹说明

+ `/config`
  传输应存储配置文件和日志的位置。
+ `/downloads`
  下载的本地路径。
+ `/watch`
  监视 torrent 文件的文件夹。
