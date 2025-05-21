---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Get-AxDeviceField

## SYNOPSIS
Get-AxDeviceField retrieves device field information from the Axonius API.

## SYNTAX

```
Get-AxDeviceField [[-AxoniusURL] <String>] [[-AXKey] <String>] [[-AXSecret] <String>] [[-OutputType] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get-AxDeviceField retrieves device field information from the Axonius API.

## EXAMPLES

### EXAMPLE 1
```
Get-AxDeviceField -AxoniusURL "https://example.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -OutputType "PSObject"
This example retrieves all fields from the Axonius instance in PSObject format.
```

### EXAMPLE 2
```
Get-AxDeviceField -AxoniusURL "https://example.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -OutputType "JSON"
This example retrieves all fields from the Axonius instance in JSON format.
```

### EXAMPLE 3
```
Get-AxDeviceField -AxoniusURL "https://example.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -OutputType "String"
This example retrieves all fields from the Axonius instance in string format.
```

## PARAMETERS

### -AxoniusURL
The URL of the Axonius instance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: $env:AX_URL
Accept pipeline input: False
Accept wildcard characters: False
```

### -AXKey
The API key for the Axonius instance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: $env:AX_KEY
Accept pipeline input: False
Accept wildcard characters: False
```

### -AXSecret
The API secret for the Axonius instance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $env:AX_SECRET
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutputType
The format of the output.
Options are PSObject, JSON, or String.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: PSObject
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
