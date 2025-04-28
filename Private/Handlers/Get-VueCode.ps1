function Get-VueCode {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content,
        
        [Parameter()]
        [string]$Lang = ""
    )
    
    # Create Vue component code
    $langAttribute = if ($Lang) { " lang=`"$Lang`"" } else { "" }
    
    # Parse SVG content to extract any styles
    $parsedContent = Parse-SvgContent -Content $Content -Framework "Vue"
    
    $vueCode = @"
<script setup$langAttribute></script>
<template>
 $($parsedContent.templateContent)
</template>
  
$($parsedContent.componentStyle)
"@
    
    return $vueCode
}
