function Show-ResultCount {
    param (
        [Parameter(Mandatory = $true)]
        [int]$Count,
        
        [Parameter(Mandatory = $true)]
        [string]$SearchTerm,
        
        [Parameter()]
        [ConsoleColor]$Color = [ConsoleColor]::Green
    )
    
    Write-Host ""
    
    if ($Count -gt 0) {
        Write-Host "Found $Count results for '$SearchTerm'" -ForegroundColor $Color
    } else {
        Write-Host "No results found for '$SearchTerm'" -ForegroundColor Yellow
        Write-Host "Try Get-Svgl for a list of svgs" -ForegroundColor Yellow
        Write-Host "Or try Get-Svgl -c <category> to only return svgs in a category" -ForegroundColor Yellow
    }
    
    Write-Host ""
}
