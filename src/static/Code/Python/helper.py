def readFile(filename):
    fp=open(filename)
    content=fp.read()
    fp.close()
    return content

def ensureDir(dir):
    import os
    if not os.path.exists(dir):
        os.mkdir(dir)

def installHTTPBasicAuthOpener(user, passwd):
    import urllib.request
    auth_handler=urllib.request.HTTPBasicAuthHandler()
    auth_handler.add_password("inflate", "http://www.pythonchallenge.com", user, passwd)
    opener=urllib.request.build_opener(auth_handler)
    urllib.request.install_opener(opener)