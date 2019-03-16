function CreateFileIfNotExists
{
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

    param
    (
        [string]
        # 需要创建的文件路径
        $file
    )

    # 转换为文件的绝对路径
    $filePath=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)

    if (Test-Path $filePath) {
        Write-Verbose $("文件 {0} 已存在。" -f $file)
    } else {
        Write-Verbose $("正在创建文件 {0}" -f $file)
        $null=New-Item $filePath -Type File
        Write-Output $("文件 {0} 已成功创建。" -f $file)
    }
}

function CreateFileFromTemplate
{
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

    # 转换为文件的绝对路径
    $filePath=$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($file)

    if (Test-Path $template) {
        if (Test-Path $filePath) {
            Write-Verbose $("文件 {0} 已存在。" -f $file)
        } else {
            Write-Verbose $("正在创建文件 {0}" -f $file)
            [string]$cnt=(Get-Content -Encoding UTF8 -Raw $template).Replace("{{level}}", $("{0:000}" -f $level))
            if ($level -gt 0) {
                $cnt=$cnt.Replace("{{previous}}", $("./Challenge{0:000}.md" -f ($level-1)))
            } else {
                $cnt=$cnt.Replace("{{previous}}", "#")
            }
            if ($level -lt 39) {
                $cnt=$cnt.Replace("{{next}}", $("./Challenge{0:000}.md" -f ($level+1)))
            } else {
                $cnt=$cnt.Replace("{{next}}", "#")
            }
            #  | Out-File -Encoding utf8 $file
            $encoding=New-Object System.Text.UTF8Encoding($false)
            $writer=New-Object System.IO.StreamWriter($filePath, $false, $encoding) -ErrorAction SilentlyContinue
            if ($?) {
                $writer.Write($cnt)
                $writer.Dispose()
                Write-Output $("文件 {0} 已成功创建。" -f $file)
            } else {
                Write-Output $("文件 {0} 创建失败！" -f $file)
            }
        }
    } else {
        Write-Error $("模板文件 {0} 不存在，无法创建文件 {1}" -f $template, $file)
    }
}