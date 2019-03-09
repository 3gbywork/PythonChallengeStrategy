---
title: "013. call him"
date: 2018-11-23T16:35:45+08:00
lastmod: 2019-03-18T14:43:45+08:00
draft: false
keywords: ["xmlrpc", "xmlrpc client"]
description: ""
tags: ["xmlrpc client"]
categories: ["xmlrpc"]

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

这一关给了一部电话，并且提示：`phone that evil`。电话按键只有“5”这个按键是可用的，点击后会得到如下提示：

```
faultCode
105


faultString
XML error: Invalid document end at line 1, column 1
```

在网上搜索可以得到xmlrpc相关的解决方案，结合标题与图片下提示，可以猜测出我们需要通过xmlrpc调用给evil打电话。

xmlrpc服务器地址是：`http://www.pythonchallenge.com/pc/phonebook.php`

通过ServerProxy可以枚举出服务器提供的方法：

>['phone', 'system.listMethods', 'system.methodHelp', 'system.methodSignature', 'system.multicall', 'system.getCapabilities']

其中`phone`方法即为所需。

接着获取到phone方法的签名及使用帮助：

>[['string', 'string']]

>Returns the phone of a person

可以看出：

* phone方法返回一个字符串类型的值，需要一个字符串类型的参数。

* 返回值为一个人的电话号码。

* 参数是evil的名字，在上一关已经得到了。

请求后得到的电话号码是：

>555-ITALY

将其做为下一关地址访问会得到`404 NOT FOUND`提示，去掉`555-`后访问会提示：`SMALL letters.`

所以下一关地址是：`italy`

### 代码：

* [Python][2]

```
PS src\static> python .\Code\Python\Challenge013.py
```

* [PowerShell][3]

```
PS src\static> .\Code\PowerShell\Challenge013.ps1
```

* [Go][4]

```
PS src\static> .\Code\Go\Challenge.exe -l 013
```

---
## 最终结果： italy

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/disproportional.html
[2]: /Code/Python/Challenge013.py "点我查看源码"
[3]: /Code/PowerShell/Challenge013.ps1 "点我查看源码"
[4]: /Code/Go/Challenge013.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/italy.html
