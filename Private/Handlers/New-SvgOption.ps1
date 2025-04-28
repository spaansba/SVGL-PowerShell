function New-SvgOption {
    param (
        [Parameter(Mandatory = $true)]
        [int]$Number,
        
        [Parameter(Mandatory = $true)]
        [string]$Type,
        
        [Parameter(Mandatory = $true)]
        [string]$Source,
        
        [Parameter(Mandatory = $true)]
        [string]$Action,
        
        [Parameter(Mandatory = $true)]
        [string]$Value
    )
    
    return @{
        Number = $Number
        Type = $Type
        Source = $Source
        Action = $Action
        Value = $Value
    }
}
