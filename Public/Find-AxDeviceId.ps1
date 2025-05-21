Function Find-AxDeviceId {
    <#
    .SYNOPSIS
    Find-AxDeviceId is a function to find a device by any of it's known IDs.
    .DESCRIPTION
    Find-AxDeviceId is a function to find a device by any of it's known IDs. It will search the specific_data.data.id property of the device object for the ID you provide.
    .PARAMETER Id
    The ID of the device you want to find. This can be any of the known IDs for the device.
    .EXAMPLE
    Find-AxDeviceId -Id "1234567890"
    This will find the device with an ID of 1234567890.
    .EXAMPLE
    Find-AxDeviceId -Id "Desktop-12346"
    This will find the device with an ID of Desktop-12346.
    #>
    param(
        [string]$Id
    )

    $filter = '("specific_data.data.id" == regex("{0}", "i"))' -f $Id
    Get-AxDevice -Filter $filter
}
