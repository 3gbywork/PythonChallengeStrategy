<#
.SYNOPSIS
根据模板生成攻略文档和Go、PowerShell、Python源文件
.DESCRIPTION
根据Template目录下文件生成攻略文档和Go、PowerShell、Python源文件。如果文件已存在则不创建、不覆盖，避免误操作。
.PARAMETER level
Challenge关卡，自然数
.INPUTS
None.
.OUTPUTS
Strategy/Challengexxx.md
Code/Go/Challengexxx.go
Code/PowerShell/Challengexxx.ps1
Code/Python/Challengexxx.py
.EXAMPLE
tool -level 8
#>
[CmdletBinding()]
Param(
    # Parameter help description
    [Parameter(Mandatory = $true, HelpMessage = "输入关卡数")]
    [int] $level
)

. ./Tool/func.ps1

if ($level -lt 0 -or $level -gt 39) {
    Write-Output "关卡数应是小于40的自然数"
    return
}

# $mdfile="./Strategy/Challenge{0:000}.md" -f $level
# $mdtemplate="./Tool/Template/ChallengeTemplate.md"
# CreateFileFromTemplate -template $mdtemplate -file $mdfile -level $level
hugo new $("static/Strategy/Challenge{0:000}.md" -f $level)

$ps1file="./static/Code/PowerShell/Challenge{0:000}.ps1" -f $level
CreateFileIfNotExists($ps1file)

$pyfile="./static/Code/Python/Challenge{0:000}.py" -f $level
CreateFileIfNotExists($pyfile)

$gofile="./static/Code/Go/Challenge{0:000}.go" -f $level
$gotemplate="./Tool/Template/Go.template"
CreateFileFromTemplate -template $gotemplate -file $gofile -level $level