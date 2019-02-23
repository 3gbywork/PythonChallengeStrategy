---
title: "004. follow the chain"
date: 2018-10-30T11:18:54+08:00
lastmod: 2019-03-18T10:58:54+08:00
draft: false
keywords: ["http", "string", "query string", "regex"]
description: ""
tags: ["query string", "regex"]
categories: ["http", "string"]

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
#     weight: 5
---

## [关卡地址][1]

## 解决方案：

### 思路：

这一关鼠标移动到图片上指针会变成小手，点击会得到如下信息：

>and the next nothing is 44827

同时，url后面多了参数`?nothing=12345`。回退回关卡地址，查看源代码得到如下提示：

>urllib may help. DON'T TRY ALL NOTHINGS, since it will never end. 400 times is more than enough. 

结合标题，需要借助urllib库发送400次请求，每次请求都会得到下一次请求的参数，替换参数继续请求，最终得到下一关地址。

**PS：** 在测试时，遇到这样的提示：`Yes. Divide by two and keep going.`，已在程序中做判断处理（之前并没有遇到这样的情况，看官方攻略也不像是网站最近更新了，看来是之前比较幸运😝）。

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge004.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge004.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 004
```

---
## 最终结果： peak.html

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/linkedlist.php
[2]: /Code/Python/Challenge004.py "点我查看源码"
[3]: /Code/PowerShell/Challenge004.ps1 "点我查看源码"
[4]: /Code/Go/Challenge004.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/peak.html
