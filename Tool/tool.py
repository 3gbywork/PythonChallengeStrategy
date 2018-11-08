import os
import sys
import codecs

def main(args):
    if len(args) != 2:
        printhelp(args[0])
        sys.exit(1)
    
    level=int(args[1])
    if level < 0 or level > 39:
        print("关卡数应是小于40的自然数")
        sys.exit(2)
    
    mdfile="./Strategy/Challenge%03d.md" % (level)
    mdtemplate="./Tool/Template/ChallengeTemplate.md"
    createfilefromtemplate(mdtemplate, mdfile, level)

    ps1file="./Code/PowerShell/Challenge%03d.ps1" % (level)
    createfileifnotexists(ps1file)

    pyfile="./Code/Python/Challenge%03d.py" % (level)
    createfileifnotexists(pyfile)

    gofile="./Code/Go/Challenge%03d.go" % (level)
    gotemplate="./Tool/Template/Go.template"
    createfilefromtemplate(gotemplate, gofile, level)


def printhelp(exename):
    print("usage: %s xxx" % exename)

def createfileifnotexists(filename):
    if os.path.exists(filename):
        print("文件 %s 已存在。" % filename)
    else:
        fp=open(filename, "w")
        fp.close()
        print("文件 %s 已成功创建" % filename)

def createfilefromtemplate(template, filename, level):
    if os.path.exists(template):
        if os.path.exists(filename):
            print("文件 %s 已存在。" % filename)
        else:
            cnt=readfile(template)
            cnt=cnt.replace("{{level}}", "{:0>3d}".format(level))
            cnt=cnt.replace("{{previous}}", "./Challenge{:0>3d}.md".format(level-1) if level>0 else "#")
            cnt=cnt.replace("{{next}}", "./Challenge{:0>3d}.md".format(level+1) if level<39 else "#")
            writefile(filename, cnt)
            print("文件 %s 已成功创建" % filename)
    else:
        print("模板文件 %s 不存在，无法创建文件 %s" % (template, filename))

def readfile(filename):
    fp=codecs.open(filename, encoding="utf-8")
    cnt=fp.read()
    fp.close()
    return cnt

def writefile(filename, content):
    fp=codecs.open(filename, "w", encoding="utf-8")
    fp.write(content)
    fp.close()

if __name__ == "__main__":
   main(sys.argv)