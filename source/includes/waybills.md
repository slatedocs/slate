# Guías de Remisión

## Emisión de una guía de remisión

### Operación

`POST /waybills/issue`

<h3 id="requerimiento-nota-credito">Requerimiento</h3>

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/waybills/issue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
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
    'x-password': '<clave-certificado-firma>',
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
      request.AddHeader("X-Password", "<clave-certificado-firma>");

      request.AddBody(@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":50,
        ""fecha_inicio_transporte"":""2015-02-28T11:28:56.782Z"",
        ""fecha_fin_transporte"":""2015-02-28T11:28:56.782Z"",
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

Para la emisión de una nota de crédito se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la nota de crédito. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
fecha_inicio_transporte | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
fecha_fin_transporte | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
destinatarios | listado de objetos tipo [destinatario](#destinatario) | Descripción de destinatarios y la mercadería transportada. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"email": "juan@empresa.com", "Carga asegurada por": "Securitas"}`


### Respuesta

> #### Respuesta de ejemplo

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
  ]
}
```

Retorna un objeto tipo **[nota de crédito](#requerimiento-nota-credito)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la nota de crédito. El campo `clave_acceso` 
generado también se incluirá como parte de la respuesta.

## Consulta de una nota de crédito

Consulta una nota de crédito para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica 
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emisión), 
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /waybills/<invoice-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/waybills/<id-notacredito> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
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

Reemplaza en la ruta `<invoice-ID>` por el `id` de la nota de crédito que necesitas consultar.

### Respuesta

> #### Respuesta de ejemplo

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

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la nota de crédito.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor. 
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. 
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales) | Listado de totales. 
comprador | objeto [comprador](#comprador) | Información del comprador. 
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la nota de crédito.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`
