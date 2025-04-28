Function Add-Options {
    param (
        [int]$StartNumber,
        [string]$Source,
        [string]$SvgUrl,
        [string]$Title,
        [string[]]$Actions,
        [System.Collections.ArrayList]$SvgOptions

    )

    $offset = 0
    foreach ($action in $Actions) {
        [void]$SvgOptions.Add(@{
            Number = $counter + $offset
            Source = $Source
            Action = $action
            SvgUrl = $SvgUrl
            Title = $Title
        })
        $offset += 1
    }

    return $SvgOptions
}
