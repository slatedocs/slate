# Waybills

## Issuing a waybill

### Operation

`POST /waybills/issue`

<h3 id="requerimiento-guia-remision">Request</h3>

> #### Example request

```shell
curl -v https://link.datil.co/waybills/issue \
-H "Content-Type: application/json" \
-H "X-Key: <your-api-key>" \
-H "X-Password: <your-certificate-password>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":50,
  "fecha_inicio_transporte":"2015-02-28T11:28:56.782Z",
  "fecha_fin_transporte":"2015-02-28T11:28:56.782Z",
  "direccion_partida": "Victor Emilio Estrada",
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
  "transportista":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"04 6029400",
    "placa":"GSM-0123"
  },
  "destinatarios": [{
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "email":"juan.perez@xyz.com",
    "telefono":"046029400",
    "fecha_emision_documento_sustento": "2015-02-27T11:28:56.782Z",
    "numero_documento_sustento": "001-001-000000008",
    "numero_autorizacion_documento_sustento": "0123456789",
    "motivo_traslado": "Venta",
    "tipo_documento_sustento": "01",
    "ruta": "GYE - UIO",
    "documento_aduanero_unico": "",
    "codigo_establecimiento_destino": "001",
    "items": [{
      "cantidad": 1.0,
      "codigo_principal": "SPS",
      "codigo_auxiliar": "001",
      "descripcion": "Playstation 4",
      "detalles_adicionales": {
        "numero": "DFGDG2342-2",
        "serie": "1-2014-2"
      }
    }]
  }]
}'
```

```python
import requests, json

guia_remision = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":50,
  "fecha_inicio_transporte":"2015-02-28T11:28:56.782Z",
  "fecha_fin_transporte":"2015-02-28T11:28:56.782Z",
  "direccion_partida": "Victor Emilio Estrada",
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
  "transportista":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"04 6029400",
    "placa":"GSM-0123"
  },
  "destinatarios": [{
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "email":"juan.perez@xyz.com",
    "telefono":"046029400",
    "fecha_emision_documento_sustento": "2015-02-27T11:28:56.782Z",
    "numero_documento_sustento": "001-001-000000008",
    "numero_autorizacion_documento_sustento": "0123456789",
    "motivo_traslado": "Venta",
    "tipo_documento_sustento": "01",
    "ruta": "GYE - UIO",
    "documento_aduanero_unico": "",
    "codigo_establecimiento_destino": "001",
    "items": [{
      "cantidad": 1.0,
      "codigo_principal": "SPS",
      "codigo_auxiliar": "001",
      "descripcion": "Playstation 4",
      "detalles_adicionales": {
        "numero": "DFGDG2342-2",
        "serie": "1-2014-2"
      }
    }]
  }]
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<your-certificate-password>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/waybills/issue",
    headers = cabeceras,
    data = json.dumps(guia_remision))
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
      var request = new RestRequest("waybills/issue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<your-certificate-password>");

      request.AddBody(@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":50,
        ""fecha_inicio_transporte"":""2015-02-28T11:28:56.782Z"",
        ""fecha_fin_transporte"":""2015-02-28T11:28:56.782Z"",
        ""direccion_partida"": ""Victor Emilio Estrada"",
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
          ""Tiempo de entrega"":""5 días""
        },
        ""transportista"":{
          ""email"":""juan.perez@xyz.com"",
          ""identificacion"":""0987654321"",
          ""tipo_identificacion"":""05"",
          ""razon_social"":""Juan Pérez"",
          ""direccion"":""Calle única Numero 987"",
          ""telefono"":""04 6029400"",
          ""placa"":""GSM-0123""
        },
        ""destinatarios"": [{
          ""identificacion"":""0987654321"",
          ""tipo_identificacion"":""05"",
          ""razon_social"":""Juan Pérez"",
          ""direccion"":""Calle única Numero 987"",
          ""email"":""juan.perez@xyz.com"",
          ""telefono"":""046029400"",
          ""fecha_emision_documento_sustento"": ""2015-02-27T11:28:56.782Z"",
          ""numero_documento_sustento"": ""001-001-000000008"",
          ""numero_autorizacion_documento_sustento"": ""0123456789"",
          ""motivo_traslado"": ""Venta"",
          ""tipo_documento_sustento"": ""01"",
          ""ruta"": ""GYE - UIO"",
          ""documento_aduanero_unico"": """",
          ""codigo_establecimiento_destino"": ""001"",
          ""items"": [{
            ""cantidad"": 1.0,
            ""codigo_principal"": ""SPS"",
            ""codigo_auxiliar"": ""001"",
            ""descripcion"": ""Playstation 4"",
            ""detalles_adicionales"": {
              ""numero"": ""DFGDG2342-2"",
              ""serie"": ""1-2014-2""
            }
          }]
        }]
      }");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
      Console.ReadLine();
    }
  }
}
```
A waybill requires the following information.

