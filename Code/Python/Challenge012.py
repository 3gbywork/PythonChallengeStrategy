import helper
path=".\\Data\\012"
helper.ensureDir(path)

# ================================
# 使用http认证，下载文件
import urllib.request
helper.installHTTPBasicAuthOpener("huge", "file")

gfx="http://www.pythonchallenge.com/pc/return/evil2.gfx"
(filename, headers)=urllib.request.urlretrieve(gfx, path+"\\evil2.gfx")

evil4="http://www.pythonchallenge.com/pc/return/evil4.jpg"
urllib.request.urlretrieve(evil4, path+"\\evil4.jpg")
# ================================

filename=path+"\\evil2.gfx"
# ================================
# 输出文件头
# fp=open(filename,'rb')
# cnt=fp.read(16*7-2)
# fp.close()

# for i in range(5):
#     print(cnt[i::5])
# ================================

fp=open(filename,'rb')
cnt=fp.read()
fp.close()

exts=["jpg","png","gif","png","jpg"]
for i in range(5):
    fp=open(path+"\\out%d.%s" % (i, exts[i]),'wb')
    fp.write(cnt[i::5])
    fp.close()

print("please see the folder: ", path)