---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Find-AxDeviceId

## SYNOPSIS
Find-AxDeviceId is a function to find a device by any of it's known IDs.

## SYNTAX

```
Find-AxDeviceId [[-Id] <String>]
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

### -Id
The ID of the device you want to find.
This can be any of the known IDs for the device.

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

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
