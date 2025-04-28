# Constants for table formatting
$script:SVG_TABLE_FORMAT = "{0,-15} | {1,-3} | {2,-3} | {3,-5} | {4,-3} | {5,-6} | {6,-5} | {7,-7}"
$script:SVG_TABLE_HEADERS = @("Logo Type", "URL", "Raw SVG", "React", "Vue", "Svelte", "Astro", "Angular")
$script:SVG_TABLE_HEADER_COUNT = $script:SVG_TABLE_HEADERS.Count
$script:SVG_TABLE_WIDTHS = @(15, 3, 7, 5, 3, 6, 5, 7)

# Constants for API URLs
$script:SVGL_API_BASE_URL = "https://api.svgl.app"
$script:SVGL_API_SEARCH_URL = "$SVGL_API_BASE_URL?search="
$script:SVGL_API_CATEGORY_URL = "$SVGL_API_BASE_URL/category/"

# Constants for result messages
$script:MSG_NO_RESULTS = "No results found for '{0}'"
$script:MSG_TRY_GET_SVGL = "Try Get-Svgl for a list of svgs"
$script:MSG_TRY_CATEGORY = "Or try Get-Svgl -c <category> to only return svgs in a category"
$script:MSG_FOUND_RESULTS = "Found {0} results for '{1}'"
