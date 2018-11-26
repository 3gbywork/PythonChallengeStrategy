$path=".\\Data\\014"

. .\Code\PowerShell\helper.ps1
EnsureDir -Dir $path

$wire="http://www.pythonchallenge.com/pc/return/wire.png"
$filename=$path+"\\wire.png"
DownloadWithBasicAuth -Url $gfx -Filename $filename -Username "huge" -Password "file"

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)

$newImg=New-Object System.Drawing.Bitmap 100,100
$hLines,$vLines=0,0
$xStep,$yStep=1,0
$length=100
$x,$y,$index=0,0,0
while ($index -lt 10000) {
    if ($length -eq 0) {
        break
    }
    for ($i=0; $i -lt $length; $i++) {
        $newImg.SetPixel($x+$i*$xStep,$y+$i*$yStep, $img.GetPixel($index+$i,0))
    }
    $index+=$length
    $x+=$xStep*($length-1)
    $y+=$yStep*($length-1)
    if ($xStep -eq 1 -or $xStep -eq -1) {
        $hLines+=1
        $length=100-$hLines
    }
    else {
        $vLines+=1
        $length=100-$vLines
    }
    if ($xStep -eq 1) {
        $xStep=0
        $yStep=1
    }
    elseif ($yStep -eq 1) {
        $yStep=0
        $xStep=-1
    }
    elseif ($xStep -eq -1) {
        $xStep=0
        $yStep=-1
    }
    elseif ($yStep -eq -1) {
        $yStep=0
        $xStep=1
    }
}

ShowImage -Title "Challenge014" -Image $newImg -Width 300 -Height 200

# $img.Save($path+"\\cave.info.jpg")
$img.Dispose()
$newImg.Dispose()