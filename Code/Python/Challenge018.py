import helper
path=".\\Data\\018"
helper.ensureDir(path)

# ================================
# 使用http认证，下载文件
import urllib.request
helper.installHTTPBasicAuthOpener("huge", "file")

gif="http://www.pythonchallenge.com/pc/return/deltas.gz"
(filename, headers)=urllib.request.urlretrieve(gif, path+"\\deltas.gz")
# ================================

import gzip
with gzip.open(filename) as gz:
    lines=gz.readlines()
    
file1=[str(line)[2:55] for line in lines]
file2=[str(line)[58:111] for line in lines]

import difflib
d=difflib.Differ()
rst=list(d.compare(file1, file2))

# 查看比较结果
# tmp=path+"\\compare.txt"
# fp=open(tmp, 'w')
# fp.write(''.join(rst))
# fp.close()
# from pprint import pprint
# pprint(rst)

pngs=[''.join(filter(lambda l: l[0]==c, rst)) for c in ' -+']

import binascii
for i in range(len(pngs)):
    png=pngs[i].replace(' ','').replace('\\n','').replace('\'','').replace('+','').replace('-','')
    # print(png)
    open('%s\\delta%d.png' % (path,i), 'wb').write(binascii.unhexlify(png))