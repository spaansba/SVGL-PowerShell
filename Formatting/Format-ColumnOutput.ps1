function Format-ColumnOutput {
    param (
        [Parameter(Mandatory = $true)]
        [array]$Items,
        
        [Parameter()]
        [int]$ColumnsPerRow = 3,
        
        [Parameter()]
        [int]$ColumnWidth = 25
    )
    
    # Process items in groups based on ColumnsPerRow
    for ($i = 0; $i -lt $Items.Count; $i += $ColumnsPerRow) {
        $row = ""
        
        # Process each column in this row
        for ($j = 0; $j -lt $ColumnsPerRow; $j++) {
            $index = $i + $j
            
            # If we have an item for this position, add it with padding
            if ($index -lt $Items.Count) {
                $row += "{0,-$ColumnWidth}" -f $Items[$index]
            }
        }
        
        # Output the formatted row
        Write-Host $row
    }
}