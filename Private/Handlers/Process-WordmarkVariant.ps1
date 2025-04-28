function Process-WordmarkVariant {
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
    
    if (-not ($Item.PSObject.Properties.Name -contains "wordmark")) {
        return $Options
    }
    
    if ($Item.wordmark -is [PSCustomObject]) {
        # Handle light wordmark
        if ($Item.wordmark.PSObject.Properties.Name -contains "light") {
            Write-Host ($TableFormat -f "Wordmark Light", $Counter.Value, ($Counter.Value+1), ($Counter.Value+2), ($Counter.Value+3), ($Counter.Value+4), ($Counter.Value+5), ($Counter.Value+6))
            $Counter.Value = Add-StandardRowOptions -Options $Options -Counter $Counter.Value -Source "Wordmark Light" -ItemUrl $Item.url -SvgRoute $Item.wordmark.light
        }
        
        # Handle dark wordmark
        if ($Item.wordmark.PSObject.Properties.Name -contains "dark") {
            Write-Host ($TableFormat -f "Wordmark Dark", $Counter.Value, ($Counter.Value+1), ($Counter.Value+2), ($Counter.Value+3), ($Counter.Value+4), ($Counter.Value+5), ($Counter.Value+6))
            $Counter.Value = Add-StandardRowOptions -Options $Options -Counter $Counter.Value -Source "Wordmark Dark" -ItemUrl $Item.url -SvgRoute $Item.wordmark.dark
        }
    } 
    else {
        Write-Host ($TableFormat -f "Wordmark", $Counter.Value, ($Counter.Value+1), ($Counter.Value+2), ($Counter.Value+3), ($Counter.Value+4), ($Counter.Value+5), ($Counter.Value+6))
        $Counter.Value = Add-StandardRowOptions -Options $Options -Counter $Counter.Value -Source "Wordmark" -ItemUrl $Item.url -SvgRoute $Item.wordmark
    }
    
    return $Options
}
