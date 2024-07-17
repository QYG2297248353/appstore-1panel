# 青龙

支持 Python3、JavaScript、Shell、Typescript 的定时任务管理平台

![青龙](https://file.lifebus.top/imgs/qinglong_cover.png)

## 简介

+ 支持多种脚本语言（python3、javaScript、shell、typescript）
+ 支持在线管理脚本、环境变量、配置文件
+ 支持在线查看任务日志
+ 支持秒级任务设置
+ 支持系统级通知
+ 支持暗黑模式
+ 支持手机端操作

## API 文档

[青龙 Apifox](https://qinglong.apifox.cn/)

## 内置命令

### `task` 任务命令

```shell
# 依次执行，如果设置了随机延迟，将随机延迟一定秒数
task <file_path>                                             
# 依次执行，无论是否设置了随机延迟，均立即运行，前台会输出日，同时记录在日志文件中
task <file_path> now                                         
# 并发执行，无论是否设置了随机延迟，均立即运行，前台不产生日，直接记录在日志文件中，且可指定账号执行
task <file_path> conc <env_name> <account_number>(可选的) 
# 指定账号执行，无论是否设置了随机延迟，均立即运行 
task <file_path> desi <env_name> <account_number>      
# 设置任务超时时间   
task -m <max_time> <file_path>
# 使用 -- 分割，-- 后面的参数会传给脚本，下面的例子，脚本就可接收到参数 -u whyour -p password
task <file_path> -- -u whyour -p password
```

### `ql` 青龙命令

```shell
# 更新并重启青龙
ql update
# 运行自定义脚本extra.sh
ql extra
# 添加单个脚本文件
ql raw <file_url>
# 添加单个仓库的指定脚本
ql repo <repo_url> <whitelist> <blacklist> <dependence> <branch> <extensions>
# 删除旧日志
ql rmlog <days>
# 启动tg-bot
ql bot
# 检测青龙环境并修复
ql check
# 重置登录错误次数
ql resetlet                                                  
# 禁用两步登录
ql resettfa
```

| **参数**     | **说明**                                            |
|------------|---------------------------------------------------|
| file_url   | 脚本地址                                              |
| repo_url   | 仓库地址                                              |
| whitelist  | 拉取仓库时的白名单，即就是需要拉取的脚本的路径包含的字符串，多个竖线分割              |
| blacklist  | 拉取仓库时的黑名单，即就是需要拉取的脚本的路径不包含的字符串，多个竖线分割             |
| dependence | 拉取仓库需要的依赖文件，会直接从仓库拷贝到scripts下的仓库目录，不受黑名单影响，多个竖线分割 |
| extensions | 拉取仓库的文件后缀，多个竖线分割                                  |
| branch     | 拉取仓库的分支                                           |
| days       | 需要保留的日志的天数                                        |
| file_path  | 任务执行时的文件路径                                        |
