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
## 最终结果： equality

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/ocr.html
[2]: http://www.pythonchallenge.com/pc/def/equality.html
