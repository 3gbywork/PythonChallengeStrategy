function GetNext {
    param (
        [string]
        $instr
    )
    
    $count=0
    $curch=$instr[0]
    $outstr=New-Object System.Text.StringBuilder

    for ($i = 0; $i -lt $instr.Length; $i++) {
        $ch=$instr[$i]
        if ($ch -ne $curch) {
            # StringBuilder.Append的值会作为函数的返回值返回，所以要在前面加[void]或$null=
            [void]$outstr.AppendFormat("{0}{1}", $count, $curch)
            $curch=$ch
            $count=1
        } else {
            $count++
        }
    }
    [void]$outstr.AppendFormat("{0}{1}", $count, $curch)

    return $outstr.ToString()
}

$a=New-Object System.Collections.Generic.List[string]
$a.Add("1")
for ($i = 0; $i -lt 31; $i++) {
    $next=GetNext($a[$i])
    $a.Add($next)
}
Write-Output $a[30].Length