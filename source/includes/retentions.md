# Comprobantes de Retención

## Emisión de una retención

### Operación

`POST /retentions/issue`

<h3 id="requerimiento-retencion">Requerimiento</h3>

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/retentions/issue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
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
  "impuestos":[
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
  "impuestos":[
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
    'x-password': '<clave-certificado-firma>',
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
      request.AddHeader("X-Password", "<clave-certificado-firma>");

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
        ""impuestos"":[
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

Para la emisión de una nota de crédito se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la nota de crédito. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
periodo_fiscal | string | Mes y año en el siguiente formato MM/AAAA. Ejm: 12/2015
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
impuestos | vector de objetos tipo [impuesto](#impuesto-retenido) | Listado de impuestos retenidos. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"Email": "contabilidad@empresa.com"}`

<!--aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside-->

### Respuesta

> #### Respuesta de ejemplo

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
  "impuestos":{
    "impuestos":[
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
  },
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

Retorna un objeto tipo **[retención](#requerimiento-retencion)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la nota de crédito. El campo `clave_acceso` 
generado también se incluirá como parte de la respuesta.

## Consulta de un Comprobante de Retención

Consulta una nota de crédito para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica 
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emisión), 
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /retentions/<receipt-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/retentions/<id-retencion> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
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

Reemplaza en la ruta `<receipt-id>` por el `id` de la nota de crédito que necesitas consultar.

### Respuesta

> #### Respuesta de ejemplo

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
    "impuestos":[
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
    "informacion_adicional": [],
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

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la nota de crédito.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor. 
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
impuestos | vector de objetos tipo [impuesto](#impuesto-retenido) | Listado de impuestos retenidos. __Requerido__
sujeto | objeto [persona](#persona) | Información del sujeto al que se le retiene. 
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`
