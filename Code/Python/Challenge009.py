import helper

firststr=helper.readFile(".\\Data\\009\\first.txt")
secondstr=helper.readFile(".\\Data\\009\\second.txt")

firstlist=[int(x.strip()) for x in firststr.split(',')]
secondlist=[int(x.strip()) for x in secondstr.split(',')]

import turtle
import tkinter

tk=tkinter.Tk()
tk.title("Challenge009")
canvas=tkinter.Canvas(tk, width=500, height=500)
canvas.pack(expand=1,fill="both")
pen=turtle.RawPen(canvas)
pen.hideturtle()

def drawPoints(plist):
    points=list(map(lambda x: (x[0]-250, 250-x[1]), zip(plist[::2], plist[1::2])))
    pen.up()
    pen.goto(points[0])
    pen.down()
    for x,y in points:
        pen.goto(x,y)

drawPoints(firstlist)
drawPoints(secondlist)
tk.mainloop()