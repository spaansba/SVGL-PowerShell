function Get-AstroCode {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content
    )
    
    # Remove width and height attributes
    $cleanedSvg = $Content
    $cleanedSvg = $cleanedSvg -replace '\s*(width|height)="[^"]*"', ''
    $cleanedSvg = $cleanedSvg -replace "\s*(width|height)='[^']*'", ''
    $cleanedSvg = $cleanedSvg -replace '\s*(width|height)=\{[^}]*\}', ''
    
    # Add Astro.props to the SVG tag
    $cleanedSvg = $cleanedSvg -replace '<svg([^>]*)>', {
        param($match, $attrs)
        
        # Clean existing Astro.props if present
        $cleanedAttrs = $args[1] -replace '\s*\{?\.\.\.Astro\.props\}?\s*', ''
        
        # Return the modified SVG opening tag
        return "<svg $cleanedAttrs {...Astro.props}>"
    }
    
    # Return the trimmed SVG
    return $cleanedSvg.Trim()
}
