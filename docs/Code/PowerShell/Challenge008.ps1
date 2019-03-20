$un='BZh91AY&SYA\xaf\x82\r\x00\x00\x01\x01\x80\x02\xc0\x02\x00 \x00!\x9ah3M\x07<]\xc9\x14\xe1BA\x06\xbe\x084'
$pw='BZh91AY&SY\x94$|\x0e\x00\x00\x00\x81\x00\x03$ \x00!\x9ah3M\x13<]\xc9\x14\xe1BBP\x91\xf08'

$path=".\\Data\\008"
. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

Write-BinaryFile -Filename $($path+"\\user.bz2") -Data $(ConvertFrom-Bz2String -InStr $un)
Write-BinaryFile -Filename $($path+"\\pwd.bz2") -Data $(ConvertFrom-Bz2String -InStr $pw)

# 使用bzip2解压并输出
Write-Output $("username: {0}" -f $(.\Code\PowerShell\bin\bzip2.exe -d -k -c .\Data\008\user.bz2))
Write-Output $("password: {0}" -f $(.\Code\PowerShell\bin\bzip2.exe -d -k -c .\Data\008\pwd.bz2))