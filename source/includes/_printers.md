# Printers

## Permanently delete or disconnect printer

```shell
curl https://api.simplyprint.io/{id}/printers/Delete?pid=1234&just_connection=1 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

| Required permissions |
| -------------------- |
| `PRINTER_EDIT` |

This endpoint can be used to delete a printer from the database, or to disconnect a pi from a printer. This is useful if you want to change the printer that is connected to a pi.

### Request

`GET /{id}/printers/Delete`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer | yes | The ID of the printer to delete. |
| `just_connection` | integer | no | If set to 1, the Pi connection will be deleted. If set to 0, the printer and connection will be permanently deleted.<br>**Default: 0** |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Check if OctoPrint plugin is installed

```shell
curl https://api.simplyprint.io/{id}/printers/HasPlugin?pid=1234&plugin=PrintTimeGenius \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "has": true
}
```

This endpoint can be used to check if a printer has a plugin installed. The plugins are checked by ... ? TODO

### Request

`GET /{id}/printers/HasPlugin`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer | yes | The ID of the printer to check. |
| `plugin` | string | yes | The name of the plugin key to check. |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `has` | boolean | True if the printer has the plugin. |

## Clear print bed

```shell
curl https://api.simplyprint.io/{id}/printers/actions/ClearBed?pid=1234 \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "success": true,
  "rating": 4
}
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

This endpoint can be used to clear the print bed of a printer.

### Request

`POST /{id}/printers/actions/ClearBed`

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer | yes | The ID(s) of the printer to clear, comma separated. These printers have to be in either the `operational` or `offline` states. |

#### Request body

| Field | Type | Required | Description |
| ----- | ---- | -------- | ----------- |
| `success` | boolean | no | True if the print was successful.<br>**Default: false** |
| `rating` | integer | no | The rating of the print. Don't send this field if you do not want to rate the print. |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Create print job (WIP)

```shell
curl https://api.simplyprint.io/{id}/printers/actions/CreateJob?pid=1234&filesystem=291 \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "pid": [1234, 1235],
  "filesystem": "196a1dd0b93a66c19192a39fa4c16e71"
}
```

> Success response

```json
{
  "status": true,
  "message": null,
  "files": [
    {
      "name": "Benchy.gcode",
      "analysis": {
        "slicer": "Simplify3D",
        "filament": [
          60
        ],
        "estimate": 240,
        "movement": {
          "mRelative": 0,
          "eRelative": 0
        },
        "temps": {
          "tool": {
            "T0": 210
          },
          "bed": 50,
          "pset": 1
        },
        "modelSize": {
          "x": 151,
          "y": 16,
          "z": 5
        },
        "printArea": {
          "maxX": 156.05,
          "minX": 5,
          "maxY": 157.86,
          "minY": 142.14,
          "maxZ": 5,
          "minZ": 0.2
        },
        "minDeltaRadius": 313.91,
        "v": 5
      },
      "printers": [
        1234,
        1235        
      ],
      "queued": false
    }
  ],
  "jobIds": [
    495462,
    495463
  ]
}
```

This endpoint can be used to create a print job for one or more printers. The printers have to be in the `operational` state.

### Request

`POST /{id}/printers/actions/CreateJob`

To start a print job you must either specify a `filesystem` ID, a `queue_file` ID file or set `next_queue_item` to true.

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer or integer[] | yes | The ID(s) of the printer to create the job for. |
| `filesystem` | string | no | The filesystem ID of the file to print. |
| `queue_file` | integer | no | The queue ID of the queue item to print. |
| `next_queue_item` | boolean | no | If true, the next queue item will be printed. |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `files` | array | Array of started print job objects. |
| `files[].name` | string | The name of the file. |
| `files[].analysis` | object | The analysis of the file. This has been documented in the [Save autoqueue defaults endpoint.](#save-autoqueue-defaults). |
| `files[].printers` | integer[] | The IDs of the printers that the print job was started on. |
| `files[].queued` | boolean | True if the print job was queued. |

## actions/Resume

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Resume \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/printers/actions/Resume`

TODO

## actions/Pause

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Pause \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/printers/actions/Pause`

TODO

## actions/Get

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Get \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/printers/actions/Get`

TODO

## actions/Cancel

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Cancel \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/printers/actions/Cancel`

TODO

## logs/ReadLog

```shell
curl https://api.simplyprint.io/{id}/printers/logs/ReadLog \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/printers/logs/ReadLog`

TODO

## logs/DeleteLog

```shell
curl https://api.simplyprint.io/{id}/printers/logs/DeleteLog \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "TODO": "TODO"
}
```

### Request

`? /{id}/printers/logs/DeleteLog`

TODO
