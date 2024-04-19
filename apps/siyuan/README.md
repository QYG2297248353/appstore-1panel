# 思源笔记

> 重构你的思维
>
> 所见所得 双链块引
>
> 加密同步 隐私优先

思源笔记是一款隐私优先的个人知识管理系统，支持完全离线使用，同时也支持端到端加密同步。

融合块、大纲和双向链接，重构你的思维。

## 应用安装

### 移动端：

[App Store](https://apps.apple.com/cn/app/siyuan/id1583226508)

[Google Play](https://play.google.com/store/apps/details?id=org.b3log.siyuan)

[F-Droid](https://f-droid.org/packages/org.b3log.siyuan)

[华为应用市场](https://appgallery.huawei.com/app/C105558879)

[小米应用商店](https://app.mi.com/details?id=org.b3log.siyuan)

[酷安](https://www.coolapk.com/apk/292664)

### 桌面端：

[Microsoft Store](https://www.microsoft.com/store/apps/9P7HPMXP73K4)

### 安装包

[B3log](https://b3log.org/siyuan/download.html)

[GitHub](https://github.com/siyuan-note/siyuan/releases)

## 反向代理

Nginx 配置 WebSocket 反向代理：

```shell
location /ws {
    proxy_pass http://{HOST_IP}:{SERVER_PORT};
    proxy_read_timeout 60s;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'Upgrade';
}
```

## 常见问题

### 数据存储

数据保存在工作空间文件夹下，在工作空间 data 文件夹下：

| 文件夹       | 说明                |
|-----------|-------------------|
| assets    | 保存所有插入的资源文件       |
| emojis    | 用于保存自定义图标表情图片     |
| snippets  | 用于保存代码片段          |
| storage   | 用于保存查询条件、布局和闪卡数据等 |
| templates | 用于保存模板片段          |
| widgets   | 用于保存挂件            |
| plugins   | 用于保存插件            |
| public    | 用于保存公开的数据         |

> 其余文件夹就是用户自己创建的笔记本文件夹，笔记本文件夹下 .sy 后缀的文件用于保存文档数据，数据格式为 JSON
