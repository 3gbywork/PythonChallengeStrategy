package main

import(
	"fmt"
	"strings"
)

func (c *Challenge) Challenge010() {
	a:=[]string {"1"}
	for i := 0; i < 31; i++ {
		a=append(a, getNext(a[i]))
	}
	fmt.Println(len(a[30]))
}

func getNext(instr string) string {
	count:=0
	curch:=instr[0]
	var outstr strings.Builder

	for i := 0; i < len(instr); i++ {
		ch:=instr[i]
		if ch != curch {
			outstr.WriteString(fmt.Sprintf("%d%s",count,string(curch)))
			curch=ch
			count=1
		} else {
			count++
		}
	}
	outstr.WriteString(fmt.Sprintf("%d%s",count,string(curch)))

	return outstr.String()
}