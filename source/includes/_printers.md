# Printers

## Get printer info

```shell
curl https://api.simplyprint.io/{id}/printers/Get \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "page": 1,
  "page_size": 10,
  "search": "Printer 1"
}
```

> Success response

```json
{
  "status": true,
  "message": null,
  "page_amount": 1,
  "data": [
    {
      "id": 385,
      "sort_order": 6,
      "printer": {
        "name": "Mini Printer 1",
        "state": "printing",
        "group": 99,
        "position": 6,
        "api": "OctoPrint",
        "ui": "OctoPrint",
        "ip": "10.78.16.46",
        "public": 1,
        "machine": "Raspberry Pi 4 Model B Rev 1.2",
        "online": true,
        "region": "eu-west-2",
        "firmware": "Virtual Marlin",
        "spVersion": "4.0.5",
        "temps": {
          "ambient": 22,
          "current": {
            "tool": [
              210
            ],
            "bed": null
          },
          "target": {
            "tool": [
              210
            ],
            "bed": null
          }
        },
        "hasPSU": 1,
        "psuOn": true,
        "hasFilSensor": true,
        "filSensor": true,
        "filamentRetraction": 250,
        "model": {
          "id": 91,
          "name": "Fabrikator Mini",
          "brand": "Turnigy",
          "bedSize": [
            80,
            80
          ],
          "bedType": "square",
          "maxHeight": 80,
          "image": "https:\/\/cdn.simplyprint.io\/i\/printer_types\/turnigy\/fabrikator_mini\/silhouette_sm.png?cacheid=5fe9e77f49198",
          "hasHeatedBed": false,
          "extruders": 1,
          "extruderSettings": null,
          "maxToolTemp": 240,
          "maxBedTemp": 0,
          "filamentWidth": 1.75,
          "nozzleDia": 0.4,
          "axes": {
            "e": {
              "inverted": false,
              "speed": 5
            },
            "x": {
              "inverted": false,
              "speed": 100
            },
            "y": {
              "inverted": false,
              "speed": 100
            },
            "z": {
              "inverted": false,
              "speed": 3.5
            }
          },
          "screwOffset": 35,
          "filamentRetraction": 250,
          "customBoundingBox": false,
          "extrudeAbs": 0,
          "originCenter": 0,
          "bedBelt": 0,
          "fwRetract": 0,
          "extrusionType": 1,
          "noControl": 0
        },
        "hasCam": 1,
        "hasQueue": {
          "items": 6,
          "fits": true
        },
        "health": {
          "usage": 24,
          "temp": 61,
          "memory": 19
        },
        "unsupported": 0,
        "latency": null,
        "outOfOrder": 0
      },
      "filament": null,
      "job": {
        "id": 552252,
        "uid": "da69d2a4-e07e-48ff-128a-f88fab1b8f20",
        "state": "printing",
        "file": "Benchy.15mm_PLA_MK3S_7h40m.gcode",
        "percentage": 50,
        "time": 12627,
        "canPreview": true,
        "layer": null
      }
    },
    ...
  ]
}
```

This endpoint returns a list of printers based on the given parameters.

### Request

`POST /{id}/printers/Get`

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer | no | Optional printer ID if you want to get info for a single printer. |

#### Request body

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `page` | integer | no | Page number to get. Leave empty for page 1. |
| `page_size` | integer | no | Number of printers per page. (Between 1 and 100)<br>Default: 10 |
| `search` | string | no | Search string to filter printers by. |

### Response

Note that `data` will be an object if `pid` is specified, otherwise it will be an array.

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `data` | object or array | Printer object(s). |
| `data.*.id` | integer | Printer ID. |
| `data.*.sort_order` | integer | The printer's sort index. |
| `data.*.printer` | object | Printer object. |
| `data.*.printer.name` | string | Printer's name. |
| `data.*.printer.state` | string | Printer's state. |
| `data.*.printer.group` | integer | Printer's group ID. |
| `data.*.printer.position` | integer | Printer's position in the group. |
| `data.*.printer.api` | string | Printer's API type. |
| `data.*.printer.ui` | string | Printer's UI type. |
| `data.*.printer.ip` | string | Printer's local IP address. |
| `data.*.printer.public` | boolean | Whether the printer is shown on the company hub. |
| `data.*.printer.machine` | string | Printer's machine type. |
| `data.*.printer.online` | boolean | Whether the printer is online. |
| `data.*.printer.region` | string | What region the printer is online in. |
| `data.*.printer.firmware` | string | Printer's firmware version. |
| `data.*.printer.spVersion` | string | Printer's SimplyPrint version. |
| `data.*.printer.temps` | object | Printer's current temperatures. |
| `data.*.printer.hasPSU` | boolean | Whether the printer has a SimplyPrint connected PSU. |
| `data.*.printer.psuOn` | boolean | Whether the printer's PSU is on. |
| `data.*.printer.hasFilSensor` | boolean | Whether the printer has a filament sensor. |
| `data.*.printer.filamentRetraction` | integer | Printer's filament retraction distance. |
| `data.*.printer.model` | string | Printer's model. |
| `data.*.printer.hasCam` | boolean | Whether the printer has a camera. |
| `data.*.printer.hasQueue` | object | Data about the printer's queue. Null if the printer doesn't have a queue. |
| `data.*.printer.hasQueue.items` | integer | Number of items in the printer's queue. |
| `data.*.printer.hasQueue.fits` | boolean | Whether the printer can physically fit any items in its queue. |
| `data.*.printer.health` | object | Printer's health data. (CPU usage, temperature, memory usage) |
| `data.*.printer.unsupported` | boolean | Whether the printer is unsupported. |
| `data.*.printer.latency` | integer | Printer's latency. |
| `data.*.printer.outOfOrder` | boolean | Whether the printer is out of order. |
| `data.*.filament` | object | Printer's filament data. |
| `data.*.job` | object | Printer's current job data. See [Get Print Jobs](#get-print-jobs) for more info. |

## Start print / create job

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

## Delete / disconnect printer

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

## Cancel reasons

| ID | Description |
| -- | ----------- |
| 1 | Print failed |
| 2 | Regretted print |
| 3 | No filament extruded / nozzle clog |
| 4 | Fell of the plate |
| 5 | Not enough filament |
| 6 | Other |
