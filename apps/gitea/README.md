# Gitea

Gitea 是一个轻量级的 DevOps 平台软件。

![Gitea](https://file.lifebus.top/imgs/gitea_cover_show.png)

Gitea 是一个轻量级的 DevOps 平台软件。从开发计划到产品成型的整个软件生命周期，他都能够高效而轻松的帮助团队和开发者。包括
Git 托管、代码审查、团队协作、软件包注册和 CI/CD。它与 GitHub、Bitbucket 和 GitLab 等比较类似。 Gitea 最初是从 Gogs
分支而来，几乎所有代码都已更改。

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 特性

+ 代码托管

Gitea⽀持创建和管理仓库、浏览提交历史和代码⽂件、审查和合并代码提交、管理协作者、管理分⽀等。它还⽀持许多常见的Git特性，⽐如标签、Cherry-pick、hook、集成协作⼯具等。

+ 轻量级和快速

Gitea 的设计目标之一就是轻量级和快速响应。它不像一些大型的代码托管平台那样臃肿，因此在性能方面表现出色，适用于资源有限的服务器环境。由于其轻量级设计，Gitea
在资源消耗方面相对较低，可以在资源有限的环境下运行良好。

+ 易于部署和维护

轻松地部署在各种服务器上，不需要复杂的配置和依赖。这使得个人开发者或小团队可以方便地设置和管理自己的 Git 服务。

+ 安全性

Gitea 注重安全性，提供了用户权限管理、访问控制列表等功能，可以确保代码和数据的安全性。

+ 代码评审

代码评审同时支持 Pull Request workflow 和 AGit workflow。评审⼈可以在线浏览代码，并提交评审意见或问题。 提交者可以接收到评审意见，并在线回
复或修改代码。代码评审可以帮助用户和企业提⾼代码质量。

+ CI/CD

Gitea Actions⽀持 CI/CD 功能，该功能兼容 GitHub Actions，⽤⼾可以采用熟悉的YAML格式编写workflows，也可以重⽤⼤量的已有的 Actions
插件。Actions 插件支持从任意的 Git 网站中下载。

项目管理：Gitea 通过看板和⼯单来跟踪⼀个项⽬的需求，功能和bug。⼯单⽀持分支，标签、⾥程碑、 指派、时间跟踪、到期时间、依赖关系等功能。

+ 制品库

Gitea支持超过 20 种不同种类的公有或私有软件包管理，包括：Cargo, Chef, Composer, Conan, Conda, Container, Helm, Maven, npm,
NuGet, Pub, PyPI, RubyGems, Vagrant等

+ 开源社区支持

Gitea 是一个基于 MIT 许可证的开源项目,Gitea 拥有一个活跃的开源社区，能够持续地进行开发和改进，同时也积极接受社区贡献，保持了平台的更新和创新。

+ 多语言支持

Gitea 提供多种语言界面，适应全球范围内的用户，促进了国际化和本地化。

## 安装说明

### 代理配置

开启 `启用代理` 配置后,同时生效与 `Gitea` 服务和 `Webhook` 服务和 `Git` 服务

+ `代理服务器地址` 填写代理服务器地址

代理服务器支持协议：`http://` `https://` `socks://`

+ `代理网址` 代理匹配规则

支持使用 `*` 匹配符号

使用 `**` 代表所有网址

例如需要代理: `Github` `gitlab`, 此项配置不作用于 `Git` 服务

```text
github.com,*.github.com,*.gitlab.com
```

在 app.ini 配置文件中配置如下：

```ini
[webhook]
PROXY_URL = http://{host}:{port}
PROXY_HOSTS = github.com,*.github.com,*.gitlab.com
[proxy]
PROXY_ENABLED = true
PROXY_URL = http://{host}:{port}
PROXY_HOSTS = github.com,*.github.com,*.gitlab.com
```

### 开启 API 文档

默认关闭 `Swagger` 文档，开启后可以查看 `API` 文档

首次安装前，编辑`docker-compose.yml`修改环境变量 `GITEA__api__ENABLE_SWAGGER=false` 为 `true` 即可开启文档服务。

已安装用户，修改配置文件 `data/gitea/conf/app.ini` 中 `API` 配置项 `ENABLE_SWAGGER` 为 `true` 即可开启文档服务。

```ini
[api]
ENABLE_SWAGGER = true
```

## 反向代理

> Nginx

```nginx
location / {
    proxy_pass http://localhost:3000;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

## 常见问题

> 安装后，修改配置文件后，重启服务，但是配置文件没有生效？

安装后如需修改配置，请修改 持久化目录 下的 `data/gitea/conf/app.ini` 文件，然后重启服务。

> 迁移 大仓库时，提示 `fatal: early EOF`？

请修改 `data/gitea/home/.gitconfig` 文件，然后重启服务。

```gitconfig
[http]
	version = HTTP/1.1
	lowSpeedLimit = 0
	lowSpeedTime = 999999
	postbuffer = 2147483648
[core]
	compression = 0
```

配置说明：

+ 使用 HTTP/1.1 协议 `http.version = HTTP/1.1`

+ 限制速度 `http.lowSpeedLimit = 0`

+ 限制时间 `http.lowSpeedTime = 999999`

+ 提交缓冲区大小 `http.postbuffer = 2147483648`

+ 关闭压缩 `core.compression = 0`

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
