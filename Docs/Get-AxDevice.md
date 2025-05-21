---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Get-AxDevice

## SYNOPSIS
Get-AxDevice retrieves device information from the Axonius API.

## SYNTAX

### Filter
```
Get-AxDevice [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] [-Filter <String>]
 [-PageOffset <Int32>] [-PageLimit <Int32>] [-Fields <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### SavedQuery
```
Get-AxDevice [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] -QueryId <String>
 [-PageOffset <Int32>] [-PageLimit <Int32>] [-Fields <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get-AxDevice retrieves device information from the Axonius API.

## EXAMPLES

### EXAMPLE 1
```
Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+"
This example retrieves all devices from the Axonius instance.
```

### EXAMPLE 2
```
Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -Filter "specific_data.data.os.type == 'Windows'"
This example retrieves all Windows devices from the Axonius instance.
```

### EXAMPLE 3
```
Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -PageLimit 10
This example retrieves the first 10 devices from the Axonius instance.
```

### EXAMPLE 4
```
Get-AxDevice -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+" -Fields @("specific_data.data.name","specific_data.data.hostname")
This example retrieves the name and hostname of all devices from the Axonius instance.
```

## PARAMETERS

### -AxoniusURL
The URL of the Axonius instance.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
Position: Named
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
Position: Named
Default value: $env:AX_SECRET
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
The filter to apply to the query.

```yaml
Type: String
Parameter Sets: Filter
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -QueryId
The ID of the saved query to use.

```yaml
Type: String
Parameter Sets: SavedQuery
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageOffset
The page offset to start the query.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -PageLimit
The page limit for the query.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Fields
The fields to return in the query.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @("adapters", "specific_data.data.name", "specific_data.data.hostname", "specific_data.data.last_seen", "specific_data.data.network_interfaces.mac", "specific_data.data.network_interfaces.ips", "specific_data.data.os.type", "labels")
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
