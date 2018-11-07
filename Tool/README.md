# 攻略文件创建脚本

## 输入

* 关卡数（大于0的自然数）

## 输出

* `../Code/Go/Challengexxx.go`
* `../Code/PowerShell/Challengexxx.ps1`
* `../Code/Python/Challengexxx.py`
* `../Strategy/Challengexxx.md`

## 依赖项

* `./Template/ChallengeTemplate.md`
* `./Template/Go.template`

## 文件说明

```
G:\GIT\PYTHON\LEARN\TOOL
│   func.ps1                            PowerShell帮助函数库
│   README.md                           本文件
│   tool.go                             工具Go语言实现
│   tool.ps1                            工具PowerShell脚本实现
│   tool.py                             工具Python脚本实现
│
└───Template                            模板文件夹
        ChallengeTemplate.md                攻略文件模板
        Go.template                         Go语言源文件模板
```

## 使用说明

* 运行PowerShell工具

`.\Tool\tool.ps1 xxx`

or

* 运行Python工具

`.\Tool\tool.py xxx`

or

* 运行Go工具

先build：`go build -o .\Tool\tool_go.exe .\Tool\tool.go`

`.\Tool\tool_go.exe xxx`