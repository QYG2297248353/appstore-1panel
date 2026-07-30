# Traccar 轨迹

Traccar GPS 追踪系统

![Traccar 轨迹](https://file.lifebus.top/imgs/traccar_cover.png)

Traccar 是一个开源的 GPS 跟踪系统。此仓库包含基于 Java 的后端服务。它支持超过 200 种 GPS 协议和超过 2000 种 GPS
跟踪设备型号。Traccar 可以与任何主要的 SQL 数据库系统一起使用。它还提供易于使用的 REST API。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

🚀 服务器

Traccar 软件在 Windows、Linux 或其他任何平台上都提供了卓越的性能和稳定性。服务器可以部署在本地或云端，我们提供各种托管选项，并提供专业支持。

🚀 设备

Traccar 在市场上众多的 GPS 跟踪系统中脱颖而出，因为它支持广泛的各种协议和设备型号。无论您更喜欢低成本、无名的 GPS
跟踪器，还是高品质、有质量保证的品牌，Traccar 都能让您从众多供应商中进行选择。

🚀 界面

Traccar 提供了一个现代且全面的网络界面，适用于桌面和移动设备。
此外，我们还提供针对 Android 和 iOS 平台的本地移动应用程序。此外，我们还提供一系列应用程序，可以将移动设备转变为 GPS 追踪器。

🚀 实时跟踪

Traccar 允许您实时查看 GPS 设备的位置，没有任何延迟。
多种地图选项可供选择，包括道路地图和卫星图像，您可以选择最符合您需求的一个。此外，Traccar 可以高效管理由 GPS 单元提供的大量传感器和数据。

🚀 警报

Traccar 软件提供即时通知，包括推送通知、电子邮件和其他方法的支持。
这些功能使软件能够提醒用户恶劣驾驶行为、燃油下降、维护事件、地理围栏违规以及多种其他类型的警报。

🚀 报告

Traccar 提供多种报告，包括位置历史、行程、图表和总结报告。这些报告可以直接通过网络或移动应用访问，也可以导出为 Excel 文件。
此外，Traccar 允许用户在地图上可视化位置历史，以便更直观地理解他们的数据。

## 功能

+ 实时 GPS 追踪
+ 驾驶员行为监控
+ 详细报告和摘要报告
+ 地理围栏功能
+ 警报和通知
+ 账户和设备管理
+ 电子邮件和短信支持

## 平台

### 管理平台

[![Download on the App Store](http://www.tananaev.com/badges/app-store.svg)](https://itunes.apple.com/app/traccar-manager/id1113966562) [![Get it on Google Play](http://www.tananaev.com/badges/google-play.svg)](https://play.google.com/store/apps/details?id=org.traccar.manager)

### 服务平台

[![Download on the App Store](http://www.tananaev.com/badges/app-store.svg)](https://itunes.apple.com/app/traccar-client/id843156974) [![Get it on Google Play](http://www.tananaev.com/badges/google-play.svg)](https://play.google.com/store/apps/details?id=org.traccar.client) [![Get it on F-Droid](http://www.tananaev.com/badges/f-droid.svg)](https://f-droid.org/repository/browse/?fdid=org.traccar.client)

## 安装说明

> ### 账户说明
>
> 在较旧版本的 Traccar 中，系统会自动创建默认管理员账户，登录名和密码均为 admin
>
> 在较新版本中，没有默认用户，因此需要进行注册。第一个注册的用户会自动成为管理员。

> ### 设备注册
>
> 您需要填写名称和标识符字段。名称可以是任何内容。标识符必须与您的设备向服务器报告的唯一 ID 相匹配。对于大多数设备，您应该使用
> IMEI 或序列号作为唯一标识符。

### 数据库选择

Traccar 支持以下数据库：

+ MySQL
+ PostgreSQL
+ H2

其中，H2 为默认数据库，但不建议在生产环境中使用。因此，我们建议使用 MySQL 或 PostgreSQL。

请在持久化目录中，查看配置文件：`traccar.xml`

#### H2 数据库配置

我们不建议您修改 H2 数据库配置。如果您执意要修改，请确保您知道自己在做什么。
您可以在安装目录 `conf/traccar.xml` 中找到默认的 H2 数据库配置。

```xml
<entry key='database.driver'>org.h2.Driver</entry>
<entry key='database.url'>jdbc:h2:./data/database</entry>
<entry key='database.user'>sa</entry>
<entry key='database.password'></entry>
```

#### MySQL 数据库配置

修改持久化目录中的 `traccar.xml` 文件，配置 MySQL 数据库。

```xml
<entry key='database.driver'>com.mysql.cj.jdbc.Driver</entry>
<entry key='database.url'>jdbc:mysql://[HOST]/[DATABASE]?zeroDateTimeBehavior=round&amp;serverTimezone=UTC&amp;allowPublicKeyRetrieval=true&amp;useSSL=false&amp;allowMultiQueries=true&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8&amp;sessionVariables=sql_mode=''</entry>
<entry key='database.user'>[USER]</entry>
<entry key='database.password'>[PASSWORD]</entry>
```

请将 `[]` 替换为您的实际配置。

#### PostgreSQL 数据库配置

修改持久化目录中的 `traccar.xml` 文件，配置 PostgreSQL 数据库。

```xml
<entry key='database.driver'>org.postgresql.Driver</entry>
<entry key='database.url'>jdbc:postgresql://[HOST]/[DATABASE]</entry>
<entry key='database.user'>[USER]</entry>
<entry key='database.password'>[PASSWORD]</entry>
```

请将 `[]` 替换为您的实际配置。

### 端口服务

Traccar 默认使用 8082 端口作为 Web / 移动端 服务端口。

同时，将 `5000-5150` TCP/UDP 端口，用于 GPS 设备与 Traccar 服务器通信。

如果使用 GPS硬件设备， 请在安装前确认 `5000-5150` 端口未被占用。并添加端口映射

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
