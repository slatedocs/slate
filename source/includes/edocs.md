# Consulta de autorización

Consulta la información de autorización de cualquier tipo de comprobante electrónico.
El ID del documento `id-doc` es el ID que obtienes después de emitir un documento.

### Operación

`GET /edocs/<id-doc>`

### Requerimiento

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
estado       | string  | Estado de autorización del comprobante. Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`
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