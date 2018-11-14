package main

import (
	"fmt"
	"flag"
	"strconv"
	"reflect"
	"io/ioutil"
	"os"
	"net/http"
	"io"
)

var level = flag.Int("l",-1,"int类型关卡数")

func main() {
	flag.Parse()
	
	if (*level < 0) {
		fmt.Println("请输入非负关卡数")
		return
	}

	funcName:=fmt.Sprintf("Challenge%03s", strconv.Itoa(*level))

	// ================反射函数================
	// funcs:=map [string] func() { 
	// 	"Challenge000":Challenge000,
	// 	"Challenge001":Challenge001,
	// }
	// v:=reflect.ValueOf(funcs[funcName])
	// v.Call(nil)
	// ================反射函数================

	// **函数与方法区别**
	// 方法是对象的一种行为

	// ================反射方法================
	c:=&Challenge{}

	cv:=reflect.ValueOf(&c).Elem()
	// or
	// cv:=reflect.ValueOf(c)

	cv.MethodByName(funcName).Call(nil)
	// ================反射方法================
}

type Challenge struct {
	
}

// ********************************
// 帮助函数
// ********************************
func ReadFile(file string) string {
	content, err := ioutil.ReadFile(file)
	if err != nil {
		return ""
	}

	return string(content)
}

func PathExists(path string) bool {
	_, err := os.Stat(path)
	if err == nil {
		return true
	}
	if os.IsNotExist(err) {
		return false
	}
	return false
}

func Download(url, filename string) {
	resp, err := http.Get(url)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()
	file, err := os.Create(filename)
	if err != nil {
		panic(err)
	}
	io.Copy(file, resp.Body)
}

func DownloadWithBasicAuth(url, filename, user, pwd string) {
	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		panic(err)
	}
	req.SetBasicAuth(user, pwd)

	client := &http.Client{};
	resp, err := client.Do(req)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	file, err := os.Create(filename)
	if err != nil {
		panic(err)
	}
	io.Copy(file, resp.Body)
}