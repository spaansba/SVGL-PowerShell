function Get-SvelteCode {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Content,
        
        [Parameter()]
        [ValidateSet('ts', 'js')]
        [string]$Lang = 'ts'
    )
    
    # Create Svelte component code
    $scriptLang = if ($Lang) { "<script lang=`"$Lang`">`n</script>" } else { "<script lang=`"js`">`n</script>" }
    
    $svelteCode = @"
$scriptLang
$Content
"@
    
    return $svelteCode
}
