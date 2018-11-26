# [第014关][1] walk around

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

* [Python][2]

```
PS > python .\Code\Python\Challenge014.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge014.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 014
```

---
## 最终结果： uzi

## [下一关地址][5]

## [上一关攻略][6] [回首页][7] [下一关攻略][8]

[1]: http://www.pythonchallenge.com/pc/return/italy.html
[2]: ../Code/Python/Challenge014.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge014.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge014.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/uzi.html
[6]: ./Challenge013.md "上一关攻略"
[7]: ../README.md "回首页"
[8]: ./Challenge015.md "下一关攻略"
