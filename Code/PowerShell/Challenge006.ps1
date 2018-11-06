$path=".\\Data\\006"
if ((Test-Path $path) -eq $false) {
    mkdir $path
}

$url="http://www.pythonchallenge.com/pc/def/channel.zip"
$filename=$path+"\\channel.zip"
curl -Uri $url -OutFile $filename

[void][System.Reflection.Assembly]::LoadFile($PSScriptRoot+"\\lib\\ICSharpCode.SharpZipLib.dll")

$namespace="ICSharpCode.SharpZipLib.Zip.{0}"

$zip=New-Object($namespace -f "ZipFile")($filename)

$pattern=[regex]"Next nothing is (\d+)"
$entryname="90052"

$outstr=""
while ($true) {
    $entry=$zip.GetEntry($entryname+".txt")
    $stream=$zip.GetInputStream($entry)
    $reader=New-Object System.IO.StreamReader($stream)
    $cnt=$reader.ReadToEnd()
    $reader.Dispose()
    $stream.Dispose()

    $outstr+=$entry.Comment
    $match = $pattern.Match($cnt)
    if ($match.Success) {
        $entryname = $match.Groups[1].Value
    } else {
        "last: {0}, cnt: {1}" -f $entryname,$cnt
        break
    }
}

$zip.Close()
Write-Output $outstr