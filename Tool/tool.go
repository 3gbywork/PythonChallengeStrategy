package main

import (
	"fmt"
	"os"
	"strconv"
	"io/ioutil"
	"strings"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Printf("usage: %s xxx\n", os.Args[0])
		return
	}

	level,err:=strconv.Atoi(os.Args[1])
	if err != nil || level < 0 || level > 39 {
		fmt.Printf("关卡数应是小于40的自然数\n")
		return
	}

	levelStr:=os.Args[1]

	mdfile:=fmt.Sprintf("./Strategy/Challenge%03s.md", levelStr)
    mdtemplate:="./Tool/Template/ChallengeTemplate.md"
    createFileFromTemplate(mdtemplate, mdfile, levelStr)

    ps1file:=fmt.Sprintf("./Code/PowerShell/Challenge%03s.ps1", levelStr)
    createFileIfNotExists(ps1file)

    pyfile:=fmt.Sprintf("./Code/Python/Challenge%03s.py", levelStr)
    createFileIfNotExists(pyfile)

    gofile:=fmt.Sprintf("./Code/Go/Challenge%03s.go", levelStr)
    gotemplate:="./Tool/Template/Go.template"
	createFileFromTemplate(gotemplate, gofile, levelStr)
	
	fmt.Println("welcome to generate tool.")
}

func createFileIfNotExists(filename string) {
	if fileExists(filename) {
		fmt.Printf("文件 %s 已存在。\n", filename)
	} else {
		file,err:=os.Create(filename)
		if err != nil {
			fmt.Printf("创建文件 %s 失败！[%v]\n", filename, err)
			return
		}
		defer file.Close()

		fmt.Printf("文件 %s 已成功创建\n", filename)
	}
}

func createFileFromTemplate(template, filename, level string) {
	if fileExists(template) {
		if fileExists(filename) {
			fmt.Printf("文件 %s 已存在。\n", filename)
		} else {
			cnt:=readFile(template)
			cnt=strings.Replace(cnt, "{#}", level, -1)
			cnt=strings.Replace(cnt, "{###}", fmt.Sprintf("%03s", level), -1)

			file,err:=os.Create(filename)
			if err != nil {
				fmt.Printf("创建文件 %s 失败！[%v]\n", filename, err)
				return
			}
			defer file.Close()
			_,ferr:=file.WriteString(cnt)
			if ferr != nil {
				fmt.Printf("写入文件 %s 失败！[%v]\n", filename, ferr)
			}

			fmt.Printf("文件 %s 已成功创建\n", filename)
		}
	} else {
		fmt.Printf("模板文件 %s 不存在，无法创建文件 %s\n", template, filename)
	}
}

func fileExists(filename string) bool {
	_, err := os.Stat(filename)
	if err == nil {
		return true
	}
	if os.IsNotExist(err) {
		return false
	}
	return false
}

func readFile(filename string) string {
	content, err := ioutil.ReadFile(filename)
	if err != nil {
		return ""
	}

	return string(content)
}