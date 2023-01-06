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
| `just_connection` | integer | no | If set to 1, only the Pi connection will be deleted. Otherwise, the printer will be permanently deleted.<br>**Default: 0** |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

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
| `files[].analysis` | object | The analysis of the file. This has been documented in the [Get queue items endpoint](#get-queue-items). |
| `files[].printers` | integer[] | The IDs of the printers that the print job was started on. |
| `files[].queued` | boolean | TODO |
| `jobIds` | integer[] | The IDs of the print jobs that were started. |

## Get printer info

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Get \
  -X ? \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

<aside class="warning">
  This endpoint has not been implemented yet.
</aside>

### Request

`? /{id}/printers/actions/Get`

## Pause print job

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Pause?pid=1234 \
  -X POST \
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

This endpoint can be used to pause one or multiple print jobs. The printers have to be in the `PRINTING` state.

### Request

`POST /{id}/printers/actions/Pause`

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer or integer[] | yes | The ID(s) of the printer to pause. Pause multiple printers by comma separating printer ids.<br>**Printer must be in `PRINTER_PRINTING` state** |

#### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Resume print job

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Resume?pid=1234 \
  -X POST \
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

### Request

`POST /{id}/printers/actions/Resume`

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer or integer[] | yes | The ID(s) of the printer to resume. Resume multiple printers by comma separating printer ids.<br>**Printer must be in `PRINTER_PAUSED` state** |

#### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Cancel print job

```shell
curl https://api.simplyprint.io/{id}/printers/actions/Cancel?pid=1234 \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "reason": 3,
  "comment": "Cancel comment"
}
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

| Required permission | Description |
| ------------------- | ----------- |
| `CANCEL_OTHERS_PRINTS` | Need permission to cancel other users' prints if the print job was started by another user. |

This endpoint can be used to cancel one or multiple print jobs. The printers have to be in the `PRINTING`, `PAUSED` or `PAUSING` state.

### Request

`POST /{id}/printers/actions/Cancel`

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer or integer[] | yes | The ID(s) of the printer to cancel. Cancel multiple printers by comma separating printer ids.<br>**Printer must be in `PRINTER_PRINTING`, `PRINTER_PAUSED` or `PRINTER_PAUSING` state** |

#### Request body

| Field | Type | Required | Description |
| ----- | ---- | -------- | ----------- |
| `reason` | integer | no | The reason for cancelling the print job. See [Cancel reasons](#cancel-reasons). Depending on the `require_cancel_reason` organization setting, this field may be required. |
| `comment` | string | no | A comment for the cancel reason. Depending on the `require_comment` organization setting, this field may be required.<br>**Max length: 500 characters** |

### Response

| Field | Type | Description |
| ----- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Cancel reasons

| ID | Description |
| -- | ----------- |
| 1 | Print failed |
| 2 | Regretted print |
| 3 | No filament extruded / nozzle clog |
| 4 | Fell of the plate |
| 5 | Not enough filament |
| 6 | Other |
