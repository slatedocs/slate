# Withholdings

## Issuing a withholding

### Operation

`POST /retentions/issue`

### Requirement

> #### Example requirement

```shell
curl -v https://link.datil.co/retentions/issue \
-H "Content-Type: application/json" \
-H "X-Key: <your-api-key>" \
-H "X-Password: <your-certificate-password>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":14,
  "fecha_emision":"2015-12-25T11:28:56.782Z",
  "periodo_fiscal":"12/2015",
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
    "Envíada al correo electónico":"contabilidad@xyz.com"
  },
  "items":[
    {
      "base_imponible": 4226.4,
      "codigo": 1,
      "codigo_porcentaje": "312",
      "fecha_emision_documento_sustento": "2015-12-04T00:00:00-05:19",
      "numero_documento_sustento": "011-007-000000251",
      "porcentaje": 1.0,
      "tipo_documento_sustento": "01",
      "valor_retenido": 42.26
    }
  ]
  "sujeto":{
    "email":"contabilidad@email.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  }
}'
```

```python
import requests, json

retencion = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":14,
  "fecha_emision":"2015-12-25T11:28:56.782Z",
  "periodo_fiscal":"12/2015",
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
    "Envíada al correo electónico":"contabilidad@xyz.com"
  },
  "items":[
    {
      "base_imponible": 4226.4,
      "codigo": 1,
      "codigo_porcentaje": "312",
      "fecha_emision_documento_sustento": "2015-12-04T00:00:00-05:19",
      "numero_documento_sustento": "011-007-000000251",
      "porcentaje": 1.0,
      "tipo_documento_sustento": "01",
      "valor_retenido": 42.26
    }
  ],
  "sujeto":{
    "email":"contabilidad@email.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  }
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<your-certificate-password>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/retentions/issue",
    headers = cabeceras,
    data = json.dumps(retencion))
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
      var request = new RestRequest("invoices/issue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<your-certificate-password>");

      request.AddBody(@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":14,
        ""fecha_emision"":""2015-12-25T11:28:56.782Z"",
        ""periodo_fiscal"":""12/2015"",
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
        ""informacion_adicional"":{
          ""Envíada al correo electónico"":""contabilidad@xyz.com""
        },
        ""items"":[
          {
            ""base_imponible"": 4226.4,
            ""codigo"": 1,
            ""codigo_porcentaje"": ""312"",
            ""fecha_emision_documento_sustento"": ""2015-12-04T00:00:00-05:19"",
            ""numero_documento_sustento"": ""011007000000251"",
            ""porcentaje"": 1.0,
            ""tipo_documento_sustento"": ""01"",
            ""valor_retenido"": 42.26
          }
        ],
        ""sujeto"":{
          ""email"":""contabilidad@email.com"",
          ""identificacion"":""0987654321"",
          ""tipo_identificacion"":""05"",
          ""razon_social"":""Juan Pérez"",
          ""direccion"":""Calle única Numero 987"",
          ""telefono"":""046029400""
        }
      }");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
      Console.ReadLine();
    }
  }
}
```

A withholding requires the following information

