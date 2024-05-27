# 青龙

支持 Python3、JavaScript、Shell、Typescript 的定时任务管理平台。

## API 文档

[青龙 Apifox](https://qinglong.apifox.cn/)

## 主要功能：

+ 支持多种脚本语言（python3、javaScript、shell、typescript）
+ 支持在线管理脚本、环境变量、配置文件
+ 支持在线查看任务日志
+ 支持秒级任务设置
+ 支持系统级通知
+ 支持暗黑模式
+ 支持手机端操作

## 内置命令

### task

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

### ql

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
