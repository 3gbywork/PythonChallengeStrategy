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
## 最终结果： peak.html

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/linkedlist.php
[2]: http://www.pythonchallenge.com/pc/def/peak.html
