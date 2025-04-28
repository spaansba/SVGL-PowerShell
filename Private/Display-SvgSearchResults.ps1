Function Display-SvgSearchResults {
    param (
        [array]$Results,
        [string]$SearchTerm
    )
    
    # Display results count
    $count = $Results.Count
    Write-Host ""
    Write-Host "Found $count results for '$SearchTerm'" -ForegroundColor Green
    Write-Host ""
    
    $svgOptions = @()
    $counter = 1
    
    foreach ($item in $Results) {
        # Display title as header
        Write-Host "Title: $($item.title)"
        
        # Create a neat table with fixed-width formatting
        $tableFormat = "{0,-15} | {1,-3} | {2,-7} | {3,-5} | {4,-3} | {5,-6} | {6,-5} | {7,-7}"
        
        # Table header
        Write-Host ($tableFormat -f "SVG", "URL", "Raw SVG", "React", "Vue", "Svelte", "Astro", "Angular")
        Write-Host ($tableFormat -f ("-" * 15), "---", ("-" * 7), "-----", "---", "------", "-----", "-------")
        
        # Handle route variants
        if ($item.PSObject.Properties.Name -contains "route") {
            if ($item.route -is [PSCustomObject]) {
                # Handle light route
                if ($item.route.PSObject.Properties.Name -contains "light") {
                    Write-Host ($tableFormat -f "Light", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    $svgOptions += @{Number = $counter; Type = "Light"; Url = $item.route.light}
                    $counter += 7
                }
                
                # Handle dark route
                if ($item.route.PSObject.Properties.Name -contains "dark") {
                    Write-Host ($tableFormat -f "Dark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    $svgOptions += @{Number = $counter; Type = "Dark"; Url = $item.route.dark}
                    $counter += 7
                }
            } else {
                Write-Host ($tableFormat -f "Default", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                $svgOptions += @{Number = $counter; Type = "Default"; Url = $item.route}
                $counter += 7
            }
        }
        
        # Handle wordmark variants
        if ($item.PSObject.Properties.Name -contains "wordmark") {
            if ($item.wordmark -is [PSCustomObject]) {
                # Handle light wordmark
                if ($item.wordmark.PSObject.Properties.Name -contains "light") {
                    Write-Host ($tableFormat -f "Wordmark Light", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    $svgOptions += @{Number = $counter; Type = "Wordmark Light"; Url = $item.wordmark.light}
                    $counter += 7
                }
                
                # Handle dark wordmark
                if ($item.wordmark.PSObject.Properties.Name -contains "dark") {
                    Write-Host ($tableFormat -f "Wordmark Dark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    $svgOptions += @{Number = $counter; Type = "Wordmark Dark"; Url = $item.wordmark.dark}
                    $counter += 7
                }
            } else {
                Write-Host ($tableFormat -f "Wordmark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                $svgOptions += @{Number = $counter; Type = "Wordmark"; Url = $item.wordmark}
                $counter += 7
            }
        }
        
        Write-Host ""
    }
    
    # Handle no results case
    if ($Results.Count -eq 0) {
        Write-Host "No results found for '$SearchTerm'" -ForegroundColor Yellow
        Write-Host "Try Get-Svgl for a list of svgs" -ForegroundColor Yellow
        Write-Host "Or try Get-Svgl -c <category> to only return svgs in a category" -ForegroundColor Yellow
        return $null
    }
    
    # Prompt for selection
    $selection = Read-Host "Enter the number of the SVG you want to use"
    
    # Convert selection to integer if possible
    if ($selection -match '^\d+$') {
        $selection = [int]$selection
    }
    
    $selectedOption = $svgOptions | Where-Object { $_.Number -eq $selection }
    
    return $selectedOption
}