---
title: "017. eat?"
date: 2018-12-06T23:45:58+08:00
lastmod: 2019-03-18T14:58:58+08:00
draft: false
keywords: ["http", "string", "data persistence", "xmlrpc", "download", "authentication", "cookie", "regex", "bz2", "xmlrpc client"]
description: ""
tags: ["download", "authentication", "cookie", "regex", "bz2", "xmlrpc client"]
categories: ["http", "string", "data persistence", "xmlrpc"]

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

这一关图片中是曲奇饼干，左下角图片是不是有点熟悉？是[第四关][a]啦！

查看源代码并没有什么提示。

但是！根据`cookie`可以联想到什么？对！就是浏览器缓存。

通过浏览器开发者工具查看`cookie`后，可以得到如下提示：

>you+should+have+followed+busynothing...

在第四关，我们请求的是：`http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=`

这里需要将`nothing`替换为`busynothing`，并且收集`cookie`中`info`的值。

之后得到`BZh91AY`开头的经过url编码的字符串，是不是又有点熟悉？不熟悉的请回顾[第八关][b]。

使用python在解码时会有小问题：

>OSError: Invalid data stream

在解码前将`+`替换为`%20`可以解决该问题。

解码后得到提示：

>is it the 26th already? call his father and inform him that "the flowers are on their way". he'll understand.

这句话信息量有点大，26号暗示[第十五关][d]，`call his father`则暗示[第十三关][c]，Mozart的父亲是Leopold（注意L大写）。

给Leopold打电话之后得到：

>555-VIOLIN

访问`violin.html`得到如下提示：

>no! i mean yes! but ../stuff/violin.php. 

替换url之后访问，得到的是一张Leopold的照片，及：

>it's me. what do you want?

额。。。对，and **info**rm him that "the flowers are on their way"

将`cookie`中`info`的值设置为："the flowers are on their way"，并重新请求。Leopold会回复你：

>oh well, don't you dare to forget the balloons.

所以下一关地址是：balloons.html

### 代码：

<div>
    <input id="tab-python" type="radio" name="code-tabs" class="code-tabs" checked>
    <label class="language-label" for="tab-python">Python</label>
    <input id="tab-powershell" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-powershell">PowerShell</label>
    <input id="tab-golang" type="radio" name="code-tabs" class="code-tabs">
    <label class="language-label" for="tab-golang">Golang</label>
    <section id="content-python" class="content-section">
        <p><a href="../../Code/Python/Challenge017.py" title="点我下载源码">Challenge017.py</a></p>
{{< highlight python3 >}}
url='http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing='
param='12345'

import urllib.request
import http.cookiejar
cj=http.cookiejar.CookieJar()
cookie_handler=urllib.request.HTTPCookieProcessor(cj)
opener=urllib.request.build_opener(cookie_handler)
urllib.request.install_opener(opener)

import re
pattern=re.compile("the next busynothing is (\\d+)")

outstr=[]
for i in range(400):
    resp=urllib.request.urlopen(url+param)
    cnt=resp.read().decode('utf-8')
    # print("request %4d url: %s\nresponse: %s" %(i,url+param,cnt))
    outstr.append(list(cj)[0].value)
    
    try:
        param=pattern.search(cnt).group(1)
    except:
        print("param %s, response: %s" %(param,cnt))
        if cnt == "Yes. Divide by two and keep going.":
            try:
                tmpParam=str(int(int(param)/2))
                param=tmpParam
                continue
            except:
                break
        break
cookieStr=''.join(outstr)
print(cookieStr)

# cookieStr='BZh91AY%26SY%94%3A%E2I%00%00%21%19%80P%81%11%00%AFg%9E%A0+%00hE%3DM%B5%23%D0%D4%D1%E2%8D%06%A9%FA%26S%D4%D3%21%A1%EAi7h%9B%9A%2B%BF%60%22%C5WX%E1%ADL%80%E8V%3C%C6%A8%DBH%2632%18%A8x%01%08%21%8DS%0B%C8%AF%96KO%CA2%B0%F1%BD%1Du%A0%86%05%92s%B0%92%C4Bc%F1w%24S%85%09%09C%AE%24%90'

import codecs
import urllib.parse
info=urllib.parse.unquote_to_bytes(cookieStr.replace('+','%20'))
msg=codecs.decode(info,'bz2').decode('utf-8')
print(msg)

import xmlrpc.client
serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"
serverProxy=xmlrpc.client.ServerProxy(serverUrl)
print(serverProxy.phone('Leopold'))

url='http://www.pythonchallenge.com/pc/stuff/violin.php'
cookie=list(cj)[0]
cookie.value="the flowers are on their way"
cj.set_cookie(cookie)

resp=urllib.request.urlopen(url).read().decode('utf-8')
print(resp)
{{< /highlight >}}
        <pre><code>PS src\static> python .\Code\Python\Challenge017.py</code></pre>
    </section>
    <section id="content-powershell" class="content-section">
        <p><a href="../../Code/PowerShell/Challenge017.ps1" title="点我下载源码">Challenge017.ps1</a></p>
{{< highlight powershell >}}
$url='http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing='
$param="12345"

