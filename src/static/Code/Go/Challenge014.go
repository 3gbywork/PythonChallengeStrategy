package main

import(
	"image"
)

func (c *Challenge) Challenge014() {
	path:=".\\Data\\014"
	EnsureDir(path)

	wire:="http://www.pythonchallenge.com/pc/return/wire.png"
	filename:=path+"\\wire.png"
	DownloadWithBasicAuth(wire, filename, "huge", "file")

	im:=OpenImage(filename)

	newImg:=efficientSpiral(im)

	pngfile := path+"\\wire.go.png"
	SaveImage(pngfile, newImg, "png")
	
	ShowImage(pngfile)
}

func efficientSpiral(im image.Image) *image.RGBA {
	newImg:=image.NewRGBA(image.Rect(0,0,100,100))
	hLines,vLines:=0,0
    xStep,yStep:=1,0
    length:=100
	x,y,index:=0,0,0
	for ; index < 10000; {
        if length==0 {
            break
		}
		for i := 0; i < length; i++ {
			newImg.Set(x+i*xStep,y+i*yStep,im.At(index+i,0))
		}
        index+=length
        x+=xStep*(length-1)
        y+=yStep*(length-1)
        if xStep==1 || xStep==-1 {
			hLines+=1
            length=100-hLines
		} else {
			vLines+=1
            length=100-vLines
		}

        if xStep==1 {
			xStep=0
            yStep=1
		} else if yStep==1 {
			yStep=0
            xStep=-1
		} else if xStep==-1 {
			xStep=0
            yStep=-1
		} else if yStep==-1 {
			yStep=0
			xStep=1
		}
	}

	return newImg
}