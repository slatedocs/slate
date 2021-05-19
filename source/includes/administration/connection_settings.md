## Connection Settings

<!-------------------- FIND CONNECTION SETTINGS -------------------->

### Find connection settings associated with an organization and service connection

`GET /connection_settings/serviceconnection/{serviceConnectionId}/findForOrganization?organizationId=:id`

Retrieve the connection settings associated with an organization and service connection. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Retrieve the connection settings
curl "https://cloudmc_endpoint/api/v1/connection_settings/serviceconnection/e0133c59-cfa4-4bd5-9b49-1575aadc4842/findForOrganization?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "supportsMultiStep": true,
    "id": "b3a09847-83e0-4505-b941-c0f565b39686",
    "version": 1,
    "serviceConnection": {
      "id": "e0133c59-cfa4-4bd5-9b49-1575aadc4842"
    }
  }
}
```

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured connection settings' id.
`organization.id`<br/>*UUID* | The organization id that the connection settings is linked to. It cannot be changed.
`serviceConnection.id`<br/>*UUID* | The service connection id that the connection settings is linked to. It cannot be changed.
`version`<br/>*integer* | The connection settings version.
`supportsMultiStep`<br/>*boolean* | If true the Operation (create/edit) forms for the service connection of an organization will appear in wizard mode.

<!-------------------- GET CONNECTION SETTINGS -------------------->
### Retrieve connection settings

`GET /connection_settings/:id`

```shell
# Retrieve connection settings
curl "https://cloudmc_endpoint/api/v1/connection_settings/b3a09847-83e0-4505-b941-c0f565b39686" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "supportsMultiStep": true,
    "id": "b3a09847-83e0-4505-b941-c0f565b39686",
    "version": 1,
    "serviceConnection": {
      "id": "e0133c59-cfa4-4bd5-9b49-1575aadc4842"
    }
  }
}
```

Retrieve the connection settings associated with the connection settings id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured connection settings' id.
`organization.id`<br/>*UUID* | The organization id that the connection settings is linked to. It cannot be changed.
`serviceConnection.id`<br/>*UUID* | The service connection id that the connection settings is linked to. It cannot be changed.
`version`<br/>*integer* | The connection settings version.
`supportsMultiStep`<br/>*boolean* | If true the Operation (create/edit) forms for the service connection of an organization will appear in wizard mode.

<!-------------------- CREATE CONNECTION SETTINGS -------------------->
### Create connection settings

`POST /connection_settings`

Create a new connection settings.

```shell
# Creates a new connection settings
curl -X POST "https://cloudmc_endpoint/api/v1/connection_settings" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "supportsMultiStep": true,
    "serviceConnection": {
      "id": "e0133c59-cfa4-4bd5-9b49-1575aadc4842"
    }
}
```

> The above command return JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "supportsMultiStep": true,
    "id": "b3a09847-83e0-4505-b941-c0f565b39686",
    "version": 1,
    "serviceConnection": {
      "id": "e0133c59-cfa4-4bd5-9b49-1575aadc4842"
    }
  }
}
```

Required | &nbsp;
---------- | -----------
`organization.id`<br/>*UUID* | The organization id that the connection settings will be linked to.
`serviceConnection.id`<br/>*UUID* | The service connection id that the connection settings will be linked to.

Optional | &nbsp;
---------- | -----------
`supportsMultiStep`<br/>*UUID* | Whether to display the Operation (create/edit) forms for the service connection of an organization in wizard mode. Default is false

<!-------------------- UPDATE CONNECTION SETTINGS -------------------->
### Update connection settings

`PUT /connection_settings/:id`

Updates the connection settings associated with the connection settings id.

```shell
# Updates an existing connection settings for an organization and service connection
curl -X PUT "https://cloudmc_endpoint/api/v1/connection_settings/b3a09847-83e0-4505-b941-c0f565b39686 \
   -H "MC-Api-Key: your_api_key"
   -H "Content-Type: application/json" \
   -d "request-body"
```

> Request body example:

```json
{
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "supportsMultiStep": true,
    "id": "b3a09847-83e0-4505-b941-c0f565b39686",
    "version": 2,
    "serviceConnection": {
      "id": "e0133c59-cfa4-4bd5-9b49-1575aadc4842"
    }
}
```

> The above command return JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "supportsMultiStep": true,
    "id": "b3a09847-83e0-4505-b941-c0f565b39686",
    "version": 2,
    "serviceConnection": {
      "id": "e0133c59-cfa4-4bd5-9b49-1575aadc4842"
    }
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured connection settings' id.
`organization.id`<br/>*UUID* | The organization id that the connection settings is linked to. It cannot be changed.
`serviceConnection.id`<br/>*UUID* | The service connection id that the connection settings is linked to. It cannot be changed.

Optional | &nbsp;
---------- | -----------
`supportsMultiStep`<br/>*UUID* | Whether to display the Operation (create/edit) forms for the service connection of an organization in wizard mode. Default is false
`version`<br/>*integer* | The connection settings version.



<!-------------------- DELETE CONNECTION SETTINGS -------------------->
### Delete connection settings

`DELETE /connection_settings/:id`

Delete an existing connection settings.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v1/connection_settings/b3a09847-83e0-4505-b941-c0f565b39686" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "26022b83-9797-44c0-883c-7e82ecb757e9",
  "taskStatus": "SUCCESS"
}
```
