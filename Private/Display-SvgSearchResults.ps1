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
    $tableFormat = "{0,-15} | {1,-3} | {2,-7} | {3,-5} | {4,-3} | {5,-6} | {6,-5} | {7,-7}"
    
    # Process each result
    foreach ($item in $Results) {
        # Display title as header
        Write-Host "Title: $($item.title)"
        
        # Display table header
        Write-Host ($tableFormat -f "SVG", "URL", "Raw SVG", "React", "Vue", "Svelte", "Astro", "Angular")
        Write-Host ($tableFormat -f ("-" * 15), "---", ("-" * 7), "-----", "---", "------", "-----", "-------")
        
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
                    
                    # Add placeholders for the other options
                    foreach ($i in 4..7) {
                        [void]$svgOptions.Add(@{
                            Number = ($counter+$i-1)
                            Type = "Placeholder"
                            Source = "Light"
                            Action = "None"
                            Value = "Not implemented"
                            Title = $item.title
                            SvgUrl = $item.route.light
                        })
                    }
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
                    
                    # Add placeholders for the other options
                    foreach ($i in 4..7) {
                        [void]$svgOptions.Add(@{
                            Number = ($counter+$i-1)
                            Type = "Placeholder"
                            Source = "Dark"
                            Action = "None"
                            Value = "Not implemented"
                            Title = $item.title
                            SvgUrl = $item.route.dark
                        })
                    }
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
                
                # Add placeholders for the other options
                foreach ($i in 4..7) {
                    [void]$svgOptions.Add(@{
                        Number = ($counter+$i-1)
                        Type = "Placeholder"
                        Source = "Default"
                        Action = "None"
                        Value = "Not implemented"
                        Title = $item.title
                        SvgUrl = $item.route
                    })
                }
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
                    
                    # Add placeholders for the other options
                    foreach ($i in 4..7) {
                        [void]$svgOptions.Add(@{
                            Number = ($counter+$i-1)
                            Type = "Placeholder"
                            Source = "Wordmark Light"
                            Action = "None"
                            Value = "Not implemented"
                            Title = $item.title
                            SvgUrl = $item.wordmark.light
                        })
                    }
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
                    
                    # Add placeholders for the other options
                    foreach ($i in 4..7) {
                        [void]$svgOptions.Add(@{
                            Number = ($counter+$i-1)
                            Type = "Placeholder"
                            Source = "Wordmark Dark"
                            Action = "None"
                            Value = "Not implemented"
                            Title = $item.title
                            SvgUrl = $item.wordmark.dark
                        })
                    }
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
                
                # Add placeholders for the other options
                foreach ($i in 4..7) {
                    [void]$svgOptions.Add(@{
                        Number = ($counter+$i-1)
                        Type = "Placeholder"
                        Source = "Wordmark"
                        Action = "None"
                        Value = "Not implemented"
                        Title = $item.title
                        SvgUrl = $item.wordmark
                    })
                }
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
            "None" {
                Write-Host "This option is not implemented yet" -ForegroundColor Yellow
            }
        }
    }
    else {
        Write-Host "Invalid selection" -ForegroundColor Red
    }
}
