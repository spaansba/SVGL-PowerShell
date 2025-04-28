function Get-ApiResponseContent {
    param (
        [Parameter(Mandatory = $true)]
        [PSObject]$Response
    )
    
    if ($Response.PSObject.Properties.Name -contains "data") {
        return $Response.data
    }

    return $Response
}