function Read-SelectedOption {
    param(
        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$SvgOptions
    )
    
    $selection = Read-Host "Enter the number of the SVG you want to copy"
    
    try {
        $selectionInt = [int]$selection
        $selectedOption = $SvgOptions | Where-Object { $_.Number -eq $selectionInt } | Select-Object -First 1 -Property *
        
        if ($selectedOption -and $selectedOption -isnot [System.Collections.Hashtable]) {
            $hashtable = @{}
            $selectedOption.PSObject.Properties | ForEach-Object {
                $hashtable[$_.Name] = $_.Value
            }
            $selectedOption = $hashtable
        }
    }
    catch {
        $selectedOption = $null
    }
    
    return $selectedOption
}