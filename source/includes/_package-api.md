# Package API

## Installing Packages

The following resources allow you to install and import Intelex packages

### Install a Package

> Example Request

```javascript

```

```csharp

```

> Example Response

```json


```

Installs an Intelex package

#### POST /api/v2/packages/install

##### Body Parameters
All body parameters are in JSON format:

Parameter | Description
--------- | -----------
field_name | the system name of fields on the Intelex object you are requesting

### Import a Package

> Example Request

```javascript


```

```csharp


```

> Example Response

```json

```

Imports an Intelex package

#### GET /api/v2/packages/import

##### Body Parameters
All body parameters are in JSON format:

Parameter | Description
--------- | -----------
field_name | the system name of fields on the Intelex object you are requesting