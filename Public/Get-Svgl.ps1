function Get-Svgl {
    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [string]$Search = "",
        
        [Parameter(Position=1)]
        [Alias("c")]
        [string]$Category = ""
    )

    # Define valid categories
    $validCategories = @(
        'All', 'AI', 'Software', 'Hardware', 'Library', 'Hosting', 'Framework',
        'Devtool', 'Monorepo', 'CMS', 'Database', 'Compiler', 'Crypto',
        'Cybersecurity', 'Social', 'Entertainment', 'Browser', 'Language',
        'Education', 'Design', 'Community', 'Marketplace', 'Music', 'Vercel',
        'Google', 'Payment', 'VoidZero', 'Authentication', 'IoT', 'Config', 'Secrets'
    )

    # Handle search parameter
    if ($Search -ne "") {
        Find-Svg -search $Search
        return
    }

    # Handle -c all as showing all categories grouped
    $showAllCategories = $Category -eq "all" -or $Category -eq "All" -or $Category -eq ""
    
    # Type validation for specific category (skip for "all")
    if (-not $showAllCategories) {
        # Make first letter uppercase for consistency
        $Category = $Category.Substring(0,1).ToUpper() + $Category.Substring(1).ToLower()
        
        if ($validCategories -notcontains $Category) {
            Write-Error "Invalid category: $Category"
            Write-Host "Valid categories are:" -ForegroundColor Yellow
            Format-ColumnOutput -Items $validCategories
            return
        }
    }
    
    # Use appropriate URL based on parameters
    if ($showAllCategories) {
        Write-Host "Fetching all categories..." -ForegroundColor Cyan
        $uri = "https://api.svgl.app"
    } else {
        Write-Host "Fetching category: $Category" -ForegroundColor Cyan
        $uri = "https://api.svgl.app/category/$Category"
    }
    
    try {
        $response = Invoke-RestMethod -Uri $uri -Method Get
        
        # For a specific category
        if (-not $showAllCategories) {
            # Display the filtered category
            Write-Host "$Category $($response.Count)" -ForegroundColor Green
            
            # Sort items alphabetically by title
            $items = $response | Sort-Object -Property title
            
            # Extract just the titles for display
            $titles = $items | ForEach-Object { $_.title }
            
            # Format and display the titles
            Format-ColumnOutput -Items $titles
        }
        # For all categories grouped
        else {
            # Group by category and sort alphabetically
            $groupedByCategory = $response | Group-Object -property category | Sort-Object -Property Name
            
            # Format the output
            foreach ($categoryGroup in $groupedByCategory) {
                # Display category name in green
                Write-Host "$($categoryGroup.Name) $($categoryGroup.Count)" -ForegroundColor Green
                
                # Sort items alphabetically by title
                $items = $categoryGroup.Group | Sort-Object -Property title
                
                # Extract just the titles for display
                $titles = $items | ForEach-Object { $_.title }
                
                # Format and display the titles
                Format-ColumnOutput -Items $titles
                
                # Add a blank line between categories
                Write-Host ""
            }
        }
    }
    catch {
        Write-Error "Error making request to SVGL API: $_"
    }
}

# Export the function
Export-ModuleMember -Function Get-Svgl