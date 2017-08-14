# Hooks

## Get a Hook

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/hook \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "action=PORBUSCAR" \
    -d "site_name=PORBUSCAR"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "hooks" : [
        {
            "id" : "...",
            "action": "...",
            "site_name": "...",
            "url": "..."
        }
    ]
}
```

This endpoint retrieves a Hook.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/hook`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
action | (required) | Accion que ejecuta el hook
site_name | (required) | nombre del sitio del cual pertenece hook



## Add a Hook

```shell
curl -XPOST https://apibodegas.loadingplay.com/v1/hook \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "action=PORBUSCAR" \
    -d "site_name=PORBUSCAR" \
    -d "url=PORBUSCAR"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "hooks" : [
        {
            "id" : "...",
            "action": "...",
            "site_name": "...",
            "url": "..."
        }
    ]
}
```

This endpoint add a Hook.

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/hook`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
action | (required) | Accion que ejecuta el hook
site_name | (required) | nombre del sitio del cual pertenece hook
url | (optional) | url del cual hook realiza la accion



## Edit a Hook

```shell
curl -XPUT https://apibodegas.loadingplay.com/v1/hook \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "action=PORBUSCAR" \
    -d "site_name=PORBUSCAR" \
    -d "url=PORBUSCAR"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "hooks" : [
        {
            "id" : "...",
            "action": "...",
            "site_name": "...",
            "url": "..."
        }
    ]
}
```

This endpoint edit a Hook.

### HTTP Request

`PUT https://apibodegas.loadingplay.com/v1/hook`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
action | (required) | Accion que ejecuta el hook
site_name | (required) | nombre del sitio del cual pertenece hook
url | (optional) | url del cual hook realiza la accion



## Remove a Hook

```shell
curl -XDELETE https://apibodegas.loadingplay.com/v1/hook \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "id=PORBUSCAR" \
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "hooks" : [
        {
            "id" : "...",
            "action": "...",
            "site_name": "...",
            "url": "..."
        }
    ]
}
```

This endpoint delete a Hook.

### HTTP Request

`DELETE https://apibodegas.loadingplay.com/v1/hook`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
id_hook | (required) | unique identifier for hook
