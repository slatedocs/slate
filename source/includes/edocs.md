# Autorización de comprobantes

## Autorizar comprobante

Autoriza cualquier tipo de comprobante electrónico existente.
El ID del documento `id-doc` es el ID que obtienes después de crear un documento.

### Operación

`POST /edocs/<id-doc>/issue`

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/edocs/<id-doc>/issue \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>"
```

```python
import requests
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.get(
    'https://link.datil.co/edocs/<id-factura>/issue',
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

      var client = new RestClient("https://link.datil.co/edocs/");
      var idDocumento = "<id-doc>/issue";
      var request = new RestRequest("edocs/" + idDocumento, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");
      request.AddHeader("Content-Type", "application/json");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

### Requerimiento

Reemplaza en la ruta `<id-doc>` por el ID de la factura que necesitas consultar.

### Respuesta

Parámetro    | Tipo    | Descripción
------------ | ------- | -----------
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
estado       | string  | Estado de autorización del comprobante. Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
numero | string | Número completo del documento.  Ejm: 001-002-592738007
url_formato_impresion | url | Esta URL te permite acceder de manera directa al formato de impresión (RIDE) del comprobante
url_documento_electronico | url | Esta URL te permite acceder de manera directa al documento electrónico (XML)
tipo         | string  | Código que representa el tipo de documento. Revisa [aquí](#tipos-de-documentos) el código que corresponde a cada tipo de documento
id | string  | El id del documento consultado
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
receptor | objeto tipo [receptor](#receptor) | Informaci'on del receptor del documento.
clave_acceso | string  | Clave de acceso del documento.
autorizacion | Objeto de tipo [autorización SRI](#autorizacion-sri)

> #### Respuesta de ejemplo

```json
{
    "emisor": {
        "provincia": 10,
        "email": "uan.perez@xyz.com",
        "categoria": "Software",
        "ruc": "0992712554001",
        "obligado_contabilidad": true,
        "contribuyente_especial": "",
        "subcategoria": "Sorftware como Servicio",
        "nombre_comercial": "Datil",
        "pais": 1,
        "market_id": null,
        "razon_social": "XYZ Corporación S.A.",
        "direccion": "Av. Primera 234 y calle 5ta",
        "ciudad": "Guayaquil",
        "exportador": false,
        "telefono": "099999999",
        "tipoentidad": "Sociedad Anónima"
    },
    "estado": "RECIBIDO",
    "numero": "001-002-000000001",
    "url_formato_impresion": "https://app.datil.com/ver/67aa7c650g395cgb16e18df3d8ff18fc/pdf",
    "url_documento_electronico": "https://app.datil.com/ver/67aa7c650g395cgb16e18df3d8ff18fc/xml",
    "tipo": "01",
    "id": "67aa7c650g395cgb16e18df3d8ff18fc",
    "ambiente": "1",
    "receptor": {
        "identificacion": "0987654321001",
        "telefono": "",
        "email": "devops@datilmedia.com",
        "tipo_identificacion": "04",
        "direccion": "Av. Primera 234 y calle 5ta"
    },
    "clave_acceso": "0803202101099271255400110010020000000011994720519",
    "autorizacion": {
        "mensajes": []
    }
}
```

## Consulta de autorización

Consulta la información de autorización de cualquier tipo de comprobante electrónico.
El ID del documento `id-doc` es el ID que obtienes después de emitir un documento.

### Operación

`GET /edocs/<id-doc>`

### Requerimiento

Reemplaza en la ruta `<id-doc>` por el ID de la factura que necesitas consultar.

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/edocs/<id-doc> \
-H "Accept: application/json" \
-H "X-Key: <clave-del-api>"
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/edocs/<id-factura>',
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
      var idDocumento = "<id-doc>";
      var request = new RestRequest("edocs/" + idDocumento, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

### Respuesta

Parámetro    | Tipo    | Descripción
------------ | ------- | -----------
id           | string  | El id del documento consultado
tipo         | string  | Código que representa el tipo de documento. Revisa [aquí](#tipos-de-documentos) el código que corresponde a cada tipo de documento
estado       | string  | Estado de autorización del comprobante. Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
clave_acceso | string  | Clave de acceso del documento.
url_formato_impresion | url | Esta URL te permite acceder de manera directa al formato de impresión (RIDE) del comprobante
url_documento_electronico | url | Esta URL te permite acceder de manera directa al documento electrónico (XML)
autorizacion | Objeto de tipo [autorización SRI](#autorizacion-sri)

> #### Respuesta de ejemplo

```json
{
    "url_documento_electronico": "https://app.datil.co/ver/be69b7bc64b643718a643caa9a8c3569/xml",
    "autorizacion": {
        "fecha": "2020-01-23T15:41:51Z",
        "estado": "AUTORIZADO",
        "mensajes": [],
        "numero": "2301202035679285132400120010020000287082794874518"
    },
    "tipo": "01",
    "url_formato_impresion": "https://app.datil.co/ver/be69b7bc64b643718a643caa9a8c3569/pdf",
    "clave_acceso": "2301202035679285132400120010020000287082794874518",
    "estado": "AUTORIZADO",
    "id": "be69b7bc64b643718a643caa9a8c3569",
    "ambiente": "2"
}
```

# Descarga de comprobantes

## Consulta de RIDE

Consulta de la representación impresa del documento electrónico (RIDE). El ID del comprobante `id-doc` es el ID que se obtiene después de emitir un comprobante.

### Operación

`GET app.datil.co/ver/<id-doc>/pdf`

## Consulta de XML

Consulta de representación XML de los comprobantes. El ID del comprobante `id-doc` es el ID que se obtiene después de emitir un comprobante.

### Operación

`GET app.datil.co/ver/<id-doc>/xml`

# Envío por correo

Envíe cualquier tipo de comprobantes por correo electrónico hacia la persona que va dirigada el comprobante o una lista de destinatarios.

## Envío simple

Envíe el comprobante al correo electrónico que está definido en el comprobante

#### Operación

`POST edocs/send-email/<id-doc>`

#### Requerimiento

Reemplaza en la ruta `<id-doc>` por el `id` del comprobante a enviar por correo.  

```shell
curl -v https://link.datil.co/edocs/send-email/<id-doc> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>"

```

```python
import requests
cabeceras = {
  'x-key': '<clave-del-api>',
  'content-type': 'application/json'}
respuesta = requests.post(
    'https://link.datil.co/edocs/send-email/<id-factura>',
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
      var idDocumento = "<id-doc>";
      var request = new RestRequest("edocs/send-email/" + idDocumento, Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("Content-Type", "application/json");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

### Respuesta

Parámetro    | Tipo    | Descripción
------------ | ------- | -----------
id           | string  | El id del documento al cual se envío el correo.
result       | string  | Resultado del requerimiento.

## Envio a multiples receptores

Envié cualquier tipo de comprobante a multiples receptores especificando los correos electrónicos de estos en el cuerpo del requerimiento en formato JSON.

#### Operación

`POST edocs/send-email/<id-doc>`

#### Requerimiento

Reemplaza en la ruta `<id-doc>` por el `id` del comprobante a enviar por correo. El cuerpo del requerimiento debe de tener una lista con los correos de los receptores del comprobante.

Parámetro    | Tipo    | Descripción
------------ | ------- | -----------
destinatarios| lista   | Lista de los correos de los destinatarios del correo del comprobante.

```shell
curl -v https://link.datil.co/edocs/send-email/<id-doc> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>"
-d '{
      "destinatarios": [
        "juan.perez@xyz.com",
        "joel@xyz.com"
      ]
    }'
```

```python
import requests, json

destinatarios = {
  "destinatarios": [
    "juan.perez@xyz.com",
    "joel@xyz.com"
  ]
}
cabeceras = {
  'x-key': '<clave-del-api>',
  'content-type': 'application/json'}
respuesta = requests.post(
    'https://link.datil.co/edocs/send-email/<id-factura>',
    headers = cabeceras
    data = json.dumps(destinatarios))
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
      var idDocumento = "<id-doc>";
      var request = new RestRequest("edocs/send-email" + idDocumento, Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""destinatarios"": [
          ""juan.perez@xyz.com"",
          ""joel@xyz.com""
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

### Respuesta

Parámetro    | Tipo    | Descripción
------------ | ------- | -----------
id           | string  | El id del documento al cual se envío el correo.
result       | string  | Resultado del requerimiento.
