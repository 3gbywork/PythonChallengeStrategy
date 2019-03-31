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
#     weight: 4
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
## 最终结果： linkedlist

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/equality.html
[2]: http://www.pythonchallenge.com/pc/def/linkedlist.php
