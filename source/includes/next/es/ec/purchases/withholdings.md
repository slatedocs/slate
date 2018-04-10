<h2 id="retenciones-compra">Retenciones</h2>

#### Acciones disponibles para Retenciones en compra

* [`POST /purchases/withholdings/issues`](#emite-una-retención)<br>
Emite una nueva Retención

* [`GET /purchases/withholdings/:id`](#consulta-una-retención)<br>
Obtener información de una Retención

* [`GET /purchases/withholdings`](#lista-retenciones)<br>
Obtener un listado de Retenciones

* [`POST /purchases/withholdings/:id/reissues`](#re-emite-un-retención)<br>
Re-emite un Retención existente


## Emite una retención

### Operación

`POST /purchases/withholdings/issues`

### Requerimiento

```shell
curl -v https://api.datil.co/purchases/withholdings/issues \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "live": true,
  "currency": "USD",
  "fiscal_period": {
    "month": 1,
    "year": 2018
  },
  "recipient": {
    "address": "Av. Principal 234",
    "legal_name": "Acme S.A.",
    "commercial_name": "Acme S.A.",
    "tax_identification": "0910872345001",
    "tax_identification_type": "04",
    "email": "email@datil.co"
  },
  "issue_date": "2018-01-04T00:00:00-05:00",
  "items": [{
    "amount": "42.26",
    "tax_code": "1",
    "rate": "0",
    "rate_code": "312",
    "taxable_amount": "4226.40",
    "affected_document": {
      "number": "001-002-123412349",
      "issue_date": "2017-12-31",
      "type": "01"
    }
  }],
  "properties": [],
  "sequence": 9397,
  "issuer": {
    "location": {
      "code": "001",
      "point_of_sale": {
        "code": "002"
      }
    }
  }
}'
```

```python
import requests, json

withholding = {
  'live': true,
  'currency': 'USD',
  'fiscal_period': {
    'month': 1,
    'year': 2018
  },
  'recipient': {
    'address': 'Av. Principal 234',
    'legal_name': 'Acme S.A.',
    'commercial_name': 'Acme S.A.',
    'tax_identification': '0910872345001',
    'tax_identification_type': '04',
    'email': 'email@datil.co'
  },
  'issue_date': '2018-01-04T00:00:00-05:00',
  'items': [{
    'amount': '42.26',
    'tax_code': '1',
    'rate': '0',
    'rate_code': '312',
    'taxable_amount': '4226.40',
    'affected_document': {
      'number': '001-002-123412349',
      'issue_date': '2017-12-31',
      'type': '01'
    }
  }],
  'properties': [],
  'sequence': 9397,
  'issuer': {
    'location': {
      'code': '001',
      'point_of_sale': {
        'code': '002'
      }
    }
  }
}
headers = {
    'x-api-key': '<API-key>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
response = requests.post(
    "https://api.datil.co/purchases/withholdings/issues",
    headers = headers,
    data = json.dumps(withholding))
```


Para la emisión de una retención se debe enviar la información completa de la
venta. Las retenciones emitidas con un API key de pruebas, serán enviadas al
ambiente de pruebas del SRI.

Parámetros | &nbsp;
---------- | -----------
issuer<p class="dt-data-param-required">requerido</p> | En este campo sólo es necesario proveer "location" con los campos "code" y "point_of_sale". Para el objeto "point_of_sale" es necesario sólo especificar "code"
sequence | Número entero positivo mayor a cero. Si no envías esta información se utilizará el siguiente número de retención disponible.
currency<p class="dt-data-param-required">requerido</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
issue_date | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es provista, se utilizará la fecha en la que se envía la retención.
recipient<p class="dt-data-param-required">requerido</p> | Información del [receptor](#contacto).
items<p class="dt-data-param-required">requerido</p> | Bienes o servicios vendidos. Lista de [items](#withholding-item)
uuid | La clave de acceso de la retención. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties | Información adicional adjunta al comprobante. Listado de objetos tipo [property](#property)

### Respuesta

Retorna un objeto **[withholding](#el-objeto-withholding)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la retención. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

## Consulta una retención

Consulta una retención para obtener toda la información del comprobante,
incluyendo el estado de autorización del mismo.
El atributo `status` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle el estado del [proceso de emisión](#proceso-de-emisión),
se debe examinar el atributos `authorization` de la retención.

### Operación

`GET /purchases/withholdings/:withholding-id`

### Requerimiento

```shell
curl -v https://api.datil.co/withholdings/<withholding-id> \
-H "Accept: application/json" \
-H "X-Api-Key: <clave-del-api>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://api.datil.co/purchases/withholdings/<id-retención>',
    headers = cabeceras)
```

Reemplaza en la ruta `<withholding-ID>` por el `id` de la retención que necesitas consultar.


### Respuesta

> Respuesta de ejemplo

```json
{
  "live": true,
  "currency": "USD",
  "fiscal_period": {
    "month": 1,
    "year": 2018
  },
  "recipient": {
    "address": "Av. Principal 234",
    "legal_name": "Acme S.A.",
    "commercial_name": "Acme S.A.",
    "tax_identification": "0910872345001",
    "tax_identification_type": "04",
    "email": "email@datil.co"
  },
  "issue_date": "2018-01-04T00:00:00-05:00",
  "items": [{
    "amount": "42.26",
    "tax_code": "1",
    "rate": "0",
    "rate_code": "312",
    "taxable_amount": "4226.40",
    "affected_document": {
      "number": "001-002-123412349",
      "issue_date": "2017-12-31",
      "type": "01"
    }
  }],
  "properties": [],
  "sequence": 9397,
  "issuer": {
    "location": {
      "code": "001",
      "point_of_sale": {
        "code": "002"
      }
    }
  }
}
```

## Re-emite una retención

### Operación

`POST /purchases/withholdings/:id/reissues`

### Requerimiento

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS.

En la URL de esta opción se debe incluir el `id` de la retención recibida al
momento de emitirla.

El cuerpo del requerimiento es un objeto [retención](#emite-una-retención) con los
datos corregidos para que pueda ser procesado y autorizado.

### Respuesta

Retornará un error si el comprobante se encuentra autorizado.


## Lista Retenciones

```shell
curl -v https://api.datil.co/purchases/withholdings?customer_tax_identification=0900800712001 \
-H "X-Api-Key: <API-key>" \
-H "Accept: application/json"
```

```python
import requests
headers = {
  'x-api-key': '<API-key>',
  'accept': 'application/json'
}
datil_api_url = "https://api.datil.co/purchases/withholdings?customer_tax_identification=0900800712001"
withholdings = requests.get(datil_api_url, headers=headers).json()
```

Obtén el listado completo de Retenciones emitidas, o filtra los resultados
por cualquiera de estos parámetros.

Parámetros | &nbsp;
---------- | -------
customer_tax_identification<p class="dt-data-type">string</p> | Filtra las retenciones por comprador.
issue_from<p class="dt-data-type">string</p> | Lista retenciones emitidas hasta esta fecha.
issue_to<p class="dt-data-type">string</p> | Lista retenciones a partir de esta fecha de emisión.
sequence_from<p class="dt-data-type">string</p> | Lista retenciones a partir de esta secuencia.
sequence_to<p class="dt-data-type">string</p> | Lista retenciones hasta esta secuencia.
issuer_points_of_sale<p class="dt-data-type">array</p> | Listado de códigos de punto de emisión separados por coma, ej: 001,004,005
select_keys<p class="dt-data-type">array</p> | Listado de nombres de atributos de la retención separados por coma que se quisieran obtener en la respuesta. Si no se especifica la respuesta incluye el objeto completo. Ej: number,issue_date,items
page_size<p class="dt-data-type">integer</p> | Define la cantidad de items por página. Por defecto retorna 30 items por página


#### Respuesta

Retorna un objeto [result set](#result-set) con el listado de Retenciones que
coincidan con los parámetros de filtrado enviados.

> Listado de retenciones

```json
{
  "count": 10,
  "previous": null,
  "results": [
    {
      "live": true,
      "currency": "USD",
      "fiscal_period": {
        "month": 1,
        "year": 2018
      },
      "recipient": {
        "address": "Av. Principal 234",
        "legal_name": "Acme S.A.",
        "commercial_name": "Acme S.A.",
        "tax_identification": "0910872345001",
        "tax_identification_type": "04",
        "email": "email@datil.co"
      },
      "issue_date": "2018-01-04T00:00:00-05:00",
      "items": [{
        "amount": "42.26",
        "tax_code": "1",
        "rate": "0",
        "rate_code": "312",
        "taxable_amount": "4226.40",
        "affected_document": {
          "number": "001-002-123412349",
          "issue_date": "2017-12-31",
          "type": "01"
        }
      }],
      "properties": [],
      "sequence": 9397,
      "issuer": {
        "location": {
          "code": "001",
          "point_of_sale": {
            "code": "002"
          }
        }
      }
    }
  ],
  "next": "https://app.datil.co/api/v2/latest/purchases/withholdings/?page=2&issue_from=2018-02-01&page_size=2&issue_to=2018-02-10page_size=1"
}
```
