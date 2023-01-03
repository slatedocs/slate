# Filament

## List Filaments

```shell
curl https://api.simplyprint.io/{id}/filament/GetFilament \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "showid": true,
  "is_kg": false,
  "brands": {
    "test brand": 1,
    ...
  },
  "types": {
    "PLA": 1,
    ...
  },
  "filament": {
    "3017": {
      "id": 3017,
      "uid": "PL23",
      "type": {
        "id": 5637,
        "name": "PLA"
      },
      "brand": "test brand",
      "colorName": "test color",
      "colorHex": "#000000",
      "dia": 1.75,
      "density": 1.24,
      "temps": {
        "nozzle": 210,
        "bed": 65,
        "flNozzle": 210,
        "flBed": 65
      },
      "slicing": {
        "printSpeed": 70,
        "finishRate": 0.5,
        "minSpeed": 15
      },
      "total": 335284,
      "left": 234699,
      "extruder": 0,
      "bought": 1630447200,
      "created": 1630508337,
      "printer": 0,
      "nfc": 0,
      "qr": 0,
      "prodId": ""
    },
    ...
  }
}
```

This endpoint returns a list of all filaments as well as filament types and brands.

### Request

`GET /{id}/filament/GetFilament`

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `showid` | boolean | Whether to show filament id. (Frontend data) |
| `is_kg` | boolean | Whether to show filament in kg. (Frontend data) |
| `brands` | object | Filament brands. |
| `brands.{brand}` | integer | Number of filaments with `{brand}`. |
| `types` | object | Filament types such as PLA, ABS, PETG, etc. |
| `types.{type}` | integer | Number of filaments with `{type}`. |
| `filament` | object | Filament data where each key is a filament id. |
| `filament.{id}` | object | Filament data. |
| `filament.{id}.id` | integer | Filament id. (same as `{id}`) |
| `filament.{id}.uid` | string | Four character code that is used to identify the filament. Refered to as filament id in the frontend. |
| `filament.{id}.type` | object | Filament type. |
| `filament.{id}.type.id` | integer | Filament type id. |
| `filament.{id}.type.name` | string | Filament type name. |
| `filament.{id}.brand` | string | Filament brand. |
| `filament.{id}.colorName` | string | Filament color name. |
| `filament.{id}.colorHex` | string | Filament color hex code. |
| `filament.{id}.dia` | float | Filament diameter. |
| `filament.{id}.density` | float | Filament density. |
| `filament.{id}.temps` | object | Filament temperatures. |
| `filament.{id}.temps.nozzle` | integer | Filament nozzle temperature. |
| `filament.{id}.temps.bed` | integer | Filament bed temperature. |
| `filament.{id}.temps.flNozzle` | integer | Filament first layer nozzle temperature. |
| `filament.{id}.temps.flBed` | integer | Filament first layer bed temperature. |
| `filament.{id}.slicing` | object | Filament slicing settings. |
| `filament.{id}.slicing.printSpeed` | integer | Filament print speed. |
| `filament.{id}.slicing.finishRate` | float | Filament finish rate. |
| `filament.{id}.slicing.minSpeed` | integer | Filament minimum speed. |
| `filament.{id}.total` | integer | Total filament length in mm. |
| `filament.{id}.left` | integer | Left filament length in mm. |
| `filament.{id}.extruder` | integer | Which extruder the filament is assigned to. |
| `filament.{id}.bought` | integer | Timestamp of when the filament was bought. |
| `filament.{id}.created` | integer | Timestamp of when the filament was created. |
| `filament.{id}.printer` | integer | Which printer the filament is assigned to. |
| `filament.{id}.nfc` | integer | Whether the filament has NFC. |
| `filament.{id}.qr` | integer | Whether the filament has QR. |
| `filament.{id}.prodId` | string | Filament product id. |

## Create or Update Existing Filament

