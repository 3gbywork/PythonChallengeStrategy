msg=open(".\\Data\\002\\msg.txt").read()

dic={}

for ch in msg:
    if ch in dic:
        continue
    else:
        dic[ch]=msg.count(ch)

# print(dic)

outstr=[]
for key,value in dic.items():
    if value < 10:
        outstr.append(key)

print(''.join(outstr))