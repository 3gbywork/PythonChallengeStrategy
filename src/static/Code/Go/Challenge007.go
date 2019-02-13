package main

import (
	"fmt"
	"regexp"
	"strconv"
	_ "image/png"
)

func (c *Challenge) Challenge007() {
	path:=".\\Data\\007"
	EnsureDir(path)

	filename:=path+"\\oxygen.png"
	channel:="http://www.pythonchallenge.com/pc/def/oxygen.png"
	Download(channel,filename)

	im:=OpenImage(filename)

	bounds := im.Bounds()

	msg := ""
	y:=(bounds.Max.Y-bounds.Min.Y)/2
	for x:=bounds.Min.X; x<bounds.Max.X-21; x+=7 {
		r,_,_,_ := im.At(x,y).RGBA()
		msg+=string(byte(r))
	}

	fmt.Println(msg)

	pattern:=regexp.MustCompile("\\d+")
	matches:=pattern.FindAllString(msg, -1)

	outstr:=""
	for _,match := range matches {
		i,err:=strconv.Atoi(match)
		if err == nil {
			outstr+=string(byte(i))
		}
	}

	fmt.Println(outstr)
}