Parameter | Type | Description
--------- | ------- | -----------
secuencial | string | Withholding sequence number. __Required__
emisor | [issuer](#issuer) | Information about the issuer.  __Required__
fecha_emision | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
periodo_fiscal | string | Month and year in MM/YYYY fomat.
ambiente | integer | Environment. Test: `1`.<br>Production `2`.<br>__Required__
impuestos | list of [withholded-tax](#withholded-tax) objects | List of withholded tax line items. __Required__
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>__Required__
version | string | Version of the country e-billing format. Defaults to the latest version.
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
informacion_adicional | object | Additional information about the invoice in dictionary form. Example:<br>` {"plan": "pro", "months": "1"}`

#### Withholded tax

Parameter                        | Type   | Description
-------------------------------- | ------ |------------
base_imponible                   | float  | Taxable amount with up to 2 decimals. __Required__
codigo                           | string | [withholding-tax-type](#withholding-tax-types) code. __Required__
codigo_porcentaje                | string | Tax rate code. __Required__
porcentaje                       | float  | Tax rate.
valor_retenido                   | float  | Withholded tax amount, calculated from the product of `porcentaje` and `base_imponible`, with up to 2 decimals.  __Required__
fecha_emision_documento_sustento | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone). __Required__
numero_documento_sustento        | string | Complete document number of the e-document being modified. Normally invoices. Example: 001-002-010023098 __Required__

### Response

> #### Example response

```json
{
  "id": "abcdef09876123cea56784f01",
  "clave_acceso": "2802201501091000000000120010010000100451993736618",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":14,
  "fecha_emision":"2015-12-25T11:28:56.782Z",
  "periodo_fiscal":"12/2015",
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
    "Envíada al correo electónico":"contabilidad@xyz.com"
  },
  "items":[
    {
      "base_imponible": 4226.4,
      "codigo": 1,
      "codigo_porcentaje": "312",
      "fecha_emision_documento_sustento": "2015-12-04T00:00:00-05:19",
      "numero_documento_sustento": "011-007-000000251",
      "porcentaje": 1.0,
      "tipo_documento_sustento": "01",
      "valor_retenido": 42.26
    }
  ],
  "sujeto":{
    "email":"contabilidad@email.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  }
}
```

Returns a **[withholding](#withholding-request)** object that includes an `id` parameter that uniquely identifies the withholding. A generated access code is included as `clave_acceso`.

## Querying a withholding

You can query the API for the status of a withholding and look for the `estado` parameter. This will tell you if the e-document is authorized or not.

If you want to know the specific step the withholding is into the [issuance process](#issuance-process), look for value in `envio_sri` and `autorizacion_sri`.

### Operation

`GET /retentions/<receipt-id>`

### Request

> #### Example request

```shell
curl -v https://link.datil.co/retentions/<id-retencion> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <your-certificate-password>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/retentions/<id-retencion>',
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
      var idNotaCredito = "<id-retencion>";
      var request = new RestRequest("invoices/" + idNotaCredito, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Replace `<invoice-ID>` for the `id` of the withholding you want to query.

### Response

> #### Example response

```json
{
    "id": "abcf12343faad06785abcf12343faad0",
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
    "items":[
      {
        "base_imponible": 4226.4,
        "codigo": 1,
        "codigo_porcentaje": "312",
        "fecha_emision_documento_sustento": "2015-12-04T00:00:00-05:19",
        "numero_documento_sustento": "011007000000251",
        "porcentaje": 1.0,
        "tipo_documento_sustento": "01",
        "valor_retenido": 42.26
      }
    ],
    "correos_enviados": [
        {
            "fecha_envio": "2015-05-15T16:36:48.274604",
            "destinatarios": "juanantonioplaza@datilmedia.com"
        }
    ],
    "informacion_adicional": {},
    "ambiente": "1",
    "sujeto": {
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
secuencial | string | Withholding sequence number.
estado | string | Possible values: `AUTORIZADO` (authorized), `NO AUTORIZADO` (not authorized), `ENVIADO` (sent), `DEVUELTO` (rejected), `RECIBIDO` (received).
fecha_emision | string | Issuance date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
envio_sri | [sri-sending](#sri-sending) object | Information about the sending step.
autorizacion | [sri-authorization](#sri-authorization) object | Information about the authorization step.
emisor | [issuer](#issuer) | Information about the issuer.
ambiente | integer | Environment: Test `1`.<br>Production `2`.<br>
items | list of [withholded tax](#withholded-tax) objects | List of withholded taxes. __Required__
sujeto | [recipient](#recipient) object | Information about the recipient.
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>
version | string | Version of the country e-billing format. Valid values: `1.0.0`, `1.1.0`
