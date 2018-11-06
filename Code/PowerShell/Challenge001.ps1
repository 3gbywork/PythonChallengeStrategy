$msg=Get-Content ".\\Data\\001\\msg.txt"
$url='map'

function GetChar ([char]$ch) {
    if($ch -ge 'a' -and $ch -le 'z'){
        return [char]([int][char]'a'+([int]$ch-[int][char]'a'+2)%26)
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