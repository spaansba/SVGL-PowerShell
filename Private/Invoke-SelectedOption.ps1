function Invoke-SelectedOption {
    [System.Object[]]$SelectedOption

    . "$PSScriptRoot\Handlers\Parse-SvgContent.ps1"
    . "$PSScriptRoot\Handlers\Get-VueCode.ps1"
    . "$PSScriptRoot\Handlers\Get-SvelteCode.ps1"
    . "$PSScriptRoot\Handlers\Get-AngularCode.ps1"
    . "$PSScriptRoot\Handlers\Get-AstroCode.ps1"
    . "$PSScriptRoot\Options\Get-TypeScriptPreference.ps1"
    . "$PSScriptRoot\Api\Invoke-ApiRequest.ps1"

    if ($SelectedOption) {
        switch ($SelectedOption.Action) {
            "URL" {
                # Copy SVG URL to clipboard
                $SelectedOption.SvgUrl | Set-Clipboard
                Write-Host "Copied SVG URL to clipboard: $($SelectedOption.SvgUrl)" -ForegroundColor Green
                Start-Process $SelectedOption.SvgUrl
            }
            "Raw SVG" {
                # Request SVG content and copy to clipboard
                $svgContent = Invoke-ApiRequest -Uri $SelectedOption.SvgUrl
                
                if ($svgContent) {
                    $svgContent | Set-Clipboard
                    Write-Host "Copied Raw SVG content to clipboard from: $($SelectedOption.SvgUrl)" -ForegroundColor Green
                }
            }
            "React" {
                $isTypeScript = Get-TypeScriptPreference
                
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $SelectedOption.SvgUrl
                
                if ($svgContent) {
                    # Prepare the request body
                    $body = @{
                        code = $svgContent
                        name = $SelectedOption.Title
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
                        
                        $tsMessage = if ($isTypeScript) { "TypeScript" } else { "JavaScript" }
                        Write-Host "Copied $tsMessage React component to clipboard for: $($SelectedOption.Title) ($($SelectedOption.LogoType))" -ForegroundColor Green
                    }
                }
            }
            "Vue" {
                $isTypeScript = Get-TypeScriptPreference
                $lang = if ($isTypeScript) { 'ts' } else { 'js' }

                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $SelectedOption.SvgUrl
                
                if ($svgContent) {
                    # Generate Vue component
                    $vueComponent = Get-VueCode -Content $svgContent -Lang $lang
                    
                    # Copy Vue component to clipboard
                    $vueComponent | Set-Clipboard
                    
                    $tsMessage = if ($isTypeScript) { "TypeScript" } else { "JavaScript" }
                    Write-Host "Copied $tsMessage Vue component to clipboard for: $($SelectedOption.Title) ($($SelectedOption.LogoType))" -ForegroundColor Green
                }
            }
            "Svelte" {
                $isTypeScript = Get-TypeScriptPreference
                $lang = if ($isTypeScript) { 'ts' } else { 'js' }
                
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $SelectedOption.SvgUrl
                
                if ($svgContent) {
                    # Generate Svelte component
                    $svelteComponent = Get-SvelteCode -Content $svgContent -Lang $lang
                    
                    # Copy Svelte component to clipboard
                    $svelteComponent | Set-Clipboard
                    
                    $tsMessage = if ($isTypeScript) { "TypeScript" } else { "JavaScript" }
                    Write-Host "Copied $tsMessage  Svelte component to clipboard for: $($SelectedOption.Title) ($($SelectedOption.LogoType))" -ForegroundColor Green
                }
            }
            "Angular" {
                # First get the SVG content
                $svgContent = Invoke-ApiRequest -Uri $SelectedOption.SvgUrl
                
                if ($svgContent) {
                    # Generate Angular component
                    # Use title as component name (ensure valid name by removing special chars and capitalizing)
                    $componentName = $SelectedOption.Title -replace '[^a-zA-Z0-9]', '' 
                    $componentName = (Get-Culture).TextInfo.ToTitleCase($componentName)
                    
                    $angularComponent = Get-AngularCode -Content $svgContent -ComponentName $componentName
                    
                    # Copy Angular component to clipboard
                    $angularComponent | Set-Clipboard
                    
                    Write-Host "Copied Angular component to clipboard for: $($SelectedOption.Title) ($($SelectedOption.LogoType))" -ForegroundColor Green
                }
            }
            "Astro" {
                Write-Host "This option is not implemented yet" -ForegroundColor Yellow
            }
        }
        Write-Host ""
    }
    else {
        Write-Host "Invalid selection" -ForegroundColor Red
    }
}