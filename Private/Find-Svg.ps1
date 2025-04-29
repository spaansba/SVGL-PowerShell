
Function Find-Svg {
    param (
        [string]$Search
    )
    Write-Host "Searching for '$Search'..." -ForegroundColor Cyan
    $uri = "https://api.svgl.app?search=$Search"
    
    try {
        $response = Invoke-RestMethod -Uri $uri -Method Get
        
        if ($response -is [array]) {
            return $response
        } 
        else {
            return @($response)
        }
    }
    catch {
        return @()
    }
}