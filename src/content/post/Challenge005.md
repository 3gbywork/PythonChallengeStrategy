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
        <p><a href="../../Code/Python/Challenge005.py" title="点我下载源码">Challenge005.py</a></p>
{{< highlight python3 >}}
banner="http://www.pythonchallenge.com/pc/def/banner.p"

dir=".\\Data\\005"
import helper
helper.ensureDir(dir)

import urllib.request
(filename,headers)=urllib.request.urlretrieve(banner,dir+'\\banner.p')

import pickle
data=pickle.Unpickler(open(filename,'rb')).load()

# print(data)

for line in data:
    for tupleitem in line:
        print(tupleitem[0]*tupleitem[1],end='')
    print('')

# ================================
# without pickle
fp=open(filename,'r')
lines=fp.readlines()
fp.close()

import re
reln=re.compile('aa')
renum=re.compile('^I([0-9]*)')
rechsharp=re.compile("S'#'|g6")
rechspace=re.compile("S' '|g2")

for line in lines:
    if reln.search(line) != None:
        print('\n',end='')
        continue
    if rechsharp.search(line) != None:
        ch='#'
        continue
    if rechspace.search(line) != None:
        ch=' '
        continue
    if renum.search(line) != None:
        num=renum.search(line).group(1)
        print(ch*int(num),end='')
        continue
# ================================
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge005.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge005.ps1" title="点我下载源码">Challenge005.ps1</a></p>
{{< highlight powershell >}}
$banner="http://www.pythonchallenge.com/pc/def/banner.p"

$path=".\\Data\\005"

. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$filename=$path+"\\banner.p"
Invoke-WebRequest -Uri $banner -OutFile $filename

$lines=Get-Content $filename

$reln=[regex]'aa'
$renum=[regex]'^I([0-9]*)'
$rechsharp=[regex]"S'#'|g6"
$rechspace=[regex]"S' '|g2"

foreach ($line in $lines) {
    if ($reln.IsMatch($line)) {
        [System.Console]::WriteLine()
        continue
    }
    if ($rechsharp.IsMatch($line)) {
        $ch='#'
        continue
    }
    if ($rechspace.IsMatch($line)) {
        $ch=' '
        continue
    }
    if ($renum.IsMatch($line)) {
        $num=[int]$renum.Match($line).Groups[1].Value
        [System.Console]::Write($ch*$num)
        continue
    }
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge005.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge005.go" title="点我下载源码">Challenge005.go</a></p>
{{< highlight golang >}}
package main

import (
	"fmt"
	"strings"
	"regexp"
	"strconv"
)

func (c *Challenge) Challenge005()  {
	banner:="http://www.pythonchallenge.com/pc/def/banner.p"
	
	path:=".\\Data\\005"
	EnsureDir(path)

	filename:=path+"\\banner.p"
	Download(banner,filename)

	content:=ReadFile(filename)
	lines:=strings.Split(content,"\n")

	reln:=regexp.MustCompile("aa")
	renum:=regexp.MustCompile("^I([0-9]*)")
	rechsharp:=regexp.MustCompile("S'#'|g6")
	rechspace:=regexp.MustCompile("S' '|g2")

	ch:=" "

	for index := 0; index < len(lines); index++ {
		if reln.MatchString(lines[index]) {
			fmt.Printf("\n")
			continue
		}
		if rechsharp.MatchString(lines[index]) {
			ch="#"
			continue
		}
		if rechspace.MatchString(lines[index]) {
			ch=" "
			continue
		}
		matches:=renum.FindStringSubmatch(lines[index])
		if matches != nil {
			num,err:=strconv.Atoi(matches[1])
			if err == nil {
				for i:=0; i<num; i++ {
					fmt.Printf(ch)
				}
			}
			continue
		}
	}
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 005</code></pre>
    </section>
</div>

---
## 最终结果： channel

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/peak.html
[2]: http://www.pythonchallenge.com/pc/def/channel.html

[a]: ../../Image/005/channel.png

