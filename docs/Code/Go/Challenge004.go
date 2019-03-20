package main

import (
	"fmt"
	"net/http"
	"io/ioutil"
	"regexp"
	"strings"
	"strconv"
)

func (c *Challenge) Challenge004() {
	url:="http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="
	param:="12345"

	pattern:=regexp.MustCompile("the next nothing is (\\d+)")

	for i:=0; i<400; i++ {
		resp := httpGet(url+param)
		tmpParam:=pattern.FindStringSubmatch(resp)
		if len(tmpParam) != 2 {
			fmt.Printf("param: %s, response: %s\n",param, resp)
			if strings.Compare(resp,"Yes. Divide by two and keep going.") == 0 {
				intParam,err := strconv.Atoi(param)
				if err == nil {
					param = string(intParam/2)
					continue
				}
			}
			break
		} else {
			param=tmpParam[1]
		}
	}

	fmt.Println("completed")
}

func httpGet(url string) string {
	resp, err := http.Get(url)
	if err == nil {
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err == nil {
			return string(body)
		}
	}
	return ""
}