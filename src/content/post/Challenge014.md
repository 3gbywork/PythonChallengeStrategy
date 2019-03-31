---
title: "014. walk around"
date: 2018-11-26T16:55:53+08:00
lastmod: 2019-03-18T14:47:53+08:00
draft: false
keywords: ["http", "image processing", "download", "authentication", "argb"]
description: ""
tags: ["download", "authentication", "argb"]
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

这一关大图下面有个小图，查看源代码后发现是`10000*1`的图片显示为`100*100`：

>100 × 100 pixels (Natural: 10000 × 1 pixels)

同时还有一个提示：

> remember: 100*100 = (100+99+99+98) + (...  

结合标题，需要将`10000*1`的图片重新组合为`100*100`的图片，排列规律如下：

```
—————————————100-—————————————
|————————————98——————————————|
|   |   ................. |  |
|   |   ................. |  |
|   |   ................. |  |
98  96  ................. 97 99
|   |   ................. |  |
|   |   ................. |  |
|   |   ................. |  |
|   |   ................. |  |
| ——————————97————————————|  |
————————————99————————————————
```

如果一行一行排列像素会得到`bit`这个结果，然后得到如下提示：

>you took the wrong curve.

正确的结果会得到一只猫的图片，输入`cat`会得到如下提示：

>and its name is **uzi**. you'll hear from him later.

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge014.py" title="点我下载源码">Challenge014.py</a></p>
{{< highlight python3 >}}
import helper
path=".\\Data\\014"
helper.ensureDir(path)

# ================================
# 使用http认证，下载文件
import urllib.request
helper.installHTTPBasicAuthOpener("huge", "file")

wire="http://www.pythonchallenge.com/pc/return/wire.png"
(filename, headers)=urllib.request.urlretrieve(wire, path+"\\wire.png")
# ================================

from PIL import Image
im=Image.open(filename)
# px=im.load()
# (w,h)=im.size

def officialSolution():
    tmp=spiral(im)
    tmp.close()

def mySolution():
    tmp=efficientSpiral(im)
    tmp.close()

def efficientSpiral(source):
    px=source.load()
    newIm=Image.new(source.mode, (100,100))
    newPx=newIm.load()
    hLines,vLines=0,0
    xStep,yStep=1,0
    length=100
    x,y,index=0,0,0
    while index<10000:
        if length==0:
            break
        for i in range(length):
            newPx[(x+i*xStep,y+i*yStep)]=px[(index+i,0)]
        index+=length
        x+=xStep*(length-1)
        y+=yStep*(length-1)
        if xStep==1 or xStep==-1:
            hLines+=1
            length=100-hLines
        else:
            vLines+=1
            length=100-vLines
        if xStep==1:
            xStep=0
            yStep=1
        elif yStep==1:
            yStep=0
            xStep=-1
        elif xStep==-1:
            xStep=0
            yStep=-1
        elif yStep==-1:
            yStep=0
            xStep=1
    # wrong curve
    # for j in range(100):
    #     for i in range(100):
    #         newPx[(i,j)]=px[(j*100+i,0)]
    # newIm.save(path+"\\out.png")
    # newIm.show()
    return newIm

def spiral(source):
    px=source.load()
    target = Image.new(source.mode, (100, 100))
    targetPx = target.load()
    left, top, right, bottom = (0, 0, 99, 99)
    x, y = 0, 0
    dirx, diry = 1, 0
    for i in range(10000):
        # target.putpixel((x, y), source.getpixel((i, 0)))
        targetPx[(x,y)]=px[(i,0)]
        if dirx == 1 and x == right:
            dirx, diry = 0, 1
            top += 1
        elif dirx == -1 and x == left:
            dirx, diry = 0, -1
            bottom -= 1
        elif diry == 1 and y == bottom:
            dirx, diry = -1, 0
            right -= 1
        elif diry == -1 and y == top:
            dirx, diry = 1, 0
            left += 1
        x += dirx
        y += diry
    return target

# 与官方wiki中解法效率对比
# 使用*Image.load()得到像素数据，对此进行操作 比 使用*Image.getpixel和*Image.putpixel效率高
if __name__ == "__main__":
    # from timeit import Timer
    # t1=Timer("officialSolution()", "from __main__ import officialSolution")
    # t2=Timer("mySolution()", "from __main__ import mySolution")
    # print(t1.timeit(1000))
    # print(t2.timeit(1000))
    newIm=efficientSpiral(im)
    # newIm.save(path+"\\out.png")
    newIm.show()
    newIm.close()
    im.close()
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge014.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge014.ps1" title="点我下载源码">Challenge014.ps1</a></p>
{{< highlight powershell >}}
$path=".\\Data\\014"

. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$wire="http://www.pythonchallenge.com/pc/return/wire.png"
$filename=$path+"\\wire.png"
Get-FileWithAuth -Url $wire -Filename $filename -Username "huge" -Password "file"

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)

