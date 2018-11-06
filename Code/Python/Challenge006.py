import helper
dir=".\\Data\\006"
helper.ensuredir(dir)

import urllib.request
channel="http://www.pythonchallenge.com/pc/def/channel.zip"
(filename, headers)=urllib.request.urlretrieve(channel, dir+"\\channel.zip")

import zipfile
zip=zipfile.ZipFile(filename)

import re
pattern=re.compile("Next nothing is (\\d+)")

entryname="90052"
outstr=[]
while True:
    name=entryname+".txt"
    cnt=zip.read(name).decode('utf-8')
    outstr.append(zip.getinfo(name).comment.decode('utf-8'))
    try:
        entryname=pattern.search(cnt).group(1)
    except:
        print("last: %s, cnt: %s" %(entryname, cnt))
        break

print(''.join(outstr))