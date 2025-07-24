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