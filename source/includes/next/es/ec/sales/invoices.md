### Emisión de una factura

#### Operación

`POST /locations/:location-id/sales/invoices/issues`
#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://api.datil.co/sales/invoices/issues \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
      "supplier": {
        "location": {
          "code": "001",
          "point_of_sale": {
            "code": "002"
          }
        }
      },
      "sequence": 2,
      "uuid": "2003201701099999999900110011000000000022100020017",
      "issue_date": "2016-11-22 23:00:00",
      "customer": {
        "tax_identification_type": "31",
        "properties": [],
        "address": "Carrera 10 Calle 1",
        "email": "compras@datil.co",
        "phone": "57122222222222",
        "locality": "Guayaquil",
        "sublocality": "Centro",
        "tax_identification": "0924447900",
        "person": {
          "first_name": "Juan",
          "middle_name": "A.",
          "last_name": "Pérez"
        },
        "administrative_district_level_1": "Guayas",
        "country": "EC"
      },
      "taxes": [
        {
          "amount": "14.00",
          "tax_code": "2",
          "tax_rate": "14.0",
          "rate_code": "3",
          "taxable_amount": "100.00"
        }
      ],
      "totals": {
        "subtotal_amount": 100.00,
        "total_tax_amount": 14.00,
        "total_amount": 114.00,
      }
      "currency": "USD",
      "items": [
        {
          "description": "Apple",
          "properties": [{
            "name": "color",
            "description": "red"
          }],
          "unit_discount": "1.00",
          "unit_code": "units",
          "unit_price": "2.00",
          "subtotal_amount": "100.00",
          "quantity": "100"
        }
      ],
      "properties": [
         {
           "name": "Contract Number",
           "description": "420420"
         }
      ],
      "payments": [
        {
          "properties": [
            {
              "name": "account_number",
              "description": "2223XXXX23"
            },
            {
              "name": "bank",
              "description": "Banco Guayaquil"
            }
          }],
          "amount": 114.0,
          "method": "42"
        }
      ],
  }'
```

```python
import requests, json

invoice = {
      "country": "EC",
      "location_code": "001",
      "device_id": "9008edd4-cf56-4435-a387-7bf1d2eb9aef",
      "sequence": 2,
      "uuid": "12345-12345-12345-12345-12345",
      "issue_date": "2016-11-22 23:00:00",
      "customer": {
        "tax_identification_type": "31",
        "properties": [],
        "address": "Carrera 10 Calle 1",
        "email": "w@datil.co",
        "phone": "04 555-5555",
        "locality": "Bogota DC",
        "sublocality": "Centro",
        "tax_identification": "092",
        "tax_level_code": "2",
        "person": {"first_name": "Juan",
                   "middle_name": "A.",
                   "last_name": "Argüello"},
        "administrative_district_level_1": "Guayas",
        "country": "EC"
      },
      "taxes": [
        {
          "amount": 419046.82,
          "tax_code": "03",
          "tax_rate": 4.14,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        },
        {
          "amount": 1619504.64,
          "tax_code": "01",
          "tax_rate": 16.00,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        }
      ],
      "totals": {
        "subtotal_amount": 10121904.00,
        "total_tax_amount": 2038551.46,
        "total_amount": 12160455.46,
      }
      "currency": "USD",
      "items": [
        {
          "description": "Apple",
          "properties": [{
            "name": "size",
            "description": "M"
          }],
          "unit_discount": 0.00,
          "unit_code": "units",
          "unit_price": 43256.00,
          "id": "ABC",
          "subtotal_amount": 10121904.00,
          "total_amount": 1.15,
          "quantity": 234
        }
      ],
      "properties": [
         {
           "name": "Contract Number",
           "description": "420420"
         }
       ],
       "payments": [
         {
           "properties": [{
             "account_number": "2223XXXX23",
             "bank": "Bancolombia"
           }],
           "amount": 1.09,
           "method": "42"
         }
       ],
  }
