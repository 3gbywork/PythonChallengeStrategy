# PythonChallengeStrategy
learn Python Go and PowerShell

访问[GitHub Pages][0]以查看攻略

* 关于Go执行方法：

**由于需要科学上网才能使用** [`Go Playground`][1]， 所以就研究了通过反射来执行对应关卡代码的方法。

**需要注意将关卡的解决方法定义成`Challenge`结构的方法，形式如下：**

```
func (c *Challenge) Challengexxx() {
    // body
}
```

xxx为关卡的三位数字形式，不足左边补0。如：001、002。

因为依赖第三方包，所以在构建前请运行以下命令：

`go get github.com/kolo/xmlrpc`

`PS src\static> go build -o .\Code\Go\Challenge.exe .\Code\Go`：编译`.\Code\Go`目录下的源文件，并在该目录生成`Challenge.exe`。对源文件更改后需要执行这条命令。

`PS src\static> .\Code\Go\Challenge.exe -l 0`：通过命令行参数指定要执行关卡的代码。`-l`代表`level`，后面是关卡数字。

* 关于PowerShell脚本执行策略：

如果出现“无法加载文件 xxx，因为在此系统上禁止运行脚本。”

则需要**以管理员权限**运行命令行，执行`Set-ExecutionPolicy RemoteSigned`，并在提示后输入`Y`确认。

* 查看官方的攻略：

将当前关卡地址的pc替换为pcc，就会得到上一关的攻略地址。或者访问[Wiki主页][2]

---
# 如果引用图片侵权，请联系我<amos18284@outlook.com>

[0]: https://3gbywork.github.io/PythonChallengeStrategy/
[1]: https://play.golang.org/
[2]: http://wiki.pythonchallenge.com
