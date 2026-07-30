# Nacos

一个易于使用的动态服务发现、配置和服务管理平台，用于构建云原生应用。

![Nacos](https://github.com/alibaba/nacos/raw/develop/doc/Nacos_Logo.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

Nacos
2.x默认使用的端口为8848（HTTP管理端口）、9848（客户端gRPC请求服务端端口）和9849（服务端gRPC请求服务端端口）。客户端在连接时，虽然主要配置的是管理端访问端口8848，但实际上客户端会根据服务端的配置自动计算其他端口进行通信。

因此我们推荐使用 `host` 模式部署，以避免端口冲突。

> 安全路径：`/nacos`
>
> 用户名：`nacos`
>
> 自版本 `2.4.0` 起，取消了默认密码，首次启动需要自行设置密码。
> 密码：`nacos`

### 初始化数据库

安装前，需要先创建数据库，数据库初始化文件：`mysql-schema.sql`
，可前往[Nacos](https://github.com/alibaba/nacos/blob/master/distribution/conf/mysql-schema.sql)下载。

或安装完成后，进入安装目录，在 `init` 文件夹下，导入 `mysql-schema.sql` 文件。

### 加密配置

+ `Nacos身份验证令牌`

32位字符串，并使用Base64编码。

### JVM参数

+ `JVM_XMS`

这个参数设置 Java 虚拟机堆的初始内存大小。

它指定了 JVM 在启动时分配的堆内存大小。

例如，-Xms512m 表示 JVM 在启动时将分配 512MB 的堆内存。

+ `JVM_XMX`

这个参数设置 Java 虚拟机堆的最大内存大小。

它指定了 JVM 堆内存的上限。

例如，-Xmx1024m 表示 JVM 的堆内存最多可以使用 1024MB。

+ `JVM_XMN`

这个参数用于设置新生代的大小。

新生代是 JVM 堆内存中的一部分，用于存放新创建的对象。
设置 -Xmn 参数可以控制新生代的初始大小。

例如，-Xmn256m 表示将新生代的初始大小设置为 256MB。

+ `JVM_MS`

这个参数用于设置 JVM 的初始元空间大小。

元空间是用于存储类元数据的区域，它在 Java 8 中取代了永久代。

例如，-XX: MetaspaceSize=128m 表示将初始的元空间大小设置为 128MB。

+ `JVM_MMS`

这个参数用于设置 JVM 的最大元空间大小。

它指定了元空间能够增长的最大限制。

例如，-XX:MaxMetaspaceSize=256m 表示将元空间的最大大小限制为 256MB。

```shell
- JVM_XMS=64m   #-Xms default :1g
- JVM_XMX=64m   #-Xmx default :1g
- JVM_XMN=16m   #-Xmn default :512m
- JVM_MS=8m     #-XX:MetaspaceSize default :128m
- JVM_MMS=8m    #-XX:MaxMetaspaceSize default :320m
```

## 升级说明

> [升级手册](https://nacos.io/docs/latest/manual/admin/upgrading/)

### 2.5.0

表结构发生变化

```sql
/******************************************/
/*   表名称 = config_info  since 2.5.0                */
/******************************************/
CREATE TABLE `config_info_gray`
(
    `id`                 bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
    `data_id`            varchar(255) NOT NULL COMMENT 'data_id',
    `group_id`           varchar(128) NOT NULL COMMENT 'group_id',
    `content`            longtext     NOT NULL COMMENT 'content',
    `md5`                varchar(32)           DEFAULT NULL COMMENT 'md5',
    `src_user`           text COMMENT 'src_user',
    `src_ip`             varchar(100)          DEFAULT NULL COMMENT 'src_ip',
    `gmt_create`         datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT 'gmt_create',
    `gmt_modified`       datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP (3) COMMENT 'gmt_modified',
    `app_name`           varchar(128)          DEFAULT NULL COMMENT 'app_name',
    `tenant_id`          varchar(128)          DEFAULT '' COMMENT 'tenant_id',
    `gray_name`          varchar(128) NOT NULL COMMENT 'gray_name',
    `gray_rule`          text         NOT NULL COMMENT 'gray_rule',
    `encrypted_data_key` varchar(256) NOT NULL DEFAULT '' COMMENT 'encrypted_data_key',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_configinfogray_datagrouptenantgray` (`data_id`,`group_id`,`tenant_id`,`gray_name`),
    KEY                  `idx_dataid_gmt_modified` (`data_id`,`gmt_modified`),
    KEY                  `idx_gmt_modified` (`gmt_modified`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='config_info_gray';

```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
