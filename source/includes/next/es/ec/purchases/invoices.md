<h2 id="facturas-compra">Facturas</h2>

#### Acciones disponibles para Facturas de compra

* [`GET /purchases/invoices`](#lista-facturas)<br>
Obtener un listado de Facturas de compra

<h2 id="lista-facturas-compra">Lista Facturas</h2>

```shell
curl -v https://api.datil.co/purchases/invoices?supplier_tax_identification=0900800712001 \
-H "X-Api-Key: <API-key>" \
-H "Accept: application/json"
```

```python
import requests
headers = {
  'x-api-key': '<API-key>',
  'accept': 'application/json'
}
datil_api_url = "https://api.datil.co/purchases/invoices?supplier_tax_identification=0900800712001"
invoices = requests.get(datil_api_url, headers=headers).json()
```

Obtén el listado completo de Facturas recibidas, o filtra los resultados
por cualquiera de estos parámetros.

Parámetros | &nbsp;
---------- | -------
supplier_tax_identification<p class="dt-data-type">string</p> | Filtra las facturas por proveedor (emisor).
issue_from<p class="dt-data-type">string</p> | Lista facturas recibidas hasta esta fecha.
issue_to<p class="dt-data-type">string</p> | Lista facturas a partir de esta fecha de emisión.
sequence_from<p class="dt-data-type">string</p> | Lista facturas a partir de esta secuencia.
sequence_to<p class="dt-data-type">string</p> | Lista facturas hasta esta secuencia.
supplier_points_of_sale<p class="dt-data-type">array</p> | Listado de códigos de punto de emisión separados por coma, ej: 001,004,005
select_keys<p class="dt-data-type">array</p> | Listado de nombres de atributos de la factura separados por coma que se quisieran obtener en la respuesta. Si no se especifica la respuesta incluye el objeto completo. Ej: number,issue_date,items
page_size<p class="dt-data-type">integer</p> | Define la cantidad de items por página. Por defecto retorna 30 items por página
environment<p class="dt-data-type">integer</p> | Lista facturas dependiento del ambiente


#### Respuesta

Retorna un objeto [result set](#result-set) con el listado de Facturas que
coincidan con los parámetros de filtrado enviados.

> Listado de facturas

```json
{
  "count": 584,
  "previous": null,
  "results": [{
      "customer": {
        "business": {
          "legal_name": "Benalcázar Teresa"
        },
        "tax_identification_type": "04",
        "administrative_district_level_1": null,
        "phone": "555-5555",
        "address": "",
        "tax_identification": "1910221134001",
        "properties": [],
        "legal_name": "Benalcázar Teresa",
        "locality": null,
        "country": null,
        "email": "tere@email.com",
        "sublocality": null
      },
      "issue_date": "2018-02-01T13:58:25.324730-05:00",
      "uuid": "0102201801099271255999999999010001483751993713710",
      "taxes": [{
        "taxable_amount": "0.00",
        "tax_code": 2,
        "rate": "0",
        "rate_code": "2",
        "amount": "0.00"
      }],
      "created": "2018-02-01T18:58:25.324730+00:00",
      "sequence": "148375",
      "number": "001-001-000148375",
      "payment_methods": [],
      "totals": {
        "total_tax_amount": "0.00",
        "tip_amount": "0.00",
        "total_amount": "0.00",
        "additional_discount_amount": "0.00",
        "total_discount_amount": "0.00",
        "subtotal_amount": "0.00"
      },
      "environment": "live",
      "currency": "USD",
      "authorization": {
        "date": "2018-02-01T18:58:49Z",
        "status": "AUTORIZADO",
        "number": "0102201801099271255999999999010001483751993713710"
      },
      "properties": [{
        "name": "Periodo",
        "description": "Febrero 2018"
      }],
      "payments": [],
      "items": [{
        "description": "Plan Gratuito",
        "discount": "0.00",
        "unit_price": "0.000000",
        "properties": [],
        "product_id": "6047dfaa-d657-4185-b113-0f883ec455a1",
        "sku": "FEF-001",
        "total_amount": "0.00",
        "taxes": [{
          "_id": "2",
          "amount": "0.00",
          "taxable_amount": "0.00",
          "tax_code": "2",
          "rate": "12.00",
          "rate_code": "2"
        }],
        "id": 5432039,
        "subtotal_amount": "0.00",
        "quantity": "1.000000"
      }],
      "supplier": {
        "business": {
          "legal_name": "Datil",
          "commercial_name": "Datil"
        },
        "administrative_district_level_1": "Guayas",
        "phone": "0",
        "address": "Av. Principal 234",
        "tax_identification": "0992754321001",
        "id": "98e21dbd-bcec-4e83-b9e9-d4ae12b4d777",
        "legal_name": "Datil",
        "commercial_name": "Datil",
        "locality": "Guayaquil",
        "country": "EC",
        "location": {
          "code": "001",
          "administrative_district_level_2": "Guayaquil",
          "administrative_district_level_1": "Guayas",
          "point_of_sale": {
            "code": "001",
            "id": 21
          },
          "address": "Av. Principal 234",
          "id": "5d15f357-02dc-4911-841d-e69f09cb213c"
        },
        "email": "clientes@datil.co"
      },
      "outstanding_balance": "0.00",
      "printable_version_url": "https://app.datil.co/ver/aaaaaaaa0000999111ccc333777aa53/pdf?download",
      "id": "aaaaaaaa0000999111ccc333777aa53",
      "electronic_document_url": "https://app.datil.co/ver/aaaaaaaa0000999111ccc333777aa53/xml?download"
    },
    {
      "customer": {
        "business": {
          "legal_name": "Adriana Benítez"
        },
        "tax_identification_type": "04",
        "administrative_district_level_1": null,
        "phone": "",
        "address": "",
        "tax_identification": "1701927920001",
        "properties": [],
        "legal_name": "Adriana Benítez",
        "locality": null,
        "country": null,
        "email": "adriana@hyper.com",
        "sublocality": null
      },
      "issue_date": "2018-02-01T17:17:31.257164-05:00",
      "uuid": "0102201801099275432100120010020000024971994713525",
      "taxes": [{
        "taxable_amount": "31.25",
        "tax_code": "2",
        "rate": "0",
        "rate_code": "2",
        "amount": "3.75"
      }],
      "created": "2018-02-01T22:17:31.257164+00:00",
      "dbid": 999876,
      "sequence": "2497",
      "number": "001-002-000002497",
      "payment_methods": [{
        "due_date": "2018-02-01",
        "amount": "35.00",
        "method": "60"
      }],
      "totals": {
        "total_tax_amount": "3.75",
        "tip_amount": "0.00",
        "total_amount": "35.00",
        "additional_discount_amount": "0.00",
        "total_discount_amount": "0.00",
        "subtotal_amount": "31.25"
      },
      "environment": "live",
      "currency": "USD",
      "authorization": {
        "date": "2018-02-01T22:17:54Z",
        "status": "AUTORIZADO",
        "number": "0102201801099275432100120010020000024971994713517"
      },
      "properties": [{
        "name": "Periodo",
        "description": "Anual"
      }],
      "payments": [],
      "items": [{
        "description": "Certificado de Firma Electrónica",
        "discount": "0.00",
        "unit_price": "31.250000",
        "properties": [],
        "product_id": "8e77da89-4b63-40c6-b9a5-268cb4a547f9",
        "sku": "CFE-001",
        "total_amount": "35.00",
        "taxes": [{
          "_id": "2",
          "amount": "3.75",
          "taxable_amount": "31.25",
          "tax_code": "2",
          "rate": "12.00",
          "rate_code": "2"
        }],
        "id": 23717155,
        "subtotal_amount": "31.25",
        "quantity": "1.000000"
      }],
      "supplier": {
        "business": {
          "legal_name": "Datil",
          "commercial_name": "Datil"
        },
        "administrative_district_level_1": "Guayas",
        "phone": "0",
        "address": "Av. Principal 234",
        "tax_identification": "0992754321001",
        "id": "98e21dbd-b6ec-4e83-b9e9-d4ae12b4d967",
        "legal_name": "Datil",
        "commercial_name": "Datil",
        "locality": "Guayaquil",
        "country": "EC",
        "location": {
          "code": "001",
          "administrative_district_level_2": "Guayaquil",
          "administrative_district_level_1": "Guayas",
          "point_of_sale": {
            "code": "002",
            "id": 148
          },
          "address": "Av. Principal 234",
          "id": "5d15f357-02dc-4118-841d-e69f09cb213c"
        },
        "email": "clientes@datil.co"
      },
      "outstanding_balance": "35.00",
      "printable_version_url": "https://app.datil.co/ver/088140bbd883556dabf82c38f5acf8ba/pdf?download",
      "id": "088140bbd883556dabf82c38f5acf8ba",
      "electronic_document_url": "https://app.datil.co/ver/088140bbd883556dabf82c38f5acf8ba/xml?download"
    }
  ],
  "next": "https://app.datil.co/api/v2/latest/purchases/invoices/?page=2&issue_from=2018-02-01&page_size=2&issue_to=2018-02-10"
}
```
