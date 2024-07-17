# 应用制作说明

### 基础目录

`/app`

### 应用格式

```
├── app_name // 应用名称
	├── logo.png // 应用 logo , 推荐 180 * 180 px
	├── data.yml // 应用声明文件
	├── README.md // 应用说明文档
	├── 2.2.0 // 应用版本
	│   ├── data.yml // 表单配置
	|   ├── scripts // 脚本目录
	│   └── docker-compose.yml // docker-compose 文件
	└── 2.3.2 // 应用版本
	    ├── data.yml
	    ├── data
	    └── docker-compose.yml
```

#### 应用声明文件

```yaml
# 固定参数
additionalProperties:
  # 应用的 key , 仅限英文
  key: app_name
  # 应用名称 显示名称
  name: app_show_name
  # 应用标签
  tags:
    # 参考 tags.yml
    - WebSite
  # 应用中文描述, 推荐 30 字以内
  shortDescZh: 应用主要概述
  # 应用英文描述
  shortDescEn: Application main description
  # 应用类型 
  type: website
  # 跨大版本升级
  crossVersionUpdate: true
  # 安装限制, 0 代表无限制
  limit: 0
  # 官网地址
  website: https://app.com
  # 仓库地址
  github: https://github.com/app/app
  # 文档地址
  document: https://docs.app.com
```

##### 应用类型

| type    | 说明                                                     |
|---------|--------------------------------------------------------|
| website | website 类型在 1Panel 中支持在网站中一键部署,wordpress halo 都是此 type |
| runtime | mysql openresty redis 等类型的应用                           |
| tool    | phpMyAdmin redis-commander jenkins 等类型的应用              |

#### 脚本目录

+ `scripts` 安装脚本文件
    + `init.sh` 安装前执行
    + `upgrade.sh` 升级前执行
    + `uninstall.sh` 卸载后执行

#### 表单配置

```yaml
# 固定参数
additionalProperties:
  formFields:
    # 默认值
    - default: ""
      # 安装后可修改
      edit: true
      # 是否禁用
      disabled: false
      # 环境变量 key
      envKey: PANEL_DB_HOST
      # 依赖应用 key
      key: mysql
      # 英文标签
      labelEn: Database Service
      # 中文标签
      labelZh: 数据库服务
      # 是否必填
      required: true
      # 依赖服务
      type: service
      # 是否在默认值基础上增加随机字符
      random: true
      # 校验规则
      rule: paramCommon
    # 下拉选择
    - default: ""
      envKey: LOG_LEVEL
      labelEn: Log level
      labelZh: 日志级别
      required: true
      type: select
      values:
        - label: DEBUG
          value: "DEBUG"
        - label: INFO
          value: "INFO"
        - label: WARNING
          value: "WARNING"
        - label: ERROR
          value: "ERROR"
        - label: CRITICAL
          value: "CRITICAL"
    # 端口效验
    - default: 3306
      envKey: PANEL_APP_PORT_DB
      labelEn: Database port
      labelZh: 数据库端口
      rule: paramPort
      type: number
```

##### 字段说明

+ `type` 字段类型
    + `service` 依赖服务
    + `password` 密码
    + `text` 文本
    + `number` 数字
    + `select` 下拉框
+ `rule` 校验规则
    + `paramPort` 用于限制端口范围为 1-65535
    + `paramCommon` 英文、数字、.-和_,长度2-30
    + `paramComplexity` 支持英文、数字、.%@$!&~_-,长度6-30，特殊字符不能在首尾
    + `paramExtUrl` 格式为 http(s)://(域名/ip):(端口)
+ `key` 特殊值
    + `PANEL_APP_PORT_HTTP` Web应用端口
    + `PANEL_APP_PORT_HTTPS` Web应用端口 SSL
    + `PANEL_APP_PORT` 前缀将认定为端口，并且用于安装前的端口占用校验

#### docker-compose.yml 文件

通过使用 `${envKey}` 获取`表单配置`中的值