```shell
curl https://api.simplyprint.io/{id}/filament/Create \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request Body

```json
{
  "color_name": "Porcelain White",
  "color_hex": "#E5E5E5",
  "color_standard": "NCS S 1000-N",
  "width": 1.75,
  "density": 1.24,
  "bought_at": "2022-12-24",
  "filament_type": "rPLA",
  "cost": 23,
  "currency": "USD",
  "custom_note": "This is a note",
  "prod_id": "",
  "brand": "lostboyslab",
  "brand_id": 1,
  "filgroup_id": 13,
  "spool_id": 44,
  "slicing_settings": {
    "nozzle_temp": 200,
    "nozzle_fl_temp": 200,
    "bed_temp": 60,
    "bed_fl_temp": 60,
    "print_speed": 70,
    "finish_rate": 0.5,
    "min_speed": 15
  },
  "amount": 1,
  "total_length_type": "kg",
  "left_length_type": "percent",
  "total_length": 1,
  "length_used": 57
}
```

> Success response

```json
{
  "status": true,
  "message": null,
  "filament_ids": [
    "NGGY"
  ],
  "qr_gen": 1
}
```

This endpoint can be used to create or update existing filament.

To update existing filament, you need to provide a `fid` query parameter, which is the filament id of the filament you want to update.

| Required permissions |
| -------------------- |
| `CREATE_FILAMENT` |

### Request

`POST /{id}/filament/Create`

#### Query Parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `fid` | string | no | Filament id of the filament you want to update. |

#### Request Body

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `color_name` | string | yes | Filament color name.<br>**Max 64 characters** |
| `color_hex` | string | yes | Filament color hex code. |
| `color_standard` | string | no | Filament color standard. |
| `width` | float (enum) | yes | Filament width.<br>**Value has to be one of `[1.75, 2.85, 3.00]`** |
| `density` | float | yes | Filament density. |
| `bought_at` | string | no | Date of purchase.<br>**Format: `YYYY-MM-DD`** |
| `filament_type` | string | yes | Filament type. |
| `cost` | float | no | Cost of filament. |
| `currency` | string | no | Currency of `cost`.<br>**Max 3 characters** |
| `custom_note` | string | no | Custom note.<br>**Max 1000 characters** |
| `prod_id` | string | no | Filament product id. |
| `brand` | string | yes | Filament brand. |
| `brand_id` | integer | no | Filament brand id. |
| `filgroup_id` | integer | no | Target SimplyPrint filament group id to insert filament into. |
| `spool_id` | integer | no | Filament spool id. |
| `slicing_settings` | object | yes | Slicing settings. |
| `slicing_settings.nozzle_temp` | integer | yes | Nozzle temperature. |
| `slicing_settings.nozzle_fl_temp` | integer | yes | Nozzle first layer temperature. |
| `slicing_settings.bed_temp` | integer | yes | Bed temperature. |
| `slicing_settings.bed_fl_temp` | integer | yes | Bed first layer temperature. |
| `slicing_settings.print_speed` | integer | yes | Print speed. |
| `slicing_settings.finish_rate` | float | yes | Finish rate. |
| `slicing_settings.min_speed` | integer | yes | Minimum speed. |
| `amount` | integer | yes | Amount of filament. |
| `total_length_type` | string | yes | Total length type. |
| `left_length_type` | string | yes | Left length type. |
| `total_length` | float | yes | Total length. |
| `length_used` | float | yes | Length used. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `filament_ids` | array | Array of filament ids. |
| `qr_gen` | integer | Used for frontend, not important. |

## Delete Filament

```shell
curl https://api.simplyprint.io/{id}/filament/Delete?fid=4519 \
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

This endpoint deletes a filament specified by the `fid` parameter.

| Required permissions |
| -------------------- |
| `CREATE_FILAMENT` |

### Request

`GET /{id}/filament/Delete`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| fid | integer | yes | Filament id |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Assign Filament(s) To Printer

```shell
curl https://api.simplyprint.io/{id}/filament/Assign?pid=5123&fid=21812,31253 \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
    "extruder": {
      "21812": 0,
      "31253": 1
    }
}
```

> Success response

```json
{
  "status": true,
  "message": null
}
```

This endpoint assigns filament(s) to a printer.

| Required permissions |
| -------------------- |
| `CHANGE_FILAMENT` |

### Request

`POST /{id}/filament/Assign`

The request has both query parameters and a request body.

#### Query parameters

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `pid` | integer | yes | Printer id. |
| `fid` | integer | yes | Filament id(s), comma separated. |

#### Request body

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `extruder` | object | yes | Which filament to assign to which extruder. |
| `extruder.{fid}` | integer | yes | Which extruder id to assign `{fid}` to. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |

## Unassign Filament From Printer

```shell
curl https://api.simplyprint.io/{id}/filament/Unassign?fid=21812 \
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

This endpoint unassigns a filament from a printer by filament id.

| Required permissions |
| -------------------- |
| `CHANGE_FILAMENT` |

### Request

`GET /{id}/filament/Unassign`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `fid` | integer | yes | Filament id to unassign. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
