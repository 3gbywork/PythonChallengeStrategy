function GetPoints {
    param (
        [string[]]
        $strs
    )

    [System.Collections.Generic.List[System.Drawing.Point]]$list=New-Object System.Collections.Generic.List[System.Drawing.Point]

    for ($i=0; $i -lt $strs.Length; $i+=2) {
        $x=[System.Convert]::ToInt32($strs[$i].Trim())
        $y=[System.Convert]::ToInt32($strs[$i+1].Trim())
        [System.Drawing.Point]$point=New-Object System.Drawing.Point $x,$y
        $list.Add($point)
    }

    return $list
}

$firststr=(Get-Content ".\\Data\\009\\first.txt" -Raw).Replace("`r`n","").Split(',',[System.StringSplitOptions]::RemoveEmptyEntries)
$secondstr=(Get-Content ".\\Data\\009\\second.txt" -Raw).Replace("`r`n","").Split(',',[System.StringSplitOptions]::RemoveEmptyEntries)

[System.Collections.Generic.List[System.Drawing.Point]]$firstline=GetPoints -strs $firststr
[System.Collections.Generic.List[System.Drawing.Point]]$secondline=GetPoints -strs $secondstr

$form=New-Object System.Windows.Forms.Form
$form.Text="Challenge009"
$form.Width=500
$form.Height=500
$img=New-Object System.Drawing.Bitmap 500,500
$graphics=[System.Drawing.Graphics]::FromImage($img)
$graphics.Clear([System.Drawing.Color]::White)
$pen=[System.Drawing.Pens]::Black

$graphics.DrawLines($pen, $firstline.ToArray())
$graphics.DrawLines($pen, $secondline.ToArray())

$form.BackgroundImage=$img
$form.BackgroundImageLayout=[System.Windows.Forms.ImageLayout]::None
$null=$form.ShowDialog()