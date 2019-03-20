---
title: "016. let me get this straight"
date: 2018-11-29T22:52:49+08:00
lastmod: 2019-03-18T14:55:49+08:00
draft: false
keywords: ["http", "image processing", "download", "authentication", "array"]
description: ""
tags: ["download", "authentication", "array"]
categories: ["http", "image processing"]

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

图片每一行都有一条7个像素组成的像素块，两端是1个白色像素，中间是5个粉紫色像素，色值是(255,0,255)。由于图像模式是`P`，使用8位映射到调色板。

经测试，连续5个粉紫色像素的值是195。

根据标题：

>让我直说吧

将这些像素块排成一列，就会得到下一关地址啦。

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge016.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge016.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 016
```

---
## 最终结果： romance

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/mozart.html
[2]: ../../Code/Python/Challenge016.py "点我查看源码"
[3]: ../../Code/PowerShell/Challenge016.ps1 "点我查看源码"
[4]: ../../Code/Go/Challenge016.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/romance.html
