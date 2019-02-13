def getNext(instr):
    count=0
    curch=instr[0]
    outstr=[]
    for ch in instr:
        if ch != curch:
            outstr.append(str(count)+curch)
            curch=ch
            count=1
        else:
            count+=1
    outstr.append(str(count)+curch)
    return ''.join(outstr)

a=['1']
for i in range(31):
    a.append(getNext(a[i]))
print(len(a[30]))