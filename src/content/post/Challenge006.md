---
title: "006. now there are pairs"
date: 2018-11-04T22:58:08+08:00
lastmod: 2019-03-18T13:37:08+08:00
draft: false
keywords: ["http", "unzip", "download", "pickle", "entry", "comment"]
description: ""
tags: ["download", "pickle", "entry", "comment"]
categories: ["http", "unzip"]

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

图片没有提供任何有用的信息。查看源代码得到如下信息：

`<-- zip `

额，更改url可以得到一个压缩文件。

打开压缩文件，找到`readme.txt`文件，内容如下：

>welcome to my zipped list. 
> 
>hint1: start from 90052  
>hint2: answer is inside the zip

按照提示按顺序读取文件，最后得到的内容是：

>Collect the comments.

从comments中得到的信息是：

![oxygen][a]

所以下一关地址是：hockey？？？

错！访问这个地址你会得到如下内容：

>it's in the air. look at the letters. 

好吧，原来是`oxygen`

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge006.py" title="点我下载源码">Challenge006.py</a></p>
{{< highlight python3 >}}
import helper
dir=".\\Data\\006"
helper.ensureDir(dir)

import urllib.request
channel="http://www.pythonchallenge.com/pc/def/channel.zip"
(filename, headers)=urllib.request.urlretrieve(channel, dir+"\\channel.zip")

import zipfile
zip=zipfile.ZipFile(filename)

import re
pattern=re.compile("Next nothing is (\\d+)")

entryname="90052"
outstr=[]
while True:
    name=entryname+".txt"
    cnt=zip.read(name).decode('utf-8')
    outstr.append(zip.getinfo(name).comment.decode('utf-8'))
    try:
        entryname=pattern.search(cnt).group(1)
    except:
        print("last: %s, cnt: %s" %(entryname, cnt))
        break

print(''.join(outstr))
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge006.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge006.ps1" title="点我下载源码">Challenge006.ps1</a></p>
{{< highlight powershell >}}
$path=".\\Data\\006"

. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$url="http://www.pythonchallenge.com/pc/def/channel.zip"
$filename=$path+"\\channel.zip"
# 转换为文件的绝对路径
$filename=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($filename)
Invoke-WebRequest -Uri $url -OutFile $filename

[void][System.Reflection.Assembly]::LoadFile($PSScriptRoot+"\\lib\\ICSharpCode.SharpZipLib.dll")

$namespace="ICSharpCode.SharpZipLib.Zip.{0}"

$zip=New-Object($namespace -f "ZipFile")($filename)

$pattern=[regex]"Next nothing is (\d+)"
$entryname="90052"

$outstr=""
while ($true) {
    $entry=$zip.GetEntry($entryname+".txt")
    $stream=$zip.GetInputStream($entry)
    $reader=New-Object System.IO.StreamReader($stream)
    $cnt=$reader.ReadToEnd()
    $reader.Dispose()
    $stream.Dispose()

    $outstr+=$entry.Comment
    $match = $pattern.Match($cnt)
    if ($match.Success) {
        $entryname = $match.Groups[1].Value
    } else {
        "last: {0}, cnt: {1}" -f $entryname,$cnt
        break
    }
}

$zip.Close()
Write-Output $outstr
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge006.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge006.go" title="点我下载源码">Challenge006.go</a></p>
{{< highlight golang >}}
package main

import (
	"fmt"
	"archive/zip"
	"io/ioutil"
	"regexp"
)

func (c *Challenge) Challenge006() {
	path:=".\\Data\\006"
	EnsureDir(path)

	filename:=path+"\\channel.zip"
	channel:="http://www.pythonchallenge.com/pc/def/channel.zip"
	Download(channel,filename)

	rc,err:=zip.OpenReader(filename)
	if err != nil {
		fmt.Printf("open zip failed![%v]\n", err)
	}

	defer rc.Close()

	dic:=map [string] *zip.File {}
	for _,file := range rc.File {
		dic[file.Name]=file
	}

	outstr:=""
	pattern:=regexp.MustCompile("Next nothing is (\\d+)")
	name:="90052"
	for true {
		file,exists:=dic[name+".txt"]
		if exists {
			outstr+=file.Comment
			rc,err:=file.Open()
			if err == nil {
				defer rc.Close()
				bytes,err:=ioutil.ReadAll(rc)
				if err == nil {
					cnt:=string(bytes)
					matches:=pattern.FindStringSubmatch(cnt)
					if len(matches) != 2 {
						fmt.Printf("last: %s, cnt: %s\n", name, cnt)
						break
					} else {
						name=matches[1]
					}
				}
			}
		}
	}

	fmt.Println(outstr)
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 006</code></pre>
    </section>
</div>

---
## 最终结果： oxygen

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/channel.html
[2]: http://www.pythonchallenge.com/pc/def/oxygen.html

[a]: ../../Image/006/oxygen.png
