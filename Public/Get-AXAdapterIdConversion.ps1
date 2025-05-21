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
    .EXAMPLE
    Get-AXAdapterIdConversion -FromIdValue "d619273b-f124-4b21-acf1-9156771a5f2e" -FromIdType "adapters_data.azure_ad_adapter.intune_id" -ToIdType "internal_axon_id"
    This example converts the Intune device id "d619273b-f124-4b21-acf1-9156771a5f2e" to the internal axonius id.
    #>
    param(
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
    $out = Get-AxDevice -Filter $filter -Fields $fields | Select-Object -ExpandProperty $ToIdType
    $out



}