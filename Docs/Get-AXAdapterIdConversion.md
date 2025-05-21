---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Get-AXAdapterIdConversion

## SYNOPSIS
Get-AXAdapterIdConversion is a function to convert an ID from one type to another.

## SYNTAX

```
Get-AXAdapterIdConversion [[-FromIdValue] <String>] [[-FromIdType] <String>] [[-ToIdType] <String>]
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

### -FromIdValue
This is the Id that you know and want to convert from.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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
Position: 2
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

Required: False
Position: 3
Default value: Internal_axon_id
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
