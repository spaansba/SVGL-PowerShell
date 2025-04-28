function Invoke-SvgAction {
    param (
        [Parameter(Mandatory = $true)]
        [hashtable]$SelectedOption
    )
    
    # Process the selection based on action type
    switch ($SelectedOption.Action) {
        "URL" {
            return Copy-UrlToClipboard -Url $SelectedOption.Value
        }
        "RawSVG" {
            return Copy-RawSvgToClipboard -SvgUrl $SelectedOption.Value
        }
        "None" {
            return Show-NotImplementedMessage
        }
        default {
            Write-Host "Unknown action: $($SelectedOption.Action)" -ForegroundColor Red
            return $false
        }
    }
}
