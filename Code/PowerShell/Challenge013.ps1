# 安装XmlRpc模块（暂时未发布）
# Install-Module -Name XmlRpc

# 将XmlRpc源码作为git子模块克隆到Modules目录下
# 添加子模块
# git submodule add https://github.com/3gbywork/XmlRpc .\Code\PowerShell\Modules\XmlRpc
# git submodule init
# 更新子模块
# git submodule init
# git submodule update
# 加载XmlRpc模块
Import-Module .\Code\PowerShell\Modules\XmlRpc\XmlRpc.psm1

$serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"

# Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.listMethods"
# Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.methodSignature" -Params "phone"
# Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.methodHelp" -Params "phone"

Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "phone" -Params "Bert"