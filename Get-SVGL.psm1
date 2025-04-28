# Get the path to the module
$ModulePath = $PSScriptRoot
New-Alias -Name "svgl" -Value "Get-Svgl"

# Load private functions from the root Private directory only (no subdirectories)
$PrivateFunctionsPath = Join-Path -Path $ModulePath -ChildPath 'Private'
if (Test-Path -Path $PrivateFunctionsPath) {
    $PrivateFunctions = Get-ChildItem -Path $PrivateFunctionsPath -Filter '*.ps1' -Depth 0 -ErrorAction SilentlyContinue
    foreach ($Function in $PrivateFunctions) {
        try {
            . $Function.FullName
        }
        catch {
            Write-Error -Message "Failed to import function $($Function.FullName): $_"
        }
    }
}

# Load all public functions
$PublicFunctionsPath = Join-Path -Path $ModulePath -ChildPath 'Public'
if (Test-Path -Path $PublicFunctionsPath) {
    $PublicFunctions = Get-ChildItem -Path $PublicFunctionsPath -Filter '*.ps1' -Recurse -ErrorAction SilentlyContinue
    foreach ($Function in $PublicFunctions) {
        try {
            . $Function.FullName
        }
        catch {
            Write-Error -Message "Failed to import function $($Function.FullName): $_"
        }
    }
}

# Export public functions
$PublicFunctions | ForEach-Object {
    Export-ModuleMember -Function $_.BaseName
}
