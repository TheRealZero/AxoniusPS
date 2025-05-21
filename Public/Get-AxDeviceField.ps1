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
