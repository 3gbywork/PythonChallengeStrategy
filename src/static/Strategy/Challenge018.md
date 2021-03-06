---
title: "018. can you tell the difference?"
date: 2018-12-14T20:01:15+08:00
lastmod: 2019-03-18T15:09:15+08:00
draft: false
keywords: ["http", "data persistence", "encoding", "download", "authentication", "gzip", "unhex"]
description: ""
tags: ["download", "authentication", "gzip", "unhex"]
categories: ["http", "data persistence", "encoding"]

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

可以很明显的看出图片左右两部分的亮度不同，但还是看一下源代码的提示：

>it is more obvious that what you might think

替换url为bright会提示：

>ness

访问brightness仍然是相同的图片，再次查看源代码的提示：

>maybe consider deltas.gz

下载解压后发现一个`delta.txt`文件，打开后前4行数据如下：

```
89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00   89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00
02 8a 00 00 00 c8 08 02 00 00 00 e0 19 57 95 00 00 00   02 8a 00 00 00 c8 08 02 00 00 00 e0 19 57 95 00 00 00
09 70 48 59 73 00 00 0b 13 00 00 0b 13 01 00 9a 9c 18   09 70 48 59 73 00 00 0b 13 00 00 0b 13 01 00 9a 9c 18
00 00 00 07 74 49 4d 45 07 d5 05 07 0c 18 32 98 c6 a0   00 00 00 07 74 49 4d 45 07 d5 05 07 0c 18 32 98 c6 a0
```

可以看出这是两个文件合并在一起的，结合标题，需要比较两者不同。

比较结果有三种：

```
"  b'89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00'",
"- b'89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00'",
"+ b'89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52 00 00'",
```

1. ' ' 表示两个序列都有
2. '-' 表示只有第一个序列有
3. '+' 表示只有第二个序列有

将这三种结果分别输出到三个文件，文件格式是`png`。

输出文件时需要将十六进制字符串转换为二进制byte。

最后得到图片内容分别是：

1. ../hex/bin.html
2. fly
3. butter

1是下一关地址，访问需要认证。经过测试：

2是密码，3是用户名

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge018.py" title="点我下载源码">Challenge018.py</a></p>
{{< highlight python3 >}}
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge018.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge018.ps1" title="点我下载源码">Challenge018.ps1</a></p>
{{< highlight powershell >}}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge018.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge018.go" title="点我下载源码">Challenge018.go</a></p>
{{< highlight golang >}}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 018</code></pre>
    </section>
</div>

---
## 最终结果： ../hex/bin.html

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/balloons.html
[2]: http://www.pythonchallenge.com/pc/hex/bin.html
