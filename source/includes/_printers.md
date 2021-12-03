# Printers

## Get printer(s)

```shell
curl --request GET \
  --url http://api.simplyprint.io/v1/actions/printers/get \
  --header 'Authorization: Bearer {YOUR_TOKEN_HERE}'
```

```php
<?php
//Coming soon...
?>
```

> Success return:

```json
{
  "data": {
    "printers": [
      {
        "id": 1,
        "name": "My Ender-3",
        "org_id": 1,
        "printer_status": "operational",
        "active_print_job": 0,
        "online": true
      },
      {
        "id": 2,
        "name": "My Prusa Mini",
        "org_id": 1,
        "printer_status": "printing",
        "active_print_job": 189,
        "online": true
      }
    ]
  }
}
```

This endpoint retrieves one, or multiple printers.

### Request

`GET /v1/printers/get`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
id | false | A single, or multiple _(comma separated)_ printer ID's
org_id | false | If you're a member of multiple organizations, and only wish to get printers from one

## Preheat

```shell
curl --request GET \
  --url http://api.simplyprint.io/v1/actions/printers/preheat?id={PRINTER_ID(S)} \
  --header 'Authorization: Bearer {YOUR_TOKEN_HERE}'
```

```php
<?php
//Coming soon...
?>
```

> Success return:

```json
...
```

This endpoint retrieves a specific kitten.

### HTTP Request

`GET /v1/actions/printers/preheat?id={PRINTER_ID(S)}`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
id | true | A single, or multiple _(comma separated)_ printer ID's
temp | false | Target temperature for the printer(s). Defaults to `200`
type | false | Whether to heat the nozzle, bed or both. Options are; `nozzle` _(default)_, `bed`, `both`
