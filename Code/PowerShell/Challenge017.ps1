$url='http://www.pythonchallenge.com/pc/def/linkedlist.php?busynothing='
$param="12345"

$pattern=[regex]"the next busynothing is (\d+)"

[string]$cookieStr=""
for ($i=0; $i -lt 400; $i++) {
    $resp = (Invoke-WebRequest -Uri $url+$param -SessionVariable session | Select-Object -ExcludeProperty Content).Content
    $cookieStr+=$session.Cookies.GetCookies($url)[0].Value
    $match = $pattern.Match($resp)
    if ($match.Success) {
        $param = $match.Groups[1].Value
    } else {
        [System.Console]::WriteLine($("param: {0}, resp: {1}" -f $param,$resp))
        if ($resp -eq "Yes. Divide by two and keep going.") {
            $param=$param/2
            continue
        }
        break
    }
}
$cookieStr

# $cookieStr="BZh91AY%26SY%94%3A%E2I%00%00%21%19%80P%81%11%00%AFg%9E%A0+%00hE%3DM%B5%23%D0%D4%D1%E2%8D%06%A9%FA%26S%D4%D3%21%A1%EAi7h%9B%9A%2B%BF%60%22%C5WX%E1%ADL%80%E8V%3C%C6%A8%DBH%2632%18%A8x%01%08%21%8DS%0B%C8%AF%96KO%CA2%B0%F1%BD%1Du%A0%86%05%92s%B0%92%C4Bc%F1w%24S%85%09%09C%AE%24%90"
# [System.Web.HttpUtility]::UrlDecodeToBytes 可以将'+'转换为' '，故注释掉
# $cookieStr=$cookieStr.Replace('+','%20')

$path=".\\Data\\017"
. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$cookieFile=$path+"\\cookie.bz2"
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Web")
Write-BinaryFile -Filename $cookieFile -Data $([System.Web.HttpUtility]::UrlDecodeToBytes($cookieStr))

Write-Output $(.\Code\PowerShell\bin\bzip2.exe -d -k -c $cookieFile)

$serverUrl="http://www.pythonchallenge.com/pc/phonebook.php"
Invoke-XmlRpcRequest -ServerUri $serverUrl -MethodName "phone" -Params "Leopold"

$url='http://www.pythonchallenge.com/pc/stuff/violin.php'
$cookie=[System.Net.Cookie]::new("info","the flowers are on their way")
$webSession=[Microsoft.PowerShell.Commands.WebRequestSession]::new()
$webSession.Cookies.Add($url,$cookie)
$(Invoke-WebRequest -Uri $url -WebSession $webSession | Select-Object -ExcludeProperty Content).Content