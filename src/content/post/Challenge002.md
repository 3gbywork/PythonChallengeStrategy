---
title: "002. ocr"
date: 2018-10-28T22:12:21+08:00
lastmod: 2019-03-18T09:57:21+08:00
draft: false
keywords: ["ocr", "string", "statistic"]
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
#     weight: 3
---

## [关卡地址][1]

## 解决方案：

### 思路：

这一关就不贴图了，直接看图片下提示：

>recognize the characters. maybe they are in the book, but MAYBE they are in the page source.

很明显，玄机在源代码中。在源代码中有这样的提示：

>find rare characters in the mess below:

所以，从一堆混乱的字符中找到稀有的字符吧！

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge002.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge002.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 002
```

---
## 最终结果： equality

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/ocr.html
[2]: ../../Code/Python/Challenge002.py "点我查看源码"
[3]: ../../Code/PowerShell/Challenge002.ps1 "点我查看源码"
[4]: ../../Code/Go/Challenge002.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/equality.html
