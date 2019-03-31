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
        <p><a href="../../Code/Python/Challenge002.py" title="点我下载源码">Challenge002.py</a></p>
{{< highlight python3 >}}
import helper
msg=helper.readFile(".\\Data\\002\\msg.txt")

dic={}

for ch in msg:
    if ch in dic:
        continue
    else:
        dic[ch]=msg.count(ch)

# print(dic)

outstr=[]
for key,value in dic.items():
    if value < 10:
        outstr.append(key)

print(''.join(outstr))
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge002.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge002.ps1" title="点我下载源码">Challenge002.ps1</a></p>
{{< highlight powershell >}}
$msg=(Get-Content ".\\Data\\002\\msg.txt" -Raw).Replace("`r`n","")

# powershell 中 hashtable 遍历的顺序与添加的顺序不一致
# $dic=@{}
$dic=New-Object 'System.Collections.Generic.Dictionary[string,int]'
for ($i = 0; $i -lt $msg.Length; $i++) {
    $ch=$msg[$i]
    if ($dic.ContainsKey($ch)) {
        $dic[$ch]+=1
    } else {
        $dic[$ch]=0
    }  
}

[string]$outstr=""
foreach ($key in $dic.Keys) {
    if ($dic[$key] -le 10) {
        $outstr+=$key
    }
}

Write-Output $outstr
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge002.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge002.go" title="点我下载源码">Challenge002.go</a></p>
{{< highlight golang >}}
package main

import (
	"fmt"
	"strings"
)

func (c *Challenge) Challenge002()  {
	msg:=ReadFile(".\\Data\\002\\msg.txt")

	// go语言 遍历map时返回值是无序的，相同keys每次构建map时顺序都会变化，构建后多次遍历结果一致。
	dic:=map [rune] int {}
	outstr:=""
	// // 记录字符顺序
	// chars:=""

	// for _,ch := range msg {
	// 	_,exists:=dic[ch]
	// 	if (exists) {
	// 		continue
	// 	} else {
	// 		s:=string(ch)
	// 		chars+=s
	// 		dic[ch]=strings.Count(msg,s)
	// 	}
	// }

	// for _,ch := range chars {
	// 	value,exists:=dic[ch]
	// 	if (exists) {
	// 		if (value < 10) {
	// 			outstr+=string(ch)
	// 		}
	// 	}
	// }

	for _,ch := range msg {
		_,exists:=dic[ch]
		if (exists) {
			continue
		} else {
			s:=string(ch)
			count:=strings.Count(msg,s)
			dic[ch]=count
			if (count < 10) {
				outstr+=s
			}
		}
	}

	fmt.Println(outstr)
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 002</code></pre>
    </section>
</div>

---
## 最终结果： equality

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/ocr.html
[2]: http://www.pythonchallenge.com/pc/def/equality.html

