# SVGL-PowerShell

A PowerShell module for accessing the SVGL API to search for SVG logos.

## Installation

### Manual Installation

1. Download or clone this repository
2. Copy the `SVGL-PowerShell` folder to a directory in your PSModulePath
   - To find your PSModulePath directories, run: `$env:PSModulePath -split ';'`
   - Common locations: 
     - `C:\Users\<username>\Documents\PowerShell\Modules`
     - `C:\Program Files\PowerShell\Modules`
3. Import the module:
   ```powershell
   Import-Module SVGL-PowerShell
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

## Available Categories

- AI
- Software
- Hardware
- Library
- Hosting
- Framework
- Devtool
- Monorepo
- CMS
- Database
- Compiler
- Crypto
- Cybersecurity
- Social
- Entertainment
- Browser
- Language
- Education
- Design
- Community
- Marketplace
- Music
- Vercel
- Google
- Payment
- VoidZero
- Authentication
- IoT
- Config
- Secrets

## License

See the [LICENSE](https://github.com/spaansba/SVGL-PowerShell/blob/main/LICENSE) file for details.

## Credits

Original SVGL API: [https://svgl.app/](https://svgl.app/)
