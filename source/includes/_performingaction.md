# Performing Actions

REST resources usually support HTTP GET to read the current state, and some support modification and removal with HTTP POST, PUT, PATCH, or DELETE.

There are some resources that support other types of operations not easily mapped to HTTP operations.  For this reason the Redfish specification defines "Actions".  Actions are HTTP POST operations with a specifically formatted JSON request including the operation to perform and any parameters.  For instance, it is not enough to simply tell a server to reset, but it is also necessary to specify the type of reset:  cold boot, warm boot, PCI reset, etc.  Actions are often used when the operation causes iLO 4 not just to update a value, but to change system state.

In Redfish, the available actions that can be invoked are identified by a "target" property in the resource's "Actions" object definitions.  The parameters identify the supported values with the annotation @Redfish.AllowableValues.

> Example of a system resource advertising an available action:

```json
  {
  	"Actions": {
  		"#ComputerSystem.Reset": {
  			"ResetType@Redfish.AllowableValues": [
  				"On",
  				"ForceOff",
  				"ForceRestart",
  				"Nmi",
  				"PushPowerButton"
  			],
  			"target": "/redfish/v1/Systems/1/Actions/ComputerSystem.Reset/"
  		}
  	}
  }
```

> This action may be invoked by performing:

```
POST /redfish/v1/Systems/1/Actions/ComputerSystem.Reset/
Content-Type: application/json
OData-Version: 4.0

{
    "ResetType": "On"
}
```

<aside class="information">

When writing new Redfish REST client code, the first example is the recommended way to invoke actions.

For compatibility with the pre-Redfish iLO 4 REST API, the older form specifying the "Action" as a property could also be used:

</aside>

> alternative pre-Redfish action invocation:

```
POST /redfish/v1/Systems/1/
Content-Type: application/json

{
    "Action" "Reset",    
    "ResetType": "On"
}
```
## Actions on HPE-specific Extensions

The embedded extensions may also have Actions not specified by the Redfish standard.  They are invoked in a similar way.  The POST URI may include indicate the HPE specific nature of the action.

The older pre-Redfish form of the Action invokation requires you to specify `"Target": "/Oem/Hp"` as one of the properties in the body of the request.

```
POST /redfish/v1/Systems/1/
Content-Type: application/json


{
    "Action": "PowerButton", 
    "PushType": "PressAndHold", 
    "Target": "/Oem/Hp"
}

```

It is recommended that you use the Redfish version of the action invocation.

