package main

import (
	"fmt"
	"archive/zip"
	"io/ioutil"
	"regexp"
)

func (c *Challenge) Challenge006() {
	path:=".\\Data\\006"
	EnsureDir(path)

	filename:=path+"\\channel.zip"
	channel:="http://www.pythonchallenge.com/pc/def/channel.zip"
	Download(channel,filename)

	rc,err:=zip.OpenReader(filename)
	if err != nil {
		fmt.Printf("open zip failed![%v]\n", err)
	}

	defer rc.Close()

	dic:=map [string] *zip.File {}
	for _,file := range rc.File {
		dic[file.Name]=file
	}

	outstr:=""
	pattern:=regexp.MustCompile("Next nothing is (\\d+)")
	name:="90052"
	for true {
		file,exists:=dic[name+".txt"]
		if exists {
			outstr+=file.Comment
			rc,err:=file.Open()
			if err == nil {
				defer rc.Close()
				bytes,err:=ioutil.ReadAll(rc)
				if err == nil {
					cnt:=string(bytes)
					matches:=pattern.FindStringSubmatch(cnt)
					if len(matches) != 2 {
						fmt.Printf("last: %s, cnt: %s\n", name, cnt)
						break
					} else {
						name=matches[1]
					}
				}
			}
		}
	}

	fmt.Println(outstr)
}