---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Get-AxQuery

## SYNOPSIS
Get Axonius Query by ID

## SYNTAX

```
Get-AxQuery [[-AxoniusURL] <String>] [[-AXKey] <String>] [[-AXSecret] <String>] [-QueryId] <String[]>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Get detailed information about a specific Axonius query using its ID.

## EXAMPLES

### EXAMPLE 1
```
Get-AXQuery -QueryId 5687ef494b9e2df4ce456279
This example will get the details of the query with the ID 5687ef494b9e2df4ce456279.
```

## PARAMETERS

### -AxoniusURL
The URL of the Axonius instance.
Default is taken from the AX_URL environment variable.

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
The API key for Axonius.
Default is taken from the AX_KEY environment variable.

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
The API secret for Axonius.
Default is taken from the AX_SECRET environment variable.

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

### -QueryId
This is the ID of the saved query you would like to get details about.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
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
