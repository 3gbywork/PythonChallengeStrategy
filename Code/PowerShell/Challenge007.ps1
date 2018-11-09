$path=".\\Data\\007"
if ((Test-Path $path) -eq $false) {
    mkdir $path
}

$url="http://www.pythonchallenge.com/pc/def/oxygen.png"
$filename=$path+"\\oxygen.png"
Invoke-WebRequest -Uri $url -OutFile $filename

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)

$msg=""
for ($i=0; $i -lt $img.Width-21; $i+=7) {
    $msg+=[char]$img.GetPixel($i,$img.Height/2).R
}
$img.Dispose()

Write-Output $msg

$outstr=""
$pattern=[regex]"\d+"
$pattern.Matches($msg) | ForEach-Object {$outstr+=[char][int]$_.Value}

Write-Output $outstr