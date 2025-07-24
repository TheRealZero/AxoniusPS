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
