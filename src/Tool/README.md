# 攻略文件创建脚本

## 输入

* 关卡数（大于0的自然数）

## 输出

* `../static/Code/Go/Challengexxx.go`
* `../static/Code/PowerShell/Challengexxx.ps1`
* `../static/Code/Python/Challengexxx.py`
* `../static/Strategy/Challengexxx.md`

## 依赖项

* `./Template/ChallengeTemplate.md`
* `./Template/Go.template`

## 文件说明

```
G:\GIT\PYTHON\LEARN\TOOL
│   func.ps1                            PowerShell帮助函数库
│   README.md                           本文件
│   tool.go                             工具Go语言实现
|   tool_go.exe                         工具Go语言实现可执行文件，build环境：go version go1.11 windows/amd64
│   tool.ps1                            工具PowerShell脚本实现
│   tool.py                             工具Python脚本实现
|   prebuild.ps1                        预编译源代码文件与攻略文件，并输出到 ../content/post 目录
│
└───Template                            模板文件夹
        ChallengeTemplate.md                攻略文件模板（已弃用，使用 ../archetypes/default.md 做模板）
        Go.template                         Go语言源文件模板
```

## 使用说明

* 运行PowerShell工具

`PS src> .\Tool\tool.ps1 xxx`

or

* 运行Python工具

`PS src> python .\Tool\tool.py xxx`

or

* 运行Go工具

先build：`PS src> go build -o .\Tool\tool_go.exe .\Tool\tool.go`

`PS src> .\Tool\tool_go.exe xxx`
