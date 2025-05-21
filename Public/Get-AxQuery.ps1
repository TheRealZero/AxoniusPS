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