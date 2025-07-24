# Find-AxDeviceId

## SYNOPSIS
Find-AxDeviceId is a function to find a device by any of it's known IDs.

## SYNTAX

```
Find-AxDeviceId [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] [-Id] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Find-AxDeviceId is a function to find a device by any of it's known IDs.
It will search the specific_data.data.id property of the device object for the ID you provide.

## EXAMPLES

### EXAMPLE 1
```
Find-AxDeviceId -Id "1234567890"
This will find the device with an ID of 1234567890.
```

### EXAMPLE 2
```
Find-AxDeviceId -Id "Desktop-12346"
This will find the device with an ID of Desktop-12346.
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
Position: Named
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
Position: Named
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
Position: Named
Default value: $env:AX_SECRET
Accept pipeline input: False
Accept wildcard characters: False
```

### -Id
The ID of the device you want to find.
This can be any of the known IDs for the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
