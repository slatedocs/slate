# Notificaciones

Dátil emite notificaciones cada vez que un comprobante es emitido. Te podrás
suscribir a estas notificaciones proveyendo una URL en donde recibir los datos
del comprobante emitido.

## Suscripción

Para suscribirte a las notificaciones envía un requerimiento a:

### Operación

`POST /webhooks`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/<id-factura> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "event_name": "receipt-issued",
  "webhook_url": "http://www.b2b.com/ereceipts/receive"
}'
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
suscripcion = {
  "event_name": "receipt-issued",
  "webhook_url": "http://www.b2b.com/ereceipts/receive"}

respuesta = requests.post(
    'https://link.datil.co/webhooks',
    headers = cabeceras,
    data = json.dumps(suscripcion))
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
      var idFactura = "<id-factura>";
      var request = new RestRequest("invoices/" + idFactura, Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddBody(@"{
        ""event_name"": "receipt-issued",
        ""webhook_url"": "http://www.b2b.com/ereceipts/receive"
      }");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Parámetro | Tipo | Descripción
--------- | ------- | -----------
event_name | string | Podrá ser `receipt-issued` o `issue-error`. __Requerido__
webhook_url | string | Dirección donde se recibirá la información en formato JSON __Requerido__

## Eventos

Al ejecutarse un evento se enviará la información completa del comprobante en
conjunto con la autorización a la dirección registrada como `webhook_url` al
momento de la suscripción.

### Autorizado

Un comprobante *Autorizado* contendrá información como el siguiente ejemplo: 

```
{
  ...
  "autorizacion": {
    "numero": "2907201515283909927125540017656314390",
    "fecha": "2015-09-28T19:28:56.782Z",
    "estado": "AUTORIZADO",
    "mensajes": []
  }
  ...
}
```

### No Autorizado

Un comprobante *No autorizado* contendrá información como el siguiente ejemplo: 

```
{
  ...
  "autorizacion": {
    "numero": "2907201515283909927125540017656314390",
    "fecha": "2015-09-28T19:28:56.782Z",
    "estado": "NO AUTORIZADO",
    "mensajes": [{
      "identificador": 46,
      "mensaje": "RUC NO EXISTE",
      "informacion_adicional": "El RUC debe tener 13 dígitos.",
      "tipo": "ERROR"
    }]
  }
  ...
}
```

### Devuelto

Un comprobante *Devuelto* contendrá información como el siguiente ejemplo: 

```
{
  ...
  "envio_sri": {
    "fecha": "2015-09-28T19:28:56.782Z",
    "estado": "DEVUELTA",
    "mensajes": [{
      "identificador": 45,
      "mensaje": "ERROR EN DIFERENCIAS",
      "informacion_adicional": "El total 34.54 no coincide con el calculado 34.65",
      "tipo": "ERROR"
    }, {
      "identificador": 69,
      "mensaje": "IDENTIFICACION DEL RECEPTOR",
      "informacion_adicional": "La cédula 0921091010 no tiene cumple con la validación del dígito verificador",
      "tipo": "ADVERTENCIA"
    }]
  }
  ...
}
```
