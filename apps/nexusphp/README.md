# NexusPHP

完整的 PT 建站解决方案。基于 NexusPHP + Laravel + Filament。

![NexusPHP](https://file.lifebus.top/imgs/nexusphp_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 发种
+ 特别区
+ 求种
+ 字幕
+ 考核
+ H&R
+ 认领
+ 审核
+ 签到
+ 补签卡
+ 勋章
+ 道具
+ 自定义标签
+ 第三方全文搜索
+ 盒子规则
+ 论坛
+ 申诉
+ 多语言
+ 自动备份
+ 插件支持
+ 管理后台
+ Json API

## 安装说明

默认语言为英语，如需中文，请在安装完成后，登录后在站点设置中设置。

安装完成后，请尽快完成初始化操作，并重启Docker容器。

重启后，请检查 `public/install` 目录是否已删除，如未删除，请手动删除。

### 生成 APP KEY

#### 通过终端生成

1. 通过 `openssl` 得到 32位的十六进制字符串

```bash
openssl rand -hex 32
```

2. 转换为 base64 格式

```bash
echo -n "your_hex_string" | xxd -r -p | base64
```

3. 得到完整密钥

拼接 `base64:` 和上一步得到的字符串

```bash
base64:your_base64_string
```

#### 使用 PHP 函数

1. 通过 `random_bytes` 函数得到 32位的十六进制字符串

```php
<?php
echo bin2hex(random_bytes(32));
?>
```

2. 转换为 base64 格式

```bash
echo -n "your_hex_string" | xxd -r -p | base64
```

3. 得到完整密钥

拼接 `base64:` 和上一步得到的字符串

### 使用 Artisan 命令行工具

需要在项目根目录中执行

这个命令会自动修改 .env 文件中的 APP_KEY 配置，并设置一个随机生成的密钥。

```php
php artisan key:generate
```

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
