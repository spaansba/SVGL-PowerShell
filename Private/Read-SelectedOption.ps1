function Read-SelectedOption {
    [System.Collections.ArrayList]$SvgOptions
    $selection = Read-Host "Enter the number of the SVG you want to copy"

    try {
        $selectionInt = [int]$selection
        # Use Select-Object -First 1 to ensure we get a single object, not an array
        $selectedOption = $SvgOptions | Where-Object { $_.Number -eq $selectionInt } | Select-Object -First 1
    }
    catch {
        $selectedOption = $null
    }

    return $selectedOption
}