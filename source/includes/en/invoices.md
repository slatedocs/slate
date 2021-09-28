# Invoices

## Issuing an invoice

### Operation

`POST /invoices/issue`

### Request

> #### Example request

```shell
curl -v https://link.datil.co/invoices/issue \
-H "Content-Type: application/json" \
-H "X-Key: <your-api-key>" \
-H "X-Password: <your-certificate-password>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2015-02-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad":true,
    "contribuyente_especial":"12345",
    "nombre_comercial":"XYZ Corp",
    "razon_social":"XYZ Corporación S.A.",
    "direccion":"Av. Primera 234 y calle 5ta",
    "establecimiento":{
      "punto_emision":"002",
      "codigo":"001",
      "direccion":"Av. Primera 234 y calle 5ta"
    }
  },
  "moneda":"USD",
  "informacion_adicional":{
"Tiempo de entrega":"5 días"
  },
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
      {
        "base_imponible":0.0,
        "valor":0.0,
        "codigo":"2",
        "codigo_porcentaje":"0"
      },
      {
        "base_imponible":4359.54,
        "valor":523.14,
        "codigo":"2",
        "codigo_porcentaje":"2"
      }
    ],
    "importe_total":4882.68,
    "propina":0.0,
    "descuento":0.0
  },
  "comprador":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  },
  "items":[
    {
      "cantidad":622.0,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos": [
        {
          "base_imponible":4359.54,
          "valor":523.14,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales": {
        "Peso":"5000.0000"
      },
      "descuento": 0.0
    }
  ],
  "pagos": [
    {
      "medio": "efectivo",
      "total": 4882.68,
      "propiedades": {
        "plazo": 0,
        "unidad_tiempo": "dias"
      }
    }
  ]
}'
```

```python
import requests, json

factura = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2015-02-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad":true,
    "contribuyente_especial":"12345",
    "nombre_comercial":"XYZ Corp",
    "razon_social":"XYZ Corporación S.A.",
    "direccion":"Av. Primera 234 y calle 5ta",
    "establecimiento":{
      "punto_emision":"002",
      "codigo":"001",
      "direccion":"Av. Primera 234 y calle 5ta"
    }
  },
  "moneda":"USD",
  "informacion_adicional":{
    "Tiempo de entrega":"5 días"
  },
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
      {
        "base_imponible":0.0,
        "valor":0.0,
        "codigo":"2",
        "codigo_porcentaje":"0"
      },
      {
        "base_imponible":4359.54,
        "valor":523.14,
        "codigo":"2",
        "codigo_porcentaje":"2"
      }
    ],
    "importe_total":4882.68,
    "propina":0.0,
    "descuento":0.0
  },
  "comprador":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  },
  "items":[
    {
      "cantidad":622.0,
      "codigo_principal":"ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos": [
        {
          "base_imponible":4359.54,
          "valor":523.14,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales": {
        "Peso":"5000.0000"
      },
      "descuento": 0.0
    }
  ],
  "pagos": [
    {
      "medio": "efectivo",
      "total": 4882.68,
      "propiedades": {
        "plazo": 0,
        "unidad_tiempo": "dias"
      }
    }
  ]
}
cabeceras = {
    'x-key': '<your-api-key>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/issue",
    headers = cabeceras,
    data = json.dumps(factura))
```

```csharp
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DatilClient {
  class InvoicingServiceClient {
    static void Main(string[] args) {

      // Este ejemplo utiliza RestSharp
      // Para instalar anda al menú: tools > Library Package Manager > Package Manager Console
      // copia y pega y presiona enter: Install-Package RestSharp

      var client = new RestClient("https://link.datil.co/");
      var request = new RestRequest("invoices/issue", Method.POST);
      request.AddHeader("X-Key", "<your-api-key>");
      request.AddHeader("X-Password", "<your-certificate-password>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":148,
        ""fecha_emision"":""2015-02-28T11:28:56.782Z"",
        ""emisor"":{
          ""ruc"":""0910000000001"",
          ""obligado_contabilidad"":true,
          ""contribuyente_especial"":""12345"",
          ""nombre_comercial"":""XYZ Corp"",
          ""razon_social"":""XYZ Corporación S.A."",
          ""direccion"":""Av. Primera 234 y calle 5ta"",
          ""establecimiento"":{
            ""punto_emision"":""002"",
            ""codigo"":""001"",
            ""direccion"":""Av. Primera 234 y calle 5ta""
          }
        },
        ""moneda"":""USD"",
        ""informacion_adicional"":{
          ""Tiempo de entrega"":""5 días""
        },
        ""totales"":{
          ""total_sin_impuestos"":4359.54,
          ""impuestos"":[
            {
              ""base_imponible"":0.0,
              ""valor"":0.0,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""0""
            },
            {
              ""base_imponible"":4359.54,
              ""valor"":523.14,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""2""
            }
          ],
          ""importe_total"":4882.68,
          ""propina"":0.0,
          ""descuento"":0.0
        },
        ""comprador"":{
          ""email"":""juan.perez@xyz.com"",
          ""identificacion"":""0987654321"",
          ""tipo_identificacion"":""05"",
          ""razon_social"":""Juan Pérez"",
          ""direccion"":""Calle única Numero 987"",
          ""telefono"":""046029400""
        },
        ""items"":[
          {
            ""cantidad"":622.0,
            ""codigo_principal"":""ZNC"",
            ""codigo_auxiliar"": ""050"",
            ""precio_unitario"": 7.01,
            ""descripcion"": ""Zanahoria granel  50 Kg."",
            ""precio_total_sin_impuestos"": 4360.22,
            ""impuestos"": [
              {
                ""base_imponible"":4359.54,
                ""valor"":523.14,
                ""tarifa"":12.0,
                ""codigo"":""2"",
                ""codigo_porcentaje"":""2""
              }
            ],
            ""detalles_adicionales"": {
              ""Peso"":""5000.0000""
            },
            ""descuento"": 0.0
          }
        ],
      ""pagos"": [
        {
          ""medio"": ""efectivo"",
          ""total"": 4882.68,
          ""propiedades"": {
            ""plazo"": 0,
            ""unidad_tiempo"": ""dias""
          }
        }
      ]
      }");
      request.AddParameter("application/json", body, ParameterType.RequestBody);
      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
      Console.ReadLine();
    }
  }
}
```

An invoice requires the following information:

