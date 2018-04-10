## Categorías

El catálogo de categorías te permite registrar todo los bienes o servicios que
vendes y compras. Así podrás crear facturas, vender a través de Market y
controlar el inventario de los categorías.

#### Acciones disponibles para Categorías

* [`GET /catalog/categories/:id`](#consulta-una-categor-a)<br>
Obtener información de una Categoría

* [`GET /catalog/categories`](#lista-categorias)<br>
Obtener un listado de Categorías

* [`POST /catalog/categories`](#crea-una-categor-a)<br>
Crear un nuevo Producto

* [`PUT /catalog/categories/:id`](#actualiza-una-categor-a)<br>
Actualizar una Categoría existente

* [`DELETE /catalog/categories/:id`](#elimina-una-categor-a)<br>
Elimina una Categoría de tu catálogo


## Lista Categorías

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/catalog/categories?ids=e640584d-b1c3-487e-8c0c-acc931332a30,03a233139cca-c0c8-e784-3c1b-d485046e \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
product_ids = ["e640584d-b1c3-487e-8c0c-acc931332a30",
               "03a233139cca-c0c8-e784-3c1b-d485046e"]
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/catalog/categories?ids=" + ','.join(product_ids)
categories = requests.get(datil_api_url, headers=headers).json()
```

Obtén el listado completo de Categorías del catálogo, o filtra los resultados
por cualquiera de estos parámetros.

Parámetros | &nbsp;
---------- | -------
ids<p class="dt-data-type">array</p> | Listado de IDs de los categorías que quieres obtener.
name<p class="dt-data-type">string</p> | Lista todas las categorías cuyo nombre contenga este texto.
parent_id<p class="dt-data-type">string</p> | Lista las cateogorías que pertenezcan a esta categoría padre.
page_size<p class="dt-data-type">integer</p> | Define la cantidad de items por página. Por defecto retorna 30 items por página


### Respuesta

Retorna un objeto [result set](#result-set) con el listado de Categorías que coincidan
con los filtros enviados.

> Respuesta de ejemplo

```json
{
  "count": 2,
  "previous": null,
  "results": [{
      "name": "IPHONE 6",
      "created_at": "2017-07-14T01:02:24.777Z",
      "updated_at": "2017-07-14T01:11:20.655Z",
      "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
      "parent_id": null,
      "item_count": 1,
      "id": "389b528d-0b16-408d-8822-e3e8e2b3391f"
    },
    {
      "name": "Planes Vigentes 2017",
      "created_at": "2017-06-23T17:26:32.252Z",
      "updated_at": "2017-06-23T17:27:52.137Z",
      "business_id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
      "parent_id": null,
      "item_count": 3,
      "id": "81f3f42a-286c-42fe-a6b2-4301a28fab0a"
    }
  ],
  "next": null
}
```

## Consulta una Categoría

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/catalog/categories/e640584d-b1c3-487e-8c0c-acc931332a30 \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
product_id = "e640584d-b1c3-487e-8c0c-acc931332a30"
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/catalog/categories/" + product_id
product = requests.get(datil_api_url, headers=headers).json()
```

Consulta los detalles de un categoría. Envía el ID del categoría para obtener su
información

Parámetros | &nbsp;
---------- | -------
id<p class="dt-data-type">requerido</p> | El identificador único del categoría.


### Respuesta

Retorna un objeto [Product](#product) si el identificador es válido, caso contrario
retorna un error.

> Respuesta de ejemplo

```json
{
  "id": "9e01ba80-4e37-4cac-9df5-2996b7e39973",
  "name": "Carteras",
  "created_at": "2017-03-28T13:10:32.189Z",
  "updated_at": "2017-03-28T13:11:04.854Z",
  "parent_id": null
}
```

### Crea una Categoría

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/catalog/categories \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-d '{
  "name": "Zapatos"
}'
```

```python
import json
import requests
api_key = "YOUR_API_KEY"
data = {
  "name": "Zapatos"
}
headers = {
  'x-api-key': api_key
}
datil_api_url = "https://api.datil.co/catalog/categories"
product = requests.post(datil_api_url, json.dumps(data), headers=headers).json()
```

Crea un nuevo categoría en el catálogo con la información enviada. El SKU debe
ser único, si ya existe un categoría con el mismo SKU responde con un error.

<h6 id="create-cat-params"></h6>

Parámetros |  &nbsp;
---------- | -----------
name<p class="dt-data-type">requerido</p> | Nombre del categoría
parent_id | ID de la categoría padre. Esto te permitirá crear categorías dentro de otras.


### Respuesta

Retorna el nuevo objeto [Product](#product) si la información es válida, caso contrario
retorna un error.

> Respuesta de ejemplo

```json
{
  "id": "0cde3602-979f-407b-ae6f-70f7d65a3a97",
  "name": "Zapatos",
  "created_at": "2017-07-13T17:02:48.892Z",
  "updated_at": "2017-07-13T17:02:48.892Z",
  "parent_id": null
}
```

## Actualiza una Categoría

> Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/catalog/categories/0cde3602-979f-407b-ae6f-70f7d65a3a97 \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-d '{
  "name": "Zapatos Deportivos"
}'
```

```python
import json
import requests
api_key = "YOUR_API_KEY"
data = {
  "name": "Zapatos Deportivos"
}
headers = {
  'x-api-key': api_key
}
category_id = '0cde3602-979f-407b-ae6f-70f7d65a3a97'
datil_api_url = "https://api.datil.co/catalog/categories/" + cateogory_id
product = requests.post(datil_api_url, json.dumps(data), headers=headers).json()
```

Actualiza la información de una Categoría ya existente. Puedes enviar uno o más
atributos del categoría que necesitas actualizar. Revisa el listado de
[parámetros](#create-cat-params)


Parámetros |  &nbsp;
---------- | -----------
name<p class="dt-data-type">requerido</p> | Nombre del categoría


### Respuesta

Retorna el objeto [Category](#category) actualizado si la información es válida, caso contrario
retorna un error.

> Respuesta de ejemplo

```json
{
  "id": "0cde3602-979f-407b-ae6f-70f7d65a3a97",
  "name": "Zapatos Deportivos",
  "created_at": "2017-07-13T17:02:48.892Z",
  "updated_at": "2017-07-13T17:02:48.892Z",
  "parent_id": null
}
```

