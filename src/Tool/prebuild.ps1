# create content/post folder
$folder = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(".\content\post")
if ($(Test-Path $folder) -eq $false) {
    New-Item $folder -ItemType Directory
}

$mds = Get-ChildItem -Path $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(".\static\Strategy") -Filter *.md
$mds | ForEach-Object {
    $level = $([string]$_.BaseName).Substring(9,3)

    $py = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($(".\static\Code\Python\{0}.py" -f $_.BaseName))
    $pyCnt = $(Get-Content -Encoding UTF8 -Raw -Path $py)

    $ps = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($(".\static\Code\PowerShell\{0}.ps1" -f $_.BaseName))
    $psCnt = $(Get-Content -Encoding UTF8 -Raw -Path $ps)

    $go = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($(".\static\Code\Go\{0}.go" -f $_.BaseName))
    $goCnt = $(Get-Content -Encoding UTF8 -Raw -Path $go)


    $mdCnt = $(Get-Content -Encoding UTF8 -Raw $_.FullName).
    Replace("{{ .Name }}", $_.BaseName).
    Replace("{{ replace .Name `"Challenge`" `"`" }}", $level).
    Replace("{{< highlight python3 >}}`r`n{{< /highlight >}}", $("{{{{< highlight python3 >}}}}`r`n{0}`r`n{{{{< /highlight >}}}}" -f $pyCnt)).
    Replace("{{< highlight powershell >}}`r`n{{< /highlight >}}", $("{{{{< highlight powershell >}}}}`r`n{0}`r`n{{{{< /highlight >}}}}" -f $psCnt)).
    Replace("{{< highlight golang >}}`r`n{{< /highlight >}}", $("{{{{< highlight golang >}}}}`r`n{0}`r`n{{{{< /highlight >}}}}" -f $goCnt))

    $outFile = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($(".\content\post\{0}.md" -f $_.BaseName))
    $mdCnt | Out-File -Encoding utf8 $outFile
}
