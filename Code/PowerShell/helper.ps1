function Show-Image {
    [CmdletBinding()]
    param (
        [string]$Title,
        [System.Drawing.Image]$Image,
        [int]$Width,
        [int]$Height
    )
    
    begin {
        [void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    }
    
    process {
        $form=New-Object System.Windows.Forms.Form
        $form.Text=$Title
        if ($Width) {
            $form.Width=$Width
        } else {
            $form.Width=$Image.Width
        }
        if ($Height) {
            $form.Height=$Height
        } else {
            $form.Height=$Image.Height
        }
        $form.BackgroundImage=$Image
        $form.BackgroundImageLayout=[System.Windows.Forms.ImageLayout]::Center
        $null=$form.ShowDialog()
    }
    
    end {
    }
}

function New-Dir {
    [CmdletBinding()]
    param (
        [string]$Dir
    )
    
    if ((Test-Path $Dir) -eq $false) {
        mkdir $Dir > $null
    }
}

function Get-FileWithAuth {
    [CmdletBinding()]
    param (
        [string]$Url,
        [string]$Filename,
        [string]$Username,
        [string]$Password
    )
    
    $pw=ConvertTo-SecureString $Password -AsPlainText -Force
    $credential=New-Object System.Management.Automation.PSCredential($Username, $pw)
    Invoke-WebRequest -Uri $Url -OutFile $Filename -Credential $credential
}

function Write-BinaryFile {
    [CmdletBinding()]
    param (
        [string]$Filename,
        [byte[]]$Data
    )
    
    [System.IO.FileStream]$stream=[System.IO.File]::Create($Filename)
    [System.IO.BinaryWriter]$bw=[System.IO.BinaryWriter]::new($stream)
    $bw.Write($Data)
    $bw.Flush()
    $bw.Dispose()
    $stream.Dispose()
}

function ConvertFrom-Bz2String {
    [CmdletBinding()]
    [OutputType([byte[]])]
    param (
        [string]$InStr,
        [byte[]]$OutBytes
    )
    
    begin {
    }
    
    process {
        $num=0
        [byte[]]$array=[byte[]]::new($InStr.Length)
        for ($i = 0; $i -lt $InStr.Length; $i++) {
            [byte]$b=$InStr[$i]
            # '+'=43;'\'=92;'x'=120
            if ($b -eq 43) {
                $b=' '
            } elseif ($b -eq 92 -and ($i -lt $InStr.Length-3) -and $InStr[$i+1] -eq 120) {
                # \xaf => 0xaf
                $h=$(ConvertFrom-Hex -Char $($InStr[$i+2]))
                $l=$(ConvertFrom-Hex -Char $($InStr[$i+3]))
                if ($h -ge 0 -and $l -ge 0) {
                    $b=[byte]$($h -shl 4 -bor $l)
                    $i+=3
                }
            } elseif ($b -eq 92 -and ($i -lt $InStr.Length-1) -and $InStr[$i+1] -eq 114) {
                # \r => 0x0d
                $b=0x0d
                $i+=1
            }
            $array[$num++]=$b
        }

        if ($num -lt $InStr.Length) {
            [byte[]]$array2=[byte[]]::new($num)
            [array]::Copy($array,$array2,$num)
            $array=$array2
        }

        return $array
    }
    
    end {
    }
}

function ConvertFrom-Hex {
    [OutputType([int])]
    param (
        [char]$Char
    )
    
    if ($Char -ge '0' -and $Char -le '9'){
        return $Char-48
    }
    if ($Char -ge 'a' -and $Char -le 'z') {
        return $Char-97+10
    }
    if ($Char -ge 'A' -and $Char -le 'Z') {
        return $Char-65+10
    }
    return -1
}