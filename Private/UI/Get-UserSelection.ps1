function Get-UserSelection {
    param (
        [Parameter(Mandatory = $true)]
        [array]$Options
    )
    
    if ($Options.Count -eq 0) {
        return $null
    }
    
    # Prompt for selection
    $selection = Read-Host "Enter the number of the SVG you want to use"
    
    # Convert selection to integer and find matching option
    try {
        $selectionInt = [int]$selection
        $selectedOption = $Options | Where-Object { $_.Number -eq $selectionInt }
        return $selectedOption
    }
    catch {
        Write-Host "Invalid selection" -ForegroundColor Red
        return $null
    }
}
