> [!IMPORTANT]
> 本仓库已停止更新，文档与安装脚本已迁移至 [MengSenStudio/AppStore-1panel](https://github.com/MengSenStudio/AppStore-1panel)。
> 请前往新仓库查看最新文档、提交 Issue 与获取安装脚本。

# 1Panel 应用商店

面向 [1Panel](https://1panel.cn/) 的第三方 Docker 应用商店，由 [`新疆萌森软件开发工作室`](https://blog.lifebus.top/) 维护。

所有应用均以 `docker-compose` 形式维护，无需额外服务端，安装脚本会把应用同步到 1Panel 的本地应用目录。

- 仓库地址：<https://github.com/MengSenStudio/AppStore-1panel>
- 问题反馈：[Issues](https://github.com/MengSenStudio/AppStore-1panel/issues)
- 安装脚本：<https://install.lifebus.top>

## 仓库信息

| 项目 | 说明 |
|---|---|
| 默认分支 | `custom`：应用源文件与安装脚本 |
| 发布分支 | `released`：由 `custom` 每小时同步，安装脚本克隆该分支 |
| Release | [`install`](https://github.com/MengSenStudio/AppStore-1panel/releases/tag/install)：安装脚本副本 |
| 自动化 | Renovate 定时检查镜像版本，小版本自动合并，大版本保留 PR 人工审核 |
| 目录结构 | `apps/` 应用源文件、`script/` 安装脚本、`dockge/` Dockge 应用列表、`appstore/` 商店数据、`envs/` 公共环境变量 |

应用清单请直接浏览 [`apps`](https://github.com/MengSenStudio/AppStore-1panel/tree/custom/apps) 目录，仓库不再维护静态应用列表。

## 快速开始

1Panel 一键安装（推荐）：

```sh
curl -sSL https://install.lifebus.top/auto_install.sh | bash
```

脚本每三小时自动更新一次应用列表，执行完成后在 1Panel 应用商店点击 `更新应用列表` 即可看到应用。

卸载自动化脚本（不会卸载已安装应用）：

```sh
curl -sSL https://install.lifebus.top/auto_uninstall.sh | bash
```

## 更多安装方式

详细说明见 [.github/README.md](.github/README.md)，包含：

- 手动安装（按需执行更新）
- 计划任务模式与脚本网络代理
- Pre 尝鲜版应用安装与卸载
- 清理本地应用
- 1Panel v2 本地应用自动同步
- Dockge 导入应用列表
- 常见问题排查

## 如何更新

安装脚本拉取 `released` 分支的最新内容，仓库的 `custom` 分支变更会定时同步到 `released`，因此不需要手工复制文件。

若需要立即更新，重新执行安装脚本即可：

```sh
curl -sSL https://install.lifebus.top/app_install.sh | bash
```

## 反馈与贡献

- 应用安装、版本更新等问题请提交 [Issue](https://github.com/MengSenStudio/AppStore-1panel/issues)。
- 新增应用请按 `apps/<应用名>/<版本>/` 目录结构提交 Pull Request，包含 `docker-compose.yml`、`data.yml` 与应用说明。
- 镜像版本更新由 Renovate 自动提交，无需手动修改。

## 免责声明

当前第三方库应用均为开源应用，我们不对应用的安全性和稳定性负责。安装前请阅读应用说明，并自行做好数据备份。

---

> 🥰 [新疆萌森软件开发工作室](https://blog.lifebus.top/) 祝您生活愉快！
