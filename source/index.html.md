---
title: API Dátil

language_tabs:
  - shell: cURL
  - python: Python
  - csharp: C#

toc_footers:
  - <a href='#'>Para obtener mi clave del API</a>
  - <a href='http://github.com/tripit/slate'>Documentación gracias a Slate</a>

includes:
  - errores

search: true
---

# Introducción

Integra tu aplicación con Facturación Electrónica. Este API de Dátil te permite
emitir todos los tipos de comprobantes electrónicos: facturas, retenciones (próximamente), notas de crédito (próximamente), notas de débito (próximamente) y guías de remisión (próximamente).

El API de Dátil está diseñado como un servicio web [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer).
De esta manera resulta sencillo conversar con nuestra interfaz utilizando cualquier
librería en cualquier lenguaje que provea un cliente HTTP, ya que utilizamos 
componentes del estándar como los verbos y los códigos de respuesta.

Todos las operaciones responden en formato [JSON](http://www.json.org/), 
incluso los errores.

Dátil se encarga de todo el proceso de emisión del comprobante. El proceso de
emisión bajo condiciones normales, toma entre 3 a 5 segundos. Luego de ese período
bastará con consultar el comprobante para conocer su estado.

## Operaciones

Una operación REST está formada por la combinación de un verbo HTTP, la URL base
del servicio y la ruta de la operación. Las cuales se encuentran descritas en cada
sección donde se describe una función del API. Esta operación, por ejemplo, emite
una factura:

`POST https://link.datil.co/invoices/issue`

La URI anterior en conjunto con la información en formato JSON como cuerpo del
requerimiento y las cabeceras HTTP necesarias, conforman el requerimiento.

## Proceso de emisión

Comprende las siguientes fases:

1. __Creación__: Se registra el comprobante para posterior referencia.
2. __Firmado__: Utilizando el certificado de firma electrónica y un algoritmo de firma digital, 
el comprobante es firmado para que el SRI pueda verificar su legitimidad.
3. __Envío SRI__: El comprobante es enviado al SRI para ser procesado.
4. __Consulta de autorización SRI__: Luego de un período de espera, Dátil consulta la
autorización del comprobante.
5. __Envío por email__: Se envía el comprobante al correo del receptor del comprobante, si una dirección de correo electrónico válida fue provista al momento de emitir el comprobante.

<aside class="notice">
<strong>Recuerda:</strong> Este proceso es administrado completamente por nosotros y para
emitir un comprobante bastará enviarlo siguiendo la sección pertinente de esta
documentación.
</aside>

# Autenticación

Para obtener la clave del API, inicia sesión con tu cuenta en 
[app.datil.co](https://app.datil.co), ve a la opción _Configuración_ la
sección "API Key".

<img src="https://s3-us-west-2.amazonaws.com/static-files/datil-py-blurred-api-key.png">

Dátil utiliza claves para autorizar el acceso al API. La clave debe estar 
incluída en todos los requerimientos en una cabecera:

`X-Key: <clave-del-api>`

Para emitir o re-emitir un comprobante se requiere también la clave del certificado
de firma electrónica. Esta clave deberá ser provista en una cabecera:

`X-Password: <clave-certificado-firma>`

# Facturas

## Emisión de una factura

### Operación

`POST /invoices/issue`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/issue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
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
      "codigo_principal":"ZNC"
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
  ]
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://app.datil.co/invoices/issue",
    headers = cabeceras,
    data = json.dumps(factura))
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

