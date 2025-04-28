function Write-TableHeader {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Format,
        
        [Parameter(Mandatory = $true)]
        [string[]]$Headers,
        
        [Parameter(Mandatory = $true)]
        [int[]]$Widths
    )
    
    # Write the header row
    Write-Host (Format-Table -Format $Format -Values $Headers)
    
    # Create separator strings based on the width
    $separators = @()
    foreach ($width in $Widths) {
        $separators += "-" * $width
    }
    
    # Write the separator row
    Write-Host (Format-Table -Format $Format -Values $separators)
}
