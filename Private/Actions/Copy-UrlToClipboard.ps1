function Copy-UrlToClipboard {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Url
    )
    
    try {
        $Url | Set-Clipboard
        Write-Host "Copied URL to clipboard: $Url" -ForegroundColor Green
        return $true
    }
    catch {
        Write-Host "Failed to copy URL to clipboard: $_" -ForegroundColor Red
        return $false
    }
}
