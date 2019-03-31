---
title: "014. walk around"
date: 2018-11-26T16:55:53+08:00
lastmod: 2019-03-18T14:47:53+08:00
draft: false
keywords: ["http", "image processing", "download", "authentication", "argb"]
description: ""
tags: ["download", "authentication", "argb"]
categories: ["http", "image processing"]

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

这一关大图下面有个小图，查看源代码后发现是`10000*1`的图片显示为`100*100`：

>100 × 100 pixels (Natural: 10000 × 1 pixels)

同时还有一个提示：

> remember: 100*100 = (100+99+99+98) + (...  

结合标题，需要将`10000*1`的图片重新组合为`100*100`的图片，排列规律如下：

```
—————————————100-—————————————
|————————————98——————————————|
|   |   ................. |  |
|   |   ................. |  |
|   |   ................. |  |
98  96  ................. 97 99
|   |   ................. |  |
|   |   ................. |  |
|   |   ................. |  |
|   |   ................. |  |
| ——————————97————————————|  |
————————————99————————————————
```

如果一行一行排列像素会得到`bit`这个结果，然后得到如下提示：

>you took the wrong curve.

正确的结果会得到一只猫的图片，输入`cat`会得到如下提示：

>and its name is **uzi**. you'll hear from him later.

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
## 最终结果： uzi

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/italy.html
[2]: http://www.pythonchallenge.com/pc/return/uzi.html
