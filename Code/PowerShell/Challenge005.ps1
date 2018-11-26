$banner="http://www.pythonchallenge.com/pc/def/banner.p"

$path=".\\Data\\005"

. .\Code\PowerShell\helper.ps1
EnsureDir -Dir $path

$filename=$path+"\\banner.p"
Invoke-WebRequest -Uri $banner -OutFile $filename

$lines=Get-Content $filename

$reln=[regex]'aa'
$renum=[regex]'^I([0-9]*)'
$rechsharp=[regex]"S'#'|g6"
$rechspace=[regex]"S' '|g2"

foreach ($line in $lines) {
    if ($reln.IsMatch($line)) {
        [System.Console]::WriteLine()
        continue
    }
    if ($rechsharp.IsMatch($line)) {
        $ch='#'
        continue
    }
    if ($rechspace.IsMatch($line)) {
        $ch=' '
        continue
    }
    if ($renum.IsMatch($line)) {
        $num=[int]$renum.Match($line).Groups[1].Value
        [System.Console]::Write($ch*$num)
        continue
    }
}