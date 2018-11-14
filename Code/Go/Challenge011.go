package main

import(
	"fmt"
	"os"
	"bufio"
	"image"
	"image/color"
	"image/jpeg"
	"os/exec"
)

func (c *Challenge) Challenge011() {
	path:=".\\Data\\011"
	if !PathExists(path) {
		err := os.Mkdir(path, os.ModeDir)
		if err != nil {
			fmt.Printf("mkdir failed![%v]\n", err)
			return
		}
	}

	url:="http://www.pythonchallenge.com/pc/return/cave.jpg"
	filename:=path+"\\cave.jpg"
	DownloadWithBasicAuth(url, filename, "huge", "file")

	reader, err := os.Open(filename)
	if err != nil {
		fmt.Printf("open file failed![%v]\n", err)
		return
	}
	defer reader.Close()

	im,_,err := image.Decode(reader)
	if err != nil {
		fmt.Printf("open png failed![%v]\n", err)
		return
	}

	bounds := im.Bounds()

	whitecolor:=color.White
	rgba:=image.NewRGBA(bounds)
	for y := bounds.Min.Y; y < bounds.Max.Y; y++ {
		for x := bounds.Min.X; x < bounds.Max.X; x++ {
			if y%2==0 && x%2==1 {
				rgba.Set(x,y,whitecolor)
			} else if y%2==1 && x%2==0 {
				rgba.Set(x,y,whitecolor)
			} else {
				rgba.Set(x,y,im.At(x,y))
			}
		}
	}

	jpgfile := path+"\\cave.info.jpg"
	img,err := os.Create(jpgfile)
	if err != nil {
		fmt.Printf("创建图片文件失败！[%v]\n", err)
		os.Exit(1)
	}
	defer img.Close()
	writer := bufio.NewWriter(img)
	err = jpeg.Encode(writer, rgba, nil)
	if err != nil {
		fmt.Printf("保存图片失败！[%v]\n", err)
		os.Exit(1)
	}
	err = writer.Flush()
	if err != nil {
		fmt.Printf("保存图片失败！[%v]\n", err)
		os.Exit(1)
	}

	cmd := exec.Command("explorer.exe", jpgfile)
	_ = cmd.Run()
}