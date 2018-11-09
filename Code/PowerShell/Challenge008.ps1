# 使用bzip2解压并输出
Write-Output $("username: {0}" -f $(.\Code\PowerShell\bin\bzip2.exe -d -k -c .\Data\008\user.bz2))
Write-Output $("password: {0}" -f $(.\Code\PowerShell\bin\bzip2.exe -d -k -c .\Data\008\pwd.bz2))