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

[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
$img=New-Object System.Drawing.Bitmap 500,500
$graphics=[System.Drawing.Graphics]::FromImage($img)
$graphics.Clear([System.Drawing.Color]::White)
$pen=[System.Drawing.Pens]::Black

$graphics.DrawLines($pen, $firstline.ToArray())
$graphics.DrawLines($pen, $secondline.ToArray())

. .\Code\PowerShell\helper.ps1
Show-Image -Title "Challenge009" -Image $img

$img.Dispose()