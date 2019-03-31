---
title: "011. odd even"
date: 2018-11-14T21:03:49+08:00
lastmod: 2019-03-18T14:25:49+08:00
draft: false
keywords: ["http", "image-processing", "download", "authentication", "argb"]
description: ""
tags: ["download", "authentication", "argb"]
categories: ["http", "image-processing"]

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

这一关的提示比较干净，一切都需要从图片中提取分析。

把所有像素值提取到文本，以下为前4行前8列像素数据：

```
(0, 20, 0)(142, 180, 105)(0, 20, 0)(139, 177, 100)(0, 20, 0)(143, 180, 103)(0, 20, 0)(138, 175, 98)
(148, 186, 111)(0, 20, 0)(148, 186, 109)(0, 21, 0)(144, 181, 104)(0, 20, 0)(144, 181, 104)(0, 20, 0)
(0, 20, 0)(158, 195, 118)(0, 20, 0)(148, 185, 108)(0, 22, 0)(152, 189, 112)(0, 19, 0)(150, 184, 110)
(145, 182, 105)(0, 22, 0)(158, 195, 118)(0, 20, 0)(155, 189, 113)(0, 19, 0)(146, 180, 104)(0, 20, 0)
```

可以看出，绿色(0, x, 0)与彩色有规律的穿插着，绿色像素分布在偶数行偶数列和奇数行奇数列，彩色像素分布在偶数行奇数列和奇数行偶数列。

我们要做的就是把彩色像素替换为白色(255,255,255)，下一关地址就会浮现出来了。

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
## 最终结果： evil

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/5808.html
[2]: http://www.pythonchallenge.com/pc/return/evil.html
