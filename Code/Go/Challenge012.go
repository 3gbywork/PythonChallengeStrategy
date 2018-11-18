package main

import(
	"os"
	"fmt"
	"io/ioutil"
	"bytes"
)

func (c *Challenge) Challenge012() {
	path:=".\\Data\\012"
	if !PathExists(path) {
		err := os.Mkdir(path, os.ModeDir)
		if err != nil {
			fmt.Printf("mkdir failed![%v]\n", err)
			return
		}
	}

	gfx:="http://www.pythonchallenge.com/pc/return/evil2.gfx"
	filename:=path+"\\evil2.gfx"
	DownloadWithBasicAuth(gfx, filename, "huge", "file")

	evil4:="http://www.pythonchallenge.com/pc/return/evil4.jpg"
	DownloadWithBasicAuth(evil4, path+"\\evil4.jpg", "huge", "file")

	cnt, err := ioutil.ReadFile(filename)
	if err != nil {
		fmt.Printf("read file failed![%v]\n", err)
		return
	}

	exts :=[]string {"jpg","png","gif","png","jpg"}
	for i := 0; i < 5; i++ {
		outfile := fmt.Sprintf("%s\\out%d.%s", path, i, exts[i])
		var builder bytes.Buffer
		for j := i; j < len(cnt); j+=5 {
			builder.WriteByte(cnt[j])
		}
		err := ioutil.WriteFile(outfile, builder.Bytes(), 0666)
		if err != nil {
			fmt.Printf("write file failed![%v]\n", err)
			return
		}
	}
}