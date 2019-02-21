---
title: "003. re"
date: 2018-10-29T11:40:58+08:00
lastmod: 2019-03-18T10:14:58+08:00
draft: false
keywords: ["re", "string", "regex"]
description: ""
tags: ["regex"]
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

这一关同样不贴图了，直接看图片下提示：

>One small letter, surrounded by EXACTLY three big bodyguards on each of its sides. 

和上一关一样，需要从源代码中找到“一个两边完全被三个大写字母包围的小写字母”，这样的序列组成的字符串。

最后得到的是： linkedlist

访问 linkedlist.html 会提示你下一关地址是 linkedlist.php

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge003.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge003.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 003
```

---
## 最终结果： linkedlist

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/equality.html
[2]: /Code/Python/Challenge003.py "点我查看源码"
[3]: /Code/PowerShell/Challenge003.ps1 "点我查看源码"
[4]: /Code/Go/Challenge003.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/linkedlist.php
