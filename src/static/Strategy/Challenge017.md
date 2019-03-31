---
title: "017. eat?"
date: 2018-12-06T23:45:58+08:00
lastmod: 2019-03-18T14:58:58+08:00
draft: false
keywords: ["http", "string", "data persistence", "xmlrpc", "download", "authentication", "cookie", "regex", "bz2", "xmlrpc client"]
description: ""
tags: ["download", "authentication", "cookie", "regex", "bz2", "xmlrpc client"]
categories: ["http", "string", "data persistence", "xmlrpc"]

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

这一关图片中是曲奇饼干，左下角图片是不是有点熟悉？是[第四关][a]啦！

查看源代码并没有什么提示。

但是！根据`cookie`可以联想到什么？对！就是浏览器缓存。

通过浏览器开发者工具查看`cookie`后，可以得到如下提示：

>you+should+have+followed+busynothing...

在第四关，我们请求的是：`http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=`

这里需要将`nothing`替换为`busynothing`，并且收集`cookie`中`info`的值。

之后得到`BZh91AY`开头的经过url编码的字符串，是不是又有点熟悉？不熟悉的请回顾[第八关][b]。

使用python在解码时会有小问题：

>OSError: Invalid data stream

在解码前将`+`替换为`%20`可以解决该问题。

解码后得到提示：

>is it the 26th already? call his father and inform him that "the flowers are on their way". he'll understand.

这句话信息量有点大，26号暗示[第十五关][d]，`call his father`则暗示[第十三关][c]，Mozart的父亲是Leopold（注意L大写）。

给Leopold打电话之后得到：

>555-VIOLIN

访问`violin.html`得到如下提示：

>no! i mean yes! but ../stuff/violin.php. 

替换url之后访问，得到的是一张Leopold的照片，及：

>it's me. what do you want?

额。。。对，and **info**rm him that "the flowers are on their way"

将`cookie`中`info`的值设置为："the flowers are on their way"，并重新请求。Leopold会回复你：

>oh well, don't you dare to forget the balloons.

所以下一关地址是：balloons.html

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge017.py" title="点我下载源码">Challenge017.py</a></p>
{{< highlight python3 >}}
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge017.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge017.ps1" title="点我下载源码">Challenge017.ps1</a></p>
{{< highlight powershell >}}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge017.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge017.go" title="点我下载源码">Challenge017.go</a></p>
{{< highlight golang >}}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 017</code></pre>
    </section>
</div>

---
## 最终结果： balloons

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/romance.html
[2]: http://www.pythonchallenge.com/pc/return/balloons.html

[a]: {{< ref "Challenge004.md" >}} "第四关攻略"
[b]: {{< ref "Challenge008.md" >}} "第八关攻略"
[c]: {{< ref "Challenge013.md" >}} "第十三关攻略"
[d]: {{< ref "Challenge015.md" >}} "第十五关攻略"
