    Function Display-SvgSearchResults {
    param (
        [array]$Results,
        [string]$SearchTerm
    )
    
    # Import handler functions
    . "$PSScriptRoot\Handlers\Parse-SvgContent.ps1"
    . "$PSScriptRoot\Handlers\Get-VueCode.ps1"
    . "$PSScriptRoot\Handlers\Get-SvelteCode.ps1"
    . "$PSScriptRoot\Handlers\Get-AngularCode.ps1"
    . "$PSScriptRoot\Handlers\Get-AstroCode.ps1"
    
    # Display results count
    $count = $Results.Count
    Write-Host "Found $count results for '$SearchTerm'" -ForegroundColor Green
    Write-Host ""
    
    # Early return for empty results
    if ($Results.Count -eq 0) {
        Write-Host "No results found for '$SearchTerm'" -ForegroundColor Yellow
        Write-Host "Try Get-Svgl for a list of svgs" -ForegroundColor Yellow
        Write-Host "Or try Get-Svgl -c <category> to only return svgs in a category" -ForegroundColor Yellow
        return
    }
    
    # Initialize options array
    $svgOptions = [System.Collections.ArrayList]::new()
    $counter = 1
    
    # Table format string for consistent display
    $tableFormat = "{0,-15} │ {1,-3} │ {2,-7} │ {3,-5} │ {4,-3} │ {5,-6} │ {6,-5} │ {7,-7}"
    
    # Process each result
    foreach ($item in $Results) {
        # Display title as header
        Write-Host "$($item.title)" -ForegroundColor Cyan
        
        # Display table header
        Write-Host ($tableFormat -f "SVG", "URL", "Raw SVG", "React", "Vue", "Svelte", "Astro", "Angular")
        Write-Host ($tableFormat -f ("─" * 15), "───", ("─" * 7), "─────", "───", "──────", "─────", "───────")
        
        # Process route variants
        if ($item.PSObject.Properties.Name -contains "route") {
            if ($item.route -is [PSCustomObject]) {
                # Handle light route
                if ($item.route.PSObject.Properties.Name -contains "light") {
                    Write-Host ($tableFormat -f "Light", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    # Add URL option
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Light"
                        Action = "URL"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    # Add Raw SVG option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Light"
                        Action = "RawSVG"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    # Add React option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Light"
                        Action = "React"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    # Add Vue option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Light"
                        Action = "Vue"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    # Add Svelte option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Light"
                        Action = "Svelte"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    # Add Astro option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Light"
                        Action = "Astro"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    # Add Angular option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Light"
                        Action = "Angular"
                        Value = $item.route.light
                        Title = $item.title
                        SvgUrl = $item.route.light
                    })
                    
                    $counter += 7
                }
                
                # Handle dark route
                if ($item.route.PSObject.Properties.Name -contains "dark") {
                    Write-Host ($tableFormat -f "Dark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    # Add URL option
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Dark"
                        Action = "URL"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    # Add Raw SVG option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Dark"
                        Action = "RawSVG"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    # Add React option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Dark"
                        Action = "React"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    # Add Vue option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Dark"
                        Action = "Vue"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    # Add Svelte option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Dark"
                        Action = "Svelte"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    # Add Astro option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Dark"
                        Action = "Astro"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    # Add Angular option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Dark"
                        Action = "Angular"
                        Value = $item.route.dark
                        Title = $item.title
                        SvgUrl = $item.route.dark
                    })
                    
                    $counter += 7
                }
            } 
            else {
                Write-Host ($tableFormat -f "Default", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                
                # Add URL option
                [void]$svgOptions.Add(@{
                    Number = $counter
                    Type = "URL"
                    Source = "Default"
                    Action = "URL"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
                })
                
                # Add Raw SVG option
                [void]$svgOptions.Add(@{
                    Number = ($counter+1)
                    Type = "Raw SVG"
                    Source = "Default"
                    Action = "RawSVG"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
                })
                
                # Add React option
                [void]$svgOptions.Add(@{
                    Number = ($counter+2)
                    Type = "React"
                    Source = "Default"
                    Action = "React"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
                })
                
                # Add Vue option
                [void]$svgOptions.Add(@{
                    Number = ($counter+3)
                    Type = "Vue"
                    Source = "Default"
                    Action = "Vue"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
                })
                
                # Add Svelte option
                [void]$svgOptions.Add(@{
                    Number = ($counter+4)
                    Type = "Svelte"
                    Source = "Default"
                    Action = "Svelte"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
                })
                
                # Add Astro option
                [void]$svgOptions.Add(@{
                    Number = ($counter+5)
                    Type = "Astro"
                    Source = "Default"
                    Action = "Astro"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
                })
                
                # Add Angular option
                [void]$svgOptions.Add(@{
                    Number = ($counter+6)
                    Type = "Angular"
                    Source = "Default"
                    Action = "Angular"
                    Value = $item.route
                    Title = $item.title
                    SvgUrl = $item.route
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
                    
                    # Add URL option
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Wordmark Light"
                        Action = "URL"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    # Add Raw SVG option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Wordmark Light"
                        Action = "RawSVG"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    # Add React option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Wordmark Light"
                        Action = "React"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    # Add Vue option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Wordmark Light"
                        Action = "Vue"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    # Add Svelte option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Wordmark Light"
                        Action = "Svelte"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    # Add Astro option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Wordmark Light"
                        Action = "Astro"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    # Add Angular option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Wordmark Light"
                        Action = "Angular"
                        Value = $item.wordmark.light
                        Title = $item.title
                        SvgUrl = $item.wordmark.light
                    })
                    
                    $counter += 7
                }
                
                # Handle dark wordmark
                if ($item.wordmark.PSObject.Properties.Name -contains "dark") {
                    Write-Host ($tableFormat -f "Wordmark Dark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                    
                    # Add URL option
                    [void]$svgOptions.Add(@{
                        Number = $counter
                        Type = "URL"
                        Source = "Wordmark Dark"
                        Action = "URL"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    # Add Raw SVG option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+1)
                        Type = "Raw SVG"
                        Source = "Wordmark Dark"
                        Action = "RawSVG"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    # Add React option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+2)
                        Type = "React"
                        Source = "Wordmark Dark"
                        Action = "React"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    # Add Vue option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+3)
                        Type = "Vue"
                        Source = "Wordmark Dark"
                        Action = "Vue"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    # Add Svelte option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+4)
                        Type = "Svelte"
                        Source = "Wordmark Dark"
                        Action = "Svelte"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    # Add Astro option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+5)
                        Type = "Astro"
                        Source = "Wordmark Dark"
                        Action = "Astro"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    # Add Angular option
                    [void]$svgOptions.Add(@{
                        Number = ($counter+6)
                        Type = "Angular"
                        Source = "Wordmark Dark"
                        Action = "Angular"
                        Value = $item.wordmark.dark
                        Title = $item.title
                        SvgUrl = $item.wordmark.dark
                    })
                    
                    $counter += 7
                }
            } 
            else {
                Write-Host ($tableFormat -f "Wordmark", $counter, ($counter+1), ($counter+2), ($counter+3), ($counter+4), ($counter+5), ($counter+6))
                
                # Add URL option
                [void]$svgOptions.Add(@{
                    Number = $counter
                    Type = "URL"
                    Source = "Wordmark"
                    Action = "URL"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                # Add Raw SVG option
                [void]$svgOptions.Add(@{
                    Number = ($counter+1)
                    Type = "Raw SVG"
                    Source = "Wordmark"
                    Action = "RawSVG"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                # Add React option
                [void]$svgOptions.Add(@{
                    Number = ($counter+2)
                    Type = "React"
                    Source = "Wordmark"
                    Action = "React"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                # Add Vue option
                [void]$svgOptions.Add(@{
                    Number = ($counter+3)
                    Type = "Vue"
                    Source = "Wordmark"
                    Action = "Vue"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                # Add Svelte option
                [void]$svgOptions.Add(@{
                    Number = ($counter+4)
                    Type = "Svelte"
                    Source = "Wordmark"
                    Action = "Svelte"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                # Add Astro option
                [void]$svgOptions.Add(@{
                    Number = ($counter+5)
                    Type = "Astro"
                    Source = "Wordmark"
                    Action = "Astro"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                # Add Angular option
                [void]$svgOptions.Add(@{
                    Number = ($counter+6)
                    Type = "Angular"
                    Source = "Wordmark"
                    Action = "Angular"
                    Value = $item.wordmark
                    Title = $item.title
                    SvgUrl = $item.wordmark
                })
                
                $counter += 7
            }
        }
        
        Write-Host ""
    }
    
    # Prompt for selection
    $selection = Read-Host "Enter the number of the SVG you want to use"
    
    # Process selection
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
    }
    else {
        Write-Host "Invalid selection" -ForegroundColor Red
    }
}
