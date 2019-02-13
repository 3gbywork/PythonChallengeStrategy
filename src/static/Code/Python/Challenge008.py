# ================================
# 写bz2文件，可以使用7zip直接查看
def makeBz2(filename, data):
    fp=open(filename, 'wb')
    fp.write(data)
    fp.close()

import helper
dir=".\\Data\\008"
helper.ensureDir(dir)

un=b'BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
pw=b'BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'

makeBz2(dir+'\\user.bz2', un)
makeBz2(dir+'\\pwd.bz2', pw)
# ================================

import codecs

username=codecs.decode(un, 'bz2').decode('utf-8')
password=codecs.decode(pw, 'bz2').decode('utf-8')
# or
# username=codecs.decode(open(dir+'\\user.bz2','rb').read(), 'bz2').decode('utf-8')
# password=codecs.decode(open(dir+'\\pwd.bz2','rb').read(), 'bz2').decode('utf-8')

print('username: %s\npassword: %s' % (username, password))