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

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/{{ .Name }}.py" title="点我下载源码">{{ .Name }}.py</a></p>
{{< highlight python3 >}}
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\{{ .Name }}.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/{{ .Name }}.ps1" title="点我下载源码">{{ .Name }}.ps1</a></p>
{{< highlight powershell >}}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\{{ .Name }}.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/{{ .Name }}.go" title="点我下载源码">{{ .Name }}.go</a></p>
{{< highlight golang >}}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l {{ replace .Name "Challenge" "" }}</code></pre>
    </section>
</div>

---
## 最终结果： oxygen

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/channel.html
[2]: http://www.pythonchallenge.com/pc/def/oxygen.html

[a]: ../../Image/006/oxygen.png