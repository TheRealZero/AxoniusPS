Function Invoke-AXAPIRequest {
    <#
    .SYNOPSIS
    This function will invoke an Axonius API request.
    .DESCRIPTION
    This function will invoke an Axonius API request. It will use the Axonius URL, Key, and Secret from the environment variables if not provided.
    .PARAMETER AxoniusURL
    The URL of the Axonius instance. If not provided, it will use the environment variable AX_URL.
    .PARAMETER AXKey
    The API Key for the Axonius instance. If not provided, it will use the environment variable AX_KEY.
    .PARAMETER AXSecret
    The API Secret for the Axonius instance. If not provided, it will use the environment variable AX_SECRET.
    .PARAMETER Uri
    The URI of the API endpoint to call. This is required.
    .PARAMETER Method
    The HTTP method to use for the request. This can be GET, POST, PUT, or DELETE. The default is GET.
    .PARAMETER ContentType
    The content type of the request. The default is application/vnd.api+json.
    .PARAMETER Body
    The body of the request. This is optional and will be used if provided.
    .EXAMPLE
    Invoke-AXAPIRequest -ContentType "applicaiton/nvd.api+json" -Uri "/api/queries/specific/5687ef494b9e2df4ce456279"
    This example will invoke a GET request to the Axonius API to get a specific query by ID. The content type is set to application/nvd.api+json.
    #>
    param(
        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$AxoniusURL = $env:AX_URL,
        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$AXKey = $env:AX_KEY,
        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$AXSecret = $env:AX_SECRET,
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$Uri,
        [Parameter(Mandatory = $false)]
        [ValidateSet("GET", "POST", "PUT", "DELETE")]
        [string]$Method = "GET",
        [Parameter(Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [string]$ContentType = "application/vnd.api+json",
        [Parameter(Mandatory = $false)]
        [string]$Body
    )
    $uriSuffix = [Regex]::Replace($Uri,[regex]::Escape($AxoniusURL),'')
    $restURI = ( @($AxoniusURL, $uriSuffix) | Where-Object { $_ } | ForEach-Object { $_.trim('/').trim() } | Where-Object { $_ } ) -join '/' # https://stackoverflow.com/questions/9593535/best-way-to-join-parts-with-a-separator-in-powershell
    $irmParams = @{
        Uri     = $restURI
        Method  = $Method
        Headers = @{
            "api-key"      = $AXKey
            "api-secret"   = $AXSecret
            "Content-Type" = $ContentType
        }
    }
    If ($Body) {
        $irmParams.Add("Body", $Body)
    }
    Invoke-RestMethod @irmParams


}
