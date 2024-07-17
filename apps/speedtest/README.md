# SpeedTest

没有 Flash，没有 Java，没有 Websocket，没有废话。

这是一个用 Javascript 实现的非常轻量级的速度测试，使用 XMLHttpRequest 和 Web Workers。

![SpeedTest](https://github.com/librespeed/speedtest/blob/master/.logo/logo3.png)

## 特性

+ 下载
+ 上传
+ Ping
+ 抖动
+ IP 地址、ISP、距服务器的距离（可选）
+ 遥测（可选）
+ 结果共享（可选）
+ 多点测试（可选）

## 安装说明

+ `访问密码`

前提：`开启遥测`

访问统计页面的密码。如果未设置，统计页面将不允许访问。

开启遥测后： `http://127.0.0.1/results/stats.php` 处将提供统计页面

+ `隐藏 IP 地址 (开启遥测)`

启用遥测时，将从收集的遥测中编辑 IP 地址和主机名，以实现更好的隐私。

+ `邮箱地址 (开启遥测)`

GDPR 请求的电子邮件地址。启用遥测时必须指定。

+ `ipinfo.io 的 API 密钥 (开启遥测)`

如果您希望提供大量测试，则为必需。否则，ipinfo.io 将限制您的访问。

+ `禁用 ipinfo.io (开启遥测)`

禁用后，则不会从 ipinfo.io 获取 ISP 信息和距离。

+ `距离单位 (km/mi)`

如果禁用 `禁用 ipinfo.io (开启遥测)`，此项决定如何测量距服务器的距离。

`km` 代表公里， `mi` 代表英里，也可以是空字符串以禁用距离测量。
