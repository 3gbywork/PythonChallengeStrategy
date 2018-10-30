url='http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing='
param='12345'

import urllib.request
import re

pattern=re.compile("the next nothing is (\\d+)")

for i in range(400):
    # print("request %4d url: %s " %(i,url+param))
    resp=urllib.request.urlopen(url+param).read().decode('utf-8')
    try:
        param=pattern.search(resp).group(1)
    except:
        print("param %s, response: %s" %(param,resp))
        if resp == "Yes. Divide by two and keep going.":
            try:
                tmpParam=str(int(int(param)/2))
                param=tmpParam
                continue
            except:
                break
        break

print('completed')