---
title: "011. odd even"
date: 2018-11-14T21:03:49+08:00
lastmod: 2019-03-18T14:25:49+08:00
draft: false
keywords: ["http", "image-processing", "download", "authentication", "argb"]
description: ""
tags: ["download", "authentication", "argb"]
categories: ["http", "image-processing"]

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

这一关的提示比较干净，一切都需要从图片中提取分析。

把所有像素值提取到文本，以下为前4行前8列像素数据：

```
(0, 20, 0)(142, 180, 105)(0, 20, 0)(139, 177, 100)(0, 20, 0)(143, 180, 103)(0, 20, 0)(138, 175, 98)
(148, 186, 111)(0, 20, 0)(148, 186, 109)(0, 21, 0)(144, 181, 104)(0, 20, 0)(144, 181, 104)(0, 20, 0)
(0, 20, 0)(158, 195, 118)(0, 20, 0)(148, 185, 108)(0, 22, 0)(152, 189, 112)(0, 19, 0)(150, 184, 110)
(145, 182, 105)(0, 22, 0)(158, 195, 118)(0, 20, 0)(155, 189, 113)(0, 19, 0)(146, 180, 104)(0, 20, 0)
```

可以看出，绿色(0, x, 0)与彩色有规律的穿插着，绿色像素分布在偶数行偶数列和奇数行奇数列，彩色像素分布在偶数行奇数列和奇数行偶数列。

我们要做的就是把彩色像素替换为白色(255,255,255)，下一关地址就会浮现出来了。

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge011.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge011.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 011
```

---
## 最终结果： evil

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/5808.html
[2]: ../../Code/Python/Challenge011.py "点我查看源码"
[3]: ../../Code/PowerShell/Challenge011.ps1 "点我查看源码"
[4]: ../../Code/Go/Challenge011.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/evil.html
