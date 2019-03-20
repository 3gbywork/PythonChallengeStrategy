package main

import(
	"fmt"
	"regexp"
	"net/http"
	"io/ioutil"
	"strings"
	"strconv"
	"github.com/kolo/xmlrpc"
)

func (c *Challenge) Challenge017() {
	url := "http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing="
	param := "12345"

	pattern := regexp.MustCompile("the next busynothing is (\\d+)")

	var cookie *http.Cookie
	outstr := ""
	for i := 0; i < 400; i++ {
		resp, err := http.Get(url+param)
		if err != nil {
			fmt.Printf("request %s%s err[%v]\n",url, param, err)
			break
		}
		defer resp.Body.Close()
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			fmt.Printf("request %s%s err[%v]\n",url, param, err)
			break
		}
		content := string(body)
		temParam:=pattern.FindStringSubmatch(content)
		if len(temParam) != 2 {
			fmt.Printf("param: %s, response: %s\n",param, content)
			if strings.Compare(content, "Yes. Divide by two and keep going.") == 0 {
				intParam, err := strconv.Atoi(param)
				if err == nil {
					param = string(intParam/2)
					continue
				}
			}
			break
		} else {
			param=temParam[1]
		}
		cookie = resp.Cookies()[0]
		outstr += cookie.Value
	}

	cookieFile := ".\\Data\\017\\cookie.bz2"
	msg := bz2Decode(cookieFile)
	fmt.Println(msg)

	client, err := xmlrpc.NewClient("http://www.pythonchallenge.com/pc/phonebook.php", nil)
	if err != nil {
		fmt.Println("Can't create client: ", err)
	}
	defer client.Close()
	var result string
	client.Call("phone", "Leopold", &result)
	fmt.Println(result)

	url = "http://www.pythonchallenge.com/pc/stuff/violin.php"
	httpClient := &http.Client {}
	req, err := http.NewRequest("POST", url, nil)
	req.Header.Set("Cookie", "info=the flowers are on their way")
	resp, err := httpClient.Do(req)
	if err != nil {
		fmt.Printf("do post err![%v]",err)
	}
	defer resp.Body.Close()
	data, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("post %s err![%v]", url,err)
	} else {
		fmt.Println(string(data))
	}
}