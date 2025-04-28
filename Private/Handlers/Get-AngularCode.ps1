function Get-AngularCode {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content,
        
        [Parameter(Mandatory = $true)]
        [string]$ComponentName
    )
    
    # Update SVG to include Angular binding for width and height
    $updatedSvgContent = $Content -replace '<svg([^>]*)>', '<svg$1 [attr.width]="size.width" [attr.height]="size.height">'
    $trimmedSvgContent = $updatedSvgContent.Trim()
    
    # Create template part with literal backticks
    $templateStart = "template: ``"
    $templateContent = "`n    $trimmedSvgContent"
    $templateEnd = "`n  ``,"
    
    # Create Angular component
    $componentStart = @"
import { Component, Input } from '@angular/core';

@Component({
  selector: 'svg-${ComponentName}',
  standalone: true,
"@
    
    $componentEnd = @"

})
export class ${ComponentName}Component {
  @Input({ required: true }) size: { width: number; height: number };
}
"@
    
    # Combine all parts
    $angularCode = $componentStart + $templateStart + $templateContent + $templateEnd + $componentEnd
    
    return $angularCode
}
