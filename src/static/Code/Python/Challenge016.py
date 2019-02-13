import helper
path=".\\Data\\016"
helper.ensureDir(path)

# ================================
# 使用http认证，下载文件
import urllib.request
helper.installHTTPBasicAuthOpener("huge", "file")

gif="http://www.pythonchallenge.com/pc/return/mozart.gif"
(filename, headers)=urllib.request.urlretrieve(gif, path+"\\mozart.gif")
# ================================

from PIL import Image
im=Image.open(filename)
px=im.load()

newIm=Image.new(im.mode, im.size)
newPx=newIm.load()

(w,h)=im.size
for y in range(h):
    for x in range(w):
        if px[x,y] == 195:
            for xx in range(w):
                newPx[xx,y]=px[(xx+x)%w,y]
            continue

im.close()
newIm.show()
newIm.close()