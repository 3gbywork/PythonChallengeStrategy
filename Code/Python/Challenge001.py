
msg=open("..\\Data\\001\\msg.txt").read()
url='map'

# ^^^^^^^^^^^^^^^^^^^^^^^^Solution 1^^^^^^^^^^^^^^^^^^^^^^^^
def getchar(inchar):
    if inchar >= 'a' and inchar <= 'z':
        tmp=ord(inchar)-ord('a')+2
        return chr(tmp%26+ord('a'))
    else:
        return inchar

def translate(instr):
    return ''.join(map(getchar,instr))

print(translate(msg))
print(translate(url))
# vvvvvvvvvvvvvvvvvvvvvvvvSolution 1vvvvvvvvvvvvvvvvvvvvvvvv


# ^^^^^^^^^^^^^^^^^^^^^^^^Solution 2^^^^^^^^^^^^^^^^^^^^^^^^
import string

table=str.maketrans(string.ascii_lowercase, string.ascii_lowercase[2:]+string.ascii_lowercase[:2])
print(msg.translate(table))
print(url.translate(table))
# vvvvvvvvvvvvvvvvvvvvvvvvSolution 2vvvvvvvvvvvvvvvvvvvvvvvv
