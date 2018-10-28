# PythonChallengeStrategy
learn python, go and powershell

* 关于Go执行方法：

**由于需要科学上网才能使用** [`Go Playground`][1]， 所以就研究了通过反射来执行对应关卡代码的方法。

`PS > go build -o ..\Code\Go\Challenge.exe ..\Code\Go`：编译`..\Code\Go`目录下的源文件，并在该目录生成`Challenge.exe`。对源文件更改后需要执行这条命令。

`PS > ..\Code\Go\Challenge.exe -l 0`：通过命令行参数指定要执行关卡的代码。`-l`代表`level`，后面是关卡数字。

* 关于PowerShell脚本执行策略：

如果出现“无法加载文件 xxx，因为在此系统上禁止运行脚本。”

则需要**以管理员权限**运行命令行，执行`Set-ExecutionPolicy RemoteSigned`，并在提示后输入`Y`确认。

* 查看官方的攻略：

将当前关卡地址的pc替换为pcc，就会得到上一关的攻略地址。

---
# 如果引用的图片侵权，请联系我<liaiping1992@163.com>

[1]: https://play.golang.org/
