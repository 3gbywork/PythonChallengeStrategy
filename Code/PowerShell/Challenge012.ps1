$path=".\\Data\\012"

. .\Code\PowerShell\helper.ps1
EnsureDir -Dir $path

$gfx="http://www.pythonchallenge.com/pc/return/evil2.gfx"
$filename=$path+"\\evil2.gfx"
DownloadWithBasicAuth -Url $gfx -Filename $filename -Username "huge" -Password "file"

$evil4="http://www.pythonchallenge.com/pc/return/evil4.jpg"
Invoke-WebRequest -Uri $evil4 -OutFile $($path+"\\evil4.jpg") -Credential $credential

$cnt=[System.IO.File]::ReadAllBytes($filename)
$exts="jpg","png","gif","png","jpg"

for ($i = 0; $i -lt 5; $i++) {
    $outfile=$path+"\\out{0}.{1}" -f $($i, $exts[$i])
    $fs=[System.IO.FileStream]::new($outfile, [System.IO.FileMode]::Create)
    for ($j = $i; $j -lt $cnt.Length; $j+=5) {
        $fs.WriteByte($cnt[$j])        
    }
    $fs.Flush()
    $fs.Close()
    $fs.Dispose()
}

"please see the folder: $path"