Para la emisión de una factura se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la factura. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
guia_remision | string | Número de guía de remisión asociada a esta factura en formato 001-002-000000003 ([0-9]{3}-[0-9]{3}-[0-9]{9})
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
totales | objeto tipo [totales](#totales) | Listado de totales. __Requerido__
comprador | objeto tipo [comprador](#comprador) | Información del comprador. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`

<!--aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside-->

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
      "codigo_principal": "ZNC"
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

Retorna un objeto tipo **[factura](#requerimiento)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

## Consulta de una factura

Consulta una factura para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica 
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emisión), 
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /invoices/<invoice-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/<id-factura> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/invoices/<id-factura>',
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
      var idFactura = "<id-factura>";
      var request = new RestRequest("invoices/" + idFactura, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<invoice-ID>` por el `id` de la factura que necesitas consultar.

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
secuencial | string | Número de secuencia de la factura.
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
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura. 
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

# Clave de acceso

El sistema se encarga de generar automáticamente la clave de acceso de cada
comprobante y luego retornarla como parte de la respuesta de emisión del mismo.
Pero es posible también proveer la clave de acceso si se requiere tener control
en la generación de esta clave. La siguiente documentación explica como debe
estar estructurada la clave de acceso.

Las claves de acceso estarán compuestas de 49 caracteres numéricos, la herramienta o aplicativo a utilizar por el sujeto pasivo deberá generar de manera automática la clave de acceso, que constituirá un requisito que dará el carácter de único a cada uno de los comprobantes, y la misma servirá para que el SRI indique si el comprobante es autorizado o no; se describe a continuación su conformación:

Campo | Formato | Longitud
--------- | ---- |-----------
Fecha de Emisión| ddmmaaaa| 8
Tipo de Comprobante| Tabla 4| 2
Número de RUC| 1234567890001| 13
Tipo de Ambiente| Tabla 5| 1
Serie| 001001| 6
Número del Comprobante (secuencial)| 000000001| 9
Código Numérico| Numérico| 8
Tipo de Emisión| Tabla 2| 1
Dígito Verificador (módulo 11 )| Numérico| 1

**Nota:** Todos los campos deben completarse conforme a la longitud indicada, es decir si en el número secuencial no completa los 9 dígitos, la clave de acceso estará mal conformada y será motivo de rechazo de la autorización en línea.

El dígito verificador será aplicado sobre toda la clave de acceso (48 dígitos) y deberá ser incorporado por el contribuyente a través del método denominado Módulo 11, con un factor de chequeo ponderado (2), este mecanismo de detección de errores, será verificado al momento de la recepción del comprobante. Cuando el resultado del dígito verificador obtenido sea igual a once (11), el digito verificador será el cero (0) y cuando el resultado del dígito verificador obtenido sea igual a diez 10, el digito verificador será el uno (1).

El código numérico constituye un mecanismo para brindar seguridad al emisor en cada comprobante emitido, el algoritmo numérico para conformar este código es potestad absoluta del contribuyente emisor.

Ver [aquí](https://es.wikipedia.org/wiki/C%C3%B3digo_de_control) ejemplo de verificación utilizando algoritmo de módulo 11.


# Objetos comunes

## Emisor

Información del emisor de un comprobante.

Parámetro | Tipo | Descripción
--------- | ---- |-----------
ruc | string | Número de RUC de 13 caracteres
razon_social | string | Razón social. Máximo 300 caracteres
nombre_comercial | string| Nombre comercial. Máximo 300 caracteres
direccion | string | Dirección registrada en el SRI. Máximo 300 caracteres.
contribuyente_especial | string | Número de resolución. En blanco si no es contribuyente especial.
obligado_contabilidad | boolean | `true` si está obligado a llevar contabilidad.
establecimiento | [establecimiento](#establecimiento) | Establecimiento que emite la factura.

## Establecimiento

Representa un establecimiento del comercio.

Parámetro | Tipo | Descripción
--------- | ---- |-----------
codigo | string | Código numérico de 3 caracteres que representa al establecimiento. Ejemplo: `001`
direccion | string | Dirección registrada en el SRI. Máximo 300 caracteres
punto_emision | string | Código numérico de 3 caracteres que representa al punto de emisión, o punto de venta. Ejemplo: `001`

## Comprador

Datos de un comprador.

Parámetro | Tipo | Descripción
--------- | ---- |-----------
razon_social | string | Razón social del comprador. Máximo 300 caracteres.
identificacion | string | De 5 a 20 caracteres.
tipo_identificacion | string | Ver [tabla](#tipo-de-identificación) de tipos de identificación

## Tipo de identificación

Tipo de identificación      | Código
--------------------------- | ------
RUC                         | `04`
CEDULA                      | `05`
PASAPORTE                   | `06`
VENTA A CONSUMIDOR FINAL*   | `07`
IDENTIFICACION DELEXTERIOR* | `08`
PLACA                       | `09`

## Totales

Totales del comprobante.

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos.
descuento           | float | Suma de los descuentos de cada ítem.
propina             | float | Propina total, llamado también servicio.
importe_total       | float | Total incluyendo impuestos.
impuestos           | listado de objetos [total impuesto](#impuesto-total) | Listado de impuesto totalizados.

### Impuesto total

Parámetro | Tipo | Descripción
--------- | ---- |-----------
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto)
codigo_porcentaje | string | Código del porcentaje.
base_imponible | float | Base imponible.
valor | float | Valor del total.

## Envío SRI

Contiene la información y el estado de la fase de envío al SRI

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
mensajes | listado de objeto [mensaje SRI](#mensajes-de-respuesta-sri) | Listado de mensajes.
estado   | string | Posibles valores: `RECIBIDA`, `DEVUELTA`
fecha    | string | Fecha en la que se realizó el envío en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).

## Autorización SRI

Contiene la información y el estado de la fase de autorización del comprobante.

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
mensajes | listado de objeto [mensaje SRI](#mensajes-de-respuesta-sri) | Listado de mensajes.
estado   | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`
numero   | string | Número de autorización.
fecha    | string | Fecha en la que se otorgó la autorización en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).

## Mensajes de respuesta SRI

Parámetro             | Tipo   | Descripción
--------------------- | ------ | -----------
identificador         | string | Número con el que el SRI identifica al mensaje.
mensaje               | string | Descripción del error, información o advertencia.
tipo                  | string | Posibles valores: `INFORMATIVO`, `ADVERTENCIA`, `ERROR`
informacion_adicional | string | Información adicional del mensaje.

## Item de factura

Representa un producto o servicio del comercio.

Parámetro | Tipo | Descripción
--------- | ---- |-----------
descripcion | string | Descripción del ítem. __Requerido__
codigo_principal | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
codigo_auxiliar | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
cantidad | float | Cantidad de items. __Requerido__
precio_unitario | float | Precio unitario. __Requerido__
descuento | float | El descuento es aplicado por cada producto. __Requerido__
precio_total_sin_impuestos | float | Precio antes de los impuestos. Se obtiene multiplicando la `cantidad` por el `precio_unitario`
impuestos | listado de objetos tipo [impuesto item](#impuesto-item) | Impuestos grabados sobre el producto. __Requerido__
detalles_adicionales | object | Diccionario de datos de carácter adicional. Ejemplo:<br><code>{"marca": "Ferrari", "chasis": "UANEI832-NAU101"}</code>

### Impuesto item

Parámetro | Tipo | Descripción
--------- | ---- |-----------
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto)
codigo_porcentaje | string | Código del porcentaje.
base_imponible | float | Base imponible.
valor | float | Valor del total.
tarifa | float | Porcentaje actual del impuesto expresado por un número entre 0.0 y 100.0

# Catálogo

## Tipos de impuesto

Impuesto | Código
-------- | ------
IVA      | 2
ICE      | 3
IRBPNR   | 5


