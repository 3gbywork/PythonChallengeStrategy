---
title: "010. what are you looking at?"
date: 2018-11-13T13:19:40+08:00
lastmod: 2019-03-18T14:20:40+08:00
draft: false
keywords: ["string", "statistic"]
description: ""
tags: ["statistic"]
categories: ["string"]

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

图片中的牛说：“你瞅啥？”，然后你说：“瞅你咋地，不光瞅你还打你呢”。（皮一下很开心😝）。然后（点击它）会得到一个`sequence.txt`文件，内容如下：

>a = [1, 11, 21, 1211, 111221,

求`len(a[30]) = ?`

规律是这样的：

1. 第一个元素： 1
2. 第二个元素： 11      （表示1个1）
3. 第三个元素： 21      （表示2个1）
4. 第四个元素： 1211    （表示1个2，1个1）
5. 第五个元素： 111221  （表示1个1，1个2，2个1）

可以看出，这是一个简单的字符统计程序

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge010.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge010.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 010
```

---
## 最终结果： 5808

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/bull.html
[2]: ../../Code/Python/Challenge010.py "点我查看源码"
[3]: ../../Code/PowerShell/Challenge010.ps1 "点我查看源码"
[4]: ../../Code/Go/Challenge010.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/5808.html
