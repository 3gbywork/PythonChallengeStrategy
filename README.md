# PythonChallengeStrategy
learn python, go and powershell

查 | 看 | 攻 | 略
:---------------: | :---------------: | :---------------: | :---------------:
[Level 000][l000] | [Level 010][l010] | [Level 020][l020] | [Level 030][l030]
[Level 001][l001] | [Level 011][l011] | [Level 021][l021] | [Level 031][l031]
[Level 002][l002] | [Level 012][l012] | [Level 022][l022] | [Level 032][l032]
[Level 003][l003] | [Level 013][l013] | [Level 023][l023] | [Level 033][l033]
[Level 004][l004] | [Level 014][l014] | [Level 024][l024] | [Level 034][l034]
[Level 005][l005] | [Level 015][l015] | [Level 025][l025] | [Level 035][l035]
[Level 006][l006] | [Level 016][l016] | [Level 026][l026] | [Level 036][l036]
[Level 007][l007] | [Level 017][l017] | [Level 027][l027] | [Level 037][l037]
[Level 008][l008] | [Level 018][l018] | [Level 028][l028] | [Level 038][l038]
[Level 009][l009] | [Level 019][l019] | [Level 029][l029] | [Level 039][l039]

* 关于Go执行方法：

**由于需要科学上网才能使用** [`Go Playground`][1]， 所以就研究了通过反射来执行对应关卡代码的方法。

**需要注意将关卡的解决方法定义成`Challenge`结构的方法，形式如下：**

```
func (c *Challenge) Challengexxx() {
    // body
}
```

xxx为关卡的三位数字形式，不足左边补0。如：001、002。

`PS > go build -o .\Code\Go\Challenge.exe .\Code\Go`：编译`.\Code\Go`目录下的源文件，并在该目录生成`Challenge.exe`。对源文件更改后需要执行这条命令。

`PS > .\Code\Go\Challenge.exe -l 0`：通过命令行参数指定要执行关卡的代码。`-l`代表`level`，后面是关卡数字。

* 关于PowerShell脚本执行策略：

如果出现“无法加载文件 xxx，因为在此系统上禁止运行脚本。”

则需要**以管理员权限**运行命令行，执行`Set-ExecutionPolicy RemoteSigned`，并在提示后输入`Y`确认。

* 查看官方的攻略：

将当前关卡地址的pc替换为pcc，就会得到上一关的攻略地址。或者访问[Wiki主页][2]

---
# 如果引用的图片侵权，请联系我<liaiping1992@163.com>

[1]: https://play.golang.org/
[2]: http://wiki.pythonchallenge.com

[l000]: ./Strategy/Challenge000.md
[l001]: ./Strategy/Challenge001.md
[l002]: ./Strategy/Challenge002.md
[l003]: ./Strategy/Challenge003.md
[l004]: ./Strategy/Challenge004.md
[l005]: #
[l006]: #
[l007]: #
[l008]: #
[l009]: #
[l010]: #
[l011]: #
[l012]: #
[l013]: #
[l014]: #
[l015]: #
[l016]: #
[l017]: #
[l018]: #
[l019]: #
[l020]: #
[l021]: #
[l022]: #
[l023]: #
[l024]: #
[l025]: #
[l026]: #
[l027]: #
[l028]: #
[l029]: #
[l030]: #
[l031]: #
[l032]: #
[l033]: #
[l034]: #
[l035]: #
[l036]: #
[l037]: #
[l038]: #
[l039]: #
