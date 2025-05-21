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
