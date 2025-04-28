# Return true if typescript
function Get-TypeScriptPreference {
    param()

    do {
        $response = Read-Host "Do you want TypeScript support? (y/n)"
        $response = $response.Trim().ToLower()
        
        if ($response -notin 'y', 'n', 'yes', 'no') {
            Write-Host "Please enter 'y' or 'n'" -ForegroundColor Yellow
        }
    } while ($response -notin 'y', 'n', 'yes', 'no')


    return $response -in 'y', 'yes'
}