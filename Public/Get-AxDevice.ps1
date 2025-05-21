Function Get-AxDevice {
    <#
    .SYNOPSIS
    Get-AxDevice retrieves device information from the Axonius API.
    .DESCRIPTION
    Get-AxDevice retrieves device information from the Axonius API.
    .PARAMETER AxoniusURL
    The URL of the Axonius instance.
    .PARAMETER AXKey
    The API key for the Axonius instance.
    .PARAMETER AXSecret
    The API secret for the Axonius instance.
    .PARAMETER Filter
    The filter to apply to the query.
    .PARAMETER QueryId
    The ID of the saved query to use.
    .PARAMETER PageOffset
    The page offset to start the query.
    .PARAMETER PageLimit
    The page limit for the query.
    .PARAMETER PageSize
    The page size for the query.
    .PARAMETER Fields
    The fields to return in the query.
    .EXAMPLE
    Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+"
    This example retrieves all devices from the Axonius instance.
    .EXAMPLE
    Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -Filter "specific_data.data.os.type == 'Windows'"
    This example retrieves all Windows devices from the Axonius instance.
    .EXAMPLE
    Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -PageLimit 10
    This example retrieves the first 10 devices from the Axonius instance.
    .EXAMPLE
    Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -Fields @("specific_data.data.name","specific_data.data.hostname")
    This example retrieves the name and hostname of all devices from the Axonius instance.
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
        [Parameter(Mandatory = $false, ParameterSetName = "Filter")]
        [string]$Filter = "",
        [Parameter(Mandatory = $true, ParameterSetName = "SavedQuery")]
        [string]$QueryId,
        [Parameter(Mandatory = $false)]
        [int]$PageOffset = 0,
        [Parameter(Mandatory = $false)]
        [int]$PageLimit,
        [Parameter(Mandatory = $false)]
        [string[]]$Fields = @("adapters", "specific_data.data.name", "specific_data.data.hostname", "specific_data.data.last_seen", "specific_data.data.network_interfaces.mac", "specific_data.data.network_interfaces.ips", "specific_data.data.os.type", "labels")
    )
    Write-Verbose $PScmdlet.ParameterSetName
    If ($PSBoundParameters.ContainsKey("QueryId")) {

        Try {
            Write-Verbose "Getting query object for $QueryId"
            $queryObjParams = @{
                Uri     = "$($AxoniusURL)/api/queries/specific/$QueryId"
                Method  = "GET"
                Headers = @{
                    "Content-Type" = "application/vnd.api+json"
                    "api-key"      = $AXKey
                    "api-secret"   = $AXSecret
                }
            }

            $queryObj = Invoke-RestMethod @queryObjParams
            $queryObjFields = $queryObj.data.attributes.view.fields
            $queryObjFilter = $queryObj.data.attributes.view.query.filter
        } 
        Catch {
            Write-Error "Query ID not found."
            Break
        }
    }

    $body = @{
        "meta" = $null
        "data" = @{
            "type"       = "entity_request_schema"
            "attributes" = @{
                "page"               = @{
                    "offset" = $PageOffset
                    "limit"  = $PageLimit
                }
                "fields"             = @{
                    "devices" = $Fields
                }
                "get_metadata"       = $false
                "include_details"    = $false
                "null_for_non_exist" = $true
                "use_cache_entry"    = $true
            }
        }
    }    
    switch ($PsCmdlet.ParameterSetName) {

        "SavedQuery" {
            Write-Verbose "Using saved query $QueryId"
            $body.data.attributes.saved_query_id    = $QueryId
            $body.data.attributes.filter            = $queryObjFilter
            If ( -Not $PSBoundParameters.ContainsKey("Fields") ) {
                Write-Verbose "Using query object fields"
                $body.data.attributes.fields.devices = $queryObjFields
            }
        }
        "Filter" {
            Write-Verbose "Using filter '$Filter'"
            $body.data.attributes.filter = $Filter
        }
        
    } 

    $body = $body | ConvertTo-Json -Depth 10



    $deviceResponse = Invoke-RestMethod -Uri "$($AxoniusURL)/api/devices" -Method POST -headers @{
        "api-key"      = $AXKey
        "api-secret"   = $AXSecret
        "Content-Type" = "application/vnd.api+json"
    } -Body $body

    Write-Output $deviceResponse.data.attributes
}
