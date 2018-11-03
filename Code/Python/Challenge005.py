banner="http://www.pythonchallenge.com/pc/def/banner.p"

import urllib.request

import os
if not os.path.exists(".\\Data\\005"):
    os.mkdir(".\\Data\\005")

(filename,headers)=urllib.request.urlretrieve(banner,'.\\Data\\005\\banner.p')

import pickle

data=pickle.Unpickler(open(filename,'rb')).load()

# print(data)

for line in data:
    for tupleitem in line:
        print(tupleitem[0]*tupleitem[1],end='')
    print('')

# ================================
# without pickle
fp=open(filename,'r')
lines=fp.readlines()
fp.close()

import re
reln=re.compile('aa')
renum=re.compile('^I([0-9]*)')
rechsharp=re.compile("S'#'|g6")
rechspace=re.compile("S' '|g2")

for line in lines:
    if reln.search(line) != None:
        print('\n',end='')
        continue
    if rechsharp.search(line) != None:
        ch='#'
        continue
    if rechspace.search(line) != None:
        ch=' '
        continue
    if renum.search(line) != None:
        num=renum.search(line).group(1)
        print(ch*int(num),end='')
        continue
# ================================