# [第0关][1] warming up

## [关卡地址][1]

![warming up][2]

提示：试试更改url

从图中容易看出，需要求出 $2^{38}$ = ?

得到的值就是下一关的地址

## 解决方案：

* Python3

```
>>> print(2**38)
```

* PowerShell

```
PS > [math]::pow(2,38)
```

* [Go][3]

```
PS > go build -o ..\Code\Go\Challenge.exe ..\Code\Go
PS > ..\Code\Go\Challenge.exe -l 0
```

---
## 最终结果：274877906944

## [下一关地址][4]

[1]: http://www.pythonchallenge.com/pc/def/0.html
[2]: http://www.pythonchallenge.com/pc/def/calc.jpg "warming up"
[3]: ..\Code\Go\Challenge000.go "点我查看源码"
[4]: http://www.pythonchallenge.com/pc/def/274877906944.html
