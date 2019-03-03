---
title: "005. peak hell"
date: 2018-11-03T12:51:59+08:00
lastmod: 2019-03-18T11:26:59+08:00
draft: false
keywords: ["http", "data persistence", "download", "deserialization"]
description: ""
tags: ["download", "deserialization"]
categories: ["http", "data persistence"]

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

图片下有句提示信息：

>pronounce it

查看源代码得到如下提示：

>peak hell sounds familiar ? 

听着一点也不熟悉好吧😂！无奈找了其他攻略，原来说的是python的pickle库，一个数据持久化库。

既然是要使用pickle库，肯定还需要额外的文件。查看源代码，在`peakhell`标签找到了一个`banner.p`文件。

使用pickle反序列化后，得到的是一个二维列表，元素是一个元组，表示`(char,number)`。

最终得到的字符画如下：

![channel][a]

**PS：**如果看不出字符画是什么，请增加窗口显示宽度试试。

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge005.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge005.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 005
```

---
## 最终结果： channel

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/peak.html
[2]: /Code/Python/Challenge005.py "点我查看源码"
[3]: /Code/PowerShell/Challenge005.ps1 "点我查看源码"
[4]: /Code/Go/Challenge005.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/channel.html

[a]: /Image/005/channel.png
