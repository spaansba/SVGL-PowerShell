Function Display-SvgSearchResults {
    param (
        [array]$Results,
        [string]$SearchTerm
    )

    . "$PSScriptRoot\Handlers\Parse-SvgContent.ps1"
    . "$PSScriptRoot\Handlers\Get-VueCode.ps1"
    . "$PSScriptRoot\Handlers\Get-SvelteCode.ps1"
    . "$PSScriptRoot\Handlers\Get-AngularCode.ps1"
    . "$PSScriptRoot\Handlers\Get-AstroCode.ps1"
    . "$PSScriptRoot\Options\Add-Options.ps1"
    . "$PSScriptRoot\Api\Invoke-ApiRequest.ps1"

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

    $selection = Read-Host "Enter the number of the SVG you want to copy"

    try {
        $selectionInt = [int]$selection
        $selectedOption = $svgOptions | Where-Object { $_.Number -eq $selectionInt }
    }
    catch {
        $selectedOption = $null
    }

    # Handle selected option
    if ($selectedOption) {
        switch ($selectedOption.Action) {
            "URL" {
                # Copy SVG URL to clipboard
                $selectedOption.SvgUrl | Set-Clipboard
                Write-Host "Copied SVG URL to clipboard: $($selectedOption.SvgUrl)" -ForegroundColor Green
                Start-Process $selectedOption.SvgUrl
            }
            "Raw SVG" {
                # Request SVG content and copy to clipboard
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.SvgUrl
                
                if ($svgContent) {
                    $svgContent | Set-Clipboard
                    Write-Host "Copied Raw SVG content to clipboard from: $($selectedOption.SvgUrl)" -ForegroundColor Green
                }
            }
            "React" {
                # Ask if TypeScript is needed
                $useTypeScript = Read-Host "Do you want TypeScript support? (y/n)"
                $isTypeScript = $useTypeScript.ToLower() -eq 'y'
                
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.SvgUrl
                
                if ($svgContent) {
                    # Prepare the request body
                    $body = @{
                        code = $svgContent
                        name = $selectedOption.Title
                        typescript = $isTypeScript
                    } | ConvertTo-Json
                    
                    # Send request to SVGR API
                    $headers = @{
                        "Content-Type" = "application/json"
                    }
                    
                    $reactComponent = Invoke-ApiRequest -Uri "https://svgl.app/api/svgs/svgr" -Method Post -Body $body -Headers $headers
                    
                    if ($reactComponent) {
                        # Copy React component to clipboard
                        $reactComponent | Set-Clipboard
                        
                        $tsMessage = if ($isTypeScript) { " with TypeScript" } else { "" }
                        Write-Host "Copied React component$tsMessage to clipboard for: $($selectedOption.Title)" -ForegroundColor Green
                    }
                }
            }
            "Vue" {
                # Ask if TypeScript is needed
                $useTypeScript = Read-Host "Do you want TypeScript support? (y/n)"
                $lang = if ($useTypeScript.ToLower() -eq 'y') { "ts" } else { "" }
                
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.SvgUrl
                
                if ($svgContent) {
                    # Generate Vue component
                    $vueComponent = Get-VueCode -Content $svgContent -Lang $lang
                    
                    # Copy Vue component to clipboard
                    $vueComponent | Set-Clipboard
                    
                    $tsMessage = if ($lang) { " with TypeScript" } else { "" }
                    Write-Host "Copied Vue component$tsMessage to clipboard for: $($selectedOption.Title)" -ForegroundColor Green
                }
            }
            "Svelte" {
                # Ask if TypeScript is needed
                $useTypeScript = Read-Host "Do you want TypeScript support? (y/n)"
                $lang = if ($useTypeScript.ToLower() -eq 'y') { "ts" } else { "" }
                
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.SvgUrl
                
                if ($svgContent) {
                    # Generate Svelte component
                    $svelteComponent = Get-SvelteCode -Content $svgContent -Lang $lang
                    
                    # Copy Svelte component to clipboard
                    $svelteComponent | Set-Clipboard
                    
                    $tsMessage = if ($lang) { " with TypeScript" } else { "" }
                    Write-Host "Copied Svelte component$tsMessage to clipboard for: $($selectedOption.Title)" -ForegroundColor Green
                }
            }
            "Angular" {
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.SvgUrl
                
                if ($svgContent) {
                    # Generate Angular component
                    # Use title as component name (ensure valid name by removing special chars and capitalizing)
                    $componentName = $selectedOption.Title -replace '[^a-zA-Z0-9]', '' 
                    $componentName = (Get-Culture).TextInfo.ToTitleCase($componentName)
                    
                    $angularComponent = Get-AngularCode -Content $svgContent -ComponentName $componentName
                    
                    # Copy Angular component to clipboard
                    $angularComponent | Set-Clipboard
                    
                    Write-Host "Copied Angular component to clipboard for: $($selectedOption.Title)" -ForegroundColor Green
                }
            }
            "None" {
                Write-Host "This option is not implemented yet" -ForegroundColor Yellow
            }
        }
        Write-Host ""
    }
    else {
        Write-Host "Invalid selection" -ForegroundColor Red
    }
}
