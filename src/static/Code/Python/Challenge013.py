import xmlrpc.client

serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"
serverProxy=xmlrpc.client.ServerProxy(serverUrl)
# 枚举xmlrpc服务
# print(serverProxy.system.listMethods())
# print(serverProxy.system.methodSignature('phone'))
# print(serverProxy.system.methodHelp('phone'))

phoneNumber=serverProxy.phone('Bert')
print(phoneNumber)