# PythonChallengeStrategy
learn python, go and powershell

关于Go执行方法：

**由于需要科学上网才能使用** [`Go Playground`][1]， 所以就研究了通过反射来执行对应关卡代码的方法。

`PS > go build -o ..\Code\Go\Challenge.exe ..\Code\Go`：编译`..\Code\Go`目录下的源文件，并在该目录生成`Challenge.exe`。对源文件更改后需要执行这条命令。

`PS > ..\Code\Go\Challenge.exe -l 0`：通过命令行参数指定要执行关卡的代码。`-l`代表`level`，后面是关卡数字。

[1]: https://play.golang.org/
