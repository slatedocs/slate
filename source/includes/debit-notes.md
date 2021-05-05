# Notas de Débito

## Emisión de una nota de débito

### Operación

`POST /debit-notes/issue`

<h3 id="requerimiento-nota-debito">Requerimiento</h3>

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/debit-notes/issue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-08-28T11:28:56.782Z",
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
    "total_sin_impuestos":120.89,
    "impuestos":[
      {
        "base_imponible":120.89,
        "valor":14.51,
        "codigo":"2",
        "codigo_porcentaje":"2",
        "tarifa": 12.0
      }
    ],
    "importe_total":135.4
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
  "fecha_emision":"2019-02-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad":True,
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
    "Tiempo de entrega":u"5 días"
  },
  "totales":{
    "total_sin_impuestos":120.89,
    "impuestos":[
      {
        "base_imponible":120.89,
        "valor":14.51,
        "codigo":"2",
        "codigo_porcentaje":"2",
        "tarifa": 12.0
      }
    ],
    "importe_total":135.4
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
      "motivo":u"Interés por mora",
      "valor":120.89
    }
  ]
}}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/debit-notes/issue",
    headers = cabeceras,
    data = json.dumps(nota_debito))
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

      // Este ejemplo utiliza RestSharp
      // Para instalar anda al menú: tools > Library Package Manager > Package Manager Console
      // copia y pega y presiona enter: Install-Package RestSharp

      var client = new RestClient("https://link.datil.co/");
      var request = new RestRequest("debit-notes/issue", Method.POST);
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
          ""total_sin_impuestos"":120.89,
          ""impuestos"":[
            {
              ""base_imponible"":0.0,
              ""valor"":0.0,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""0"",
              ""tarifa"": 12.0
            },
            {
              ""base_imponible"":120.89,
              ""valor"":14.51,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""2""
            }
          ],
          ""total"":135.4,
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
                ""base_imponible"":120.89,
                ""valor"":14.51,
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

