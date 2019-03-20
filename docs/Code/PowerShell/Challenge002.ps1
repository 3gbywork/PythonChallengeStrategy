$msg=(Get-Content ".\\Data\\002\\msg.txt" -Raw).Replace("`r`n","")

# powershell 中 hashtable 遍历的顺序与添加的顺序不一致
# $dic=@{}
$dic=New-Object 'System.Collections.Generic.Dictionary[string,int]'
for ($i = 0; $i -lt $msg.Length; $i++) {
    $ch=$msg[$i]
    if ($dic.ContainsKey($ch)) {
        $dic[$ch]+=1
    } else {
        $dic[$ch]=0
    }  
}

[string]$outstr=""
foreach ($key in $dic.Keys) {
    if ($dic[$key] -le 10) {
        $outstr+=$key
    }
}

Write-Output $outstr