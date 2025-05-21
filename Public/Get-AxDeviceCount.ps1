Function Get-AxDeviceCount {
    <#
    .SYNOPSIS
    Get-AxDevice retrieves device count from the Axonius API.
    .DESCRIPTION
    Get-AxDevice retrieves device count from the Axonius API.
    .PARAMETER AxoniusURL
    The URL of the Axonius instance.
    .PARAMETER AXKey
    The API key for the Axonius instance.
    .PARAMETER AXSecret
    The API secret for the Axonius instance.
    .PARAMETER Filter
    The filter to apply to the query.
    .EXAMPLE
    Get-AxDeviceCount -AxoniusURL "https://axonius.example.com" -AXKey "API_KEY" -AXSecret "API_SECRET" -Filter "specific_filter"
    .EXAMPLE
    New-AxoniusSession -AxoniusURL "https://axonius.example.com" -AXKey "API_KEY" -AXSecret "API_SECRET"
    Get-AxDeviceCount -Filter "specific_filter"

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
        [Parameter(Mandatory = $false)]
        [string]$Filter
        )

    $body = @{
        "data" = [ordered]@{
            "type"       = "entities_count_schema"
            "attributes" = @{
                "history"               = $null
                "search"                = ""
                "filter"                = "$($filter)"
                "use_cache_entry"       = $false
                "frontend_sent_time"    = "$(get-date -format 'yyyy-MM-ddThh:mm:ss.ffffff+00:00')"
                "query_id"              = [GUID]::NewGuid().ToString()
                "saved_query_id"        = $null
            }
        }
    } | ConvertTo-Json -Depth 10
    
    $irmParams = @{
        Uri     = "$($AxoniusURL)/api/devices/count"
        Method  = "POST"
        Headers = @{
            "api-key"      = $AXKey
            "api-secret"   = $AXSecret
        }
        Body    = $body
        'ContentType'      = "application/vnd.api+json"
    }
    $deviceResponse = Invoke-RestMethod @irmParams
    
    Write-Output $deviceResponse.data.attributes.value
}