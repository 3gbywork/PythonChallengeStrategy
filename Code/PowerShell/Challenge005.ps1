$banner="http://www.pythonchallenge.com/pc/def/banner.p"

$path=".\\Data\\005"
if ((Test-Path $path) -eq $false) {
    mkdir $path
}

$filename=$path+"\\banner.p"
curl -Uri $banner -OutFile $filename

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