Parameter | Type | Description
--------- | ------- | -----------
secuencial | string | Invoice sequence number.  __Required__
emisor | [issuer](#issuer) | Information about the issuer. __Required__
moneda | string | [ISO](https://en.wikipedia.org/wiki/ISO_4217) code for the currency. __Required__
fecha_emision | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
guia_remision | string | Waybill number associated with the invoice in the following format: 001-002-000000003 ([0-9]{3}-[0-9]{3}-[0-9]{9})
ambiente | integer | Execution environment. Test: `1`.<br>Production `2`.<br>__Required__
totales | list of [invoice-total](#invoice-totals) objects | List of totals. __Required__
comprador | [recipient](#recipient) object | Information about the recipient. __Required__
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>__Required__
items | list of [line-item](#line-item) objects | Line items. __Required__
version | string | Version of the country e-billing format. Defaults to the latest version.
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
informacion_adicional | object | Additional information about the invoice in dictionary form. Example:<br>` {"plan": "pro", "months": "1"}`
retenciones | list of [invoice-withholding](#invoice-withholdings) objects | Withholdings to be included in the invoice. Specific case for traders or distributors of petroleum derivates and for presumptive VAT Retention for publishers, distributors and newsvendors involved in the marketing of newspapers and / or magazines.
pagos | List of [payments](#payments) objects | List of forms of payment applicable to the invoice. __Required__
credito | Object of type [credito](#cr-dito) | Información about the credit granted to the customer.


#### Invoice totals

Parameter           | Type                    | Description
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total before taxes. __Required__
descuento_adicional | float | Additional discount applied to the invoice subtotal, expressed in monetary value. <span style="color: red">__Obsoleto__</span> *utiliza el parámetro descuento_adicional de Total Impuesto*
descuento           | float | Sum of each line item discount and the additiona discount. __Required__
propina             | float | Tip or gratuity. __Required__
importe_total       | float | Total including taxes. __Required__
impuestos           | list of [total-tax](#total-tax) objects | List of aggregated taxes. __Required__

#### Payments

Parameter   | Type         | Description
----------- | ------------ | ----------
fecha       | string       | Payment date AAAA-MM-DDHoraZonaHoraria, in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format. The present date time is used when this parameter is not specified.
medio       | string       | [payment form](#payment-forms) code. __Required__
total       | float        | Total applicable to the payment form. __Required__
propiedades | object       | Additional information related to the payment in dictionary form. Example: <br>` {"plazo": "30", "unidad_tiempo": "dias"}`

#### Crédito

Parameter           | Type    | Description
------------------- | ------- | ------------
fecha_vencimiento   | string  | Due date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) date format (AAAA-MM-DD). __Requerido__
monto               | float   | Credit amount. __Requerido__

<aside class="notice">
This information is sent to the Internal Revenue Service (SRI)
</aside>

### Response

> #### Example response

```json
{
  "id": "abcdef09876123cea56784f01",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2015-02-28T11:28:56.782Z",
  "clave_acceso": "2802201501091000000000120010010000100451993736618",
  "emisor":{
    "ruc": "0910000000001",
    "obligado_contabilidad": true,
    "contribuyente_especial": "12345",
    "nombre_comercial": "XYZ Corp",
    "razon_social": "XYZ Corporación S.A.",
    "direccion": "Av. Primera 234 y calle 5ta",
    "establecimiento": {
      "punto_emision": "002",
      "codigo": "001",
      "direccion": "Av. Primera 234 y calle 5ta"
    }
  },
  "moneda": "USD",
  "informacion_adicional": {
    "Tiempo de entrega": "5 días"
  },
  "totales": {
    "total_sin_impuestos": 4359.54,
    "impuestos": [
      {
        "base_imponible": 0.0,
        "valor": 0.0,
        "codigo": "2",
        "codigo_porcentaje": "0"
      },
      {
        "base_imponible": 4359.54,
        "valor": 523.14,
        "codigo": "2",
        "codigo_porcentaje": "2"
      }
    ],
    "importe_total": 4882.68,
    "propina": 0.0,
    "descuento": 0.0
  },
  "comprador": {
    "email": "juan.perez@xyz.com",
    "identificacion": "0987654321",
    "tipo_identificacion": "05",
    "razon_social": "Juan Pérez",
    "direccion": "Calle única Numero 987",
    "telefono": "046029400"
  },
  "items":[
    {
      "cantidad": 622.0,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos":[
        {
          "base_imponible": 4359.54,
          "valor": 523.14,
          "tarifa": 12.0,
          "codigo": "2",
          "codigo_porcentaje": "2"
        }
      ],
      "detalles_adicionales": {
        "Peso": "5000.0000"
      },
      "descuento": 0.0
    }
  ],
  "pagos": [
    {
      "medio": "efectivo",
      "total": 4882.68,
      "propiedades": {
        "plazo": 0,
        "unidad_tiempo": "dias"
      }
    }
  ]
}
```

Returns a **[factura](#requerimiento)** object that includes an `id` parameter that uniquely identifies the invoice. A generated access code is included as `clave_acceso`.

## Querying an invoice

You can query the API for the status of an invoice and look for the `estado` parameter. This will tell you if the invoice is authorized or not.

If you want to know the specific step the invoice is into the [issuance process](#issuance-process), look for value in `envio_sri` and `autorizacion_sri`.

### Operation

`GET /invoices/<invoice-id>`

### Request

> #### Example request

```shell
curl -v https://link.datil.co/invoices/<id-factura> \
-H "Content-Type: application/json" \
-H "X-Key: <your-api-key>"
```

```python
import requests
cabeceras = {'x-key': '<your-api-key>'}
respuesta = requests.get(
    'https://link.datil.co/invoices/<id-factura>',
    headers = cabeceras)
```

```csharp
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
      request.AddHeader("X-Key", "<your-api-key>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Replace `<invoice-ID>` with the `id` of the invoice you to query.

### Response

> #### Example response

```json
{
    "id": "abcf12343faad06785",
    "secuencial": "16",
    "fecha_emision": "2015-05-15",
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
            ]
        }
    ],
    "pagos": [
      {
        "medio": "efectivo",
        "total": 4882.68,
        "propiedades": {
          "plazo": 0,
          "unidad_tiempo": "dias"
        }
      }
    ],
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

Parameter | Type | Description
--------- | ------- | -----------
secuencial | string | Invoice sequence number.
estado | string | Possible values: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`
fecha_emision | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
clave_acceso | string | Access code.
envio_sri | [sri-sending](#sri-sending) object | Information about the sending step.
autorizacion | [sri-authorization](#sri-authorization) object | Information about the authorization step.
emisor | [issuer](#issuer) object | Information about the issuer.
moneda | string | [ISO](https://en.wikipedia.org/wiki/ISO*4217) code of the currency.
ambiente | integer | Environment. Test: `1`.<br>Production `2`.<br>
totales | list of [invoice-total](#invoice-totals) object | List of totals.
comprador | [recipient](#recipient) object | Information about the recipient.
tipo*emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>__Required__
items | list of [line-item](#line-item) objects | Line items.
pagos | list of [payments](#payments) objects | Payment forms applicable to the invoice.
version | string | Version of the country e-billing format. Valid values: `1.0.0`, `1.1.0`

## Re-issuing an invoice

### Operation

`POST /invoices/:id/reissue`

### Request

This operation is used to correct e-documents with status `NO AUTORIZADO` (not authorized) or `DEVUELTO` (returned). This means that the local tax authority did not authorize them and you should correct and try submitting them again.

The `id` of the invoice to be re-issued must be included in the URL.

The body must include the [factura](#request) object with the corrected parameters so it can be sent and authorized again.

### Response

It may return an error if the invoice is already authorized.
