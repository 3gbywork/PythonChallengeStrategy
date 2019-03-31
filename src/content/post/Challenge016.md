---
title: "016. let me get this straight"
date: 2018-11-29T22:52:49+08:00
lastmod: 2019-03-18T14:55:49+08:00
draft: false
keywords: ["http", "image processing", "download", "authentication", "array"]
description: ""
tags: ["download", "authentication", "array"]
categories: ["http", "image processing"]

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

图片每一行都有一条7个像素组成的像素块，两端是1个白色像素，中间是5个粉紫色像素，色值是(255,0,255)。由于图像模式是`P`，使用8位映射到调色板。

经测试，连续5个粉紫色像素的值是195。

根据标题：

>让我直说吧

将这些像素块排成一列，就会得到下一关地址啦。

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge016.py" title="点我下载源码">Challenge016.py</a></p>
{{< highlight python3 >}}
import helper
path=".\\Data\\016"
helper.ensureDir(path)

# ================================
# 使用http认证，下载文件
import urllib.request
helper.installHTTPBasicAuthOpener("huge", "file")

gif="http://www.pythonchallenge.com/pc/return/mozart.gif"
(filename, headers)=urllib.request.urlretrieve(gif, path+"\\mozart.gif")
# ================================

from PIL import Image
im=Image.open(filename)
px=im.load()

newIm=Image.new(im.mode, im.size)
newPx=newIm.load()

(w,h)=im.size
for y in range(h):
    for x in range(w):
        if px[x,y] == 195:
            for xx in range(w):
                newPx[xx,y]=px[(xx+x)%w,y]
            continue

im.close()
newIm.show()
newIm.close()
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge016.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge016.ps1" title="点我下载源码">Challenge016.ps1</a></p>
{{< highlight powershell >}}
$path=".\\Data\\016"

. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$gif="http://www.pythonchallenge.com/pc/return/mozart.gif"
$filename=$path+"\\mozart.gif"
Get-FileWithAuth -Url $gif -Filename $filename -Username "huge" -Password "file"

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)
$newImg=New-Object System.Drawing.Bitmap $img.Width,$img.Height
$color=[System.Drawing.Color]::FromArgb(255,0,255)

for ($y = 0; $y -lt $img.Height; $y++) {
    for ($x = 0; $x -lt $img.Width; $x++) {
        if ($img.GetPixel($x,$y) -eq $color) {
            for ($xx = 0; $xx -lt $img.Width; $xx++) {
                $newImg.SetPixel($xx,$y,$img.GetPixel(($xx+$x)%$img.Width,$y))
            }
            continue
        }
    }
}

$img.Dispose()

Show-Image -Title "Challenge016" -Image $newImg
$newImg.Dispose()
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge016.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge016.go" title="点我下载源码">Challenge016.go</a></p>
{{< highlight golang >}}
package main

import(
	"image"
)

func (c *Challenge) Challenge016() {
	path:=".\\Data\\016"
	EnsureDir(path)

	gif:="http://www.pythonchallenge.com/pc/return/mozart.gif"
	filename:=path+"\\mozart.gif"
	DownloadWithBasicAuth(gif, filename, "huge", "file")

	im:=OpenImage(filename)

	newImg:=straightImage(im)

	giffile := path+"\\mozart.go.gif"
	SaveImage(giffile, newImg, "gif")
	
	ShowImage(giffile)
}

func straightImage(im image.Image) *image.RGBA {
	bounds:=im.Bounds()
	newImg:=image.NewRGBA(bounds)
	for y := bounds.Min.Y; y < bounds.Max.Y; y++ {
		for x := bounds.Min.X; x < bounds.Max.X; x++ {
			r,g,b,_:=im.At(x,y).RGBA()
			if r==65535 && g==0 && b==65535 {
				for xx := bounds.Min.X; xx < bounds.Max.X; xx++ {
					newImg.Set(xx,y,im.At((xx+x)%bounds.Dx(),y))
				}
				continue
			}
		}
	}
	return newImg
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 016</code></pre>
    </section>
</div>

---
## 最终结果： romance

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/mozart.html
[2]: http://www.pythonchallenge.com/pc/return/romance.html

