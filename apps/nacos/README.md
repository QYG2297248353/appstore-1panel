# Nacos

一个易于使用的动态服务发现、配置和服务管理平台，用于构建云原生应用。

![Nacos](https://github.com/alibaba/nacos/raw/develop/doc/Nacos_Logo.png)

## 特性

## 安装说明

> 安全路径：`/nacos`
>
> 用户名：`nacos`
>
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
