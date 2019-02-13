$msg=(Get-Content ".\\Data\\003\\msg.txt" -Raw).Replace("`r`n","")

$pattern=[regex]"[^A-Z][A-Z]{3}([a-z])[A-Z]{3}[^A-Z]"

$outstr=""
$pattern.Matches($msg) | foreach {$outstr += $_.Groups[1].Value}

Write-Output $outstr