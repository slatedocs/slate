# Debit notes

## Issuing a debit note

### operation

`POST /debit-notes/issue`

### Request

> #### Example request

```shell
curl -v https://link.datil.co/debit-notes/issue \
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
  "informacion_adicional":{
    "Tiempo de entrega":"5 días"
  },
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
      {
        "base_imponible":4359.54,
        "valor":523.14,
        "codigo":"2",
        "codigo_porcentaje":"2",
        "tarifa": 12.0
      }
    ],
    "importe_total":4882.68
  },
  "fecha_emision_documento_modificado": "2015-02-27T11:28:56.782Z",
  "numero_documento_modificado": "001-002-000058473",
  "tipo_documento_modificado": "01",
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
      "motivo":"Interés por mora",
      "valor":120.89
    }
  ]
}'
```

```python
import requests, json

nota_debito = {
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
  "informacion_adicional":{
    "Tiempo de entrega":"5 días"
  },
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
      {
        "base_imponible":4359.54,
        "valor":523.14,
        "codigo":"2",
        "codigo_porcentaje":"2",
        "tarifa": 12.0
      }
    ],
    "importe_total":4882.68
  },
  "fecha_emision_documento_modificado": "2015-02-27T11:28:56.782Z",
  "numero_documento_modificado": "001-002-000058473",
  "tipo_documento_modificado": "01",
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
      "motivo":"Interés por mora",
      "valor":120.89
    }
  ]
}}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<your-certificate-password>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/debit-notes/issue",
    headers = cabeceras,
    data = json.dumps(nota_debito))
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

      // Este ejemplo utiliza RestSharp
      // Para instalar anda al menú: tools > Library Package Manager > Package Manager Console
      // copia y pega y presiona enter: Install-Package RestSharp

      var client = new RestClient("https://link.datil.co/");
      var request = new RestRequest("debit-notes/issue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<your-certificate-password>");

      request.AddBody(@"{
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
              ""codigo_porcentaje"":""0"",
              ""tarifa"": 12.0
            },
            {
              ""base_imponible"":4359.54,
              ""valor"":523.14,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""2""
            }
          ],
          ""total"":4882.68,
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
            ""codigo_principal"":""ZNC""
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
        ]
      }");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
      Console.ReadLine();
    }
  }
}
```

A debit note requires the following information:

Parameter | Type | Description
--------- | ------- | -----------
secuencial | string | Debit number sequence number. __Required__
emisor | [issuer](#issuer) object | Information about the issuer. __Required__
fecha_emision | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (YYYY-MM-DDHourTimeZone).
ambiente | integer | Environment type. Test `1`.<br>Production `2`.<br>__Required__
totales | list of [debit note totals](#debit-note-total) | List of debit note totals. __Required__
fecha_emision_documento_modificado | string | Issuance date of the modified e-document in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (YYYY-MM-DDHourTimeZone). __Required__
numero_documento_modificado | string | Complete document number of the e-document being modified. Normally invoices. Example: 001-002-010023098 __Required__
tipo_documento_modificado | string | [document-type](#document-types). __Required__
motivos | list of [debit-note-reason](#debit-note-reason) | Reason for the debit note. Example: Interest on an overdue loan. __Required__
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>__Required__
version | string | Version of the country e-billing format. Defaults to the latest version.
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
informacion_adicional | objeto | objeto | Additional information about the invoice in dictionary form. Example:<br>` {"plan": "pro", "months": "1"}`

#### Debit note totals

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total befor taxes. __Required__
importe_total       | float | Total including taxes. __Required__
impuestos           | list of [debit-note-tax](#debit-note-tax) objects | Taxes applied to the amount of the debit note. __Required__

#### Debit note tax

Parameter | Type | Description
--------- | ---- |-----------
codigo | string | [tax-type](#invoice-tax-types) code.
codigo_porcentaje | string | Rate code.
base_imponible | float | Taxable amount.
valor | float | Total tax amount.
tarifa | float | Tax rate expressed as a number between 0.0 and 100.0.

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
        "codigo_porcentaje": "0",
        "tarifa": 0.0
      },
      {
        "base_imponible": 4359.54,
        "valor": 523.14,
        "codigo": "2",
        "codigo_porcentaje": "2",
        "tarifa": 12.0
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
  ]
}
```

Returns a **[debit-note](#debit-note-request)** object that includes an `id` parameter that uniquely identifies the invoice. A generated access code is included as `clave_acceso`.

## Querying a debit note

You can query the API for the status of a debit note and look for the `estado` parameter. This will tell you if the e-document is authorized or not.

If you want to know the specific step the debit note is into the [issuance process](#issuance-process), look for value in `envio_sri` and `autorizacion_sri`.

### Operation

`GET /debit-notes/<invoice-id>`

### Request

> #### Example request

```shell
curl -v https://link.datil.co/debit-notes/<id-notacredito> \
-H "Content-Type: application/json" \
-H "X-Key: <your-api-key>" \
-H "X-Password: <your-certificate-password>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/debit-notes/<id-notacredito>',
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
      var idNotaCredito = "<id-notacredito>";
      var request = new RestRequest("invoices/" + idNotaCredito, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Replace `<invoice-ID>` for the `id` of the debit note you want to query.

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
secuencial | string | credit note sequence number.
estado | string | Possible values: `AUTORIZADO` (authorized), `NO AUTORIZADO` (not authorized), `ENVIADO` (sent), `DEVUELTO` (rejected), `RECIBIDO` (received).
fecha_emision | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
envio_sri | [sri-sending](#sri-sending) object | Information about the sending step.
autorizacion | [sri-authorization](#sri-authorization) object | Information about the authorization step.
emisor | [issuer](#issuer) | Information about the issuer.
moneda | string | [ISO](https://en.wikipedia.org/wiki/ISO_4217) code of the currency.
ambiente | integer | Environment: Test `1`.<br>Production `2`.<br>
totales | list of [credit-note-total](#credit-note-totals) | List of credit note totals.
comprador | [recipient](#recipient) object | Information about the recipient.
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>
items | list of [line-item](#line-item) objects | Line items.
version | string | Version of the country e-billing format. Valid values: `1.0.0`, `1.1.0`
