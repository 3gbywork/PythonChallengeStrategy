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
        <p><a href="../../Code/Python/Challenge007.py" title="点我下载源码">Challenge007.py</a></p>
{{< highlight python3 >}}
import helper
path=".\\Data\\007"
helper.ensureDir(path)

import urllib.request
img="http://www.pythonchallenge.com/pc/def/oxygen.png"
(filename, headers)=urllib.request.urlretrieve(img, path+"\\oxygen.png")

# python3图像处理库Pillow（friendly PIL fork）
# 文档地址：https://pillow.readthedocs.io/en/5.3.x/
from PIL import Image
im=Image.open(filename)
(w,h)=im.size
px=im.load()

outstr=[]
# 21px是灰度图右边空白的宽度
for i in range(0,w-21,7):
    (r,g,b,a)=px[i,h/2]
    # 灰度图r,g,b三个分量值相等
    outstr.append(chr(r))
im.close()

msg=''.join(outstr)
print(msg)

import re
pattern=re.compile(r'[\d]+')

nextlevel=''.join(map(chr,map(int,pattern.findall(msg))))
print(nextlevel)
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge007.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge007.ps1" title="点我下载源码">Challenge007.ps1</a></p>
{{< highlight powershell >}}
$path=".\\Data\\007"

. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$url="http://www.pythonchallenge.com/pc/def/oxygen.png"
$filename=$path+"\\oxygen.png"
Invoke-WebRequest -Uri $url -OutFile $filename

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)

$msg=""
for ($i=0; $i -lt $img.Width-21; $i+=7) {
    $msg+=[char]$img.GetPixel($i,$img.Height/2).R
}
$img.Dispose()

Write-Output $msg

$outstr=""
$pattern=[regex]"\d+"
$pattern.Matches($msg) | ForEach-Object {$outstr+=[char][int]$_.Value}

Write-Output $outstr
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge007.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge007.go" title="点我下载源码">Challenge007.go</a></p>
{{< highlight golang >}}
package main

import (
	"fmt"
	"regexp"
	"strconv"
	_ "image/png"
)

func (c *Challenge) Challenge007() {
	path:=".\\Data\\007"
	EnsureDir(path)

	filename:=path+"\\oxygen.png"
	channel:="http://www.pythonchallenge.com/pc/def/oxygen.png"
	Download(channel,filename)

	im:=OpenImage(filename)

	bounds := im.Bounds()

	msg := ""
	y:=(bounds.Max.Y-bounds.Min.Y)/2
	for x:=bounds.Min.X; x<bounds.Max.X-21; x+=7 {
		r,_,_,_ := im.At(x,y).RGBA()
		msg+=string(byte(r))
	}

	fmt.Println(msg)

	pattern:=regexp.MustCompile("\\d+")
	matches:=pattern.FindAllString(msg, -1)

	outstr:=""
	for _,match := range matches {
		i,err:=strconv.Atoi(match)
		if err == nil {
			outstr+=string(byte(i))
		}
	}

	fmt.Println(outstr)
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 007</code></pre>
    </section>
</div>

---
## 最终结果： integrity

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/oxygen.html
[2]: http://www.pythonchallenge.com/pc/def/integrity.html

[a]: ../../Image/007/oxygen.png "smarty"

