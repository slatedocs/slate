## Facturas

### Emite una factura

#### Operación

`POST /sales/invoices/issues`

#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/sales/invoices/issues \
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
  "payments": [
    {
      "properties": [
        {
          "description": "2223XXXX23",
          "name": "account_number"
        },
        {
          "description": "Banco Huancavilva",
          "name": "bank"
        }
      ],
      "amount": "114.00",
      "method": "efectivo"
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
  "customer": {
    "properties": [],
    "locality": "Guayaquil",
    "address": "Carrera 10 Calle 1",
    "email": "compras@datil.co",
    "person": {
      "first_name": "Juan",
      "middle_name": "A.",
      "last_name": "Pérez"
    },
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

invoice = {
    "live": False,
    "properties": [
        {
            "description": "420420",
            "name": "Contract Number"
        }
    ],
    "payments": [
        {
            "properties": [
                {
                    "description": "2223XXXX23",
                    "name": "account_number"
                },
                {
                    "description": "Banco Huancavilva",
                    "name": "bank"
                }
            ],
            "amount": "114.00",
            "method": "efectivo"
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
    "customer": {
        "properties": [

        ],
        "locality": "Guayaquil",
        "address": "Carrera 10 Calle 1",
        "email": "compras@datil.co",
        "person": {
            "first_name": "Juan",
            "middle_name": "A.",
            "last_name": "Pérez"
        },
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
    "https://api.datil.co/sales/invoices/issues",
    headers = headers,
    data = json.dumps(invoice))
```


Para la emisión de una factura se debe enviar la información completa de la
venta. Las facturas emitidas con un API key de pruebas, serán enviadas al
ambiente de pruebas del SRI.

Parámetros | &nbsp;
---------- | -----------
supplier<p class="dt-data-param-required">requerido</p> | En este campo sólo es necesario proveer "location" con los campos "code" y "point_of_sale". Para el objeto "point_of_sale" es necesario sólo especificar "code"
sequence | Número entero positivo mayor a cero. Si no envías esta información se utilizará el siguiente número de factura disponible.
currency<p class="dt-data-param-required">requerido</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
issue_date | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es provista, se utilizará la fecha en la que se envía la factura.
totals<p class="dt-data-param-required">requerido</p> | Totales de la factura. Ver [objeto totales](#invoice-totals)
customer<p class="dt-data-param-required">requerido</p> | Información del [comprador](#contacto).
items<p class="dt-data-param-required">requerido</p> | Bienes o servicios vendidos. Lista de [items](#invoice-item)
uuid | La clave de acceso de la factura. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties | Información adicional adjunta al comprobante. Listado de objetos tipo [property](#property)
payments | Pagos realizados a la factura. Listado de objetos tipo [payment](#payment)
payment_methods | Listado de formas de pago aplicables a la factura. Si alguno de los métodos de pago tienen un "due_date" Datil entenderá esto como una factura a crédito. Listado de objectos tipo [payment_method](#payment-method)

#### Retorna

Retorna un objeto **[invoice](#el-objeto-invoice)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

### Consulta una factura

Consulta una factura para obtener toda la información del comprobante,
incluyendo el estado de autorización del mismo.
El atributo `status` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle el estado del [proceso de emisión](#proceso-de-emisión),
se debe examinar el atributos `authorization` de la factura.

#### Operación

`GET /sales/invoices/:invoice-id`

#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/<invoice-id> \
-H "Content-Type: application/json" \
-H "X-Api-Key: <clave-del-api>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://api.datil.co/sales/invoices/<id-factura>',
    headers = cabeceras)
```

Reemplaza en la ruta `<invoice-ID>` por el `id` de la factura que necesitas consultar.


#### Respuesta

> ##### Respuesta de ejemplo

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
  "issue_date": "2017-08-23",
  "customer": {
    "properties": [],
    "locality": "Guayaquil",
    "address": "Av. Primera 123",
    "email": "clientes@datil.co",
    "person": {
      "first_name": "José",
      "middle_name": "",
      "last_name": "Pérez"
    },
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
      "description": "Facturas, Retenciones, Notas de Crédito/Débito, Guías de Remisión"
    }
  ],
  "payments": []
}
```

### Re-emite una factura

#### Operación

`POST /sales/invoices/:id/re-issues`

#### Requerimiento

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS.

En la URL de esta opción se debe incluir el `id` de la factura recibida al
momento de emitirla.

El cuerpo del requerimiento es un objeto [factura](#emite-una-factura) con los
datos corregidos para que pueda ser procesado y autorizado.

#### Respuesta

Retornará un error si el comprobante se encuentra autorizado.


### Registra Pagos

#### Operación

`POST /sales/invoices/:id/payments`

#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/sales/invoices/6463427e69b546afb77a75973cc74ce7/payments \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
      "payments": [
        {
          "amount": 114.0,
          "method": "cash",
          "date": "2017-05-31T13:50:07-05:00",
          "properties": [
            {
              "name": "account_number",
              "description": "2223XXXX23"
            },
            {
              "name": "bank",
              "description": "Banco Huancavilva"
            }
          }]
        }
      ]
    }'
```

```python
import requests, json

payments = {
  "payments": [{
    "amount": "114.0",
    "method": "cash",
    "date": "2017-05-31T13:50:07-05:00",
    "properties": [{
        "name": "account_number",
        "description": "2223XXXX23"
      },
      {
        "name": "bank",
        "description": "Banco Huancavilva"
      }
    ]
  }]
}
headers = {
    'x-api-key': '<clave-del-api>',
    'content-type': 'application/json'}
response = requests.post(
    "https://api.datil.co/sales/invoices/6463427e69b546afb77a75973cc74ce7/payments",
    headers = headers,
    data = json.dumps(payments))
```

Puedes registrar uno o más pagos.

Parámetros | &nbsp;
---------- | -----------
payments<p class="dt-data-param-required">requerido</p> | Listado de [pagos](#payment) a registrar


Parámetros | &nbsp;
---------- | -----------
method<p class="dt-data-param-required">requerido</p> | Código que representa al método.
amount<p class="dt-data-param-required">requerido</p> | Monto a pagar.
date | Fecha en la que se realizó el pago en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es provista, se utilizará la fecha actual.
properties | Listado de propiedades adicionales
