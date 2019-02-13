package main

import (
	"fmt"
	"strings"
)

func (c *Challenge) Challenge002()  {
	msg:=ReadFile(".\\Data\\002\\msg.txt")

	// go语言 遍历map时返回值是无序的，相同keys每次构建map时顺序都会变化，构建后多次遍历结果一致。
	dic:=map [rune] int {}
	outstr:=""
	// // 记录字符顺序
	// chars:=""

	// for _,ch := range msg {
	// 	_,exists:=dic[ch]
	// 	if (exists) {
	// 		continue
	// 	} else {
	// 		s:=string(ch)
	// 		chars+=s
	// 		dic[ch]=strings.Count(msg,s)
	// 	}
	// }

	// for _,ch := range chars {
	// 	value,exists:=dic[ch]
	// 	if (exists) {
	// 		if (value < 10) {
	// 			outstr+=string(ch)
	// 		}
	// 	}
	// }

	for _,ch := range msg {
		_,exists:=dic[ch]
		if (exists) {
			continue
		} else {
			s:=string(ch)
			count:=strings.Count(msg,s)
			dic[ch]=count
			if (count < 10) {
				outstr+=s
			}
		}
	}

	fmt.Println(outstr)
}