Para la emisión de una nota de débito se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la nota de débito. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
comprador | objeto tipo [persona](#persona) | Información del comprador. __Requerido__
totales | objeto tipo [totales](#totales-nota-debito) | Listado de totales. __Requerido__
fecha_emision_documento_modificado | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
numero_documento_modificado | string | Número completo del documento que se está afectando. Normalmente facturas. Ejm: 001-002-010023098 __Requerido__
tipo_documento_modificado | string | Códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__
items | arreglo de objetos tipo [items](#motivos) | Motivos del débito. Ejm: Interés por mora. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`

<h4 id="totales-nota-debito">Totales</h4>

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [impuesto](#impuesto-nota-debito) | Impuestos aplicados al total de cargos. __Requerido__

<h4 id="motivos">Items</h4>

Parámetro | Tipo | Descripción
--------- | ---- |-----------
motivo | string | Motivo por el cuál se hace el débito. __Requerido__
valor | float | Valor sin impuestos. __Requerido__

<h4 id="impuesto-nota-debito">Impuesto</h4>

Parámetro | Tipo | Descripción
--------- | ---- |-----------
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto) __Requerido__
codigo_porcentaje | string | Código del porcentaje. __Requerido__
base_imponible | float | Base imponible. __Requerido__
valor | float | Valor del total. __Requerido__
tarifa | float | Porcentaje actual del impuesto expresado por un número entre 0.0 y 100.0 __Requerido__


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
    "total_sin_impuestos": 120.89,
    "impuestos": [
      {
        "base_imponible": 0.0,
        "valor": 0.0,
        "codigo": "2",
        "codigo_porcentaje": "0",
        "tarifa": 0.0
      },
      {
        "base_imponible": 120.89,
        "valor": 14.51,
        "codigo": "2",
        "codigo_porcentaje": "2",
        "tarifa": 12.0
      }
    ],
    "importe_total": 135.4,
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
          "base_imponible": 120.89,
          "valor": 14.51,
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

Retorna un objeto tipo **[nota de débito](#requerimiento-nota-debito)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la nota de débito. El campo `clave_acceso`
generado también se incluirá como parte de la respuesta.

## Emisión de una nota de débito a partir de XML

`POST /debit-notes/issue/xml`

### Requerimiento a partir de XML

Para la emisión de una nota de débito a partir de un XML se debe enviar contenido del archivo XML como parámetro en el cuerpo del requerimiento en formato JSON. Este XML debe cumplir con la especificación del SRI.

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
xml                 | string  | Contenido del archivo xml. __Requerido__

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/debit-notes/issue/xml \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{"xml": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<notaDebito id=\"comprobante\" version=\"1.0.0\">
  <infoTributaria>
    <ambiente>1</ambiente>
    <tipoEmision>1</tipoEmision>
    <razonSocial>DATILMEDIA S.A.</razonSocial>
    <nombreComercial>Datil</nombreComercial>
    <ruc>1234567890001</ruc>
    <claveAcceso>0405202005123456789000110010010000000012235571917</claveAcceso>
    <codDoc>05</codDoc>
    <estab>001</estab>
    <ptoEmi>001</ptoEmi>
    <secuencial>000000001</secuencial>
    <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
  </infoTributaria>
  <infoNotaDebito>
    <fechaEmision>04/05/2020</fechaEmision>
    <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
    <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
    <razonSocialComprador>Santacruz Hernandez Anni Rosa</razonSocialComprador>
    <identificacionComprador>0953239092001</identificacionComprador>
    <obligadoContabilidad>NO</obligadoContabilidad>
    <codDocModificado>01</codDocModificado>
    <numDocModificado>001-001-000000001</numDocModificado>
    <fechaEmisionDocSustento>04/05/2020</fechaEmisionDocSustento>
    <totalSinImpuestos>0.45</totalSinImpuestos>
    <impuestos>
      <impuesto>
        <codigo>2</codigo>
        <codigoPorcentaje>2</codigoPorcentaje>
        <tarifa>12.00</tarifa>
        <baseImponible>0.45</baseImponible>
        <valor>0.05</valor>
      </impuesto>
      <impuesto>
        <codigo>3</codigo>
        <codigoPorcentaje>3080</codigoPorcentaje>
        <tarifa>35.00</tarifa>
        <baseImponible>0.45</baseImponible>
        <valor>0.16</valor>
      </impuesto>
    </impuestos>
    <valorTotal>0.50</valorTotal>
  </infoNotaDebito>
  <motivos>
    <motivo>
      <razon>Agua purificada</razon>
      <valor>0.45</valor>
    </motivo>
  </motivos>
  <infoAdicional>
    <campoAdicional nombre=\"Campo Adicional\">Información adicional</campoAdicional>
  </infoAdicional>
</notaDebito>"}'
```

```python
import requests, json

nota_debito = {
    "xml": '''<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <notaDebito id=\"comprobante\" version=\"1.0.0\">
      <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>DATILMEDIA/razonSocial>
        <nombreComercial>Dail</nombreComercial>
        <ruc>1234567890001</ruc>
        <claveAcceso>0405202005123456789000110010010000000012235571917</claveAcceso>
        <codDoc>05</codDoc>
        <estab>001</estab>
        <ptoEmi>001</ptoEmi>
        <secuencial>000000001</secuencial>
        <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
      </infoTributaria>
      <infoNotaDebito>
        <fechaEmision>04/05/2020</fechaEmision>
        <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
        <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
        <razonSocialComprador>Santacruz Hernandez Anni Rosa</razonSocialComprador>
        <identificacionComprador>0953239092001</identificacionComprador>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <codDocModificado>01</codDocModificado>
        <numDocModificado>001-001-000000001</numDocModificado>
        <fechaEmisionDocSustento>04/05/2020</fechaEmisionDocSustento>
        <totalSinImpuestos>0.45</totalSinImpuestos>
        <impuestos>
          <impuesto>
            <codigo>2</codigo>
            <codigoPorcentaje>2</codigoPorcentaje>
            <tarifa>12.00</tarifa>
            <baseImponible>0.45</baseImponible>
            <valor>0.05</valor>
          </impuesto>
          <impuesto>
            <codigo>3</codigo>
            <codigoPorcentaje>3080</codigoPorcentaje>
            <tarifa>35.00</tarifa>
            <baseImponible>0.45</baseImponible>
            <valor>0.16</valor>
          </impuesto>
        </impuestos>
        <valorTotal>0.50</valorTotal>
      </infoNotaDebito>
      <motivos>
        <motivo>
          <razon>Agua purificada</razon>
          <valor>0.45</valor>
        </motivo>
      </motivos>
      <infoAdicional>
        <campoAdicional nombre="Campo Adicional">Información adicional</campoAdicional>
      </infoAdicional>
    </notaDebito>'''
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/debit-notes/issue/xml",
    headers = cabeceras,
    data = json.dumps(nota_debito))
```

> #### Reespuesta de ejemplo

```json
{
    "secuencial": 2,
    "fecha_emision": "2020-05-04T00:00:00-05:00",
    "emisor": {
        "ruc": "1234567890001",
        "razon_social": "DATILMEDIA S.A.",
        "nombre_comercial": "Datil",
        "contribuyente_especial": "",
        "direccion": "Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras",
        "obligado_contabilidad": false,
        "establecimiento": {
            "punto_emision": "001",
            "codigo": "001",
            "direccion": "Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras"
        },
        "email": "devops@datilmedia.com"
    },
    "fecha_emision_documento_modificado": "2020-05-04T00:00:00-05:00",
    "id": "1fb562334f654368ab26dc9ce1a5b99b",
    "informacion_adicional": {
        "Campo Adicional": "Información adicional"
    },
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": "0.45",
        "importe_total": "0.50",
        "impuestos": [
            {
                "tarifa": "12.00",
                "codigo": "2",
                "codigo_porcentaje": "2",
                "base_imponible": "0.45",
                "valor": "0.05"
            },
            {
                "tarifa": "35.00",
                "codigo": "3",
                "codigo_porcentaje": "3080",
                "base_imponible": "0.45",
                "valor": "0.16"
            }
        ],
        "total_impuestos": "0.05"
    },
    "comprador": {
        "identificacion": "0953239092001",
        "razon_social": "Santacruz Hernandez Anni Rosa",
        "tipo_identificacion": "04",
        "direccion": ""
    },
    "tipo_emision": "1",
    "items": [
        {
            "motivo": "Agua purificada",
            "valor": "0.45"
        }
    ],
    "tipo_documento_modificado": "01",
    "numero_documento_modificado": "001-001-000000001",
    "clave_acceso": "0405202005123456789000110010010000000012235571917"
}
```

## Consulta de una nota de débito

Consulta una nota de débito para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emisión),
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /debit-notes/<invoice-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/debit-notes/<id-notadebito> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/debit-notes/<id-notadebito>',
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
      var  = "<id-notadebito>";
      var request = new RestRequest("debit-notes/" + idNotaDebito, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<id-notadebito>` por el `id` de la nota de débito que necesitas consultar.

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
                "codigo": "2",
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
secuencial | string | Número de secuencia de la nota de débito.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales-notas-de-débito) | Listado de totales.
comprador | objeto [comprador](#comprador) | Información del comprador.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la nota de débito.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

## Re-emisión de una nota de débito

### Operación

`POST /debit-notes/:id/reissue`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/debit-notes/<id-notadebito>/reissue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-08-28T11:28:56.782Z",
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
    "total_sin_impuestos":120.89,
    "impuestos":[
      {
        "base_imponible":120.89,
        "valor":14.51,
        "codigo":"2",
        "codigo_porcentaje":"2",
        "tarifa": 12.0
      }
    ],
    "importe_total":135.4
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
  "fecha_emision":"2019-02-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad":True,
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
    "Tiempo de entrega":u"5 días"
  },
  "totales":{
    "total_sin_impuestos":120.89,
    "impuestos":[
      {
        "base_imponible":120.89,
        "valor":14.51,
        "codigo":"2",
        "codigo_porcentaje":"2",
        "tarifa": 12.0
      }
    ],
    "importe_total":135.4
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
      "motivo":u"Interés por mora",
      "valor":120.89
    }
  ]
}}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/debit-notes/<id-notadebito>/reissue",
    headers = cabeceras,
    data = json.dumps(nota_debito))
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

      // Este ejemplo utiliza RestSharp
      // Para instalar anda al menú: tools > Library Package Manager > Package Manager Console
      // copia y pega y presiona enter: Install-Package RestSharp

      var client = new RestClient("https://link.datil.co/");
      var idNotaDebito = "<id-notadebito>"
      var request = new RestRequest("debit-notes/" + idNotaDebito + "/reissue", Method.POST);
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
          ""total_sin_impuestos"":120.89,
          ""impuestos"":[
            {
              ""base_imponible"":0.0,
              ""valor"":0.0,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""0"",
              ""tarifa"": 12.0
            },
            {
              ""base_imponible"":120.89,
              ""valor"":14.51,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""2""
            }
          ],
          ""total"":135.4,
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
                ""base_imponible"":120.89,
                ""valor"":14.51,
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

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el id de la nota de débito recibida al momento de emitirla.

El cuerpo del requerimiento es un objeto nota de débito con los datos corregidos para que pueda ser procesado y autorizado.

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
    "total_sin_impuestos": 120.89,
    "impuestos": [
      {
        "base_imponible": 0.0,
        "valor": 0.0,
        "codigo": "2",
        "codigo_porcentaje": "0",
        "tarifa": 0.0
      },
      {
        "base_imponible": 120.89,
        "valor": 14.51,
        "codigo": "2",
        "codigo_porcentaje": "2",
        "tarifa": 12.0
      }
    ],
    "importe_total": 135.4,
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
          "base_imponible": 120.89,
          "valor": 14.51,
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

Retorna un objeto tipo **[nota de débito](#requerimiento-nota-debito)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la nota de débito. El campo `clave_acceso`
generado también se incluirá como parte de la respuesta. Sí la nota de débito ya está autorizada se retornará un error.
