function CreateFileIfNotExists
{
    param
    (
        [string]
        # 需要创建的文件路径
        $file
    )

    if (Test-Path $file) {
        Write-Verbose $("文件 {0} 已存在。" -f $file)
    } else {
        Write-Verbose $("正在创建文件 {0}" -f $file)
        $null=New-Item $file -Type File
        Write-Output $("文件 {0} 已成功创建。" -f $file)
    }

<#
.SYNOPSIS
如果文件不存在，创建文件
.DESCRIPTION
检测指定文件是否存在，不存在则创建文件；否则无动作。
.PARAMETER file
需要创建的文件路径
.INPUTS
None.
.OUTPUTS
File
.EXAMPLE
CreateFileIfNotExists ./test.txt
#>
}

function CreateFileFromTemplate
{
    param
    (
        [string]
        # 模板文件路径
        $template,

        [string]
        # 需要创建的文件路径
        $file,

        [int]
        # 关卡数
        $level
    )

    if (Test-Path $template) {
        if (Test-Path $file) {
            Write-Verbose $("文件 {0} 已存在。" -f $file)
        } else {
            Write-Verbose $("正在创建文件 {0}" -f $file)
            [string]$cnt=(Get-Content -Encoding UTF8 -Raw $template).Replace("{#}", $("{0}" -f $level)).Replace("{###}", $("{0:000}" -f $level))
            #  | Out-File -Encoding utf8 $file
            $encoding=New-Object System.Text.UTF8Encoding($false)
            $writer=New-Object System.IO.StreamWriter($file, $false, $encoding)
            $writer.Write($cnt)
            $writer.Dispose()
            Write-Output $("文件 {0} 已成功创建。" -f $file)
        }
    } else {
        Write-Error $("模板文件 {0} 不存在，无法创建文件 {1}" -f $template, $file)
    }

<#
.SYNOPSIS
如果文件不存在，则根据模板创建文件
.DESCRIPTION
检测指定文件是否存在，不存在则创建文件；否则无动作。
.PARAMETER template
模板文件路径
.PARAMETER file
需要创建的文件路径
.INPUTS
None.
.OUTPUTS
File
.EXAMPLE
CreateFileFromTemplate ./template.txt ./test.txt
#>
}