function ShowImage {
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

function EnsureDir {
    [CmdletBinding()]
    param (
        [string]$Dir
    )
    
    if ((Test-Path $Dir) -eq $false) {
        mkdir $Dir > $null
    }
}

function DownloadWithBasicAuth {
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