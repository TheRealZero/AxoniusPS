# Get-AXUserAllInfo

## SYNOPSIS
Gets all available fields from all available adapters for a single user.

## SYNTAX

```
Get-AXUserAllInfo [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] [-InternalAxonId] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Gets all available fields from all available adapters for a single user.

## EXAMPLES

### EXAMPLE 1
```
Get-AXUserAllInfo -InternalAxonId "1234567890abcdef1234567890abcdef"
Retrieves all available fields from all adapters for the specified user.
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

### -InternalAxonId
The internal Axon ID of the device to query.

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
