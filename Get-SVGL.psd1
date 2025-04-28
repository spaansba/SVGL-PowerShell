@{
    # Script module or binary module file associated with this manifest.
    RootModule = 'Get-SVGL.psm1'
    
    # Version number of this module.
    ModuleVersion = '1.0.0'
    
    # ID used to uniquely identify this module
    GUID = 'b3e13b76-75c1-43a9-af77-ffd3c6b7a16a'
    
    # Author of this module
    Author = 'spaansa'
    
    # Company or vendor of this module
    CompanyName = 'N/A'
    
    # Copyright statement for this module
    Copyright = 'See LICENSE file in the project root'
    
    # Description of the functionality provided by this module
    Description = 'PowerShell module for accessing the SVGL API to search for SVG logos'
    
    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.1'
    
    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('Get-Svgl')
    
    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()
    
    # Variables to export from this module
    VariablesToExport = @()
    
    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = 'svgl'
    
    # Private data to pass to the module specified in RootModule/ModuleToProcess
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @('SVG', 'Logo', 'API', "SVGL", "React", "Astro", "Vue", "Angular", "Svelte")
            
            # A URL to the license for this module.
            LicenseUri = 'https://github.com/spaansba/SVGL-PowerShell/blob/main/LICENSE'
            
            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/spaansba/SVGL-PowerShell'
            
            # ReleaseNotes of this module
            ReleaseNotes = 'Initial release of the SVGL PowerShell module'
        }
    }
}
