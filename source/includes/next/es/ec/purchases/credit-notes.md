<h2 id="notas-credito-compra">Notas de crédito</h2>

#### Acciones disponibles para Nota de Crédito en compra

* [`GET /purchases/credit-notes`](#lista-notas-de-credito-compra)<br>
Obtener un listado de Notas de Crédito

<h2 id="lista-notas-credito-compra">Lista Notas de crédito</h2>

```shell
curl -v https://api.datil.co/purchases/credit-notes?customer_tax_identification=0900800712001 \
-H "X-Api-Key: <API-key>" \
-H "Accept: application/json"
```

```python
import requests
headers = {
  'x-api-key': '<API-key>',
  'accept': 'application/json'
}
datil_api_url = "https://api.datil.co/purchases/credit-notes?customer_tax_identification=0900800712001"
credit-notes = requests.get(datil_api_url, headers=headers).json()
```

Obtén el listado completo de Notas de crédito recibidas, o filtra los resultados
por cualquiera de estos parámetros.

Parámetros | &nbsp;
---------- | -------
customer_tax_identification<p class="dt-data-type">string</p> | Filtra las notas de crédito por comprador.
issue_from<p class="dt-data-type">string</p> | Lista notas de crédito emitidas hasta esta fecha.
issue_to<p class="dt-data-type">string</p> | Lista notas de crédito a partir de esta fecha de emisión.
sequence_from<p class="dt-data-type">string</p> | Lista notas de crédito a partir de esta secuencia.
sequence_to<p class="dt-data-type">string</p> | Lista notas de crédito hasta esta secuencia.
supplier_points_of_sale<p class="dt-data-type">array</p> | Listado de códigos de punto de emisión separados por coma, ej: 001,004,005
select_keys<p class="dt-data-type">array</p> | Listado de nombres de atributos de la nota de crédito separados por coma que se quisieran obtener en la respuesta. Si no se especifica la respuesta incluye el objeto completo. Ej: number,issue_date,items
page_size<p class="dt-data-type">integer</p> | Define la cantidad de items por página. Por defecto retorna 30 items por página


#### Respuesta

Retorna un objeto [result set](#result-set) con el listado de Notas de crédito que
coincidan con los parámetros de filtrado enviados.

> Listado de notas de crédito

```json
{
  "count": 584,
  "previous": null,
  "results": [{
      "customer": {
        "tax_identification_type": "04",
        "administrative_district_level_1": "Guayas",
        "phone": "555-5555",
        "address": "Calle Dátiles",
        "tax_identification": "1701927920001",
        "properties": [],
        "legal_name": "Datil",
        "locality": "Guayaquil",
        "country": "EC",
        "email": "clientes@datil.co",
        "sublocality": "Urdesa"
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
      "items": [{
        "description": "Asesoría",
        "discount": "0.00",
        "quantity": "1.000000",
        "unit_price": "100.000000",
        "properties": [],
        "product_id": "6047dfaa-d657-4185-b113-0f883ec455a1",
        "sku": "TNT-001",
        "taxes": [{
          "amount": "12.00",
          "taxable_amount": "100.00",
          "tax_code": "2",
          "rate": "12.00",
          "rate_code": "2"
        }],
        "subtotal_amount": "100.00",
        "total_amount": "112.00",
      }],
      "supplier": {
        "tax_identification_type": "04",
        "legal_name": "Benalcázar Teresa",
        "phone": "555-5555",
        "tax_identification": "1910221134001",
        "properties": [],
        "email": "tere@email.com",
        "sublocality": null,
        "commercial_name": "Benalcázar Teresa",
        "administrative_district_level_1": "Pichincha",
        "phone": "0",
        "address": "Av. Principal 234",
        "id": "98e21dbd-bcec-4e83-b9e9-d4ae12b4d777",
        "locality": "Quito",
        "country": "EC",
        "location": {
          "code": "001",
          "administrative_district_level_2": "Quito",
          "administrative_district_level_1": "Pichincha",
          "point_of_sale": {
            "code": "001",
            "id": 21
          },
          "address": "Av. Principal 234",
          "id": "5d15f357-02dc-4911-841d-e69f09cb213c"
        },
      },
      "printable_version_url": "https://app.datil.co/ver/aaaaaaaa0000999111ccc333777aa53/pdf?download",
      "id": "aaaaaaaa0000999111ccc333777aa53",
      "electronic_document_url": "https://app.datil.co/ver/aaaaaaaa0000999111ccc333777aa53/xml?download"
    },
    {
      "customer": {
        "tax_identification_type": "04",
        "administrative_district_level_1": "Guayas",
        "phone": "555-5555",
        "address": "Calle Dátiles",
        "tax_identification": "1701927920001",
        "properties": [],
        "legal_name": "Datil",
        "locality": "Guayaquil",
        "country": "EC",
        "email": "clientes@datil.co",
        "sublocality": "Urdesa"
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
      "items": [{
        "description": "Dinamita",
        "discount": "0.00",
        "quantity": "5.000000",
        "unit_price": "10.000000",
        "properties": [],
        "product_id": "6047dfaa-d657-4185-b113-0f883ec455a1",
        "sku": "TNT-001",
        "taxes": [{
          "amount": "6.00",
          "taxable_amount": "50.00",
          "tax_code": "2",
          "rate": "12.00",
          "rate_code": "2"
        }],
        "subtotal_amount": "50.00",
        "total_amount": "56.00",
      }],
      "supplier": {
        "tax_identification_type": "04",
        "legal_name": "Acmere S.A.",
        "commercial_name": "Acme Inc.",
        "phone": "555-5555",
        "tax_identification": "0923948576001",
        "properties": [],
        "email": "tere@email.com",
        "sublocality": null,
        "administrative_district_level_1": "Guayas",
        "phone": "0",
        "address": "Av. Principal 234",
        "id": "98e21dbd-bcec-4e83-b9e9-d4ae12b4d777",
        "locality": "Samborondón",
        "country": "EC",
        "location": {
          "code": "001",
          "administrative_district_level_2": "Samborondón",
          "administrative_district_level_1": "Guayas",
          "point_of_sale": {
            "code": "001",
            "id": 21
          },
          "address": "Av. Principal 234",
          "id": "5d15f357-02dc-4911-841d-e69f09cb213c"
        },
      },
      "printable_version_url": "https://app.datil.co/ver/088140bbd883556dabf82c38f5acf8ba/pdf?download",
      "id": "088140bbd883556dabf82c38f5acf8ba",
      "electronic_document_url": "https://app.datil.co/ver/088140bbd883556dabf82c38f5acf8ba/xml?download"
    }
  ],
  "next": "https://app.datil.co/api/v2/latest/purchases/credit-notes/?page=2&issue_from=2018-02-01&page_size=2&issue_to=2018-02-10"
}
```
