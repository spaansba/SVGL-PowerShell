# SVGL-PowerShell (Get-SVGL)
A PowerShell module for accessing the SVGL API to search for SVG logos.

![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/Get-SVGL)
![PowerShell Gallery](https://img.shields.io/powershellgallery/dt/Get-SVGL)
![License](https://img.shields.io/github/license/spaansba/SVGL-PowerShell)

## Installation

### Manual Installation

From [PowerShell Gallery](https://www.powershellgallery.com/packages/Get-SVGL):

```powershell
Install-Module -Name Get-SVGL
```

## Usage

### List All SVG Categories

```powershell
Get-Svgl
```

### List SVGs in a Specific Category

```powershell
Get-Svgl -Category Framework
# Or use the alias
Get-Svgl -c Framework
```

### Search for a Specific SVG

```powershell
Get-Svgl "React"
```

## License

See the [LICENSE](https://github.com/spaansba/SVGL-PowerShell/blob/main/LICENSE) file for details.

## Credits

Original SVGL API: [https://svgl.app/](https://svgl.app/)
