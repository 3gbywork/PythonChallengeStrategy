# [第018关][1] can you tell the difference?

## [关卡地址][1]

## 解决方案：

### 思路：

可以很明显的看出图片左右两部分的亮度不同，但还是看一下源代码的提示：

>it is more obvious that what you might think

替换url为bright会提示：

>ness

访问brightness仍然是相同的图片，再次查看源代码的提示：

>maybe consider deltas.gz

下载解压后发现一个`delta.txt`文件，打开后前4行数据如下：

```
89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00   89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00
02 8a 00 00 00 c8 08 02 00 00 00 e0 19 57 95 00 00 00   02 8a 00 00 00 c8 08 02 00 00 00 e0 19 57 95 00 00 00
09 70 48 59 73 00 00 0b 13 00 00 0b 13 01 00 9a 9c 18   09 70 48 59 73 00 00 0b 13 00 00 0b 13 01 00 9a 9c 18
00 00 00 07 74 49 4d 45 07 d5 05 07 0c 18 32 98 c6 a0   00 00 00 07 74 49 4d 45 07 d5 05 07 0c 18 32 98 c6 a0
```

可以看出这是两个文件合并在一起的，结合标题，需要比较两者不同。

比较结果有三种：

```
"  b'89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00'",
"- b'89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00'",
"+ b'89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00'",
```

1. ' ' 表示两个序列都有
2. '-' 表示只有第一个序列有
3. '+' 表示只有第二个序列有

将这三种结果分别输出到三个文件，文件格式是`png`。

输出文件时需要将十六进制字符串转换为二进制byte。

最后得到图片内容分别是：

1. ../hex/bin.html
2. fly
3. butter

1是下一关地址，访问需要认证。经过测试：

2是密码，3是用户名

### 代码：

* [Python][2]

```
PS > python .\Code\Python\Challenge018.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge018.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 018
```

---
## 最终结果： ../hex/bin.html

## [下一关地址][5]

## [上一关攻略][6] [回首页][7] [下一关攻略][8]

[1]: http://www.pythonchallenge.com/pc/return/balloons.html
[2]: ../Code/Python/Challenge018.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge018.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge018.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/hex/bin.html
[6]: ./Challenge017.md "上一关攻略"
[7]: ../README.md "回首页"
[8]: ./Challenge019.md "下一关攻略"
