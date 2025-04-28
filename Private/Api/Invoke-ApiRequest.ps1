# Helper function to process web requests
function Invoke-ApiRequest {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Uri,
        
        [Parameter()]
        [string]$Method = "Get",
        
        [Parameter()]
        [object]$Body,
        
        [Parameter()]
        [hashtable]$Headers
    )

    . "$PSScriptRoot.\Get-ApiResponseContent.ps1"
    
    try {
        if ($Method -eq "Get") {
            $response = Invoke-WebRequest -Uri $Uri -UseBasicParsing
            return $response.Content
        }
        else {
            $response = Invoke-RestMethod -Uri $Uri -Method $Method -Body $Body -Headers $Headers
            return Get-ApiResponseContent -Response $response
        }
    }
    catch {
        Write-Host "Error making request to $Uri : $_" -ForegroundColor Red
        return $null
    }
}