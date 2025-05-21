---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Get-AxDeviceCount

## SYNOPSIS
Get-AxDevice retrieves device count from the Axonius API.

## SYNTAX

```
Get-AxDeviceCount [[-AxoniusURL] <String>] [[-AXKey] <String>] [[-AXSecret] <String>] [[-Filter] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get-AxDevice retrieves device count from the Axonius API.

## EXAMPLES

### EXAMPLE 1
```
Get-AxDeviceCount -AxoniusURL "https://axonius.example.com" -AXKey "API_KEY" -AXSecret "API_SECRET" -Filter "specific_filter"
```

### EXAMPLE 2
```
New-AxoniusSession -AxoniusURL "https://axonius.example.com" -AXKey "API_KEY" -AXSecret "API_SECRET"
Get-AxDeviceCount -Filter "specific_filter"
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

### -Filter
The filter to apply to the query.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
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
