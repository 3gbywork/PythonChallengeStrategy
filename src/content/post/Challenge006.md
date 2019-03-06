---
title: "006. now there are pairs"
date: 2018-11-04T22:58:08+08:00
lastmod: 2019-03-18T13:37:08+08:00
draft: false
keywords: ["http", "unzip", "download", "pickle", "entry", "comment"]
description: ""
tags: ["download", "pickle", "entry", "comment"]
categories: ["http", "unzip"]

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

图片没有提供任何有用的信息。查看源代码得到如下信息：

`<-- zip `

额，更改url可以得到一个压缩文件。

打开压缩文件，找到`readme.txt`文件，内容如下：

>welcome to my zipped list. 
> 
>hint1: start from 90052  
>hint2: answer is inside the zip

按照提示按顺序读取文件，最后得到的内容是：

>Collect the comments.

从comments中得到的信息是：

![oxygen][a]

所以下一关地址是：hockey？？？

错！访问这个地址你会得到如下内容：

>it's in the air. look at the letters. 

好吧，原来是`oxygen`

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge006.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge006.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 006
```

---
## 最终结果： oxygen

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/channel.html
[2]: /Code/Python/Challenge006.py "点我查看源码"
[3]: /Code/PowerShell/Challenge006.ps1 "点我查看源码"
[4]: /Code/Go/Challenge006.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/oxygen.html

[a]: /Image/006/oxygen.png