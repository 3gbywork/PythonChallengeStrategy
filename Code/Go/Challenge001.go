package main

import(
	"fmt"
	"strings"
)

func (c *Challenge) Challenge001()  {
	msg:=ReadFile("..\\Data\\001\\msg.txt")
	url:="map"

	fmt.Println(translate(msg))
	fmt.Println(translate(url))
}

func getChar(r rune) rune {
	// switch {
	// case r >= 'a' && r <= 'z':
	// 	return 'a' + (r-'a'+2)%26
	// }
	if (r >= 'a' && r <= 'z') {
		return 'a' + (r-'a'+2)%26
	}
	return r
}

func translate(instr string) string {
	return strings.Map(getChar, instr)
}