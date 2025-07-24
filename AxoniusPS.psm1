Function Find-AxDeviceId {
    <#
    .SYNOPSIS
    Find-AxDeviceId is a function to find a device by any of it's known IDs.
    .DESCRIPTION
    Find-AxDeviceId is a function to find a device by any of it's known IDs. It will search the specific_data.data.id property of the device object for the ID you provide.
    .PARAMETER Id
    The ID of the device you want to find. This can be any of the known IDs for the device.
    .PARAMETER AxoniusURL
        The URL of the Axonius instance. Default is taken from the AX_URL environment variable.
    .PARAMETER AXKey
        The API key for Axonius. Default is taken from the AX_KEY environment variable.
    .PARAMETER AXSecret
        The API secret for Axonius. Default is taken from the AX_SECRET environment variable.
    .EXAMPLE
    Find-AxDeviceId -Id "1234567890"
    This will find the device with an ID of 1234567890.
    .EXAMPLE
    Find-AxDeviceId -Id "Desktop-12346"
    This will find the device with an ID of Desktop-12346.
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
        [Parameter(Mandatory, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Id
    )

    $filter = '("specific_data.data.id" == regex("{0}", "i"))' -f $Id
    $outParams = @{
        AxoniusURL = $AxoniusURL
        AXKey = $AXKey
        AXSecret = $AXSecret
        Filter = $filter
    }
    Get-AxDevice @outParams
}
Function Get-AXAdapterIdConversion{
    <#
    .SYNOPSIS
    Get-AXAdapterIdConversion is a function to convert an ID from one type to another.
    .DESCRIPTION
    This function will convert a given Id to the desired conversion ID type.
    .PARAMETER FromIdValue
    This is the Id that you know and want to convert from.
    .PARAMETER FromIdType
    This is the Id type of the value you know.
    .PARAMETER ToIdType
    This is the Id type of the value you don't know, and want to convert your known Id into.
    .PARAMETER AxoniusURL
        The URL of the Axonius instance. Default is taken from the AX_URL environment variable.
    .PARAMETER AXKey
        The API key for Axonius. Default is taken from the AX_KEY environment variable.
    .PARAMETER AXSecret
        The API secret for Axonius. Default is taken from the AX_SECRET environment variable.
    .EXAMPLE
    Get-AXAdapterIdConversion -FromIdValue "d619273b-f124-4b21-acf1-9156771a5f2e" -FromIdType "adapters_data.azure_ad_adapter.intune_id" -ToIdType "internal_axon_id"
    This example converts the Intune device id "d619273b-f124-4b21-acf1-9156771a5f2e" to the internal axonius id.
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
        [Parameter(Mandatory, Position = 0)]
        [string]$FromIdValue,
        [ValidateSet(   "internal_axon_id",
                        "specific_data.data.hostname",
                        "specific_data.data.owner",
                        "specific_data.data.email",
                        "specific_data.data.bios_serial",
                        "specific_data.data.device_serial",
                        "adapters_data.active_directory_adapter.ad_guid",
                        "adapters_data.active_directory_adapter.ad_sid",
                        "adapters_data.azure_ad_adapter.intune_id",
                        "adapters_data.azure_ad_adapter.azure_object_id",
                        "adapters_data.azure_ad_adapter.azure_device_id",
                        "adapters_data.crowd_strike_adapter.id",
                        "adapters_data.defender_atp_adapter.id",
                        "adapters_data.epo_adapter.id",
                        "adapters_data.epo_adapter.epo_id",
                        "adapters_data.hp_device_manager_adapter.id",
                        "adapters_data.sccm_adapter.id")]
        [string]$FromIdType,
        [Parameter(Mandatory, Position = 1)]
        [ValidateSet(   "internal_axon_id",
                        "specific_data.data.hostname",
                        "specific_data.data.owner",
                        "specific_data.data.email",
                        "specific_data.data.bios_serial",
                        "specific_data.data.device_serial",
                        "adapters_data.active_directory_adapter.ad_guid",
                        "adapters_data.active_directory_adapter.ad_sid",
                        "adapters_data.azure_ad_adapter.intune_id",
                        "adapters_data.azure_ad_adapter.azure_device_id",
                        "adapters_data.azure_ad_adapter.azure_object_id",
                        "adapters_data.crowd_strike_adapter.id",
                        "adapters_data.defender_atp_adapter.id",
                        "adapters_data.epo_adapter.id",
                        "adapters_data.epo_adapter.epo_id",
                        "adapters_data.hp_device_manager_adapter.id",
                        "adapters_data.sccm_adapter.id")]
        [string]$ToIdType = "internal_axon_id"
    )

    $filter = '("{0}" == "{1}")' -f $FromIdType, $FromIdValue
    $fields = @($FromIdType, $ToIdType)
    $outParams = @{
        AxoniusURL = $AxoniusURL
        AXKey = $AXKey
        AXSecret = $AXSecret
        Filter = $filter
        Fields = $fields
    }
    $out = Get-AxDevice @outParams | Select-Object -ExpandProperty $ToIdType
    Write-Output $out



}
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
                Uri        = "$($AxoniusURL)/api/queries/specific/$QueryId"
                Method     = "GET"
                Headers    = @{
                    "Content-Type" = "application/vnd.api+json"
                    "api-key"      = $AXKey
                    "api-secret"   = $AXSecret
                }
                AxoniusURL = $AxoniusURL
                AXKey      = $AXKey
                AXSecret   = $AXSecret
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
            $body.data.attributes.saved_query_id = $QueryId
            $body.data.attributes.filter = $queryObjFilter
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


    $deviceResponseParams = @{
        Uri        = "$($AxoniusURL)/api/devices"
        Method     = "POST"
        Headers    = @{
            "Content-Type" = "application/vnd.api+json"
            "api-key"      = $AXKey
            "api-secret"   = $AXSecret
        }
        Body       = $body
        AxoniusURL = $AxoniusURL
        AXKey      = $AXKey
        AXSecret   = $AXSecret
    }
    $deviceResponse = Invoke-RestMethod @deviceResponseParams

    Write-Output $deviceResponse.data.attributes
}
Function Get-AXDeviceAllInfo {
    <#
    .SYNOPSIS
    Gets all available fields from all available adapters for a singe device.
    .DESCRIPTION
    Gets all available fields from all available adapters for a single device.
    .PARAMETER InternalAxonId
    The internal Axon ID of the device to query.
    .PARAMETER AxoniusURL
        The URL of the Axonius instance. Default is taken from the AX_URL environment variable.
    .PARAMETER AXKey
        The API key for Axonius. Default is taken from the AX_KEY environment variable.
    .PARAMETER AXSecret
        The API secret for Axonius. Default is taken from the AX_SECRET environment variable.
    .EXAMPLE
    Get-AXDeviceAllInfo -InternalAxonId "1234567890abcdef1234567890abcdef"
    Retrieves all available fields from all adapters for the specified device.
    
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
        [Parameter(Mandatory, Position = 0)]
        [string]$InternalAxonId
    )
    $requestParams = @{
        AxoniusURL = "$($AxoniusURL)/api/devices/$($InternalAxonId)?return_empty_details=false&return_complex_fields_data=false" 
        AXKey      = $AXKey
        AXSecret   = $AXSecret
    }
    Invoke-AXAPIRequest $requestParams | ConvertFrom-Json -AsHashtable | Select-Object -expand data | Select-Object -expand attributes | Select-Object -expand adapters
}
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
Function Get-AxDeviceField {
    <#
    .SYNOPSIS
    Get-AxDeviceField retrieves device field information from the Axonius API.
    .DESCRIPTION
    Get-AxDeviceField retrieves device field information from the Axonius API.
    .PARAMETER AxoniusURL
        The URL of the Axonius instance.
    .PARAMETER AXKey
    The API key for the Axonius instance.
    .PARAMETER AXSecret
    The API secret for the Axonius instance.
    .PARAMETER OutputType
    The format of the output. Options are PSObject, JSON, or String.
    .EXAMPLE
    Get-AxDeviceField -AxoniusURL "https://example.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -OutputType "PSObject"
    This example retrieves all fields from the Axonius instance in PSObject format.
    .EXAMPLE
    Get-AxDeviceField -AxoniusURL "https://example.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -OutputType "JSON"
    This example retrieves all fields from the Axonius instance in JSON format.
    .EXAMPLE
    Get-AxDeviceField -AxoniusURL "https://example.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -OutputType "String"
    This example retrieves all fields from the Axonius instance in string format.
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
        [ValidateSet("PSObject", "JSON", "String")]
        [string]$OutputType = "PSObject"
    )

    $fieldResponse = Invoke-RestMethod -Uri "$($AxoniusURL)/api/devices/fields" -Method GET -Headers @{
        "api-key"      = $AXKey
        "api-secret"   = $AXSecret
        "Content-Type" = "application/vnd.api+json"
    }
    
    Switch ($OutputType) {
        "PSObject" {
            
            $output = $fieldResponse.meta | Select-Object -ExpandProperty specific
            Add-Member -InputObject $output -NotePropertyMembers @{"generic" = $fieldResponse.meta | Select-Object -expandProperty generic}
            Write-Output $output

        }
        "JSON" {
            $fieldResponse.meta | ConvertTo-Json -Depth 100
        }
        "String" {

            $genericFields = $fieldResponse.Meta.generic | Foreach-Object {
                $name = $_.name -replace "specific_data.data.", ""
                "agg:$($name)"
            }
            $specificFields = Foreach ( $adapter in $($fieldResponse.meta.specific.psobject.properties.name)) {
                $adapterName = $($adapter -Replace "_adapter")
                $fieldResponse.meta.specific.$adapter | Foreach-Object {
                    $fieldName = $_.Name -Replace "adapters_data.$($adapterName)_adapter.", ""
                    "{0}:{1}" -f $adapterName, $fieldName
            
                }
            }
            $stringOutput = $genericFields + $specificFields
            Write-Output $stringOutput
                    
        }
        Default {
            $fieldResponse.meta | Select-Object -Property generic -ExpandProperty specific
        }

    }
}
Function Get-AxQuery {
    <#
    .SYNOPSIS
        Get Axonius Query by ID
    .DESCRIPTION
        Get detailed information about a specific Axonius query using its ID.
    .PARAMETER AxoniusURL
        The URL of the Axonius instance. Default is taken from the AX_URL environment variable.
    .PARAMETER AXKey
        The API key for Axonius. Default is taken from the AX_KEY environment variable.
    .PARAMETER AXSecret
        The API secret for Axonius. Default is taken from the AX_SECRET environment variable.
    .PARAMETER QueryId
        This is the ID of the saved query you would like to get details about.
    .EXAMPLE
    Get-AXQuery -QueryId 5687ef494b9e2df4ce456279
    This example will get the details of the query with the ID 5687ef494b9e2df4ce456279.
        
    #>
    [CmdletBinding()]
    Param(
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
        [string[]]$QueryId
    )
    Process {
        foreach ($id in $QueryId) {
            
            $queryObj = Invoke-RestMethod -Uri "$($AxoniusURL)/api/queries/specific/$id" -Method GET -Headers @{
                "api-key"      = $AXKey
                "api-secret"   = $AXSecret
                "Content-Type" = "application/vnd.api+json"
            }
            Write-Output $queryObj | Select-Object -ExpandProperty data | Select-Object -ExpandProperty attributes


        }
    }
}
Function Get-AxUser {
    <#
    .SYNOPSIS
    Get-AxUser retrieves user information from the Axonius API.
    .DESCRIPTION
    Get-AxUser retrieves user information from the Axonius API.
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
    Get-AxUser -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+"
    This example retrieves all users from the Axonius instance.

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
        [string[]]$Fields = @("adapters","specific_data.data.image","specific_data.data.username","specific_data.data.domain","specific_data.data.is_admin","specific_data.data.last_seen","labels")    )
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
                    "users" = $Fields
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
            $body.data.attributes.saved_query_id = $QueryId
            $body.data.attributes.filter = $queryObjFilter
            If ( -Not $PSBoundParameters.ContainsKey("Fields") ) {
                Write-Verbose "Using query object fields"
                $body.data.attributes.fields.users = $queryObjFields
            }
        }
        "Filter" {
            Write-Verbose "Using filter '$Filter'"
            $body.data.attributes.filter = $Filter
        }
        
    } 

    $body = $body | ConvertTo-Json -Depth 10



    $userResponse = Invoke-RestMethod -Uri "$($AxoniusURL)/api/users" -Method POST -headers @{
        "api-key"      = $AXKey
        "api-secret"   = $AXSecret
        "Content-Type" = "application/vnd.api+json"
    } -Body $body

    Write-Output $userResponse.data.attributes
}
Function Get-AXUserAllInfo {
    <#
    .SYNOPSIS
    Gets all available fields from all available adapters for a single user.
    .DESCRIPTION
    Gets all available fields from all available adapters for a single user.
    .PARAMETER InternalAxonId
    The internal Axon ID of the device to query.
    .PARAMETER AxoniusURL
        The URL of the Axonius instance. Default is taken from the AX_URL environment variable.
    .PARAMETER AXKey
        The API key for Axonius. Default is taken from the AX_KEY environment variable.
    .PARAMETER AXSecret
        The API secret for Axonius. Default is taken from the AX_SECRET environment variable.
    .EXAMPLE
    Get-AXUserAllInfo -InternalAxonId "1234567890abcdef1234567890abcdef"
    Retrieves all available fields from all adapters for the specified user.

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
        [Parameter(Mandatory, Position = 0)]
        [string]$InternalAxonId
    )

    Invoke-AXAPIRequest -Uri "$($AxoniusURL)/api/users/$($InternalAxonId)?return_empty_details=false&return_complex_fields_data=false" | convertfrom-json -AsHashtable | Select-Object -expand data | Select-Object -expand attributes | Select-Object -expand adapters
}
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
Function New-AxoniusPSSession {
    <#
    .SYNOPSIS
    Sets the environment variables for Axonius API authentication.
    .DESCRIPTION
    This function sets the environment variables for Axonius API authentication.
    It can accept either a PSCredential object or an API key and secret.
    .PARAMETER AxoniusURL
    The URL of the Axonius instance.
    .PARAMETER Credential
    The PSCredential object containing the username/APIKey and password/APISecret for Axonius API authentication.
    .PARAMETER AxoniusAPIKey
    The API key for Axonius API authentication.
    .PARAMETER AxoniusAPISecret
    The API secret for Axonius API authentication.
    .EXAMPLE
    New-AxoniusPSSession -AxoniusURL "https://axonius.example.com" -Credential $myCredential
    This example sets the environment variables for Axonius API authentication using a PSCredential object.
    .EXAMPLE
    New-AxoniusPSSession -AxoniusURL "https://axonius.example.com" -AxoniusAPIKey "myAPIKey" -AxoniusAPISecret "myAPISecret"
    This example sets the environment variables for Axonius API authentication using an API key and secret.
    #>
    param(
        [Parameter(Mandatory = $false)]
        [string]$AxoniusURL,
        [Parameter(Mandatory = $false,parameterSetName = "PSCredential")]
        [pscredential]$Credential,
        [Alias("AXKey")]
        [Parameter(Mandatory = $true,parameterSetName = "APIKey")]
        [string]$AxoniusAPIKey,
        [Alias("AXSecret")]
        [Parameter(Mandatory = $true,parameterSetName = "APIKey")]
        [string]$AxoniusAPISecret
    )
    $env:AX_URL = $AxoniusURL
    
    If ( $PSCmdlet.ParameterSetName -eq "PSCredential" ) {

        $env:AX_KEY     = $Credential.UserName
        $env:AX_SECRET  = $Credential.GetNetworkCredential().Password
    }
    Else {
        $env:AX_KEY     = $AxoniusAPIKey
        $env:AX_SECRET  = $AxoniusAPISecret
    }
   
        Try {
        $loginResponse = Invoke-RestMethod -Uri "$($env:AX_URL)/api/login" -Method GET -Headers @{
            "api-key"      = $env:AX_KEY
            "api-secret"   = $env:AX_SECRET
            "Content-Type" = "application/vnd.api+json"
        }
        Write-Verbose $loginResponse.data.attributes
    }
    Catch {
        Write-Warning $_.Exception.Message
    }

}
