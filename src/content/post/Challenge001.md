---
title: "001. What about making trans?"
date: 2018-10-27T20:06:51+08:00
lastmod: 2019-03-18T09:41:23+08:00
draft: false
keywords: ["trans", "string", "map"]
description: ""
tags: ["map"]
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
#     weight: 2
---

## [关卡地址][1]

## 解决方案：

### 思路：

![What about making trans?][a]

图中给出了字母的映射关系，通过规律来破解下面这段话：

>g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge001.py" title="点我下载源码">Challenge001.py</a></p>
{{< highlight python3 >}}
import helper
msg=helper.readFile(".\\Data\\001\\msg.txt")
url='map'

# ^^^^^^^^^^^^^^^^^^^^^^^^Solution 1^^^^^^^^^^^^^^^^^^^^^^^^
def getchar(inchar):
    if inchar >= 'a' and inchar <= 'z':
        tmp=ord(inchar)-ord('a')+2
        return chr(tmp%26+ord('a'))
    else:
        return inchar

def translate(instr):
    return ''.join(map(getchar,instr))

print(translate(msg))
print(translate(url))
# vvvvvvvvvvvvvvvvvvvvvvvvSolution 1vvvvvvvvvvvvvvvvvvvvvvvv


# ^^^^^^^^^^^^^^^^^^^^^^^^Solution 2^^^^^^^^^^^^^^^^^^^^^^^^
import string

table=str.maketrans(string.ascii_lowercase, string.ascii_lowercase[2:]+string.ascii_lowercase[:2])
print(msg.translate(table))
print(url.translate(table))
# vvvvvvvvvvvvvvvvvvvvvvvvSolution 2vvvvvvvvvvvvvvvvvvvvvvvv
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge001.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge001.ps1" title="点我下载源码">Challenge001.ps1</a></p>
{{< highlight powershell >}}
$msg=Get-Content ".\\Data\\001\\msg.txt"
$url='map'

function GetChar ([char]$ch) {
    if($ch -ge 'a' -and $ch -le 'z'){
        # [int][char]'a'=97
        return [char](97+([int]$ch-97+2)%26)
    }
    return $ch
}

function Translate ([string]$instr) {
    [char[]]$rst=New-Object char[] $instr.Length
    for ($i = 0; $i -lt $instr.Length; $i++) {
        $ch=GetChar($instr[$i])   
        $rst[$i]=$ch
    }
    
    return $rst -join ''
}

Translate($msg)
Translate($url)
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge001.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge001.go" title="点我下载源码">Challenge001.go</a></p>
{{< highlight golang >}}
package main

import(
	"fmt"
	"strings"
)

func (c *Challenge) Challenge001()  {
	msg:=ReadFile(".\\Data\\001\\msg.txt")
	url:="map"

	fmt.Println(translate(msg))
	fmt.Println(translate(url))
}

func getChar(r rune) rune {
	// switch {
	// case r >= 'a' && r <= 'z':
	// 	return 'a' + (r-'a'+2)%26
	// }
	if (r >= 'a' && r <= 'z') {
		return 'a' + (r-'a'+2)%26
	}
	return r
}

func translate(instr string) string {
	return strings.Map(getChar, instr)
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 001</code></pre>
    </section>
</div>

---
## 最终结果： ocr

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/map.html "访问 274877906944.html 会跳转到 map.html"
[2]: http://www.pythonchallenge.com/pc/def/ocr.html

[a]: ../../Image/001/map.jpg "What about making trans?"

