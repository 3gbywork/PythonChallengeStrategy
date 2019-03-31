---
title: "004. follow the chain"
date: 2018-10-30T11:18:54+08:00
lastmod: 2019-03-18T10:58:54+08:00
draft: false
keywords: ["http", "string", "query string", "regex"]
description: ""
tags: ["query string", "regex"]
categories: ["http", "string"]

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
#     weight: 5
---

## [关卡地址][1]

## 解决方案：

### 思路：

这一关鼠标移动到图片上指针会变成小手，点击会得到如下信息：

>and the next nothing is 44827

同时，url后面多了参数`?nothing=12345`。回退回关卡地址，查看源代码得到如下提示：

>urllib may help. DON'T TRY ALL NOTHINGS, since it will never end. 400 times is more than enough. 

结合标题，需要借助urllib库发送400次请求，每次请求都会得到下一次请求的参数，替换参数继续请求，最终得到下一关地址。

**PS：** 在测试时，遇到这样的提示：`Yes. Divide by two and keep going.`，已在程序中做判断处理（之前并没有遇到这样的情况，看官方攻略也不像是网站最近更新了，看来是之前比较幸运😝）。

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge004.py" title="点我下载源码">Challenge004.py</a></p>
{{< highlight python3 >}}
url='http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
param='12345'

import urllib.request
import re

pattern=re.compile("the next nothing is (\\d+)")

for i in range(400):
    # print("request %4d url: %s " %(i,url+param))
    resp=urllib.request.urlopen(url+param).read().decode('utf-8')
    try:
        param=pattern.search(resp).group(1)
    except:
        print("param %s, response: %s" %(param,resp))
        if resp == "Yes. Divide by two and keep going.":
            try:
                tmpParam=str(int(int(param)/2))
                param=tmpParam
                continue
            except:
                break
        break

print('completed')
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge004.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge004.ps1" title="点我下载源码">Challenge004.ps1</a></p>
{{< highlight powershell >}}
$url="http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="
$param="12345"

$pattern=[regex]"the next nothing is (\d+)"

for ($i=0; $i -lt 400; $i++) {
    $resp = (Invoke-WebRequest -Uri $url+$param | Select-Object -ExcludeProperty Content).Content
    $match = $pattern.Match($resp)
    if ($match.Success) {
        $param = $match.Groups[1].Value
    } else {
        [System.Console]::WriteLine($("param: {0}, resp: {1}" -f $param,$resp))
        if ($resp -eq "Yes. Divide by two and keep going.") {
            $param=$param/2
            continue
        }
        break
    }
}

[System.Console]::WriteLine("completed")
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge004.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge004.go" title="点我下载源码">Challenge004.go</a></p>
{{< highlight golang >}}
package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
	"regexp"
	"strings"
	"strconv"
)

func (c *Challenge) Challenge004() {
	url:="http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="
	param:="12345"

	pattern:=regexp.MustCompile("the next nothing is (\\d+)")

	for i:=0; i<400; i++ {
		resp := httpGet(url+param)
		tmpParam:=pattern.FindStringSubmatch(resp)
		if len(tmpParam) != 2 {
			fmt.Printf("param: %s, response: %s\n",param, resp)
			if strings.Compare(resp,"Yes. Divide by two and keep going.") == 0 {
				intParam,err := strconv.Atoi(param)
				if err == nil {
					param = string(intParam/2)
					continue
				}
			}
			break
		} else {
			param=tmpParam[1]
		}
	}

	fmt.Println("completed")
}

func httpGet(url string) string {
	resp, err := http.Get(url)
	if err == nil {
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err == nil {
			return string(body)
		}
	}
	return ""
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 004</code></pre>
    </section>
</div>

---
## 最终结果： peak.html

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/linkedlist.php
[2]: http://www.pythonchallenge.com/pc/def/peak.html

