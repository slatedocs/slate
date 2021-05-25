## Connection Settings

<!-------------------- SEARCH CONNECTION SETTINGS ASSOCIATED WITH AN ORG AND SERVICE CONNECTION-------------------->

### Search for a connection setting associated with an organization and service connection

`GET /reseller/connectionSettings/search?organizationId=:orgId&connectionId=:serviceConnectionId`

Retrieve the connection setting associated with an organization (or its lineage) and service connection. If the `organizationId` is omitted, the authenticated user's organization will be used to return a connection setting associated with the `connectionId`. If both `organizationId` and `connectionId` is omitted all connection settings associated with the
authenticated user's organization will be returned

```shell
# Retrieve a connection setting associated with an organization and service connection
curl "https://cloudmc_endpoint/api/v1/reseller/connectionSettings/search?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4&connectionId=e0133c59-cfa4-4bd5-9b49-1575aadc4842" \
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


<!-------------------- SEARCH ALL CONNECTION SETTINGS -------------------->

### Search for all connection settings associated with an organization

`GET /reseller/connectionSettings/search?organizationId=:orgId`

Retrieve the list of connection settings associated with an organization (or its lineage). If the `organizationId` is omitted, the authenticated user's organization will be used to return a list of connection settings.

```shell
# Retrieve the list of connection settings associated with an organization
curl "https://cloudmc_endpoint/api/v1/reseller/connectionSettings/search?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4&" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json

{
  "data": [
    {
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
    {
      "organization": {
        "id": "56e2219c-2576-48dc-82b1-0ea7cd096d12"
      },
      "supportsMultiStep": false,
      "id": "61c9c620-840b-4a5d-b7b1-cebdac7a4385",
      "version": 1,
      "serviceConnection": {
        "id": "b5f3ba0d-8b37-413f-a257-d1fc8bebb9a6"
      }
    }
  ]
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
### Retrieve a connection setting

`GET /reseller/connectionSettings/:id`

```shell
# Retrieve a connection setting
curl "https://cloudmc_endpoint/api/v1/reseller/connectionSettings/b3a09847-83e0-4505-b941-c0f565b39686" \
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

Retrieve the connection setting associated with the connection setting id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured connection settings' id.
`organization.id`<br/>*UUID* | The organization id that the connection settings is linked to. It cannot be changed.
`serviceConnection.id`<br/>*UUID* | The service connection id that the connection settings is linked to. It cannot be changed.
`version`<br/>*integer* | The connection settings version.
`supportsMultiStep`<br/>*boolean* | If true the Operation (create/edit) forms for the service connection of an organization will appear in wizard mode.

<!-------------------- CREATE CONNECTION SETTINGS -------------------->
### Create a connection setting

`POST /reseller/connectionSettings`

Create a new connection setting.

```shell
# Creates a new connection setting
curl -X POST "https://cloudmc_endpoint/api/v1/reseller/connectionSettings" \
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
### Update a connection setting

`PUT /reseller/connectionSettings/:id`

Updates the connection setting associated with the connection settings id.

```shell
# Updates an existing connection setting for an organization and service connection
curl -X PUT "https://cloudmc_endpoint/api/v1/reseller/connectionSettings/b3a09847-83e0-4505-b941-c0f565b39686 \
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
### Delete a connection setting

`DELETE /reseller/connectionSettings/:id`

Delete an existing connection setting.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v1/reseller/connectionSettings/b3a09847-83e0-4505-b941-c0f565b39686" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "26022b83-9797-44c0-883c-7e82ecb757e9",
  "taskStatus": "SUCCESS"
}
```
