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
	"bufio"
	"image"
	"image/png"
	"image/jpeg"
	"image/gif"
	"os/exec"
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

func EnsureDir(path string) {
	if !PathExists(path) {
		err := os.Mkdir(path, os.ModeDir)
		if err != nil {
			fmt.Printf("mkdir failed![%v]\n", err)
			os.Exit(1)
		}
	}
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

func OpenImage(filename string) image.Image {
	reader, err := os.Open(filename)
	if err != nil {
		fmt.Printf("open file failed![%v]\n", err)
		os.Exit(1)
	}
	defer reader.Close()

	im,_,err := image.Decode(reader)
	if err != nil {
		fmt.Printf("open png failed![%v]\n", err)
		os.Exit(1)
	}

	return im
}

func SaveImage(filename string, image *image.RGBA, format string) {
	img,err := os.Create(filename)
	if err != nil {
		fmt.Printf("创建图片文件失败！[%v]\n", err)
		os.Exit(1)
	}
	defer img.Close()
	writer := bufio.NewWriter(img)
	if format=="png" {
		err = png.Encode(writer, image)
	} else if format=="jpeg" {
		err = jpeg.Encode(writer, image, nil)
	} else if format=="gif" {
		err = gif.Encode(writer, image, nil)
	} else {
		fmt.Printf("不支持的图片格式！%s", format)
		os.Exit(2)
	}
	if err != nil {
		fmt.Printf("保存图片失败！[%v]\n", err)
		os.Exit(1)
	}
	err = writer.Flush()
	if err != nil {
		fmt.Printf("保存图片失败！[%v]\n", err)
		os.Exit(1)
	}
}

func ShowImage(filename string) {
	cmd := exec.Command("explorer.exe", filename)
	// [exit status 1] 故忽略
	_ = cmd.Run()
}