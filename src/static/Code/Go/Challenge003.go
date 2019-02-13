package main

import (
	"fmt"
	"regexp"
)

func (c *Challenge) Challenge003() {
	msg:=ReadFile(".\\Data\\003\\msg.txt")

	pattern:=regexp.MustCompile("[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]")

	// 返回一个二维数组
	matches:=pattern.FindAllStringSubmatch(msg,-1)

	outstr:=""
	for _,ch := range matches {
		outstr+=ch[1]
	}

	fmt.Println(outstr)
}