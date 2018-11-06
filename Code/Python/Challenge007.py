import helper
path=".\\Data\\007"
helper.ensuredir(path)

import urllib.request
img="http://www.pythonchallenge.com/pc/def/oxygen.png"
(filename, headers)=urllib.request.urlretrieve(img, path+"\\oxygen.png")

# python3图像处理库Pillow（friendly PIL fork）
# 文档地址：https://pillow.readthedocs.io/en/5.3.x/
from PIL import Image
im=Image.open(filename)
(w,h)=im.size
px=im.load()

outstr=[]
# 21px是灰度图右边空白的宽度
for i in range(0,w-21,7):
    (r,g,b,a)=px[i,h/2]
    # 灰度图r,g,b三个分量值相等
    outstr.append(chr(r))
msg=''.join(outstr)
print(msg)

import re
pattern=re.compile(r'[\d]+')

nextlevel=''.join(map(chr,map(int,pattern.findall(msg))))
print(nextlevel)