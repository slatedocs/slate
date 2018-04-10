## Notas de crédito

#### Acciones disponibles para Nota de crédito en venta

* [`POST /sales/credit-notes/issues`](#emite-una-nota-de-crédito)<br>
Emite una nueva Nota de crédito

* [`GET /sales/credit-notes/:id`](#consulta-una-nota-de-crédito)<br>
Obtener información de una Nota de crédito

* [`GET /sales/credit-notes`](#lista-notas-de-crédito)<br>
Obtener un listado de Notas de crédito

* [`POST /sales/credit-notes/:id/reissues`](#re-emite-un-nota-de-crédito)<br>
Re-emite un Nota de crédito existente


## Emite una Nota de crédito

### Operación

`POST /sales/credit-notes/issues`

### Requerimiento

```shell
curl -v https://api.datil.co/sales/credit-notes/issues \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "live": false,
  "properties": [
    {
      "description": "420420",
      "name": "Contract Number"
    }
  ],
  "supplier": {
    "location": {
      "point_of_sale": {
        "code": "002"
      },
      "code": "001"
    }
  },
  "sequence": 1000,
  "taxes": [
    {
      "amount": "14.00",
      "tax_code": "2",
      "rate_code": "3",
      "tax_rate": "14.0",
      "taxable_amount": "100.00"
    }
  ],
  "credit_reason": "Pedido equivocado",
  "credited_document": {
    "number": "001-007-002357641",
    "type": "01",
    "issue_date": "2017-10-26T01:10:06-05:00"
  },
  "issue_date": "2017-11-01T09:00:00-05:00",
  "customer": {
    "properties": [],
    "locality": "Guayaquil",
    "address": "Carrera 10 Calle 1",
    "email": "compras@datil.co",
    "legal_name": "Juan A. Pérez",
    "phone": "57122222222222",
    "tax_identification_type": "05",
    "sublocality": "Centro",
    "tax_identification": "0924447956",
    "country": "EC",
    "administrative_district_level_1": "Guayas"
  },
  "totals": {
    "total_tax_amount": "14.00",
    "subtotal_amount": "100.00",
    "total_discount_amount": "100.00",
    "total_amount": "114.00"
  },
  "currency": "USD",
  "items": [
    {
      "description": "Apple",
      "properties": [
        {
          "description": "red",
          "name": "color"
        }
      ],
      "unit_price": "2.00",
      "taxes": [
        {
          "amount": "14.00",
          "tax_code": "2",
          "rate_code": "3",
          "tax_rate": "14.00",
          "taxable_amount": "100.00"
        }
      ],
      "subtotal_amount": "100.00",
      "unit_code": "units",
      "unit_discount": "1.00",
      "quantity": "100"
    }
  ]
}'
```

```python
import requests, json

credit_note = {
    "live": False,
    "properties": [
        {
            "description": "420420",
            "name": "Contract Number"
        }
    ],
    "supplier": {
        "location": {
            "point_of_sale": {
                "code": "002"
            },
            "code": "001"
        }
    },
    "sequence": 1000,
    "taxes": [
        {
            "amount": "14.00",
            "tax_code": "2",
            "rate_code": "3",
            "tax_rate": "14.0",
            "taxable_amount": "100.00"
        }
    ],
    "issue_date": "2017-11-01T09:00:00-05:00",
    "credit_reason": "Pedido equivocado",
    "credited_document": {
        "number": "001-007-002357641",
        "type": "01",
        "issue_date": "2017-10-26T01:10:06-05:00"
    },
    "customer": {
        "properties": [

        ],
        "locality": "Guayaquil",
        "address": "Carrera 10 Calle 1",
        "email": "compras@datil.co",
        "legal_name": "Juan A. Pérez",
        "phone": "57122222222222",
        "tax_identification_type": "05",
        "sublocality": "Centro",
        "tax_identification": "0924447956",
        "country": "EC",
        "administrative_district_level_1": "Guayas"
    },
    "totals": {
        "total_tax_amount": "14.00",
        "subtotal_amount": "100.00",
        "total_discount_amount": "100.00",
        "total_amount": "114.00"
    },
    "currency": "USD",
    "items": [
        {
            "description": "Apple",
            "properties": [
                {
                    "description": "red",
                    "name": "color"
                }
            ],
            "unit_price": "2.00",
            "taxes": [
                {
                    "amount": "14.00",
                    "tax_code": "2",
                    "rate_code": "3",
                    "tax_rate": "14.00",
                    "taxable_amount": "100.00"
                }
            ],
            "subtotal_amount": "100.00",
            "unit_code": "units",
            "unit_discount": "1.00",
            "quantity": "100"
        }
    ]
}
headers = {
    'x-api-key': '<API-key>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
response = requests.post(
    "https://api.datil.co/sales/credit-notes/issues",
    headers = headers,
    data = json.dumps(credit-note))
```


Para la emisión de una nota de crédito se debe enviar la información completa de la
venta. Las notas de crédito emitidas con un API key de pruebas, serán enviadas al
ambiente de pruebas del SRI.

Parámetros | &nbsp;
---------- | -----------
supplier<p class="dt-data-param-required">requerido</p> | Información del [emisor](#issuer) .En este campo sólo es necesario proveer "location" con los campos "code" y "point_of_sale". Para el objeto "point_of_sale" es necesario sólo especificar "code"
sequence | Número entero positivo mayor a cero. Si no envías esta información se utilizará el siguiente número de nota de crédito disponible.
credit_reason<p class="dt-data-param-required">requerido</p> | Razón por la cual se emite la nota de crédito.
credited_document<p class="dt-data-param-required">requerido</p> | Documento al que afecta esta nota de crédito. Ver [documento relacionado](#documento-relacionado)
currency<p class="dt-data-param-required">requerido</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
issue_date | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es provista, se utilizará la fecha en la que se envía la nota de crédito.
totals<p class="dt-data-param-required">requerido</p> | Totales de la nota de crédito. Ver [objeto totales](#credit-note-totals)
customer<p class="dt-data-param-required">requerido</p> | Información del [comprador](#contacto).
items<p class="dt-data-param-required">requerido</p> | Bienes o servicios vendidos. Lista de [items](#credit-note-item)
uuid | La clave de acceso de la nota de crédito. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties | Información adicional adjunta al comprobante. Listado de objetos tipo [property](#property)


### Respuesta

Retorna un objeto **[credit-note](#el-objeto-credit-note)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la nota de crédito. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

## Consulta una Nota de crédito

Consulta una nota de crédito para obtener toda la información del comprobante,
incluyendo el estado de autorización del mismo.
El atributo `status` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle el estado del
[proceso de emisión](#proceso-de-emisión), se debe examinar el atributos
`authorization` de la nota de crédito.

### Operación

`GET /sales/credit-notes/:credit-note-id`

### Requerimiento

```shell
curl -v https://api.datil.co/sales/credit-notes/<credit-note-id> \
-H "Content-Type: application/json" \
-H "X-Api-Key: <clave-del-api>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://api.datil.co/sales/credit-notes/<id-nota-crédito>',
    headers = cabeceras)
```

Reemplaza en la ruta `<credit-note-ID>` por el `id` de la nota de crédito que
necesitas consultar.


### Respuesta

> Respuesta de ejemplo

```json
{
  "id": "6463427e69b546afb77a75973cc74ce7",
  "supplier": {
    "location": {
      "code": "001",
      "point_of_sale": {
        "code": "002"
      }
    }
  },
  "taxes": [{
    "amount": "3.64",
    "tax_code": "2",
    "rate": null,
    "rate_code": "2",
    "taxable_amount": "30.36"
  }],
  "number": "001-002-000438970",
  "authorization": {
    "number": "2308201701099271255400110010020004389701994000000",
    "date": "2017-08-23T10:09:15-05:00",
    "status": "AUTORIZADO",
    "messages": []
  },
  "credit_reason": "Pedido equivocado",
  "credited_document": {
    "number": "001-007-002357641",
    "type": "01",
    "issue_date": "2017-10-26T01:10:06-05:00"
  },
  "issue_date": "2017-08-10T18:09:00-05:00",
  "customer": {
    "properties": [],
    "locality": "Guayaquil",
    "address": "Av. Primera 123",
    "email": "clientes@datil.co",
    "legal_name": "José Pérez",
    "phone": "0990289327",
    "tax_identification_type": "05",
    "sublocality": "",
    "tax_identification": "0914617584",
    "country": "EC",
    "administrative_district_level_1": ""
  },
  "totals": {
    "subtotal_amount": "30.36",
    "total_discount_amount": "0.00",
    "total_tax_amount": "3.64",
    "total_amount": "34.00"
  },
  "currency": "USD",
  "sequence": 438970,
  "uuid": "2308201701099271255400110010020004389701994000000",
  "items": [{
    "description": "Plan Pro",
    "properties": [],
    "unit_discount": "0.00",
    "unit_of_measurement": "",
    "unit_price": "30.357000",
    "subtotal_amount": "30.36",
    "quantity": "1.000000",
    "taxes": [{
      "amount": "3.64",
      "tax_code": "2",
      "rate": "12.00",
      "rate_code": "2",
      "taxable_amount": "30.36"
    }]
  }],
  "properties": [{
      "name": "Servicio",
      "description": "Dátil Facturación Electrónica"
    },
    {
      "name": "Incluye",
      "description": "Notas de crédito, Retenciones, Notas de crédito/Débito, Guías de Remisión"
    }
  ]
}
```

## Re-emite una Nota de crédito

### Operación

`POST /sales/credit-notes/:id/reissues`

### Requerimiento

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS.

En la URL de esta opción se debe incluir el `id` de la nota de crédito recibida al
momento de emitirla.

El cuerpo del requerimiento es un objeto [nota de crédito](#emite-una-nota de crédito) con los
datos corregidos para que pueda ser procesado y autorizado.

### Respuesta

Retornará un error si el comprobante se encuentra autorizado.


## Lista Notas de crédito

```shell
curl -v https://api.datil.co/sales/credit-notes?customer_tax_identification=0900800712001 \
-H "X-Api-Key: <API-key>" \
-H "Accept: application/json"
```

```python
import requests
headers = {
  'x-api-key': '<API-key>',
  'accept': 'application/json'
}
datil_api_url = "https://api.datil.co/sales/credit-notes?customer_tax_identification=0900800712001"
credit-notes = requests.get(datil_api_url, headers=headers).json()
```

Obtén el listado completo de Notas de crédito emitidas, o filtra los resultados
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
        "legal_name": "Benalcázar Teresa",
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
        "legal_name": "Datil",
        "commercial_name": "Datil",
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
        "legal_name": "Adriana Benítez",
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
        "legal_name": "Datil",
        "commercial_name": "Datil",
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
  "next": "https://app.datil.co/api/v2/latest/sales/credit-notes/?page=2&issue_from=2018-02-01&page_size=2&issue_to=2018-02-10"
}
```
