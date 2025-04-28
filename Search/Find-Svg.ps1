Function Find-Svg {
    param (
         [string]$Search
    )
    Write-Host ""
    Write-Host "Searching for '$Search'..." -ForegroundColor Cyan
    $uri = "https://api.svgl.app?search=$Search"

    try {
        $response = Invoke-RestMethod -Uri $uri -Method Get
        
        # Display search results count
        $count = if ($response -is [array]) { $response.Count } else { 1 }
        Write-Host "Found $count results for '$Search'" -ForegroundColor Green
        Write-Host ""
        
        # Handle single result vs array of results
        $items = if ($response -is [array]) { $response } else { @($response) }
        
        # Display detailed results
        foreach ($item in $items) {
            Write-Host "$($item.title)" -ForegroundColor Yellow
            Write-Host "  Category: $($item.category)"
            Write-Host "  URL: $($item.url)"
            
            # Handle different route formats
            if ($item.PSObject.Properties.Name -contains "route") {
                # Check if route is an object with light/dark properties
                if ($item.route -is [PSCustomObject]) {
                    if ($item.route.PSObject.Properties.Name -contains "light") {
                        Write-Host "  SVG (Light): $($item.route.light)"
                    }
                    
                    if ($item.route.PSObject.Properties.Name -contains "dark") {
                        Write-Host "  SVG (Dark): $($item.route.dark)" 
                    }
                } 
                # Handle case where route is a direct string
                else {
                    Write-Host "  SVG: $($item.route)"
                }
            } else {
                Write-Host "  SVG: Not available"
            }
            
            # Handle wordmark if present
            if ($item.PSObject.Properties.Name -contains "wordmark") {
                # Check if wordmark is an object with light/dark properties
                if ($item.wordmark -is [PSCustomObject]) {
                    if ($item.wordmark.PSObject.Properties.Name -contains "light") {
                        Write-Host "  Wordmark (Light): $($item.wordmark.light)"
                    }
                    
                    if ($item.wordmark.PSObject.Properties.Name -contains "dark") {
                        Write-Host "  Wordmark (Dark): $($item.wordmark.dark)" 
                    }
                } 
                # Handle case where wordmark is a direct string
                else {
                    Write-Host "  Wordmark: $($item.wordmark)"
                }
            }
            
            Write-Host ""
        }
    }
    catch {
        # Error handling
        Write-Host "No results found for '$Search'" -ForegroundColor Yellow
        Write-Host "Try Get-Svgl for a list of svgs" -ForegroundColor Yellow
        Write-Host "Or try Get-Svgl -c <category> to only return svgs in a category" -ForegroundColor Yellow
        Write-Host " "
    }
}