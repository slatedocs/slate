# Catálogo

## Productos

El catálogo de productos te permite registrar todo los bienes o servicios que
vendes y compras. Así podrás crear facturas, vender a través de Market y
controlar el inventario de los productos.


### Consulta un Producto

> ##### Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/catalog/products/e640584d-b1c3-487e-8c0c-acc931332a30 \
-H "X-Api-Key: <API-key>" \
```

```python
import requests
product_id = "e640584d-b1c3-487e-8c0c-acc931332a30"
headers = {
  'x-api-key': '<API-key>'
}
datil_api_url = "https://api.datil.co/catalog/products/" + product_id
product = requests.get(datil_api_url, headers=headers).json()
```

Consulta los detalles de un producto antes creado. Envía el ID del producto para
obtener su información

Parámetros | &nbsp;
---------- | -------
id<p class="dt-data-type">requerido</p> | El identificador único del producto.


#### Respuesta

Retorna un objeto [Product](#product) si el identificador es válido, caso contrario
retorna un error.

> ##### Respuesta de ejemplo

```json
{
  "id": "9e01ba80-4e37-4cac-9df5-2996b7e39973",
  "name": "Bolso UM",
  "description": "",
  "unit_of_measurement": {
    "abbreviation": "und",
    "name": "Unidad"
  },
  "images": [],
  "category": null,
  "unit_price": "45.000000",
  "applicable_taxes": [{
    "tax_code": "2",
    "rate": "14.00",
    "rate_code": "3",
    "name": "IVA 14%"
  }],
  "purchase_applicable_taxes": [],
  "track_inventory": false,
  "type": "good",
  "sku": "BOL-U123",
  "tags": ["bolso"],
  "available_online": false,
  "slug": "bolso-um",
  "unit_cost": "30.000000",
  "created_at": "2017-03-28T13:10:32.189Z",
  "updated_at": "2017-03-28T13:11:04.854Z"
}
```