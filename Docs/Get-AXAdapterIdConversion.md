# Get-AXAdapterIdConversion

## SYNOPSIS
Get-AXAdapterIdConversion is a function to convert an ID from one type to another.

## SYNTAX

```
Get-AXAdapterIdConversion [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] [-FromIdValue] <String>
 [-FromIdType <String>] [-ToIdType] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function will convert a given Id to the desired conversion ID type.

## EXAMPLES

### EXAMPLE 1
```
Get-AXAdapterIdConversion -FromIdValue "d619273b-f124-4b21-acf1-9156771a5f2e" -FromIdType "adapters_data.azure_ad_adapter.intune_id" -ToIdType "internal_axon_id"
This example converts the Intune device id "d619273b-f124-4b21-acf1-9156771a5f2e" to the internal axonius id.
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

### -FromIdValue
This is the Id that you know and want to convert from.

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

### -FromIdType
This is the Id type of the value you know.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ToIdType
This is the Id type of the value you don't know, and want to convert your known Id into.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: Internal_axon_id
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
