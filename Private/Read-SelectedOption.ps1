function Read-SelectedOption {
    [System.Collections.ArrayList]$SvgOptions
    $selection = Read-Host "Enter the number of the SVG you want to copy"

    try {
        $selectionInt = [int]$selection
        $selectedOption = $SvgOptions | Where-Object { $_.Number -eq $selectionInt }
    }
    catch {
        $selectedOption = $null
    }

    return $selectedOption
}