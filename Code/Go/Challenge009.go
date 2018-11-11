package main

import(
	"fmt"
	"image"
	"image/color"
	"image/draw"
	"image/png"
	"strings"
	"strconv"
	"os"
	"bufio"
	"os/exec"
)

func (c *Challenge) Challenge009() {
	firststr := ReadFile(".\\Data\\009\\first.txt")
	secondstr := ReadFile(".\\Data\\009\\second.txt")

	bg := image.White
	pen := color.Black

	rgba :=  image.NewRGBA(image.Rect(0, 0, 500, 500))
	draw.Draw(rgba, rgba.Bounds(), bg, image.ZP, draw.Over)

	firstline := getPoints(firststr)
	secondline := getPoints(secondstr)

	drawPoints(rgba, pen, firstline)
	drawPoints(rgba, pen, secondline)

	pngfile := ".\\Data\\009\\go.png"
	img,err := os.Create(pngfile)
	if err != nil {
		fmt.Printf("创建图片文件失败！[%v]\n", err)
		os.Exit(1)
	}
	defer img.Close()
	writer := bufio.NewWriter(img)
	err = png.Encode(writer, rgba)
	if err != nil {
		fmt.Printf("保存图片失败！[%v]\n", err)
		os.Exit(1)
	}
	err = writer.Flush()
	if err != nil {
		fmt.Printf("保存图片失败！[%v]\n", err)
		os.Exit(1)
	}

	cmd := exec.Command("explorer.exe", pngfile)
	_ = cmd.Run()
	// [exit status 1]
	// if err != nil {
	// 	fmt.Printf("显示图片失败！[%v]\n", err)
	// 	os.Exit(1)
	// }
}

func getPoints(str string) []image.Point {
	var points []image.Point
	strlist := strings.Split(str, ",")
	for i := 0; i < len(strlist); i+=2 {
		x,_ := strconv.Atoi(strings.Trim(strlist[i], "\r\n "))
		y,_ := strconv.Atoi(strings.Trim(strlist[i+1], "\r\n "))
		points = append(points, image.Pt(x,y))
	}

	return points
}

func drawPoints(rgba *image.RGBA, color color.Color, points []image.Point) {
	for i := 0; i < len(points)-1; i++ {
		drawLine(points[i].X, points[i].Y, points[i+1].X, points[i+1].Y, rgba, color)
	}
}

func drawLine(x0, y0, x1, y1 int, rgba *image.RGBA, color color.Color) {
	dx := abs(x1 - x0)
	dy := abs(y1 - y0)

	sx, sy := 1, 1
	if x0>=x1 {
		sx = -1
	}
	if y0>=y1 {
		sy = -1
	}
	err := dx-dy

	for {
		rgba.Set(x0, y0, color)
		if x0 == x1 && y0 == y1 {
			return
		}
		e2 := err * 2
		if e2 > -dy {
			err -= dy
			x0 += sx
		}
		if e2 < dx {
			err += dx
			y0 += sy
		}
	}
}

func abs(x int) int {
	if x>=0 {
		return x
	} else {
		return -x
	}
}