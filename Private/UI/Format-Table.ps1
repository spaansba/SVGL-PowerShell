function Format-Table {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Format,
        
        [Parameter(Mandatory = $true)]
        [string[]]$Values
    )
    
    # Format the table row
    return $Format -f $Values
}
