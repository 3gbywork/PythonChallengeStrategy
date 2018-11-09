# [第008关][1] working hard?

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

* [Python][2]

```
PS > python .\Code\Python\Challenge008.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge008.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 008
```

---
## 最终结果： username: huge, password: file

## [下一关地址][5]

## [上一关攻略][6] [回首页][7] [下一关攻略][8]

[1]: http://www.pythonchallenge.com/pc/def/integrity.html
[2]: ../Code/Python/Challenge008.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge008.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge008.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/good.html
[6]: ./Challenge007.md "上一关攻略"
[7]: ../README.md "回首页"
[8]: ./Challenge009.md "下一关攻略"
