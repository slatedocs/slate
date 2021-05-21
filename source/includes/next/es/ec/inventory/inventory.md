# Inventario

El catálogo de inventario te permite consultar información de las bodegas y stock de los items que tengas.

#### Acciones disponibles para Categorías

* [`GET /inventory/warehouses`](#listar-bodegas)<br>
Obtener un listado de las bodegas

* [`GET /inventory/warehouses/:id`](#consulta-una-bodega)<br>
Consutlar información de una bodega

* [`GET /inventory/warehouses/locations/:id`](#consulta-una-bodega-por-punto-de-emision)<br>
Consultar información de la bodega por defecto de un punto de emisión

* [`GET /inventory/warehouses/:id/stocks`](#listar-existencias)<br>
Consultar stock de los items en una bodega

* [`GET /inventory/warehouses/:id_warehouse/stocks/:id_item`](#consulta-existencias)<br>
Consultar stock de un item en una bodega

## Listar Bodegas

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/warehouses
-H "X-Api-Key: <API-key>" \
```

```python
import requests
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/warehouses"
categories = requests.get(datil_api_url, headers=headers).json()
```

Obten un listado completo de las bodegas en tu inventario.

### Respuesta

Retorna un objeto [result set](#result-set) con el listado de las bodegas que tengas en tu inventario.

> Respuesta de ejemplo

```json
{
    "count": 1,
    "results": [
        {
            "name": "Matriz",
            "default_warehouse": true,
            "created_at": "2021-05-18T20:02:07.582Z",
            "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
            "updated_at": "2021-05-18T20:02:17.424Z",
            "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
            "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"
        },
        {
            "name": "Bodega",
            "default_warehouse": false,
            "created_at": "2021-05-17T20:02:07.582Z",
            "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
            "updated_at": "2021-05-17T20:02:17.424Z",
            "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
            "id": "874ec980-b939-11eb-8529-0242ac130003"
        }
    ]
}
```

## Consulta una Bodega

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/warehouses/874ec980-b939-11eb-8529-0242ac130003 \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
warehouse_id = "874ec980-b939-11eb-8529-0242ac130003"
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/warehouses/" + warehouse_id
warehouse = requests.get(datil_api_url, headers=headers).json()
```

Consulta los detalles de una bodega. Envía el ID de la bodega para obtener su información.

Parámetros | Descripción
---------- | -------
id<p class="dt-data-type">requerido</p> | El identificador único de la bodega.

### Respuesta

Retorna un objeto [Warehouse](#warehouse) si el identificador es válido, caso contrario
retorna un error.

> Respuesta de ejemplo

```json
{
    "name": "Bodega",
    "default_warehouse": false,
    "created_at": "2021-05-17T20:02:07.582Z",
    "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
    "updated_at": "2021-05-17T20:02:17.424Z",
    "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
    "id": "874ec980-b939-11eb-8529-0242ac130003"
}
```

## Consulta una Bodega por punto de emisión

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/warehouses/locations/2eff72aa-d3e1-4c0d-96be-3d22e8c6e72 \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
location_id = "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72"
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/warehouses/locations" + location_id
warehouse = requests.get(datil_api_url, headers=headers).json()
```

Consulta los detalles de la bodega por defecto del punto de emisión. Envía el ID del punto de emisión para obtener su información.

Parámetros | Descripción
---------- | -------
id<p class="dt-data-type">requerido</p> | El identificador único del punto de emisión.

### Respuesta

Retorna un objeto [warehouse](#warehouse) si el identificador es válido, caso contrario
retorna un error.

> Respuesta de ejemplo

```json
{
    "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39",
    "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
    "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
    "default_warehouse": true,
    "name": "Bodega"
}
```

## Listar existencias

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/warehouses/874ec980-b939-11eb-8529-0242ac130003/stocks \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
warehouse_id = "874ec980-b939-11eb-8529-0242ac130003"
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/warehouses/" + warehouse_id + "/stocks"
warehouse = requests.get(datil_api_url, headers=headers).json()
```

Obten un listado de todas las existencias de una bodega. Envía el ID de la bodega para obtener su información.

Parámetros | Descripción
---------- | -------
id<p class="dt-data-type">requerido</p> | El identificador único de la bodega.

### Respuesta

Retorna un objeto [result set](#result-set) con el listado de las existencias que tenga la bodega.

> Respuesta de ejemplo

```json
{
    "count": 2,
    "results": [
        {
            "unit_price": "30.000000",
            "item_id": "80518213-0ca4-4ec7-b988-db6462352d71",
            "latest_update_by_transaction": "cb16de6e-fd4b-4428-a496-91d9245f0902",
            "warehouse": {
                "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39",
                "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
                "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
                "default_warehouse": true,
                "name": "Bodega"
            },
            "total": "3450.000000",
            "id": 2,
            "quantity": "115.000000"
        },
        {
            "unit_price": "2.055944",
            "item_id": "991ee848-06ff-433d-9811-3ba0afdf1352",
            "latest_update_by_transaction": "ad3a06bf-e08c-4126-9e29-d2491e049ec5",
            "warehouse": {
                "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39",
                "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
                "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
                "default_warehouse": true,
                "name": "Bodega"
            },
            "total": "106.909092",
            "id": 1,
            "quantity": "52.000000"
        }
    ]
}
```

## Consulta Existencias

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/warehouses/874ec980-b939-11eb-8529-0242ac130003/stocks/991ee848-06ff-433d-9811-3ba0afdf1352 \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
warehouse_id = "874ec980-b939-11eb-8529-0242ac130003"
item_id = "991ee848-06ff-433d-9811-3ba0afdf1352"
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/warehouses/" + warehouse_id + "/stocks/" + item_id
stock = requests.get(datil_api_url, headers=headers).json()
```

Consulta las existencias de un item en la bodega. Envía el ID de la bodega y el ID del item.

Parámetros | Descripción
---------- | -------
id_warehouse<p class="dt-data-type">requerido</p> | El identificador único de la bodega.
id_item<p class="dt-data-type">requerido</p> | El identificador único de la bodega.

### Respuesta

Retorna un objeto [Stock](#stock) si los identificadores son correctos, caso contrario
retorna un error.

> Respuesta de ejemplo

```json
{
    "to_buy": 0,
    "item_id": "991ee848-06ff-433d-9811-3ba0afdf1352",
    "stock_alarm": "ok",
    "latest_update_by_transaction": "ad3a06bf-e08c-4126-9e29-d2491e049ec5",
    "warehouse": {
        "name": "Bodega",
        "default_warehouse": true,
        "created_at": "2021-05-19T20:28:49.090Z",
        "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
        "updated_at": "2021-05-19T20:28:49.090Z",
        "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
        "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"
    },
    "created_at": "2021-05-19T02:57:12.505Z",
    "total": "106.909092",
    "updated_at": "2021-05-19T17:16:51.404Z",
    "unit_price": "2.055944",
    "quantity": "52.000000"
}
```

## Transacciones

Actualiza las existencias en las bodegas de tu inventario.

* [`POST /inventory/input`](#entrada)<br>
Incrementa las existencias en una bodega

* [`POST /inventory/output`](#salida)<br>
Disminuye las existencias en una bodega

## Entrada

### Operación

`POST /inventory/inputs`

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/input \
-H "X-Api-Key: <API-key>" \
-d '{
    "warehouse": {"id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"},
    "support_doc_id": "97b34644c9a848fc8b4f1g8edac0323d",
    "support_doc_type": 1,
    "support_doc_date": "2021-05-18T00:00:00Z",
    "items": [{
        "id": "80518213-0ca4-4ec7-b988-db6462352d71",
        "sku": "113",
        "name": "Laptop",
        "quantity": 5,
        "unit_price": "30.0",
        "total": "150.0"
    }],
    "description": "Factura MegaMarket 001-034-000555007"
}'
```

```python
import requests
entrada = {
    "warehouse": {"id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"},
    "support_doc_id": "97b34644c9a848fc8b4f1g8edac0323d",
    "support_doc_type": 1,
    "support_doc_date": "2021-05-18T00:00:00Z",
    "items": [{
        "id": "80518213-0ca4-4ec7-b988-db6462352d71",
        "sku": "113",
        "name": "Laptop",
        "quantity": 5,
        "unit_price": "30.0",
        "total": "150.0"
    }],
    "description": "Factura MegaMarket 001-034-000555007"
}

headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/input
respuesta = requests.post(
    datil_api_url, 
    headers=headers,
    data=json.dumps(entrada))
```

Para aumentar la cantidad de existencias en una bodega, se debe de enviar el ID de la bodega más la información del item del cual se incrementará la cantidad

Parámetro | Descripción
----------|------------
warehouse<p class="dt-data-type">object</p> | Objeto donde se especifica el id de la bodega
support_doc_id<p class="dt-data-type">string</p> | El id del documento de compra de los productos
support_doc_type<p class="dt-data-type">integer</p> | Tipo de documento de compra
support_doc_date<p class="dt-data-type">string</p> | Fecha de del documento de compra
items | Objeto de tipo [Item](#item)
descripcion<p class="dt-data-type">string</p> | Descripción del incremento de existencias

### Respuesta

Retorna información del incremento e información del item y de la bodega a la que se le hizo el aumento.

> Respuesta de ejemplo

```json
{
    "status": "approved",
    "support_doc_type": 1,
    "total_amount": null,
    "description": "Factura MegaMarket 001-034-000555007",
    "entry_type": "I",
    "created_at": "2021-05-19T17:46:25.862Z",
    "support_doc_id": "97b34644c9a848fc8b4f1g8edac0323d",
    "updated_at": "2021-05-19T17:46:25.862Z",
    "number": 0,
    "items": [
        {
            "sku": "113",
            "_id": 21,
            "name": "Laptop",
            "unit_price": "30.0",
            "stock": {
                "created_at": "2021-05-19T17:33:51.614Z",
                "total": "450.000000",
                "updated_at": "2021-05-19T17:46:25.935Z",
                "unit_price": "30.000000",
                "quantity": "15.000000"
            },
            "total": "150.0",
            "id": "80518213-0ca4-4ec7-b988-db6462352d71",
            "quantity": "5"
        }
    ],
    "warehouse": {
        "name": "Bodega",
        "default_warehouse": true,
        "created_at": "2021-05-17T20:02:07.582Z",
        "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
        "updated_at": "2021-05-17T20:02:17.424Z",
        "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
        "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"
    },
    "id": "1a35aad6-063b-450d-b056-4ca3e913a87e",
    "support_doc_date": "2021-05-18T00:00:00Z"
}
```

Parámetro | Descripción
----------|------------
status<p class="dt-data-type">string</p> | Estado de la operación
support_doc_type<p class="dt-data-type">integer</p> | El id del documento de compra de los productos
total_amount<p class="dt-data-type">integer</p> | Tipo de documento de compra
description<p class="dt-data-type">string</p> | Descripción del incremento de existencias
entry_type<p class="dt-data-type">string</p> | Tipo de Operación. Si es un ingreso `"I"` si es una salida `"O"`
created_at<p class="dt-data-type">string</p> | Fecha de creación del incremento
support_doc_id<p class="dt-data-type">string</p> | Identificador único del documento asociando
updated_at<p class="dt-data-type">string</p> | Fecha de la última actualización
items<p class="dt-data-type">array</p> | Objeto de tipo [Item](#item)
warehouse<p class="dt-data-type">object</p> | Objeto de tipo [Bodega](#bodega)
id<p class="dt-data-type">string</p> | Identificador único del incremento
support_doc_date<p class="dt-data-type">string</p> | Fecha de del documento de compra

## Salida

### Operación

`POST /inventory/outputs`

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/inventory/input \
-H "X-Api-Key: <API-key>" \
-d '{
    "warehouse": {"id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"},
    "support_doc_id": "97b34644c9a848fc8b4f1g8edac0323d",
    "support_doc_type": 1,
    "support_doc_date": "2021-05-17T22:15:41Z",
    "items": [{
        "id": "991ee848-06ff-433d-9811-3ba0afdf1352",
        "sku": "111",
        "name": "Agua Mineral",
        "quantity": 3
    }],
    "description": "Factura MegaMarket 001-034-000555007"
}'
```

```python
import requests
entrada = {
    "warehouse": {"id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"},
    "support_doc_id": "97b34644c9a848fc8b4f1g8edac0323d",
    "support_doc_type": 1,
    "support_doc_date": "2021-05-17T22:15:41Z",
    "items": [{
        "id": "991ee848-06ff-433d-9811-3ba0afdf1352",
        "sku": "111",
        "name": "Agua Mineral",
        "quantity": 3
    }],
    "description": "Factura MegaMarket 001-034-000555007"
}

headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/inventory/input
respuesta = requests.post(
    datil_api_url, 
    headers=headers,
    data=json.dumps(entrada))
```

Para decrementar la cantidad de existencias en una bodega, se debe de enviar el ID de la bodega más la información del item del cual se disminuirá la cantidad

Parámetro | Descripción
----------|------------
warehouse<p class="dt-data-type">object</p> | Objeto donde se especifica el id de la bodega
support_doc_id<p class="dt-data-type">string</p> | El id del documento de compra de los productos
support_doc_type<p class="dt-data-type">integer</p> | Tipo de documento de compra
support_doc_date<p class="dt-data-type">string</p> | Fecha de del documento de compra
items<p class="dt-data-type">array</p> | Objeto con información del item
descripcion<p class="dt-data-type">string</p> | Descripción del incremento de existencias

### Respuesta

> Respuesta de ejemplo

```json
{
    "status": "approved",
    "support_doc_type": 1,
    "total_amount": null,
    "description": "Factura MegaMarket 001-034-000555007",
    "entry_type": "O",
    "created_at": "2021-05-21T17:07:10.374Z",
    "support_doc_id": "97b34644c9a848fc8b4f1g8edac0323d",
    "updated_at": "2021-05-21T17:07:10.374Z",
    "number": 0,
    "items": [
        {
            "sku": "111",
            "_id": 22,
            "name": "Agua Mineral",
            "unit_price": "2.363636",
            "stock": {
                "created_at": "2021-05-19T02:57:12.505Z",
                "total": "11.818184",
                "updated_at": "2021-05-21T17:07:10.530Z",
                "unit_price": "2.363636",
                "quantity": "5.000000"
            },
            "total": "7.090908",
            "id": "991ee848-06ff-433d-9811-3ba0afdf1352",
            "quantity": "3"
        }
    ],
    "warehouse": {
        "name": "Bodega",
        "default_warehouse": true,
        "created_at": "2021-05-17T20:02:07.582Z",
        "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
        "updated_at": "2021-05-17T20:02:17.424Z",
        "location_id": "2eff72aa-d3e1-4c0d-96be-3d22e8c6e72f",
        "id": "e1579cd1-2040-47e2-8b8f-de87f4644f39"
    },
    "id": "c3c756a4-f029-43d2-9905-78d6e0c79fb3",
    "support_doc_date": "2021-05-17T22:15:41Z"
}
```

Retorna información del decremento e información del item y de la bodega a la que se le hizo la dismimnución.

Parámetro | Descripción
----------|------------
status<p class="dt-data-type">string</p> | Estado de la operación
support_doc_type<p class="dt-data-type">integer</p> | El id del documento de compra de los productos
total_amount<p class="dt-data-type">integer</p> | Monto total en la bodega
description<p class="dt-data-type">string</p> | Descripción del decremento de existencias
entry_type<p class="dt-data-type">string</p> | Tipo de Operación. Si es un ingreso `"I"` si es una salida `"O"`
created_at<p class="dt-data-type">string</p> | Fecha de creación del decremento
support_doc_id<p class="dt-data-type">string</p> | Identificador único del documento asociando
updated_at<p class="dt-data-type">string</p> | Fecha de la última actualización
items<p class="dt-data-type">array</p> | Objeto de tipo [Item](#item)
warehouse<p class="dt-data-type">object</p> | Objeto de tipo [Bodega](#bodega)
id<p class="dt-data-type">string</p> | Identificador único del decremento
support_doc_date<p class="dt-data-type">string</p> | Fecha de del documento de compra