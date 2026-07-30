# OmniRoute

AI 网关 永不停止编程

![OmniRoute](https://file.lifebus.top/imgs/omniroute_cover.png)

![](https://img.shields.io/badge/%E6%96%B0%E7%96%86%E8%90%8C%E6%A3%AE%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91%E5%B7%A5%E4%BD%9C%E5%AE%A4-%E6%8F%90%E4%BE%9B%E6%8A%80%E6%9C%AF%E6%94%AF%E6%8C%81-blue)

## 安装说明

## JWT_SECRET

用于：

- Dashboard 登录 Session
- JWT Cookie 签名与验证

生成方式：

```bash
openssl rand -base64 48
```

示例：

```text
xxxxxxxxxxxxxxxxxxxxxxxx
```

注意：

该密钥需要长期保存。

如果修改：

- 所有 Dashboard 登录状态失效
- 用户需要重新登录

---

## API_KEY_SECRET

用于：

- 加密存储数据库中的 API Key

生成方式：

```bash
openssl rand -hex 32
```

示例：

```text
xxxxxxxxxxxxxxxxxxxxxxxx
```

注意：

该密钥非常重要。

如果丢失：

- 已保存的 API Key 无法恢复
- 需要重新配置所有模型 Provider

---

## INITIAL_PASSWORD

用于：

- OmniRoute Dashboard 首次登录管理员密码

安装时必须设置。

建议：

- 长度不少于 12 位
- 包含大小写字母
- 包含数字
- 包含特殊字符

首次登录后建议修改：

```
Dashboard
  ↓
Settings
  ↓
Security
```

---

## OMNIROUTE_WS_BRIDGE_SECRET

用于：

- Codex Responses WebSocket Bridge
- Electron / Browser Relay 与 OmniRoute 通信认证

生产环境必须配置。

生成方式：

```bash
openssl rand -base64 32
```

如果未配置：

- WebSocket Bridge 请求会被拒绝

## 简介

单一端点。永不停止构建。

### 🚫 永不触碰限制

毫秒内在 236 个提供商间自动切换。配额用尽？下一个提供商接管 — 零停机。

### 💸 最多节省 95% 的 Token

RTK + Caveman 叠加压缩削减 15–95% 的合格 Token — 在重度工具会话中约为 89%。

### 🆓 $0 起步

90+ 个提供商提供免费套餐，11 个永久免费（Kiro、Pollinations、LongCat…）。无需信用卡。

### 🔌 每个工具都能用

16+ 个编程助手 — Claude Code、Codex、Cursor、Cline、Copilot、Antigravity — 通过一个配置。

### 🧩 单一端点

OpenAI ↔ Claude ↔ Gemini ↔ Responses API 翻译。将任何工具指向 /v1，即可正常工作。

### 🛡️ 生产级

熔断器、TLS 隐身、MCP（95 个工具）、A2A、记忆、护栏、评估 — 由 21,000+ 个测试支撑。

---

![Ms Studio](https://file.lifebus.top/imgs/ms_blank_001.png)
![Ms Studio](https://analytics.lifebus.top/p/wJix5nI1W)
