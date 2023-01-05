# Queue

## Add item to queue

```shell
curl https://api.simplyprint.io/{id}/queue/AddItem \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "filesystem": "1a077dd6296417fe75555bf806b68089"
}
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

This endpoint adds a file to the queue. The file can either be a file on the filesystem or an uploaded stl/3mf/obj/gcode/gco/nc/npg file.

### Request

`POST /{id}/queue/AddItem`

You must specify either a filesystem id or a file to upload.

#### Parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `filesystem` | string | no | The filesystem id of the file to add to the queue. |
| `amount` | int | no | The amount of prints to add to the queue.<br>**Default: 1** |

#### File upload

| File | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `file` | stl/3mf/obj/gcode/gco/nc/npg | no | The file to add to the queue.<br>**Max file size: 100MB (bigger files must be uploaded to the filesystem first)** |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |

## Get queue items

```shell
curl https://api.simplyprint.io/{id}/queue/GetItems?p=1234 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "queue": {
    "fits": true,
    "items": [
      {
        "id": 51293,
        "index": 1,
        "filename": "benchy.gcode",
        "model": false,
        "left": 1,
        "printed": 0,
        "for": {
          "printers": [
            1234
          ],
          "models": [
            1234
          ],
          "groups": [
            1234
          ]
        },
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
        "user": "John Doe",
        "user_id": 1234
      }
    ]
  }
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

This endpoint returns the queue for the specified or all printers.

### Request

`GET /{id}/queue/GetItems`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `p` | int | no | The printer id to get the queue for. If not specified, the queue for all printers will be returned. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |
| `queue` | object | The queue object. |
| `queue.fits` | boolean | TODO |
| `queue.items` | array | An array of queue item objects. |
| `queue.items[].id` | int | The queue item id. |
| `queue.items[].index` | int | The queue item index. |
| `queue.items[].filename` | string | The queue item filename. |
| `queue.items[].model` | boolean | True if the queue item is a model. |
| `queue.items[].left` | int | The amount of prints left to print. |
| `queue.items[].printed` | int | The amount of prints that have been printed. |
| `queue.items[].for` | object | For which printers, models and groups this queue item is for. |
| `queue.items[].for.printers` | array | An array of printer ids. |
| `queue.items[].for.models` | array | An array of printer model ids. |
| `queue.items[].for.groups` | array | An array of group ids. |
| `queue.items[].analysis` | object | The analysis object. |
| `queue.items[].analysis.slicer` | string | The slicer used to slice the file. |
| `queue.items[].analysis.filament` | array | An array of filament lengths. |
| `queue.items[].analysis.estimate` | int | The estimated print time in seconds. |
| `queue.items[].analysis.movement` | object | The movement object. |
| `queue.items[].analysis.temps` | object | The temperatures object. |
| `queue.items[].analysis.temps.tool` | object | Temperature for each tool (extruder). |
| `queue.items[].analysis.temps.bed` | int | Temperature for the bed. |
| `queue.items[].analysis.temps.pset` | int | TODO |
| `queue.items[].analysis.modelSize` | object | The model size object. Represented as `x`, `y` and `z` values in millimeters. |
| `queue.items[].analysis.printArea` | object | The print area object. Represented as `maxX`, `minX`, `maxY`, `minY`, `maxZ` and `minZ` values in millimeters. |
| `queue.items[].analysis.minDeltaRadius` | float | Minimum radius for delta printers. |
| `queue.items[].analysis.v` | int | The analysis version. |
| `queue.items[].user` | string | The user name of who added the queue item. |
| `queue.items[].user_id` | int | The user id of who added the queue item. |

## Update queue item

```shell
curl https://api.simplyprint.io/{id}/queue/UpdateItem?job=1234 \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "for_groups": [
    1234
  ],
  "for_models": [
    1234
  ],
  "for_printers": [
    1234
  ]
}
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

This endpoint updates the queue item with the specified id.

### Request

`POST /{id}/queue/UpdateItem`

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `job` | int | yes | The queue item id to update. |

#### Request body

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `for_groups` | array | no | An array of group ids to assign the queue item to. |
| `for_models` | array | no | An array of printer model ids to assign the queue item to. |
| `for_printers` | array | no | An array of printer ids to assign the queue item to. |
| `amount` | int | no | The new amount to set. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |

## Delete queue item

```shell
curl https://api.simplyprint.io/{id}/queue/DeleteItem?job=1234 \
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

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

This endpoint deletes the queue item with the specified id.

### Request

`? /{id}/queue/DeleteItem`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `job` | int | yes | The queue item id to delete. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |

## Change queue order

```shell
curl https://api.simplyprint.io/{id}/queue/SetOrder?job=1234&from=0&to=1 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
    "success": true,
    "message": null
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

This endpoint changes the order of the queue items by moving the queue item with the specified id.

### Request

`GET /{id}/queue/SetOrder`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `job` | int | yes | The queue item id to move. |
| `from` | int | yes | The current position of the queue item. |
| `to` | int | yes | The new position of the queue item. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `success` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `success` is false. |

## Empty queue

```shell
curl https://api.simplyprint.io/{id}/queue/EmptyQueue \
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

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required Permissions |
| -------------------- |
| `PRINT_QUEUE_REMOVE_ALL` |

This endpoint empties the queue.

### Request

`GET /{id}/queue/EmptyQueue`

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |
