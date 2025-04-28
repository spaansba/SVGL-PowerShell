function Process-RouteVariant {
    param (
        [Parameter(Mandatory = $true)]
        [PSObject]$Item,
        
        [Parameter(Mandatory = $true)]
        [array]$Options,
        
        [Parameter(Mandatory = $true)]
        [ref]$Counter,
        
        [Parameter(Mandatory = $true)]
        [string]$TableFormat
    )
    
    if (-not ($Item.PSObject.Properties.Name -contains "route")) {
        return $Options
    }
    
    if ($Item.route -is [PSCustomObject]) {
        # Handle light route
        if ($Item.route.PSObject.Properties.Name -contains "light") {
            Write-Host ($TableFormat -f "Light", $Counter.Value, ($Counter.Value+1), ($Counter.Value+2), ($Counter.Value+3), ($Counter.Value+4), ($Counter.Value+5), ($Counter.Value+6))
            $Counter.Value = Add-StandardRowOptions -Options $Options -Counter $Counter.Value -Source "Light" -ItemUrl $Item.url -SvgRoute $Item.route.light
        }
        
        # Handle dark route
        if ($Item.route.PSObject.Properties.Name -contains "dark") {
            Write-Host ($TableFormat -f "Dark", $Counter.Value, ($Counter.Value+1), ($Counter.Value+2), ($Counter.Value+3), ($Counter.Value+4), ($Counter.Value+5), ($Counter.Value+6))
            $Counter.Value = Add-StandardRowOptions -Options $Options -Counter $Counter.Value -Source "Dark" -ItemUrl $Item.url -SvgRoute $Item.route.dark
        }
    } 
    else {
        Write-Host ($TableFormat -f "Default", $Counter.Value, ($Counter.Value+1), ($Counter.Value+2), ($Counter.Value+3), ($Counter.Value+4), ($Counter.Value+5), ($Counter.Value+6))
        $Counter.Value = Add-StandardRowOptions -Options $Options -Counter $Counter.Value -Source "Default" -ItemUrl $Item.url -SvgRoute $Item.route
    }
    
    return $Options
}
