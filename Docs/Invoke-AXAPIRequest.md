---
external help file: AxoniusPS-help.xml
Module Name: AxoniusPS
online version:
schema: 2.0.0
---

# Invoke-AXAPIRequest

## SYNOPSIS
This function will invoke an Axonius API request.

## SYNTAX

```
Invoke-AXAPIRequest [[-AxoniusURL] <String>] [[-AXKey] <String>] [[-AXSecret] <String>] [-Uri] <String>
 [[-Method] <String>] [[-ContentType] <String>] [[-Body] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
This function will invoke an Axonius API request.
It will use the Axonius URL, Key, and Secret from the environment variables if not provided.

## EXAMPLES

### EXAMPLE 1
```
Invoke-AXAPIRequest -ContentType "applicaiton/nvd.api+json" -Uri "/api/queries/specific/5687ef494b9e2df4ce456279"
This example will invoke a GET request to the Axonius API to get a specific query by ID. The content type is set to application/nvd.api+json.
```

## PARAMETERS

### -AxoniusURL
The URL of the Axonius instance.
If not provided, it will use the environment variable AX_URL.

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
The API Key for the Axonius instance.
If not provided, it will use the environment variable AX_KEY.

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
The API Secret for the Axonius instance.
If not provided, it will use the environment variable AX_SECRET.

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

### -Uri
The URI of the API endpoint to call.
This is required.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Method
The HTTP method to use for the request.
This can be GET, POST, PUT, or DELETE.
The default is GET.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: GET
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContentType
The content type of the request.
The default is application/vnd.api+json.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: Application/vnd.api+json
Accept pipeline input: False
Accept wildcard characters: False
```

### -Body
The body of the request.
This is optional and will be used if provided.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
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