headers = {
    'x-api-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
response = requests.post(
    "https://api.datil.co/sales/invoices/issue",
    headers = headers,
    data = json.dumps(invoice))
```


Para la emisión de una factura se debe enviar la información completa de la
venta. Las facturas emitidas con un API key de pruebas, serán enviadas al
ambiente de pruebas del SRI.

Parámetros | &nbsp;
---------- | -----------
supplier<p class="dt-data-param-required">requerido</p> | En este campo sólo es necesario proveer "location" con los campos "code" y "point_of_sale". Para el objeto "point_of_sale" es necesario sólo especificar "code"
sequence | Número entero positivo mayor a cero
currency<p class="dt-data-param-required">requerido</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
issue_date | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es provista, se utilizará la fecha en la que se envía la factura.
totals<p class="dt-data-param-required">requerido</p> | Totales de la factura
customer<p class="dt-data-param-required">requerido</p> | Información del comprador.
items<p class="dt-data-param-required">requerido</p> | Bienes o servicios vendidos.
uuid | La clave de acceso de la factura. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties | Información adicional adjunta al comprobante.
payments | Pagos realizados a la factura.
payment_methods | Listado de formas de pago aplicables a la factura. Si alguno de los métodos de pago tienen un "due_date" Datil entenderá esto como una factura a crédito.

#### Retorna

Retorna un objeto **[invoice](#el-objeto-invoice)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

### Consulta de una factura

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
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/invoices/<id-factura>',
    headers = cabeceras)
```

```c#
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DatilClient {
  class InvoicingServiceClient {
    static void Main(string[] args) {

      var client = new RestClient("https://link.datil.co/");
      var idFactura = "<id-factura>";
      var request = new RestRequest("invoices/" + idFactura, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<invoice-ID>` por el `id` de la factura que necesitas consultar.


#### Respuesta

> ##### Respuesta de ejemplo

```json
{
    "id": "abcf12343faad06785",
    "secuencial": "16",
    "fecha_emision": "2016-05-15",
    "version": "1.0.0",
    "clave_acceso": "1505201501099271255400110011000000000162092727615",
    "emisor": {
        "ruc": "0992712554001",
        "razon_social": "DATILMEDIA S.A.",
        "nombre_comercial": "Dátil",
        "direccion": null,
        "obligado_contabilidad": true,
        "contribuyente_especial": "",
        "establecimiento": {
            "codigo": "001",
            "direccion": "V.E. 112 Y CIRCUNVALACION NORTE",
            "punto_emision": "100"
        }
    },
    "estado": "AUTORIZADO",
    "correos_enviados": [
        {
            "fecha_envio": "2015-05-15T16:36:48.274604",
            "destinatarios": "juanantonioplaza@datilmedia.com"
        }
    ],
    "guia_remision": "",
    "moneda": "USD",
    "informacion_adicional": [],
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": "150.00",
        "descuento": "0.00",
        "propina": "0.00",
        "impuestos": [
            {
                "codigo": 2,
                "codigo_porcentaje": "2",
                "base_imponible": "150.00",
                "valor": "18.00"
            }
        ],
        "importe_total": "168.00"
    },
    "comprador": {
        "razon_social": "Carlos L. Plaza",
        "identificacion": "0900102222",
        "tipo_identificacion": 1,
        "email": "cplaza@gye593.com",
        "direccion": "Calle Uno y Calle Dos",
        "telefono": "043334445"
    },
    "envio_sri": {
        "mensajes": [],
        "estado": "RECIBIDA",
        "fecha": ""
    },
    "tipo_emision": "1",
    "items": [
        {
            "detalles_adicionales": {
                "Estadía": "2 noches",
                "Habitación": "203"
            },
            "cantidad": "1.000000",
            "codigo_principal": "HAB",
            "codigo_auxiliar": "DOB",
            "descripcion": "Habitación doble",
            "precio_unitario": "150.000000",
            "descuento": "0.00",
            "precio_total_sin_impuestos": "",
            "impuestos": [
                {
                    "tarifa": "12.00",
                    "codigo": "2",
                    "codigo_porcentaje": "2",
                    "base_imponible": "150.00",
                    "valor": "18.00"
                }
            ],
            "unidad_medida": "Kilos"
        }
    ],
    "valor_retenido_iva": 70.40,
    "valor_retenido_renta": 29.60,
    "credito": {
        "fecha_vencimiento": "2016-06-28",
        "monto": 34.21
    },
    "pagos": [
      {
        "medio": "cheque",
        "total": 4882.68,
        "propiedades": {
          "numero": "1234567890",
          "banco": "Banco Pacífico"
        }
      }
    ],
    "compensaciones": [
      {
        "codigo": 1,
        "tarifa": 2,
        "valor": 2.00
      }
    ],
    "exportacion": {
      "incoterm": {
        "termino": "CIF",
        "lugar": "Guayaquil",
        "total_sin_impuestos": "CIF"
      },
      "origen": {
        "codigo_pais":"EC",
        "puerto": "Guayaquil"
      },
      "destino": {
        "codigo_pais":"CN",
        "puerto": "China"
      },
      "codigo_pais_adquisicion": "EC",
      "totales": {
        "flete_internacional": 1000.00,
        "seguro_internacional": 200.00,
        "gastos_aduaneros": 800,
        "otros_gastos_transporte": 350.00
      }
    }
    "autorizacion": {
        "estado": "AUTORIZADO",
        "mensajes": [
            {
                "identificador": "60",
                "mensaje": "ESTE PROCESO FUE REALIZADO EN EL AMBIENTE DE PRUEBAS",
                "tipo": "INFORMATIVO",
                "informacion_adicional": ""
            }
        ],
        "numero": "1505201516323509927125540010266935227",
        "fecha": "2015-05-15T16:32:35.000380"
    }
}
```

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la factura.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf).
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales) | Listado de totales.
comprador | objeto [persona](#persona) | Información del comprador.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura.
pagos | listado de objetos tipo [pagos](#pagos) | Listado de formas de pago aplicables a la factura.
credito | Objeto de tipo [credito](#cr-dito) | Información del crédito directo otorgado al cliente.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

### Re-emisión de una factura

#### Operación

`POST /invoices/:id/reissue`

#### Requerimiento

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o
DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el `id` de la factura recibida al
momento de emitirla.

El cuerpo del requerimiento es un objeto [factura](#requerimiento) con los
datos corregidos para que pueda ser procesado y autorizado.

#### Respuesta

Retornará un error si el comprobante se encuentra autorizado.
