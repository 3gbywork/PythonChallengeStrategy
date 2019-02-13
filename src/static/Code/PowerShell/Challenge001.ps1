$msg=Get-Content ".\\Data\\001\\msg.txt"
$url='map'

function GetChar ([char]$ch) {
    if($ch -ge 'a' -and $ch -le 'z'){
        # [int][char]'a'=97
        return [char](97+([int]$ch-97+2)%26)
    }
    return $ch
}

function Translate ([string]$instr) {
    [char[]]$rst=New-Object char[] $instr.Length
    for ($i = 0; $i -lt $instr.Length; $i++) {
        $ch=GetChar($instr[$i])   
        $rst[$i]=$ch
    }
    
    return $rst -join ''
}

Translate($msg)
Translate($url)