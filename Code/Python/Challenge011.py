import helper
path=".\\Data\\011"
helper.ensureDir(path)

# ================================
# 使用http认证，下载图片
import urllib.request
auth_handler=urllib.request.HTTPBasicAuthHandler()
auth_handler.add_password("inflate", "http://www.pythonchallenge.com", "huge", "file")
opener=urllib.request.build_opener(auth_handler)
urllib.request.install_opener(opener)

cave="http://www.pythonchallenge.com/pc/return/cave.jpg"
(filename, headers)=urllib.request.urlretrieve(cave, path+"\\cave.jpg")
# ================================

# filename=path+"\\cave.jpg"

from PIL import Image
im=Image.open(filename)
px=im.load()
(w,h)=im.size

# ================================
# 输出像素文件
# outstr=[]
# for y in range(h):
#     for x in range(w):
#         outstr.append(str(px[x,y]))
#     outstr.append('\n')
# fp=open(path+'\\cave.txt','w',encoding='utf-8')
# fp.write(''.join(outstr))
# fp.close()
# ================================

pixel=(255,255,255)
for y in range(h):
    for x in range(w):
        p=(x,y)
        if y%2 == 0 and x%2 == 1:
            px[p]=pixel
        elif y%2 == 1 and x%2 == 0:
            px[p]=pixel
im.save(path+'\\cave.info.jpg','jpeg')
im.show()