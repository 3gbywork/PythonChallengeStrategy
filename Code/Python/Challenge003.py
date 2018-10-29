msg=open(".\\Data\\003\\msg.txt").read()

import re

# pattern=re.compile("[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]")

# matches=pattern.findall(msg)

# print(''.join(matches))

print(''.join(re.findall("[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]",msg)))