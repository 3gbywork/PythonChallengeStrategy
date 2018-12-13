# 选择安装模块或者使用源码

# 安装XmlRpc模块（已发布）
# Install-Module -Name PSXmlRpcClient

# 将XmlRpc源码作为git子模块克隆到Modules目录下
# 添加子模块
# git submodule add https://github.com/3gbywork/PSXmlRpcClient.git .\Code\PowerShell\Modules\PSXmlRpcClient
# git submodule init
# 更新子模块
# git submodule init
# git submodule update
# 删除子模块
# git rm .\Code\PowerShell\Modules\XmlRpc
# 加载XmlRpc模块
# Import-Module .\Code\PowerShell\Modules\PSXmlRpcClient\PSXmlRpcClient.psm1

$serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"

# Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.listMethods"
# Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.methodSignature" -Params "phone"
# Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "system.methodHelp" -Params "phone"

Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "phone" -Params "Bert"