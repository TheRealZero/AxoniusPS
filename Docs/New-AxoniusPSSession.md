---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# New-AxoniusPSSession

## SYNOPSIS
Sets the environment variables for Axonius API authentication.

## SYNTAX

### PSCredential
```
New-AxoniusPSSession [-AxoniusURL <String>] [-Credential <PSCredential>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### APIKey
```
New-AxoniusPSSession [-AxoniusURL <String>] -AxoniusAPIKey <String> -AxoniusAPISecret <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This function sets the environment variables for Axonius API authentication.
It can accept either a PSCredential object or an API key and secret.

## EXAMPLES

### EXAMPLE 1
```
New-AxoniusPSSession -AxoniusURL "https://axonius.example.com" -Credential $myCredential
This example sets the environment variables for Axonius API authentication using a PSCredential object.
```

### EXAMPLE 2
```
New-AxoniusPSSession -AxoniusURL "https://axonius.example.com" -AxoniusAPIKey "myAPIKey" -AxoniusAPISecret "myAPISecret"
This example sets the environment variables for Axonius API authentication using an API key and secret.
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
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The PSCredential object containing the username/APIKey and password/APISecret for Axonius API authentication.

```yaml
Type: PSCredential
Parameter Sets: PSCredential
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AxoniusAPIKey
The API key for Axonius API authentication.

```yaml
Type: String
Parameter Sets: APIKey
Aliases: AXKey

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AxoniusAPISecret
The API secret for Axonius API authentication.

```yaml
Type: String
Parameter Sets: APIKey
Aliases: AXSecret

Required: True
Position: Named
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
