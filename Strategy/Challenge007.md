# [第7关][1] smarty

## [关卡地址][1]

这一关源代码中没有任何提示信息，看来信息都在图片中了。

![smarty][7]

图片中间位置有一条灰度图像，灰度图取值范围与ASCII码范围一致，所以可以将灰度值转换为ASCII码。小灰度条的宽度都是`7px`（除了第一条是`5px`）。需要注意灰度图与图片右边界有`21px`空白。

行动起来吧。

经过灰度值转换得到如下信息：

>smart guy, you made it. the next level is [105, 110, 116, 101, 103, 114, 105, 116, 121]

将列表中数值转换后就是下一关的地址了。

## 解决方案：

* [Python][2]

```
PS > python .\Code\Python\Challenge007.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge007.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 7
```

---
## 最终结果：integrity

## [下一关地址][5]

## [回首页][6]

[1]: http://www.pythonchallenge.com/pc/def/oxygen.html
[2]: ../Code/Python/Challenge007.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge007.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge007.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/integrity.html
[6]: ../README.md "回首页"
[7]: http://www.pythonchallenge.com/pc/def/oxygen.png "smarty"
