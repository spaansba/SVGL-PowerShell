function Copy-RawSvgToClipboard {
    param (
        [Parameter(Mandatory = $true)]
        [string]$SvgUrl
    )
    
    try {
        $svgResponse = Invoke-WebRequest -Uri $SvgUrl -UseBasicParsing
        $svgResponse.Content | Set-Clipboard
        Write-Host "Copied Raw SVG content to clipboard from: $SvgUrl" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Failed to retrieve SVG content: $_" -ForegroundColor Red
        return $false
    }
}
