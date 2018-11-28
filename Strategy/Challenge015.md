# [第015关][1] whom?

## [关卡地址][1]

## 解决方案：

### 思路：

![whom?][a]

解释下这个日历，顶部是月份、年份，中间是当月日历，底部分别是上个月与下个月的缩略图

在源代码有两条提示：

> he ain't the youngest, he is the second 

> todo: buy flowers for tomorrow 

1月26日日程：为明天买花。说明1**6年1月27日是一个值得纪念的日子。

从图中右下角可以看到，2月份有29号，说明那一年是闰年。

根据以上信息，年份需满足以下条件：

1. 闰年
2. 年份最后一位是6
3. 该年1月1日是星期四
4. 所有满足条件的倒数第二个年份

注：如果起始年份为闰年（如1016、1996），则年份步进可选为10与4的最小公倍数20。否则年份步进应为10。

最后得到的年份是1756年。

1756年1月27日，奥地利音乐大师莫扎特诞生。

### 代码：

* [Python][2]

```
PS > python .\Code\Python\Challenge015.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge015.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 015
```

---
## 最终结果： mozart

## [下一关地址][5]

## [上一关攻略][6] [回首页][7] [下一关攻略][8]

[1]: http://www.pythonchallenge.com/pc/return/uzi.html
[2]: ../Code/Python/Challenge015.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge015.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge015.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/return/mozart.html
[6]: ./Challenge014.md "上一关攻略"
[7]: ../README.md "回首页"
[8]: ./Challenge016.md "下一关攻略"

[a]: ../Image/015/screen15.jpg "whom?"
