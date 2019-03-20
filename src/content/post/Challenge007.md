---
title: "007. smarty"
date: 2018-11-06T15:14:54+08:00
lastmod: 2019-03-18T13:53:54+08:00
draft: false
keywords: ["http", "image processing", "string", "download", "gray", "regex"]
description: ""
tags: ["download", "gray", "regex"]
categories: ["http", "image processing", "string"]

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

这一关源代码中没有任何提示信息，看来信息都在图片中了。

![smarty][a]

图片中间位置有一条灰度图像，灰度图取值范围与ASCII码范围一致，所以可以将灰度值转换为ASCII码。小灰度条的宽度都是`7px`（除了第一条是`5px`）。需要注意灰度图与图片右边界有`21px`空白。

行动起来吧。

经过灰度值转换得到如下信息：

>smart guy, you made it. the next level is [105, 110, 116, 101, 103, 114, 105, 116, 121]

将列表中数值转换后就是下一关的地址了。

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge007.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge007.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 007
```

---
## 最终结果： integrity

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/oxygen.html
[2]: ../../Code/Python/Challenge007.py "点我查看源码"
[3]: ../../Code/PowerShell/Challenge007.ps1 "点我查看源码"
[4]: ../../Code/Go/Challenge007.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/integrity.html

[a]: ../../Image/007/oxygen.png "smarty"
