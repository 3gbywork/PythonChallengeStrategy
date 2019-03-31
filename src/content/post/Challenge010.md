---
title: "010. what are you looking at?"
date: 2018-11-13T13:19:40+08:00
lastmod: 2019-03-18T14:20:40+08:00
draft: false
keywords: ["string", "statistic"]
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
#     weight: 1
---

## [关卡地址][1]

## 解决方案：

### 思路：

图片中的牛说：“你瞅啥？”，然后你说：“瞅你咋地，不光瞅你还打你呢”。（皮一下很开心😝）。然后（点击它）会得到一个`sequence.txt`文件，内容如下：

>a = [1, 11, 21, 1211, 111221,

求`len(a[30]) = ?`

规律是这样的：

1. 第一个元素： 1
2. 第二个元素： 11      （表示1个1）
3. 第三个元素： 21      （表示2个1）
4. 第四个元素： 1211    （表示1个2，1个1）
5. 第五个元素： 111221  （表示1个1，1个2，2个1）

可以看出，这是一个简单的字符统计程序

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge010.py" title="点我下载源码">Challenge010.py</a></p>
{{< highlight python3 >}}
def getNext(instr):
    count=0
    curch=instr[0]
    outstr=[]
    for ch in instr:
        if ch != curch:
            outstr.append(str(count)+curch)
            curch=ch
            count=1
        else:
            count+=1
    outstr.append(str(count)+curch)
    return ''.join(outstr)

a=['1']
for i in range(31):
    a.append(getNext(a[i]))
print(len(a[30]))
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge010.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge010.ps1" title="点我下载源码">Challenge010.ps1</a></p>
{{< highlight powershell >}}
function GetNext {
    param (
        [string]
        $instr
    )
    
    $count=0
    $curch=$instr[0]
    $outstr=New-Object System.Text.StringBuilder

    for ($i = 0; $i -lt $instr.Length; $i++) {
        $ch=$instr[$i]
        if ($ch -ne $curch) {
            # StringBuilder.Append的值会作为函数的返回值返回，所以要在前面加[void]或$null=
            [void]$outstr.AppendFormat("{0}{1}", $count, $curch)
            $curch=$ch
            $count=1
        } else {
            $count++
        }
    }
    [void]$outstr.AppendFormat("{0}{1}", $count, $curch)

    return $outstr.ToString()
}

$a=New-Object System.Collections.Generic.List[string]
$a.Add("1")
for ($i = 0; $i -lt 31; $i++) {
    $next=GetNext($a[$i])
    $a.Add($next)
}
Write-Output $a[30].Length
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge010.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge010.go" title="点我下载源码">Challenge010.go</a></p>
{{< highlight golang >}}
package main

import(
	"fmt"
	"strings"
)

func (c *Challenge) Challenge010() {
	a:=[]string {"1"}
	for i := 0; i < 31; i++ {
		a=append(a, getNext(a[i]))
	}
	fmt.Println(len(a[30]))
}

func getNext(instr string) string {
	count:=0
	curch:=instr[0]
	var outstr strings.Builder

	for i := 0; i < len(instr); i++ {
		ch:=instr[i]
		if ch != curch {
			outstr.WriteString(fmt.Sprintf("%d%s",count,string(curch)))
			curch=ch
			count=1
		} else {
			count++
		}
	}
	outstr.WriteString(fmt.Sprintf("%d%s",count,string(curch)))

	return outstr.String()
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 010</code></pre>
    </section>
</div>

---
## 最终结果： 5808

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/bull.html
[2]: http://www.pythonchallenge.com/pc/return/5808.html

