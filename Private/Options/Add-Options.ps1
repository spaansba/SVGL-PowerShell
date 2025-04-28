Function Add-Options {
    param (
        [int]$StartNumber,
        [string]$LogoType,
        [string]$SvgUrl,
        [string]$Title,
        [string[]]$Actions,
        [System.Collections.ArrayList]$SvgOptions,
        [string]$TableFormat
    )

    Write-Host ($TableFormat -f $LogoType, $StartNumber, ($StartNumber + 1), ($StartNumber + 2), ($StartNumber + 3), ($StartNumber + 4), ($StartNumber + 5), ($StartNumber + 6))

    $offset = 0
    foreach ($action in $Actions) {
        [void]$SvgOptions.Add(@{
            Number = $StartNumber + $offset
            LogoType = $LogoType
            Action = $action
            SvgUrl = $SvgUrl
            Title = $Title
        })
        $offset += 1
    }

    return $SvgOptions
}
