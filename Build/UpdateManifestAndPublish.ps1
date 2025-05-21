param(
    [string]$manifestPath = $(Join-Path -Path $env:GitRepos -ChildPath 'AxoniusPS\AxoniusPS.psd1')
)

    If (Test-Path -Path $manifestPath ) {
        Write-Verbose "Manifest found at $manifestPath"
    }
    Else {
        Write-Warning "Manifest not found at $manifestPath" -ErrorAction Stop
        Exit 1
}

$manifestFolder = Split-Path -Path $manifestPath -Parent
$manifest       = Get-Item -Path $manifestPath
$moduleName     = Get-ChildItem $manifestPath | Select-Object -ExpandProperty BaseName
$publicFunctions= Get-ChildItem -Path $manifestFolder\Public\*.ps1
$rootModule     = "$manifestFolder\$moduleName.psm1"

$publicFunctions | Get-Content | Set-Content $rootModule
    



$moduleManifest = Import-PowerShellDataFile -Path $manifest

$currentModuleVersion   = [System.Version]$($moduleManifest.ModuleVersion)
$newModuleVersion       = [System.Version]::new($currentModuleVersion.major, $currentModuleVersion.minor, $currentModuleVersion.build + 1)
$updateManifestParams = @{
    Path              = $manifest
    ModuleVersion     = $newModuleVersion
    FunctionsToExport = $publicFunctions.BaseName
}

Copy-Item -Path $manifest -Destination $(Join-Path $manifestFolder -ChildPath "$moduleName.psd1.bak")
Try{
    Update-ModuleManifest @updateManifestParams
    New-Item -Path "$manifestFolder\BuildOutput\$moduleName" -ItemType Directory -Force -ErrorAction SilentlyContinue | Out-Null
    Remove-Item -Path "$manifestFolder\BuildOutput\$moduleName\*" -Recurse -Force -ErrorAction SilentlyContinue
    Copy-Item -Path $rootModule -Destination "$manifestFolder\BuildOutput\$moduleName\$moduleName.psm1"
    Copy-Item -Path $manifest -Destination "$manifestFolder\BuildOutput\$moduleName\$moduleName.psd1"

    Remove-Item -Path "$manifestFolder\$moduleName.psd1.bak" -Force
}
Catch{
    Rename-Item -Path "$manifestFolder\$moduleName.psd1.bak" -NewName "$moduleName.psd1"
    Write-Warning -Message "Error updating module manifest. Restored backup manifest."
}



Publish-Module -Repository 3MAutomation -Path "$manifestFolder\$moduleName\BuildOutput\"