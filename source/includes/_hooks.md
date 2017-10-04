# Hooks

## Get a Hook

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/hook/42 \
    -H 'Authorization: Bearer ACCESS_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "hooks": [
        {
            "id": 42,
            "url": "https://www.test.cl",
            "action": "addProduct",
            "site_name": "test"
        }
    ]
}
```

This endpoint retrieves a Hook.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/hook/HOOK_ID`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
HOOK_ID   | (required) | identificador unico para hook




## Add a Hook

```shell
curl -XPOST https://apibodegas.loadingplay.com/v1/hook \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "url=www.testaddhook.cl" \
    -d "action=addProducts" \
    -d "site_name=test"
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "hooks": [
        {
            "id": "CREATED_HOOK_ID",
            "url": "www.testaddhook.cl",
            "action": "addProduct",
            "site_name": "test"
        }
    ]
}
```

This endpoint add a Hook.

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/hook`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
action    | (required) | Accion que dispara el hook
site_name | (required) | nombre del sitio del cual pertenece hook
url       | (optional) | url del cual hook realiza la accion



## Edit a Hook

```shell
curl -XPUT https://apibodegas.loadingplay.com/v1/hook/HOOK_ID \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "url=www.testedithook.cl" \
    -d "action=editProduct"
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "hooks": [
        {
            "id": "HOOK_ID",
            "url": "www.testedithook.cl",
            "action": "editProduct"
        }
    ]
}
```

This endpoint edit a Hook.

### HTTP Request

`PUT https://apibodegas.loadingplay.com/v1/hook/HOOK_ID`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
HOOK_ID   | (required) | identificador unico para hook
url       | (optional) | url del cual hook realiza la accion
action    | (optional) | Accion que dispara el hook




## Remove a Hook

```shell
curl -XDELETE https://apibodegas.loadingplay.com/v1/hook/HOOK_ID \
    -H 'Authorization: Bearer ACCESS_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "hooks": [
        {
            "id": "HOOK_ID",
            "url": "www.testedithook.cl",
            "action": "editProduct",
            "site_name": "test"
        }
    ]
}
```

This endpoint delete a Hook.

### HTTP Request

`DELETE https://apibodegas.loadingplay.com/v1/hook/HOOK_ID`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
HOOK_ID   | (required) | identificador unico para hook




## Get a Hook list

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/hook \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "site_name=test"
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "hooks": [
        {
            "id": "42",
            "url": "https://www.test.cl",
            "action": "addProduct",
            "site_name": "test"
        },
        {
            "id": "...",
            "url": "...",
            "action": "...",
            "site_name": "..."
        },
        ...
    ]
}
```

This endpoint retrieves a Hook list.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/hook`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
site_name | (required) | nombre del sitio del cual pertenece hook
