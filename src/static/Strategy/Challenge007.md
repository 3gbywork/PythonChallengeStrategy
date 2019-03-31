---
title: "007. smarty"
date: 2018-11-06T15:14:54+08:00
lastmod: 2019-03-18T13:53:54+08:00
draft: false
keywords: ["http", "image processing", "string", "download", "gray", "regex"]
description: ""
tags: ["download", "gray", "regex"]
categories: ["http", "image processing", "string"]

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

这一关源代码中没有任何提示信息，看来信息都在图片中了。

![smarty][a]

图片中间位置有一条灰度图像，灰度图取值范围与ASCII码范围一致，所以可以将灰度值转换为ASCII码。小灰度条的宽度都是`7px`（除了第一条是`5px`）。需要注意灰度图与图片右边界有`21px`空白。

行动起来吧。

经过灰度值转换得到如下信息：

>smart guy, you made it. the next level is [105, 110, 116, 101, 103, 114, 105, 116, 121]

将列表中数值转换后就是下一关的地址了。

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
## 最终结果： integrity

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/oxygen.html
[2]: http://www.pythonchallenge.com/pc/def/integrity.html

[a]: ../../Image/007/oxygen.png "smarty"
