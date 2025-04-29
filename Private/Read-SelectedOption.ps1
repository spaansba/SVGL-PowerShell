function Read-SelectedOption {
    param(
        [Parameter(Mandatory=$true)]
        [System.Collections.ArrayList]$SvgOptions
    )
    
    $selection = Read-Host "Enter the number of the SVG you want to copy"
    
    try {
        $selectionInt = [int]$selection
        # Use Select-Object -First 1 to ensure we get a single object
        # Use -Property * to ensure we preserve the original object structure
        $selectedOption = $SvgOptions | Where-Object { $_.Number -eq $selectionInt } | Select-Object -First 1 -Property *
        
        # If you need to ensure it's a hashtable specifically
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