$url="http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing="
$param="12345"

$pattern=[regex]"the next nothing is (\d+)"

for ($i=0; $i -lt 400; $i++) {
    $resp = (Invoke-WebRequest -Uri $url+$param | Select-Object -ExcludeProperty Content).Content
    $match = $pattern.Match($resp)
    if ($match.Success) {
        $param = $match.Groups[1].Value
    } else {
        [System.Console]::WriteLine($("param: {0}, resp: {1}" -f $param,$resp))
        if ($resp -eq "Yes. Divide by two and keep going.") {
            $param=$param/2
            continue
        }
        break
    }
}

[System.Console]::WriteLine("completed")