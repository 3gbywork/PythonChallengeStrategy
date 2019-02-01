---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
keywords: []
description: ""
tags: []
categories: []

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

### 代码：

* [Python][2]

```
PS > python .\Code\Python\{{ .Name }}.py
```

* [PowerShell][3]

```
PS > .\Code\PowerShell\{{ .Name }}.ps1
```

* [Go][4]

```
PS > .\Code\Go\Challenge.exe -l {{ replace .Name "Challenge" "" }}
```

---
## 最终结果： result

## [下一关地址][5]

[1]: http://www.pythonchallenge.com/pc/def/current.html
[2]: ../Code/Python/{{ .Name }}.py "点我查看源码"
[3]: ../Code/PowerShell/{{ .Name }}.ps1 "点我查看源码"
[4]: ../Code/Go/{{ .Name }}.go "点我查看源码"
[5]: http://www.pythonchallenge.com/pc/def/next.html
