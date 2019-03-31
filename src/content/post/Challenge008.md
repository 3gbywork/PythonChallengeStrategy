---
title: "008. working hard?"
date: 2018-11-09T15:25:57+08:00
lastmod: 2019-03-18T14:02:57+08:00
draft: false
keywords: ["data persistence", "bz2"]
description: ""
tags: ["bz2"]
categories: ["data persistence"]

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

这一关，图片下面有这样的提示：

>Where is the missing link?

鼠标在图片上“扫描”一遍发现，图片中蜜蜂区域是可点击的，访问的就是下一关的地址。

对，你没有看错，就是下一关地址。不过在此之前，你需要认证。

所以这一关的目的就是找到用户名和密码。

查看源代码得到如下提示：

```
un: 'BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
pw: 'BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'
```

很明显，un就是username的简写，pw就是password的简写。

字符串是经过`bz2`编码之后的输出，我们要解码得到原始字符串。

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge008.py" title="点我下载源码">Challenge008.py</a></p>
{{< highlight python3 >}}
# ================================
# 写bz2文件，可以使用7zip直接查看
def makeBz2(filename, data):
    fp=open(filename, 'wb')
    fp.write(data)
    fp.close()

import helper
dir=".\\Data\\008"
helper.ensureDir(dir)

un=b'BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
pw=b'BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'

makeBz2(dir+'\\user.bz2', un)
makeBz2(dir+'\\pwd.bz2', pw)
# ================================

import codecs

username=codecs.decode(un, 'bz2').decode('utf-8')
password=codecs.decode(pw, 'bz2').decode('utf-8')
# or
# username=codecs.decode(open(dir+'\\user.bz2','rb').read(), 'bz2').decode('utf-8')
# password=codecs.decode(open(dir+'\\pwd.bz2','rb').read(), 'bz2').decode('utf-8')

print('username: %s\npassword: %s' % (username, password))
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge008.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge008.ps1" title="点我下载源码">Challenge008.ps1</a></p>
{{< highlight powershell >}}
$un='BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
$pw='BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'

$path=".\\Data\\008"
. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

Write-BinaryFile -Filename $($path+"\\user.bz2") -Data $(ConvertFrom-Bz2String -InStr $un)
Write-BinaryFile -Filename $($path+"\\pwd.bz2") -Data $(ConvertFrom-Bz2String -InStr $pw)

# 使用bzip2解压并输出
Write-Output $("username: {0}" -f $(.\Code\PowerShell\bin\bzip2.exe -d -k -c .\Data\008\user.bz2))
Write-Output $("password: {0}" -f $(.\Code\PowerShell\bin\bzip2.exe -d -k -c .\Data\008\pwd.bz2))
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge008.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge008.go" title="点我下载源码">Challenge008.go</a></p>
{{< highlight golang >}}
package main

import(
	"fmt"
	"os"
	"compress/bzip2"
	"io/ioutil"
)

func (c *Challenge) Challenge008() {
	unfile:=".\\Data\\008\\user.bz2"
	pwfile:=".\\Data\\008\\pwd.bz2"

	username:=bz2Decode(unfile)
	password:=bz2Decode(pwfile)

	fmt.Printf("username: %s\npassword: %s\n", username, password)
}

func bz2Decode(filename string) string {
	reader,err := os.Open(filename)
	if err != nil {
		fmt.Printf("open file %s failed![%v]", filename, err)
		return ""
	}
	defer reader.Close()

	bzrd := bzip2.NewReader(reader)

	bytes,ierr := ioutil.ReadAll(bzrd)
	if ierr != nil {
		fmt.Printf("read file %s failed![%v]", filename, ierr)
		return ""
	}

	return string(bytes)
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 008</code></pre>
    </section>
</div>

---
## 最终结果： username: huge, password: file

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/integrity.html
[2]: http://www.pythonchallenge.com/pc/return/good.html

