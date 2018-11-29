$path=".\\Data\\016"

. .\Code\PowerShell\helper.ps1
EnsureDir -Dir $path

$gif="http://www.pythonchallenge.com/pc/return/mozart.gif"
$filename=$path+"\\mozart.gif"
DownloadWithBasicAuth -Url $gif -Filename $filename -Username "huge" -Password "file"

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=[System.Drawing.Image]::FromFile($filename)
$newImg=New-Object System.Drawing.Bitmap $img.Width,$img.Height
$color=[System.Drawing.Color]::FromArgb(255,0,255)

for ($y = 0; $y -lt $img.Height; $y++) {
    for ($x = 0; $x -lt $img.Width; $x++) {
        if ($img.GetPixel($x,$y) -eq $color) {
            for ($xx = 0; $xx -lt $img.Width; $xx++) {
                $newImg.SetPixel($xx,$y,$img.GetPixel(($xx+$x)%$img.Width,$y))
            }
            continue
        }
    }
}

$img.Dispose()

ShowImage -Title "Challenge016" -Image $newImg
$newImg.Dispose()