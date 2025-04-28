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
    
    foreach ($item in $Results) {
        Write-Host "$($item.title)" -ForegroundColor Cyan
        # Display table header
        Write-Host ($tableFormat -f "Logo Type", "URL", "Raw SVG", "React", "Vue", "Svelte", "Astro", "Angular")
        Write-Host ($tableFormat -f ("─" * 15), "───", ("─" * 7), "─────", "───", "──────", "─────", "───────")
        
        # Process route variants
        if ($item.PSObject.Properties.Name -contains "route") {
            if ($item.route -is [PSCustomObject]) {
                if ($item.route.PSObject.Properties.Name -contains "light") {
                    Write-Host ($tableFormat -f "Light", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Light"
                        Action = "URL"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Light"
                        Action = "RawSVG"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Light"
                        Action = "React"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Light"
                        Action = "Vue"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    

                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Light"
                        Action = "Svelte"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Light"
                        Action = "Astro"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Light"
                        Action = "Angular"
                        Value = $item.route.light
                        Title = $item.title
                    })
                    
                    $counter += 7
                }
                
                # Handle dark route
                if ($item.route.PSObject.Properties.Name -contains "dark") {
                    Write-Host ($tableFormat -f "Dark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Dark"
                        Action = "URL"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Dark"
                        Action = "RawSVG"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Dark"
                        Action = "React"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Dark"
                        Action = "Vue"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Dark"
                        Action = "Svelte"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Dark"
                        Action = "Astro"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Dark"
                        Action = "Angular"
                        Value = $item.route.dark
                        Title = $item.title
                    })
                    
                    $counter += 7
                }
            } 
            else {
                Write-Host "here"
                Write-Host ($tableFormat -f "Default", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                
                [void]$svgOptions.Add(@{
                    Number = $counter
                    Type = "URL"
                    Source = "Default"
                    Action = "URL"
                    Value = $item.route
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+1)
                    Type = "Raw SVG"
                    Source = "Default"
                    Action = "RawSVG"
                    Value = $item.route
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+2)
                    Type = "React"
                    Source = "Default"
                    Action = "React"
                    Value = $item.route
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+3)
                    Type = "Vue"
                    Source = "Default"
                    Action = "Vue"
                    Value = $item.route
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+4)
                    Type = "Svelte"
                    Source = "Default"
                    Action = "Svelte"
                    Value = $item.route
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+5)
                    Type = "Astro"
                    Source = "Default"
                    Action = "Astro"
                    Value = $item.route
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+6)
                    Type = "Angular"
                    Source = "Default"
                    Action = "Angular"
                    Value = $item.route
                    Title = $item.title
                })
                
                $counter += 7
            }
        }
        
        # Process wordmark variants
        if ($item.PSObject.Properties.Name -contains "wordmark") {
            if ($item.wordmark -is [PSCustomObject]) {
                # Handle light wordmark
                if ($item.wordmark.PSObject.Properties.Name -contains "light") {
                    Write-Host ($tableFormat -f "Wordmark Light", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Wordmark Light"
                        Action = "URL"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Wordmark Light"
                        Action = "RawSVG"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Wordmark Light"
                        Action = "React"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Wordmark Light"
                        Action = "Vue"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Wordmark Light"
                        Action = "Svelte"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Wordmark Light"
                        Action = "Astro"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Wordmark Light"
                        Action = "Angular"
                        Value = $item.wordmark.light
                        Title = $item.title
                    })
                    
                    $counter += 7
                }
                
                # Handle dark wordmark
                if ($item.wordmark.PSObject.Properties.Name -contains "dark") {
                    Write-Host ($tableFormat -f "Wordmark Dark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Wordmark Dark"
                        Action = "URL"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Wordmark Dark"
                        Action = "RawSVG"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Wordmark Dark"
                        Action = "React"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Wordmark Dark"
                        Action = "Vue"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    

                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Wordmark Dark"
                        Action = "Svelte"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Wordmark Dark"
                        Action = "Astro"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Wordmark Dark"
                        Action = "Angular"
                        Value = $item.wordmark.dark
                        Title = $item.title
                    })
                    
                    $counter += 7
                }
            } 
            else {
                Write-Host ($tableFormat -f "Wordmark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                
                [void]$svgOptions.Add(@{
                    Number = $counter
                    Type = "URL"
                    Source = "Wordmark"
                    Action = "URL"
                    Value = $item.wordmark
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+1)
                    Type = "Raw SVG"
                    Source = "Wordmark"
                    Action = "RawSVG"
                    Value = $item.wordmark
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+2)
                    Type = "React"
                    Source = "Wordmark"
                    Action = "React"
                    Value = $item.wordmark
                    Title = $item.title
                })

                [void]$svgOptions.Add(@{
                    Number = ($counter+3)
                    Type = "Vue"
                    Source = "Wordmark"
                    Action = "Vue"
                    Value = $item.wordmark
                    Title = $item.title
                })
                
                [void]$svgOptions.Add(@{
                    Number = ($counter+4)
                    Type = "Svelte"
                    Source = "Wordmark"
                    Action = "Svelte"
                    Value = $item.wordmark
                    Title = $item.title
                })

                [void]$svgOptions.Add(@{
                    Number = ($counter+5)
                    Type = "Astro"
                    Source = "Wordmark"
                    Action = "Astro"
                    Value = $item.wordmark
                    Title = $item.title
                })

                [void]$svgOptions.Add(@{
                    Number = ($counter+6)
                    Type = "Angular"
                    Source = "Wordmark"
                    Action = "Angular"
                    Value = $item.wordmark
                    Title = $item.title
                })
                
                $counter += 7
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
    
    # Helper function to get API response data
    function Get-ApiResponseContent {
        param (
            [Parameter(Mandatory = $true)]
            [PSObject]$Response
        )
        
        # Check if the response has a data property (common API response pattern)
        if ($Response.PSObject.Properties.Name -contains "data") {
            return $Response.data
        }
        
        # Otherwise return the full response
        return $Response
    }
    
    # Helper function to process web requests
    function Invoke-ApiRequest {
        param (
            [Parameter(Mandatory = $true)]
            [string]$Uri,
            
            [Parameter()]
            [string]$Method = "Get",
            
            [Parameter()]
            [object]$Body,
            
            [Parameter()]
            [hashtable]$Headers
        )
        
        try {
            if ($Method -eq "Get") {
                $response = Invoke-WebRequest -Uri $Uri -UseBasicParsing
                return $response.Content
            }
            else {
                $response = Invoke-RestMethod -Uri $Uri -Method $Method -Body $Body -Headers $Headers
                return Get-ApiResponseContent -Response $response
            }
        }
        catch {
            Write-Host "Error making request to $Uri : $_" -ForegroundColor Red
            return $null
        }
    }
    
    # Handle selected option
    if ($selectedOption) {
        switch ($selectedOption.Action) {
            "URL" {
                # Copy SVG URL to clipboard
                $selectedOption.Value | Set-Clipboard
                Write-Host "Copied SVG URL to clipboard: $($selectedOption.Value)" -ForegroundColor Green
                Start-Process $selectedOption.Value
            }
            "RawSVG" {
                # Request SVG content and copy to clipboard
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.Value
                
                if ($svgContent) {
                    $svgContent | Set-Clipboard
                    Write-Host "Copied Raw SVG content to clipboard from: $($selectedOption.Value)" -ForegroundColor Green
                }
            }
            "React" {
                # Ask if TypeScript is needed
                $useTypeScript = Read-Host "Do you want TypeScript support? (y/n)"
                $isTypeScript = $useTypeScript.ToLower() -eq 'y'
                
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.Value
                
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
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.Value
                
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
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.Value
                
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
                $svgContent = Invoke-ApiRequest -Uri $selectedOption.Value
                
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
