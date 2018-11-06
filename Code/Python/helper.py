def readfile(filename):
    fp=open(filename)
    content=fp.read()
    fp.close()
    return content

def ensuredir(dir):
    import os
    if not os.path.exists(dir):
        os.mkdir(dir)