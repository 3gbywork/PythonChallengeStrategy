---
title: "005. peak hell"
date: 2018-11-03T12:51:59+08:00
lastmod: 2019-03-18T11:26:59+08:00
draft: false
keywords: ["http", "data persistence", "download", "deserialization"]
description: ""
tags: ["download", "deserialization"]
categories: ["http", "data persistence"]

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

图片下有句提示信息：

>pronounce it

查看源代码得到如下提示：

>peak hell sounds familiar ? 

听着一点也不熟悉好吧😂！无奈找了其他攻略，原来说的是python的pickle库，一个数据持久化库。

既然是要使用pickle库，肯定还需要额外的文件。查看源代码，在`peakhell`标签找到了一个`banner.p`文件。

使用pickle反序列化后，得到的是一个二维列表，元素是一个元组，表示`(char,number)`。

最终得到的字符画如下：

![channel][a]

**PS：**如果看不出字符画是什么，请增加窗口显示宽度试试。

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
## 最终结果： channel

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/peak.html
[2]: http://www.pythonchallenge.com/pc/def/channel.html

[a]: ../../Image/005/channel.png
