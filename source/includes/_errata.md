# API Errata

## Using PowerShell with the API

The HP REST API on iLO 4 2.30 and later contains a JSON-formatted resource that is incompatible with PowerShell’s `ConvertFrom-Json` cmdlet, resulting in an error when a PowerShell script attempts to parse the JSON response string.

A PowerShell script will emit an error parsing JSON when reading the iLO 4 Ethernet configuration and status resource at `/redfish/v1/managers/{item}/ethernetinterfaces/{item}`:

```
ConvertFrom-Json : Cannot convert the JSON string because a dictionary that was converted from the string contains the duplicated keys 'MACAddress' and 
'MacAddress'.
At line:1 char:6
+ $a | ConvertFrom-Json
+      ~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (:) [ConvertFrom-Json], InvalidOperationException
    + FullyQualifiedErrorId : DuplicateKeysInJsonString,Microsoft.PowerShell.Commands.ConvertFromJsonCommand 

```

The cause of the problem is that iLO 4 presents the MAC Address of the network controller in two separate properties differing only by character case.  The existing REST API in iLO 4 2.30 and earlier contains a property called `MacAddress`.  Additionally, iLO 4 2.30 adds the Redfish conformant versions of properties, which includes `MACAddress`.  This would not be a problem for clients that treat JSON as case sensitive, but PowerShell’s ConvertFrom-Json is not case sensitive and results in an error.

Three client code fixes are possible:

1.	The client may pre-process the JSON string to replace one of the colliding substrings before converting it to a hash table with `ConvertFrom-Json`.  For instance, one could replace the string `MacAddress` with `MacAddressUnused` or alter `MACAddress` instead.
2.	The client may create or use a different hash table structure in PowerShell that is case sensitive.
3.	The client may include the Redfish mandated HTTP header `"OData-Version”: 4.0`.  This header causes iLO 4 to hide non-Redfish conformant properties including the older `MacAddress` property.

Solution #3 is the most strategically forward-thinking solution if the clients intends to be Redfish conformant.



