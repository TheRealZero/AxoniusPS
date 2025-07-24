# Get-AxUser

## SYNOPSIS
Get-AxUser retrieves user information from the Axonius API.

## SYNTAX

### Filter
```
Get-AxUser [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] [-Filter <String>]
 [-PageOffset <Int32>] [-PageLimit <Int32>] [-Fields <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### SavedQuery
```
Get-AxUser [-AxoniusURL <String>] [-AXKey <String>] [-AXSecret <String>] -QueryId <String>
 [-PageOffset <Int32>] [-PageLimit <Int32>] [-Fields <String[]>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Get-AxUser retrieves user information from the Axonius API.

## EXAMPLES

### EXAMPLE 1
```
Get-AxUser -AxoniusURL "https://{companyURL}.on.axonius.com" -AXKey "key" -AXSecret "53cr3+"
This example retrieves all users from the Axonius instance.
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
Default value: @("adapters","specific_data.data.image","specific_data.data.username","specific_data.data.domain","specific_data.data.is_admin","specific_data.data.last_seen","labels")
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
