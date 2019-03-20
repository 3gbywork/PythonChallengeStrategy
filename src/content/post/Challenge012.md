---
title: "012. dealing evil"
date: 2018-11-18T18:55:17+08:00
lastmod: 2019-03-18T14:30:17+08:00
draft: false
keywords: ["http", "file processing", "download", "authentication", "io"]
description: ""
tags: ["download", "authentication", "io"]
categories: ["http", "file processing"]

# You can also close(false) or open(true) something for this content.
# P.S. comment can only be closed
comment: false
toc: false
autoCollapseToc: false
# You can also define another contentCopyright. e.g. contentCopyright: "This is another copyright."
# contentCopyright: true
reward: false
mathjax: false

# menu:
#   main:
#     parent: "000~009"
#     weight: 1
---

## [关卡地址][1]

## 解决方案：

### 思路：

这一关提示很隐晦，图片名称是`evil1.jpg`，那是不是还有`evil2.jpg`呢？

在浏览器输入`evil2.jpg`的地址，图片中的提示是：

>not jpg - _.gfx

将jpg改为gfx会得到一个文件。

`evil3.jpg`得到的提示是：

>no more evils...

如果你不死心，继续访问`evil4.jpg`，你会得到一个文本文件，内容如下：

>Bert is evil! go back!

所以玄机都在`evil2.gfx`这个文件中。

直接查看其二进制文件：

```
  Offset: 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F 	
00000000: FF 89 47 89 FF D8 50 49 50 D8 FF 4E 46 4E FF E0    ..G..XPIPX.NFN.`
00000010: 47 38 47 E0 00 0D 37 0D 00 10 0A 61 0A 10 4A 1A    G8G`..7....a..J.
00000020: 40 1A 4A 46 0A 01 0A 46 49 00 F0 00 49 46 00 00    @.JF...FI.p.IF..
00000030: 00 46 00 00 E7 00 00 01 0D 00 0D 01 01 49 00 49    .F..g........I.I
00000040: 01 01 48 00 48 01 00 44 01 44 00 B4 52 00 52 B4    ..H.H..D.D.4R.R4
00000050: 00 00 00 00 00 B4 00 01 00 B4 00 01 04 01 00 00    .....4...4......
00000060: 90 02 40 00 FF 00 00 00 FF E1 00 05 00 E1
```

可以看出每五个字节类似“回文”，将其每隔五个字节连起来得到的输出是：

```
b'\xff\xd8\xff\xe0\x00\x10JFIF\x00\x01\x01\x01\x00\xb4\x00\xb4\x00\x00\xff\xe1'
b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x01\x90\x00\x00'
b'GIF87a@\x01\xf0\x00\xe7\x00\x00\x00\x01\x00\x00\x01\x04\x02\x00\x05'
b'\x89PNG\r\n\x1a\n\x00\x00\x00\rIHDR\x00\x00\x01@\x00\x00'
b'\xff\xd8\xff\xe0\x00\x10JFIF\x00\x01\x01\x01\x00\xb4\x00\xb4\x00\x00\xff\xe1'
```

这五组分别是：jpg、png、gif、png、jpg的文件头。即`evil2.gfx`是由五个文件组成的，需要将其分离开。

得到的是：`dis`、`pro`、`port`、`ional`、~~`ity`~~

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge012.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge012.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 012
```

---
## 最终结果： disproportional

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/evil.html
[2]: ../../Code/Python/Challenge012.py "点我查看源码"
[3]: ../../Code/PowerShell/Challenge012.ps1 "点我查看源码"
[4]: ../../Code/Go/Challenge012.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/disproportional.html
