package main

import(
	"image"
	"image/color"
)

func (c *Challenge) Challenge011() {
	path:=".\\Data\\011"
	EnsureDir(path)

	url:="http://www.pythonchallenge.com/pc/return/cave.jpg"
	filename:=path+"\\cave.jpg"
	DownloadWithBasicAuth(url, filename, "huge", "file")

	im:=OpenImage(filename)

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
	SaveImage(jpgfile, rgba, "jpeg")

	ShowImage(jpgfile)
}