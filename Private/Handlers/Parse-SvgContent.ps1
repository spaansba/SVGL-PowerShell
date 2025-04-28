function Parse-SvgContent {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content,
        
        [Parameter(Mandatory = $true)]
        [ValidateSet("Vue", "Svelte")]
        [string]$Framework
    )
    
    # Remove XML declaration if present
    if ($Content -match '<?xml') {
        $Content = $Content -replace '<\?xml[^>]*\?>', ''
    }
    
    # Regular expression to match <style> tags in the SVG content
    $styleTagRegex = '<style[^>]*>([\s\S]*?)</style>'
    
    # Extract styles and store them in an array
    $styles = @()
    $matches = [regex]::Matches($Content, $styleTagRegex)
    
    foreach ($match in $matches) {
        $styleContent = $match.Groups[1].Value
        $styles += $styleContent
    }
    
    # Remove <style> tags from the SVG content
    $templateContent = $Content -replace $styleTagRegex, ''
    
    # Create component style
    $scopedAttr = if ($Framework -eq "Vue") { " scoped" } else { "" }
    $componentStyle = if ($styles.Count -gt 0) {
        "<style$scopedAttr>`n$($styles -join "`n")`n</style>"
    } else {
        ""
    }
    
    # Return the result as a hashtable
    return @{
        componentStyle = $componentStyle
        templateContent = $templateContent
    }
}