$pattern=[regex]"the next busynothing is (\d+)"

[string]$cookieStr=""
for ($i=0; $i -lt 400; $i++) {
    $resp = (Invoke-WebRequest -Uri $url+$param -SessionVariable session | Select-Object -ExcludeProperty Content).Content
    $cookieStr+=$session.Cookies.GetCookies($url)[0].Value
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
$cookieStr

# $cookieStr="BZh91AY%26SY%94%3A%E2I%00%00%21%19%80P%81%11%00%AFg%9E%A0+%00hE%3DM%B5%23%D0%D4%D1%E2%8D%06%A9%FA%26S%D4%D3%21%A1%EAi7h%9B%9A%2B%BF%60%22%C5WX%E1%ADL%80%E8V%3C%C6%A8%DBH%2632%18%A8x%01%08%21%8DS%0B%C8%AF%96KO%CA2%B0%F1%BD%1Du%A0%86%05%92s%B0%92%C4Bc%F1w%24S%85%09%09C%AE%24%90"
# [System.Web.HttpUtility]::UrlDecodeToBytes 可以将'+'转换为' '，故注释掉
# $cookieStr=$cookieStr.Replace('+','%20')

$path=".\\Data\\017"
. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$cookieFile=$path+"\\cookie.bz2"
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Web")
Write-BinaryFile -Filename $cookieFile -Data $([System.Web.HttpUtility]::UrlDecodeToBytes($cookieStr))

Write-Output $(.\Code\PowerShell\bin\bzip2.exe -d -k -c $cookieFile)

$serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"
Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "phone" -Params "Leopold"

$url='http://www.pythonchallenge.com/pc/stuff/violin.php'
$cookie=[System.Net.Cookie]::new("info","the flowers are on their way")
$webSession=[Microsoft.PowerShell.Commands.WebRequestSession]::new()
$webSession.Cookies.Add($url,$cookie)
$(Invoke-WebRequest -Uri $url -WebSession $webSession | Select-Object -ExcludeProperty Content).Content
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\PowerShell\Challenge017.ps1</code></pre>
    </section>
    <section id="content-golang" class="content-section">
        <p><a href="../../Code/Go/Challenge017.go" title="点我下载源码">Challenge017.go</a></p>
{{< highlight golang >}}
package main

import(
	"fmt"
	"regexp"
	"net/http"
	"io/ioutil"
	"strings"
	"strconv"
	"github.com/kolo/xmlrpc"
)

func (c *Challenge) Challenge017() {
	url := "http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing="
	param := "12345"

	pattern := regexp.MustCompile("the next busynothing is (\\d+)")

	var cookie *http.Cookie
	outstr := ""
	for i := 0; i < 400; i++ {
		resp, err := http.Get(url+param)
		if err != nil {
			fmt.Printf("request %s%s err[%v]\n",url, param, err)
			break
		}
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			fmt.Printf("request %s%s err[%v]\n",url, param, err)
			break
		}
		content := string(body)
		temParam:=pattern.FindStringSubmatch(content)
		if len(temParam) != 2 {
			fmt.Printf("param: %s, response: %s\n",param, content)
			if strings.Compare(content, "Yes. Divide by two and keep going.") == 0 {
				intParam, err := strconv.Atoi(param)
				if err == nil {
					param = string(intParam/2)
					continue
				}
			}
			break
		} else {
			param=temParam[1]
		}
		cookie = resp.Cookies()[0]
		outstr += cookie.Value
	}

	cookieFile := ".\\Data\\017\\cookie.bz2"
	msg := bz2Decode(cookieFile)
	fmt.Println(msg)

	client, err := xmlrpc.NewClient("http://www.pythonchallenge.com/pc/phonebook.php", nil)
	if err != nil {
		fmt.Println("Can't create client: ", err)
	}
	defer client.Close()
	var result string
	client.Call("phone", "Leopold", &result)
	fmt.Println(result)

	url = "http://www.pythonchallenge.com/pc/stuff/violin.php"
	httpClient := &http.Client {}
	req, err := http.NewRequest("POST", url, nil)
	req.Header.Set("Cookie", "info=the flowers are on their way")
	resp, err := httpClient.Do(req)
	if err != nil {
		fmt.Printf("do post err![%v]",err)
	}
	defer resp.Body.Close()
	data, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("post %s err![%v]", url,err)
	} else {
		fmt.Println(string(data))
	}
}
{{< /highlight >}}
        <pre><code>PS src\static> .\Code\Go\Challenge.exe -l 017</code></pre>
    </section>
</div>

---
## 最终结果： balloons

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/return/romance.html
[2]: http://www.pythonchallenge.com/pc/return/balloons.html

[a]: {{< ref "Challenge004.md" >}} "第四关攻略"
[b]: {{< ref "Challenge008.md" >}} "第八关攻略"
[c]: {{< ref "Challenge013.md" >}} "第十三关攻略"
[d]: {{< ref "Challenge015.md" >}} "第十五关攻略"

