function Add-StandardRowOptions {
    param (
        [Parameter(Mandatory = $true)]
        [array]$Options,
        
        [Parameter(Mandatory = $true)]
        [int]$Counter,
        
        [Parameter(Mandatory = $true)]
        [string]$Source,
        
        [Parameter(Mandatory = $true)]
        [string]$ItemUrl,
        
        [Parameter(Mandatory = $true)]
        [string]$SvgRoute
    )
    
    # Add URL option
    $Options += New-SvgOption -Number $Counter -Type "URL" -Source $Source -Action "URL" -Value $ItemUrl
    
    # Add Raw SVG option
    $Options += New-SvgOption -Number ($Counter+1) -Type "Raw SVG" -Source $Source -Action "RawSVG" -Value $SvgRoute
    
    # Add placeholder options for other framework variants (React, Vue, etc.)
    foreach ($i in 3..7) {
        $Options += New-SvgOption -Number ($Counter+$i-1) -Type "Placeholder" -Source $Source -Action "None" -Value "Not implemented"
    }
    
    # Return the updated counter
    return $Counter + 7
}
