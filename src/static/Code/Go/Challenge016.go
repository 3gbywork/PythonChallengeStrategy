package main

import(
	"image"
)

func (c *Challenge) Challenge016() {
	path:=".\\Data\\016"
	EnsureDir(path)

	gif:="http://www.pythonchallenge.com/pc/return/mozart.gif"
	filename:=path+"\\mozart.gif"
	DownloadWithBasicAuth(gif, filename, "huge", "file")

	im:=OpenImage(filename)

	newImg:=straightImage(im)

	giffile := path+"\\mozart.go.gif"
	SaveImage(giffile, newImg, "gif")
	
	ShowImage(giffile)
}

func straightImage(im image.Image) *image.RGBA {
	bounds:=im.Bounds()
	newImg:=image.NewRGBA(bounds)
	for y := bounds.Min.Y; y < bounds.Max.Y; y++ {
		for x := bounds.Min.X; x < bounds.Max.X; x++ {
			r,g,b,_:=im.At(x,y).RGBA()
			if r==65535 && g==0 && b==65535 {
				for xx := bounds.Min.X; xx < bounds.Max.X; xx++ {
					newImg.Set(xx,y,im.At((xx+x)%bounds.Dx(),y))
				}
				continue
			}
		}
	}
	return newImg
}