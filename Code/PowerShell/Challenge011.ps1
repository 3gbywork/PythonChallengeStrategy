$path=".\\Data\\011"
if ((Test-Path $path) -eq $false) {
    mkdir $path
}

$pw=ConvertTo-SecureString "file" -AsPlainText -Force
$credential=New-Object System.Management.Automation.PSCredential("huge", $pw)
$cave="http://www.pythonchallenge.com/pc/return/cave.jpg"
$filename=$path+"\\cave.jpg"
Invoke-WebRequest -Uri $cave -OutFile $filename -Credential $credential

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

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$form=New-Object System.Windows.Forms.Form
$form.Text="Challenge011"
$form.Width=$img.Width
$form.Height=$img.Height
$form.BackgroundImage=$img
$form.BackgroundImageLayout=[System.Windows.Forms.ImageLayout]::None
$null=$form.ShowDialog()

# $img.Save($path+"\\cave.info.jpg")
$img.Dispose()