$path=".\\Data\\011"

. .\Code\PowerShell\helper.ps1
New-Dir -Dir $path

$cave="http://www.pythonchallenge.com/pc/return/cave.jpg"
$filename=$path+"\\cave.jpg"
Get-FileWithAuth -Url $cave -Filename $filename -Username "huge" -Password "file"

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)
$color=[System.Drawing.Color]::FromArgb(255,255,255)
for ($y = 0; $y -lt $img.Height; $y++) {
    for ($x = 0; $x -lt $img.Width; $x++) {
        if ($y % 2 -eq 0 -and $x % 2 -eq 1) {
            $img.SetPixel($x, $y, $color)
        } else {
            if ($y % 2 -eq 1 -and $x % 2 -eq 0) {
                $img.SetPixel($x, $y, $color)
            }
        }
    }
}

Show-Image -Title "Challenge011" -Image $img

# $img.Save($path+"\\cave.info.jpg")
$img.Dispose()