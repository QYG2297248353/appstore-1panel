# 迅雷 NAS版

迅雷远程下载服务 NAS移植版

![AList](https://file.lifebus.top/imgs/xunlei_cnk3x.png)

从迅雷群晖套件中提取出来用于其他设备的迅雷远程下载服务程序。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

需要填写的 `用户名` 与 `密码` 并非迅雷账户。

该账户，仅作为远程下载服务的登录凭证。

## 使用说明

<div style="border: 1px solid #FFC107; padding: 10px; border-radius: 5px; color: #856404; background-color: #FFF3CD; display: inline-block; width: 100%; max-width: 60%; margin-top: 10px;">
    <div style="display: flex; align-items: center;">
        <span style="font-size: 24px; margin-right: 8px;">⚠️</span>
        <div>
            <strong style="font-size: 16px;">警告</strong><br>
            <span style="font-size: 14px; color: #333;">该应用申请使用 `特权模式`， 将允许应用在容器内部执行特权操作，如挂载宿主机目录、访问宿主机设备等。</span>
        </div>
    </div>
</div>

下载的数据存储在`downloads`目录下，请查看持久化目录的位置。

### 注册与登陆

> 官方内测邀请码：`迅雷牛通`

1. 访问 `http://<ip>:<port>` 进入迅雷远程下载服务页面
2. 首次进出会出现：鉴权验证，输入用户名与密码
3. 登陆成功后，进入迅雷远程下载服务页面，要求绑定迅雷账号
4. 输入迅雷账号与密码，完成绑定
5. 在登录成功后，30s 内会出现 `内测邀请码` 页面。
6. 填写完成后，即可使用迅雷远程下载服务

### 内置服务

+ 网速测试 - 用于测试当前网络的下载速度
+ 网心云-NAS版 (服务异常)

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