$newImg=New-Object System.Drawing.Bitmap 100,100
$hLines,$vLines=0,0
$xStep,$yStep=1,0
$length=100
$x,$y,$index=0,0,0
while ($index -lt 10000) {
    if ($length -eq 0) {
        break
    }
    for ($i=0; $i -lt $length; $i++) {
        $newImg.SetPixel($x+$i*$xStep,$y+$i*$yStep, $img.GetPixel($index+$i,0))
    }
    $index+=$length
    $x+=$xStep*($length-1)
    $y+=$yStep*($length-1)
    if ($xStep -eq 1 -or $xStep -eq -1) {
        $hLines+=1
        $length=100-$hLines
    }
    else {
        $vLines+=1
        $length=100-$vLines
    }
    if ($xStep -eq 1) {
        $xStep=0
        $yStep=1
    }
    elseif ($yStep -eq 1) {
        $yStep=0
        $xStep=-1
    }
    elseif ($xStep -eq -1) {
        $xStep=0
        $yStep=-1
    }
    elseif ($yStep -eq -1) {
        $yStep=0
        $xStep=1
    }
}

Show-Image -Title "Challenge014" -Image $newImg -Width 300 -Height 200

# $img.Save($path+"\\cave.info.jpg")
$img.Dispose()
$newImg.Dispose()
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge014.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge014.go" title="点我下载源码">Challenge014.go</a></p>
{{< highlight golang >}}
package main

import(
	"image"
)

func (c *Challenge) Challenge014() {
	path:=".\\Data\\014"
	EnsureDir(path)

	wire:="http://www.pythonchallenge.com/pc/return/wire.png"
	filename:=path+"\\wire.png"
	DownloadWithBasicAuth(wire, filename, "huge", "file")

	im:=OpenImage(filename)

	newImg:=efficientSpiral(im)

	pngfile := path+"\\wire.go.png"
	SaveImage(pngfile, newImg, "png")
	
	ShowImage(pngfile)
}

func efficientSpiral(im image.Image) *image.RGBA {
	newImg:=image.NewRGBA(image.Rect(0,0,100,100))
	hLines,vLines:=0,0
    xStep,yStep:=1,0
    length:=100
	x,y,index:=0,0,0
	for ; index < 10000; {
        if length==0 {
            break
		}
		for i := 0; i < length; i++ {
			newImg.Set(x+i*xStep,y+i*yStep,im.At(index+i,0))
		}
        index+=length
        x+=xStep*(length-1)
        y+=yStep*(length-1)
        if xStep==1 || xStep==-1 {
			hLines+=1
            length=100-hLines
		} else {
			vLines+=1
            length=100-vLines
		}

        if xStep==1 {
			xStep=0
            yStep=1
		} else if yStep==1 {
			yStep=0
            xStep=-1
		} else if xStep==-1 {
			xStep=0
            yStep=-1
		} else if yStep==-1 {
			yStep=0
			xStep=1
		}
	}

	return newImg
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 014</code></pre>
    </section>
</div>

---
## 最终结果： uzi

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/italy.html
[2]: http://www.pythonchallenge.com/pc/return/uzi.html

