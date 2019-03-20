package main

import (
	"fmt"
	"strings"
	"regexp"
	"strconv"
)

func (c *Challenge) Challenge005()  {
	banner:="http://www.pythonchallenge.com/pc/def/banner.p"
	
	path:=".\\Data\\005"
	EnsureDir(path)

	filename:=path+"\\banner.p"
	Download(banner,filename)

	content:=ReadFile(filename)
	lines:=strings.Split(content,"\n")

	reln:=regexp.MustCompile("aa")
	renum:=regexp.MustCompile("^I([0-9]*)")
	rechsharp:=regexp.MustCompile("S'#'|g6")
	rechspace:=regexp.MustCompile("S' '|g2")

	ch:=" "

	for index := 0; index < len(lines); index++ {
		if reln.MatchString(lines[index]) {
			fmt.Printf("\n")
			continue
		}
		if rechsharp.MatchString(lines[index]) {
			ch="#"
			continue
		}
		if rechspace.MatchString(lines[index]) {
			ch=" "
			continue
		}
		matches:=renum.FindStringSubmatch(lines[index])
		if matches != nil {
			num,err:=strconv.Atoi(matches[1])
			if err == nil {
				for i:=0; i<num; i++ {
					fmt.Printf(ch)
				}
			}
			continue
		}
	}
}