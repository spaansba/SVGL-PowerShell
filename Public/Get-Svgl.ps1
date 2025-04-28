function Get-Svgl {
    [CmdletBinding()]
    param (
        [Parameter(Position=0)]
        [string]$Search = "",
        
        [Parameter(Position=1)]
        [Alias("c")]
        [string]$Category = ""
    )

    $validCategories = @(
        'All', 'AI', 'Software', 'Hardware', 'Library', 'Hosting', 'Framework',
        'Devtool', 'Monorepo', 'CMS', 'Database', 'Compiler', 'Crypto',
        'Cybersecurity', 'Social', 'Entertainment', 'Browser', 'Language',
        'Education', 'Design', 'Community', 'Marketplace', 'Music', 'Vercel',
        'Google', 'Payment', 'VoidZero', 'Authentication', 'IoT', 'Config', 'Secrets'
    )
    Write-Host ""
    if ($Search -ne "") {
        $Search = $Search.Substring(0,1).ToUpper() + $Search.Substring(1).ToLower()
        $results = Find-Svg -Search $Search
        Display-SvgSearchResults -Results $results -SearchTerm $Search
        return
    }

    $showAllCategories = $Category -eq "all" -or $Category -eq "All" -or $Category -eq ""
    
    if (-not $showAllCategories) {
        $Category = $Category.Substring(0,1).ToUpper() + $Category.Substring(1).ToLower()
        
        if ($validCategories -notcontains $Category) {
            Write-Error "Invalid category: $Category"
            Write-Host "Valid categories are:" -ForegroundColor Yellow
            Format-ColumnOutput -Items $validCategories
            return
        }
    }
    
    if ($showAllCategories) {
        Write-Host "Fetching all categories..." -ForegroundColor Cyan
        $uri = "https://api.svgl.app"
    } else {
        Write-Host "Fetching category: $Category" -ForegroundColor Cyan
        $uri = "https://api.svgl.app/category/$Category"
    }
    
    try {
        $response = Invoke-RestMethod -Uri $uri -Method Get
        
        if (-not $showAllCategories) {
            Write-Host ""
            Write-Host "$Category ($($response.Count))" -ForegroundColor Green
            $items = $response | Sort-Object -Property title
            $titles = $items | ForEach-Object { $_.title }
            Format-ColumnOutput -Items $titles
            Write-Host ""
        }
        else {
            $groupedByCategory = $response | Group-Object -property category | Sort-Object -Property Name
            
            foreach ($categoryGroup in $groupedByCategory) {
                Write-Host "$($categoryGroup.Name) ($($categoryGroup.Count))" -ForegroundColor Green
                $items = $categoryGroup.Group | Sort-Object -Property title
                $titles = $items | ForEach-Object { $_.title }
                Format-ColumnOutput -Items $titles
                Write-Host ""
            }
            
            Write-Host "Get-Svgl <name> will return the svg" -ForegroundColor Cyan
            Write-Host "Or try Get-Svgl -c <category> to only return svgs in a category" -ForegroundColor Cyan
            Write-Host ""
        }
    }
    catch {
        Write-Error "Error making request to SVGL API: $_"
    }
}

Export-ModuleMember -Function Get-Svgl

