# [第010关][1] what are you looking at?

## [关卡地址][1]

## 解决方案：

### 思路：

图片中的牛说：“你瞅啥？”，然后你说：“瞅你咋地，不光瞅你还打你呢”。（皮一下很开心😝）。然后（点击它）会得到一个`sequence.txt`文件，内容如下：

>a = [1, 11, 21, 1211, 111221,

求`len(a[30]) = ?`

规律是这样的：

1. 第一个元素： 1
2. 第二个元素： 11      （表示1个1）
3. 第三个元素： 21      （表示2个1）
4. 第四个元素： 1211    （表示1个2，1个1）
5. 第五个元素： 111221  （表示1个1，1个2，2个1）

可以看出，这是一个简单的字符统计程序

### 代码：

* [Python][2]

```
PS > python .\Code\Python\Challenge010.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge010.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 010
```

---
## 最终结果： 5808

## [下一关地址][5]

## [上一关攻略][6] [回首页][7] [下一关攻略][8]

[1]: http://www.pythonchallenge.com/pc/return/bull.html
[2]: ../Code/Python/Challenge010.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge010.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge010.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/5808.html
[6]: ./Challenge009.md "上一关攻略"
[7]: ../README.md "回首页"
[8]: ./Challenge011.md "下一关攻略"
