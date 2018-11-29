import helper
path=".\\Data\\014"
helper.ensureDir(path)

# ================================
# 使用http认证，下载文件
import urllib.request
helper.installHTTPBasicAuthOpener("huge", "file")

wire="http://www.pythonchallenge.com/pc/return/wire.png"
(filename, headers)=urllib.request.urlretrieve(wire, path+"\\wire.png")
# ================================

from PIL import Image
im=Image.open(filename)
# px=im.load()
# (w,h)=im.size

def officialSolution():
    tmp=spiral(im)
    tmp.close()

def mySolution():
    tmp=efficientSpiral(im)
    tmp.close()

def efficientSpiral(source):
    px=source.load()
    newIm=Image.new(source.mode, (100,100))
    newPx=newIm.load()
    hLines,vLines=0,0
    xStep,yStep=1,0
    length=100
    x,y,index=0,0,0
    while index<10000:
        if length==0:
            break
        for i in range(length):
            newPx[(x+i*xStep,y+i*yStep)]=px[(index+i,0)]
        index+=length
        x+=xStep*(length-1)
        y+=yStep*(length-1)
        if xStep==1 or xStep==-1:
            hLines+=1
            length=100-hLines
        else:
            vLines+=1
            length=100-vLines
        if xStep==1:
            xStep=0
            yStep=1
        elif yStep==1:
            yStep=0
            xStep=-1
        elif xStep==-1:
            xStep=0
            yStep=-1
        elif yStep==-1:
            yStep=0
            xStep=1
    # wrong curve
    # for j in range(100):
    #     for i in range(100):
    #         newPx[(i,j)]=px[(j*100+i,0)]
    # newIm.save(path+"\\out.png")
    # newIm.show()
    return newIm

def spiral(source):
    px=source.load()
    target = Image.new(source.mode, (100, 100))
    targetPx = target.load()
    left, top, right, bottom = (0, 0, 99, 99)
    x, y = 0, 0
    dirx, diry = 1, 0
    for i in range(10000):
        # target.putpixel((x, y), source.getpixel((i, 0)))
        targetPx[(x,y)]=px[(i,0)]
        if dirx == 1 and x == right:
            dirx, diry = 0, 1
            top += 1
        elif dirx == -1 and x == left:
            dirx, diry = 0, -1
            bottom -= 1
        elif diry == 1 and y == bottom:
            dirx, diry = -1, 0
            right -= 1
        elif diry == -1 and y == top:
            dirx, diry = 1, 0
            left += 1
        x += dirx
        y += diry
    return target

# 与官方wiki中解法效率对比
# 使用*Image.load()得到像素数据，对此进行操作 比 使用*Image.getpixel和*Image.putpixel效率高
if __name__ == "__main__":
    # from timeit import Timer
    # t1=Timer("officialSolution()", "from __main__ import officialSolution")
    # t2=Timer("mySolution()", "from __main__ import mySolution")
    # print(t1.timeit(1000))
    # print(t2.timeit(1000))
    newIm=efficientSpiral(im)
    # newIm.save(path+"\\out.png")
    newIm.show()
    newIm.close()
    im.close()