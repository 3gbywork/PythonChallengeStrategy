url='http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing='
param='12345'

import urllib.request
import http.cookiejar
cj=http.cookiejar.CookieJar()
cookie_handler=urllib.request.HTTPCookieProcessor(cj)
opener=urllib.request.build_opener(cookie_handler)
urllib.request.install_opener(opener)

import re
pattern=re.compile("the next busynothing is (\\d+)")

outstr=[]
for i in range(400):
    resp=urllib.request.urlopen(url+param)
    cnt=resp.read().decode('utf-8')
    # print("request %4d url: %s\nresponse: %s" %(i,url+param,cnt))
    outstr.append(list(cj)[0].value)
    
    try:
        param=pattern.search(cnt).group(1)
    except:
        print("param %s, response: %s" %(param,cnt))
        if cnt == "Yes. Divide by two and keep going.":
            try:
                tmpParam=str(int(int(param)/2))
                param=tmpParam
                continue
            except:
                break
        break
cookieStr=''.join(outstr)
print(cookieStr)

# cookieStr='BZh91AY%26SY%94%3A%E2I%00%00%21%19%80P%81%11%00%AFg%9E%A0+%00hE%3DM%B5%23%D0%D4%D1%E2%8D%06%A9%FA%26S%D4%D3%21%A1%EAi7h%9B%9A%2B%BF%60%22%C5WX%E1%ADL%80%E8V%3C%C6%A8%DBH%2632%18%A8x%01%08%21%8DS%0B%C8%AF%96KO%CA2%B0%F1%BD%1Du%A0%86%05%92s%B0%92%C4Bc%F1w%24S%85%09%09C%AE%24%90'

import codecs
import urllib.parse
info=urllib.parse.unquote_to_bytes(cookieStr.replace('+','%20'))
msg=codecs.decode(info,'bz2').decode('utf-8')
print(msg)

import xmlrpc.client
serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"
serverProxy=xmlrpc.client.ServerProxy(serverUrl)
print(serverProxy.phone('Leopold'))

url='http://www.pythonchallenge.com/pc/stuff/violin.php'
cookie=list(cj)[0]
cookie.value="the flowers are on their way"
cj.set_cookie(cookie)

resp=urllib.request.urlopen(url).read().decode('utf-8')
print(resp)