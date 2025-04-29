Function Write-SvgSearchResults {
    param (
        [array]$Results,
        [string]$SearchTerm
    )

    . "$PSScriptRoot\Options\Add-Options.ps1"
 
    $count = $Results.Count
    Write-Host "Found $count results for '$SearchTerm'" -ForegroundColor Green
    Write-Host ""

    if ($Results.Count -eq 0) {
        Write-Host "No results found for '$SearchTerm'" -ForegroundColor Yellow
        Write-Host "Try Get-Svgl for a list of svgs" -ForegroundColor Yellow
        Write-Host "Or try Get-Svgl -c <category> to only return svgs in a category" -ForegroundColor Yellow
        Write-Host ""
        return
    }

    $svgOptions = [System.Collections.ArrayList]::new()
    $counter = 1
    $tableFormat = "{0,-15} │ {1,-3} │ {2,-7} │ {3,-5} │ {4,-3} │ {5,-6} │ {6,-5} │ {7,-7}"
    $headers = "Logo Type", "URL", "Raw SVG", "React", "Vue", "Svelte", "Astro", "Angular"
    $actions = $headers | Where-Object { $_ -ne "Logo Type" }
    $itemColors = "light", "dark"
    $itemTypes = "route", "wordmark"

    foreach ($item in $Results) {
        Write-Host "$($item.title)" -ForegroundColor Cyan
        Write-Host ($tableFormat -f $headers)
        Write-Host ($tableFormat -f ("─" * 15), "───", ("─" * 7), "─────", "───", "──────", "─────", "───────")
        
        foreach ($itemType in $itemTypes) {
            if ($item.PSObject.Properties.Name -contains $itemType) {

                $LogoTypePreFix = if ($itemType -ne "route") { ($itemType.Substring(0,1).ToUpper() + $itemType.Substring(1)  + " ") } else { "" }
                
                if ($item.$itemType -is [PSCustomObject]) {
                    foreach ($colorType in $itemColors) {
                        if ($item.$itemType.PSObject.Properties.Name -contains $colorType) {
                            $svgOptions = Add-Options -StartNumber $counter `
                                                    -Actions $actions `
                                                    -SvgOptions $svgOptions `
                                                    -LogoType ($LogoTypePreFix + ($colorType -replace '^.', { $_.Value.ToUpper() })) `
                                                    -SvgUrl $item.$itemType.$colorType `
                                                    -Title $item.title `
                                                    -TableFormat $tableFormat
                            $counter += $actions.Length
                        }
                    }
                } 
                else {
                    $svgOptions = Add-Options -StartNumber $counter `
                                    -Actions $actions `
                                    -SvgOptions $svgOptions `
                                    -LogoType ($LogoTypePreFix + "Default") `
                                    -SvgUrl $item.$itemType `
                                    -Title $item.title `
                                    -TableFormat $tableFormat

                    $counter += $actions.length
                }
            }
        }
        Write-Host ""
    }
    return $svgOptions

}
