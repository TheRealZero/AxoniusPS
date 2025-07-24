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