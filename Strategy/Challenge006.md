# [第6关][1] now there are pairs

## [关卡地址][1]

图片没有提供任何有用的信息。查看源代码得到如下信息：

><-- zip 

额，更改url可以得到一个压缩文件。

打开压缩文件，找到`readme.txt`文件，内容如下：

>welcome to my zipped list. 
> 
>hint1: start from 90052  
>hint2: answer is inside the zip

按照提示按顺序读取文件，最后得到的内容是：

>Collect the comments.

从comments中得到的信息是：

```
****************************************************************
****************************************************************
**                                                            **
**   OO    OO    XX      YYYY    GG    GG  EEEEEE NN      NN  **
**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE  NN    NN   **
**   OO    OO XXX  XXX YYY   YY  GG GG     EE       NN  NN    **
**   OOOOOOOO XX    XX YY        GGG       EEEEE     NNNN     **
**   OOOOOOOO XX    XX YY        GGG       EEEEE      NN      **
**   OO    OO XXX  XXX YYY   YY  GG GG     EE         NN      **
**   OO    OO  XXXXXX   YYYYYY   GG   GG   EEEEEE     NN      **
**   OO    OO    XX      YYYY    GG    GG  EEEEEE     NN      **
**                                                            **
****************************************************************
 **************************************************************
```

所以下一关地址是：hockey？？？

错！访问这个地址你会得到如下内容：

>it's in the air. look at the letters. 

好吧，原来是`oxygen`

## 解决方案：

* [Python][2]

```
PS > python .\Code\Python\Challenge006.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\Challenge006.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l 6
```

---
## 最终结果：oxygen

## [下一关地址][5]

## [回首页][6]

[1]: http://www.pythonchallenge.com/pc/def/channel.html
[2]: ../Code/Python/Challenge006.py "点我查看源码"
[3]: ../Code/PowerShell/Challenge006.ps1 "点我查看源码"
[4]: ../Code/Go/Challenge006.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/oxygen.html
[6]: ../README.md "回首页"
