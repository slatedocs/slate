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
curl -v https://link.datil.co/webhooks \
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

Al ejecutarse un evento se enviará en un requerimiento tipo *POST*, la información completa del comprobante en
conjunto con la autorización a la dirección registrada como `webhook_url` al
momento de la suscripción.

### Autorizado

Un comprobante *Autorizado* contendrá información como el siguiente ejemplo: 

```
{
  "secuencial":1267,
  "fecha_emision":"2015-12-04T19:28:56.782Z",
  "emisor":{
    "ruc":"0992712554001",
    "obligado_contabilidad":true,
    "contribuyente_especial":"",
    "nombre_comercial":"Datilmedia",
    "razon_social":"Datilmedia S.A.",
    "direccion":"Kennedy Norte Av. Miguel H. Alcivar",
    "establecimiento":{
      "punto_emision":"002",
      "codigo":"001",
      "direccion":"Calle A"
    },
    "email":"clientes@datilmedia.com"
  },
  "guia_remision":"001-002-007654320",
  "tipo":"factura",
  "moneda":"USD",
  "id":"1ae2afaf6fed46dcabb14d424311e232",
  "informacion_adicional":{
    "Tiempo de entrega":"5 días"
  },
  "ambiente":1,
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
    "identificacion":"0924447956001",
    "tipo_identificacion":"04",
    "razon_social":"Juan Antonio Plaza",
    "direccion":"Calle única Numero: S/N",
    "telefono":"046015159",
    "email":"jplazaarguello@gmail.com"
  },
  "tipo_emision":1,
  "items":[
    {
      "precio_unitario":7.01,
      "descripcion":"CEMENTO ROCA 50 KG. (1) 40U C/PALET",
      "precio_total_sin_impuestos":4359.54,
      "impuestos":[
        {
          "base_imponible":4359.54,
          "valor":523.14,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales":{
        "Peso":"5000.0000",
        "Volumen":"1 Gl"
      },
      "cantidad":622.0,
      "codigo_auxiliar":"CTO2",
      "descuento":0.0,
      "codigo_principal":"CTO1"
    }
  ],
  "version":"1.0.0",
  "clave_acceso":"0412201501099271255400110010020000012671994716611",
  "api-key":"abcxyz1234567890mnbvqwe321tyu653",
  "autorizacion":{
    "numero":"0412201516042509927125540010331009539",
    "fecha":"2015-12-04T16:04:25",
    "estado":"AUTORIZADO",
    "mensajes":[

    ]
  }
}
```

### No Autorizado

Un comprobante *No autorizado* contendrá información como el siguiente ejemplo: 

```
{
  "secuencial":1267,
  "fecha_emision":"2015-12-04T19:28:56.782Z",
  "emisor":{
    "ruc":"0992712554001",
    "obligado_contabilidad":true,
    "contribuyente_especial":"",
    "nombre_comercial":"Datilmedia",
    "razon_social":"Datilmedia S.A.",
    "direccion":"Kennedy Norte Av. Miguel H. Alcivar",
    "establecimiento":{
      "punto_emision":"002",
      "codigo":"001",
      "direccion":"Calle A"
    },
    "email":"clientes@datilmedia.com"
  },
  "guia_remision":"001-002-007654320",
  "tipo":"factura",
  "moneda":"USD",
  "id":"1ae2afaf6fed46dcabb14d424311e232",
  "informacion_adicional":{
    "Tiempo de entrega":"5 días"
  },
  "ambiente":1,
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
    "identificacion":"0924447956001",
    "tipo_identificacion":"04",
    "razon_social":"Juan Antonio Plaza",
    "direccion":"Calle única Numero: S/N",
    "telefono":"046015159",
    "email":"jplazaarguello@gmail.com"
  },
  "tipo_emision":1,
  "items":[
    {
      "precio_unitario":7.01,
      "descripcion":"CEMENTO ROCA 50 KG. (1) 40U C/PALET",
      "precio_total_sin_impuestos":4359.54,
      "impuestos":[
        {
          "base_imponible":4359.54,
          "valor":523.14,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales":{
        "Peso":"5000.0000",
        "Volumen":"1 Gl"
      },
      "cantidad":622.0,
      "codigo_auxiliar":"CTO2",
      "descuento":0.0,
      "codigo_principal":"CTO1"
    }
  ],
  "version":"1.0.0",
  "clave_acceso":"0412201501099271255400110010020000012671994716611",
  "api-key":"abcxyz1234567890mnbvqwe321tyu653",
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
}
```

### Devuelto

Un comprobante *Devuelto* contendrá información como el siguiente ejemplo: 

```
{
  "secuencial":1267,
  "fecha_emision":"2015-12-04T19:28:56.782Z",
  "emisor":{
    "ruc":"0992712554001",
    "obligado_contabilidad":true,
    "contribuyente_especial":"",
    "nombre_comercial":"Datilmedia",
    "razon_social":"Datilmedia S.A.",
    "direccion":"Kennedy Norte Av. Miguel H. Alcivar",
    "establecimiento":{
      "punto_emision":"002",
      "codigo":"001",
      "direccion":"Calle A"
    },
    "email":"clientes@datilmedia.com"
  },
  "guia_remision":"001-002-007654320",
  "tipo":"factura",
  "moneda":"USD",
  "id":"1ae2afaf6fed46dcabb14d424311e231",
  "informacion_adicional":{
    "Tiempo de entrega":"5 días"
  },
  "ambiente":1,
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
    "identificacion":"0924447956001",
    "tipo_identificacion":"04",
    "razon_social":"Juan Antonio Plaza",
    "direccion":"Calle única Numero: S/N",
    "telefono":"046015159",
    "email":"jplazaarguello@gmail.com"
  },
  "tipo_emision":1,
  "items":[
    {
      "precio_unitario":7.01,
      "descripcion":"CEMENTO ROCA 50 KG. (1) 40U C/PALET",
      "precio_total_sin_impuestos":4359.54,
      "impuestos":[
        {
          "base_imponible":4359.54,
          "valor":523.14,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales":{
        "Peso":"5000.0000",
        "Volumen":"1 Gl"
      },
      "cantidad":622.0,
      "codigo_auxiliar":"CTO2",
      "descuento":0.0,
      "codigo_principal":"CTO1"
    }
  ],
  "version":"1.0.0",
  "clave_acceso":"0412201501099271255400110010020000012671994716611",
  "api-key":"abcxyz1234567890mnbvqwe321tyu653",
  "envio_sri":{
    "estado":"DEVUELTA",
    "mensajes":[
      {
        "identificador":"35",
        "mensaje":"ARCHIVO NO CUMPLE ESTRUCTURA XML",
        "tipo":"ERROR",
        "informacion_adicional":"Se encontró el siguiente error en la estructura del comprobante: cvc-minLength-valid: Value '' with length = '0' is not facet-valid with respect to minLength '1' for type '#AnonType_valordetAdicionaldetallesAdicionalesdetalledetallesfactura'."
      }
    ]
  }
}
```