Parameter | Type | Description
--------- | ------- | -----------
secuencial | string | Waybill sequence number. __Required__
emisor | [issuer](#issuer) | Information about the issuer. __Required__
fecha_inicio_transporte | string | Start of service date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
fecha_fin_transporte | string | End of service date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
direccion_partida | string | Pickup address.
transportista | [carrier](#carrier) object | Information about the carrier.
ambiente | integer | Execution environment. Test: `1`.<br>Production `2`.<br>__Required__
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>__Required__
destinatarios | list of [receiver](#receiver) object | Information about the receivers of the waybill. __Required__
version | string | Version of the country e-billing format. Defaults to the latest version.
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
informacion_adicional | object | Additional information about the invoice in dictionary form. Example:<br>` {"plan": "pro", "months": "1"}`

#### Receiver

Parameter | Type | Description
--------- | ------- | -----------------
razon_social | string | Legal name of the receiver. 300 characters limit. __Required__
identificacion | string | Tax identification. From 5 to 20 characters. __Required__
tipo_identificacion | string | [identification type](#identification-types) code. __Required__
email | string | Email of the receiver.
telefono | string | Telephone of the receiver.
direccion | string | Address of the receiver.
ruta | string | Transport route. 300 limit.
documento_aduanero_unico | string | Unique customs identification. 20 character limit.
fecha_emision_documento_sustento | string | Issuance date of the support e-document in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).. __Required__
numero_documento_sustento | string | Complete number of the e-document that lists the transported goods. Normally invoices. Example: 001-002-010023098 __Required__
codigo_establecimiento_destino | string | Location number receiving the goods.. Example: 002. __Required__
tipo_documento_sustento | string | [support document type](#document-types). __Required__
motivo_traslado | string | Reason for the transfer. Example: Order fulfillment. __Required__
numero_autorizacion_documento_sustento | string | Authorization number of the support e-document.
items | list of [transported good](#transported-good) objects | List of transported goods.

#### Transported good

Parameter | Type | Description
--------- | ---- |-----------
descripcion | string | Item description. __Required__
codigo_principal | string | Stock keeping unit code. 25 characters limit.
codigo_auxiliar | string | Additional stock keeping unit code. 25 characters limit.
cantidad | float | Quantity. __Required__
detalles_adicionales | object | Additional product information the dictionary format. Example:<br><code>{"brand": "Ferrari", "chasis": "UANEI832-NAU101"}</code>. Limited to 3 key and value pairs.

#### Carrier

Parameter | Type | Description
--------- | ---- |-----------
razon_social | string | Legal name. 300 characters limit. __Required__
identificacion | string | Tax identification. 5 to 20 characters. __Required__
tipo_identificacion | string | [identification type](#identification-types). __Required__
email | string | Email of the carrier. 300 characters limit. __Required__
telefono | string | Telephone of the carrier.
direccion | string | Address of the carrier.
placa | string | Vehicle license plate.

### Resonse

> #### Example response

```json
{
  "id": "abcfde09817263847cdaef8493018fef",
  "clave_acceso":"2802201501091000000000120010010000100451993736618",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":50,
  "fecha_inicio_transporte":"2015-02-28T11:28:56.782Z",
  "fecha_fin_transporte":"2015-02-28T11:28:56.782Z",
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
  "transportista":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"04 6029400",
    "placa":"GSM-0123"
  },
  "destinatarios": [{
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "email":"juan.perez@xyz.com",
    "telefono":"046029400",
    "fecha_emision_documento_sustento": "2015-02-27T11:28:56.782Z",
    "numero_documento_sustento": "001-001-000000008",
    "numero_autorizacion_documento_sustento": "0123456789",
    "motivo_traslado": "Venta",
    "tipo_documento_sustento": "01",
    "ruta": "GYE - UIO",
    "documento_aduanero_unico": "",
    "codigo_establecimiento_destino": "001",
    "items": [{
      "cantidad": 1.0,
      "codigo_principal": "SPS",
      "codigo_auxiliar": "001",
      "descripcion": "Playstation 4",
      "detalles_adicionales": {
        "numero": "DFGDG2342-2",
        "serie": "1-2014-2"
      }
    }]
  }]
}
```

Returns a **[waybill](#requerimiento)** object that includes an `id` parameter that uniquely identifies the waybill. A generated access code is included as `clave_acceso`.

## Querying a waybill

You can query the API for the status of a waybill and look for the `estado` parameter. This will tell you if the waybill is authorized or not.

If you want to know the specific step the waybill is into the [issuance process](#issuance-process), look for value in `envio_sri` and `autorizacion_sri`.

### Operation

`GET /waybills/<receipt-id>`

### Request

> #### Example request

```shell
curl -v https://link.datil.co/waybills/<id-notacredito> \
-H "Content-Type: application/json" \
-H "X-Key: <your-api-key>" \
-H "X-Password: <your-certificate-password>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/waybills/<id-notacredito>',
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

Replace `<receipt-id>` with the `id` of the waybill you to query.


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
secuencial | string | Waybill sequence number. __Required__
emisor | [issuer](#issuer) | Information about the issuer. __Required__
fecha_inicio_transporte | string | Start of service date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
fecha_fin_transporte | string | End of service date in [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) format (AAAA-MM-DDHourTimeZone).
direccion_partida | string | Pickup address.
transportista | [carrier](#carrier) object | Information about the carrier.
ambiente | integer | Execution environment. Test: `1`.<br>Production `2`.<br>__Required__
tipo_emision | integer | Issuance mode. Normal: `1`.<br>Contingency: `2`<br>__Required__
destinatarios | list of [receiver](#receiver) object | Information about the receivers of the waybill. __Required__
version | string | Version of the country e-billing format. Defaults to the latest version.
envio_sri | [sri-sending](#sri-sending) object | Information about the sending step.
autorizacion | [sri-authorization](#sri-authorization) object | Information about the authorization step.
clave_acceso | string | The access code represents a unique identified for the document. Datil will generate an access code if you don't provide it.<br>¿How to [generate](#access-code) an access code?
informacion_adicional | object | Additional information about the invoice in dictionary form. Example:<br>` {"plan": "pro", "months": "1"}`
