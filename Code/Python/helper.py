def readFile(filename):
    fp=open(filename)
    content=fp.read()
    fp.close()
    return content

def ensureDir(dir):
    import os
    if not os.path.exists(dir):
        os.mkdir(dir)