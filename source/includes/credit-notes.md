# Notas de Crédito

## Emisión de una nota de crédito

### Operación

`POST /credit-notes/issue`

<h3 id="requerimiento-nota-credito">Requerimiento</h3>

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/credit-notes/issue \
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
    "importe_total":4882.68
  },
  "fecha_emision_documento_modificado": "2015-02-27T11:28:56.782Z",
  "numero_documento_modificado": "001-002-000058473",
  "tipo_documento_modificado": "01",
  "motivo": "Devolución de produtos",
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.008907,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4359.54,
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

nota_credito = {
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
    "importe_total":4882.68
  },
  "fecha_emision_documento_modificado": "2015-02-27T11:28:56.782Z",
  "numero_documento_modificado": "001-002-000058473",
  "tipo_documento_modificado": "01",
  "motivo": "Devolución de produtos",
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
      "precio_unitario": 7.008907,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4359.54,
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
    "https://link.datil.co/credit-notes/issue",
    headers = cabeceras,
    data = json.dumps(nota_credito))
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
      var request = new RestRequest("credit-notes/issue", Method.POST);
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
          ""importe_total"":4882.68
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
            ""precio_unitario"": 7.008907,
            ""descripcion"": ""Zanahoria granel  50 Kg."",
            ""precio_total_sin_impuestos"": 4359.54,
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

Para la emisión de una nota de crédito se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | integer (min. 1 - max. 999999999 ) | Número de secuencia de la nota de crédito. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
comprador | objeto tipo [persona](#persona) | Información del comprador. __Requerido__
totales | objeto tipo [totales](#totales-nota-credito) | Listado de totales. __Requerido__
fecha_emision_documento_modificado | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
numero_documento_modificado | string | Número completo del documento que se está afectando. Normalmente facturas. Ejm: 001-002-010023098 __Requerido__
tipo_documento_modificado | string | Códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__
motivo | string | Motivo de la operación. Ejm: Devolución de producto. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la nota de crédito. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`

<h4 id="totales-nota-credito">Totales</h4>

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

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
    "importe_total": 4882.68
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
      "precio_unitario": 7.008907,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4359.54,
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

## Emisión de una nota de crédito a partir de XML

`POST /credit-notes/issue/xml`

### Requerimiento a partir de XML

Para la emisión de una nota de crédito a partir de un XML se debe enviar contenido del archivo XML como parámetro en el cuerpo del requerimiento en formato JSON. Este XML debe cumplir con la especificación del SRI.

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
xml                 | string  | Contenido del archivo xml. __Requerido__

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/credit-notes/issue/xml \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{"xml": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<notaCredito id=\"comprobante\" version=\"1.1.0\">
  <infoTributaria>
    <ambiente>1</ambiente>
    <tipoEmision>1</tipoEmision>
    <razonSocial>DATILMEDIA S.A.</razonSocial>
    <nombreComercial>Datil</nombreComercial>
    <ruc>1234567890001</ruc>
    <claveAcceso>0405202004123456789000110010010000000062235571918</claveAcceso>
    <codDoc>04</codDoc>
    <estab>001</estab>
    <ptoEmi>001</ptoEmi>
    <secuencial>000000006</secuencial>
    <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
  </infoTributaria>
  <infoNotaCredito>
    <fechaEmision>04/05/2020</fechaEmision>
    <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
    <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
    <razonSocialComprador>Juan Pérez</razonSocialComprador>
    <identificacionComprador>0953239092001</identificacionComprador>
    <obligadoContabilidad>NO</obligadoContabilidad>
    <codDocModificado>01</codDocModificado>
    <numDocModificado>001-002-000000001</numDocModificado>
    <fechaEmisionDocSustento>04/05/2020</fechaEmisionDocSustento>
    <totalSinImpuestos>0.45</totalSinImpuestos>
    <valorModificacion>0.68</valorModificacion>
    <moneda>DOLAR</moneda>
    <totalConImpuestos>
      <totalImpuesto>
        <codigo>3</codigo>
        <codigoPorcentaje>3080</codigoPorcentaje>
        <baseImponible>0.45</baseImponible>
        <valor>0.16</valor>
      </totalImpuesto>
      <totalImpuesto>
        <codigo>2</codigo>
        <codigoPorcentaje>2</codigoPorcentaje>
        <baseImponible>0.61</baseImponible>
        <valor>0.07</valor>
      </totalImpuesto>
    </totalConImpuestos>
    <motivo>Motivo de la nota de credito</motivo>
  </infoNotaCredito>
  <detalles>
    <detalle>
      <codigoInterno>AGDAS-001</codigoInterno>
      <descripcion>Agua purificada</descripcion>
      <cantidad>1.000000</cantidad>
      <precioUnitario>0.450000</precioUnitario>
      <descuento>0.00</descuento>
      <precioTotalSinImpuesto>0.45</precioTotalSinImpuesto>
      <impuestos>
        <impuesto>
          <codigo>2</codigo>
          <codigoPorcentaje>2</codigoPorcentaje>
          <tarifa>12.00</tarifa>
          <baseImponible>0.61</baseImponible>
          <valor>0.07</valor>
        </impuesto>
        <impuesto>
          <codigo>3</codigo>
          <codigoPorcentaje>3080</codigoPorcentaje>
          <tarifa>35.00</tarifa>
          <baseImponible>0.45</baseImponible>
          <valor>0.16</valor>
        </impuesto>
      </impuestos>
    </detalle>
  </detalles>
  <infoAdicional>
    <campoAdicional nombre=\"Campo Adicional\">Informacion Adicional</campoAdicional>
  </infoAdicional>
</notaCredito>"}'
```

```python
import requests, json

nota_credito = {
    "xml": '''<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <notaCredito id=\"comprobante\" version=\"1.1.0\">
      <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>DATILMEDIA S.A.</razonSocial>
        <nombreComercial>Datil</nombreComercial>
        <ruc>1234567890001</ruc>
        <claveAcceso>0405202004123456789000110010010000000062235571918</claveAcceso>
        <codDoc>04</codDoc>
        <estab>001</estab>
        <ptoEmi>001</ptoEmi>
        <secuencial>000000006</secuencial>
        <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
      </infoTributaria>
      <infoNotaCredito>
        <fechaEmision>04/05/2020</fechaEmision>
        <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
        <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
        <razonSocialComprador>Juan Pérez</razonSocialComprador>
        <identificacionComprador>0953239092001</identificacionComprador>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <codDocModificado>01</codDocModificado>
        <numDocModificado>001-002-000000001</numDocModificado>
        <fechaEmisionDocSustento>04/05/2020</fechaEmisionDocSustento>
        <totalSinImpuestos>0.45</totalSinImpuestos>
        <valorModificacion>0.68</valorModificacion>
        <moneda>DOLAR</moneda>
        <totalConImpuestos>
          <totalImpuesto>
            <codigo>3</codigo>
            <codigoPorcentaje>3080</codigoPorcentaje>
            <baseImponible>0.45</baseImponible>
            <valor>0.16</valor>
          </totalImpuesto>
          <totalImpuesto>
            <codigo>2</codigo>
            <codigoPorcentaje>2</codigoPorcentaje>
            <baseImponible>0.61</baseImponible>
            <valor>0.07</valor>
          </totalImpuesto>
        </totalConImpuestos>
        <motivo>Motivo de la nota de credito</motivo>
      </infoNotaCredito>
      <detalles>
        <detalle>
          <codigoInterno>AGDAS-001</codigoInterno>
          <descripcion>Agua purificada</descripcion>
          <cantidad>1.000000</cantidad>
          <precioUnitario>0.450000</precioUnitario>
          <descuento>0.00</descuento>
          <precioTotalSinImpuesto>0.45</precioTotalSinImpuesto>
          <impuestos>
            <impuesto>
              <codigo>2</codigo>
              <codigoPorcentaje>2</codigoPorcentaje>
              <tarifa>12.00</tarifa>
              <baseImponible>0.61</baseImponible>
              <valor>0.07</valor>
            </impuesto>
            <impuesto>
              <codigo>3</codigo>
              <codigoPorcentaje>3080</codigoPorcentaje>
              <tarifa>35.00</tarifa>
              <baseImponible>0.45</baseImponible>
              <valor>0.16</valor>
            </impuesto>
          </impuestos>
        </detalle>
      </detalles>
      <infoAdicional>
        <campoAdicional nombre="Campo Adicional">Informacion Adicional</campoAdicional>
      </infoAdicional>
    </notaCredito>'''
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/credit-notes/issue/xml",
    headers = cabeceras,
    data = json.dumps(nota_credito))
```

> #### Respuesta de ejemplo

```json
{
    "secuencial": "000000006",
    "fecha_emision": "2020-05-04T00:00:00-05:19",
    "emisor": {
        "ruc": "1234567890001",
        "razon_social": "DATILMEDIA S.A.",
        "nombre_comercial": "Datil",
        "contribuyente_especial": "",
        "direccion": "Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras",
        "obligado_contabilidad": "NO",
        "establecimiento": {
            "punto_emision": "001",
            "codigo": "001",
            "direccion": "Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras"
        },
        "email": "devops@datilmedia.com"
    },
    "fecha_emision_documento_modificado": "2020-05-04T00:00:00-05:00",
    "es_valida": true,
    "moneda": "USD",
    "id": "21da58fa6ecf4827ae002b8c641e1b00",
    "informacion_adicional": {
        "Campo Adicional": "Informacion Adicional"
    },
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": 0.45,
        "importe_total": 0.68,
        "impuestos": [
            {
                "codigo": "3",
                "codigo_porcentaje": "3080",
                "base_imponible": 0.45,
                "valor": 0.16
            },
            {
                "codigo": "2",
                "codigo_porcentaje": "2",
                "base_imponible": 0.61,
                "valor": 0.07
            }
        ]
    },
    "comprador": {
        "identificacion": "0953239092001",
        "razon_social": "Juan Pérez",
        "direccion": "",
        "tipo_identificacion": "04"
    },
    "tipo_emision": 1,
    "items": [
        {
            "precio_unitario": 0.45,
            "descripcion": "Agua purificada",
            "precio_total_sin_impuestos": 0.45,
            "impuestos": [
                {
                    "codigo": "2",
                    "tarifa": 12.0,
                    "codigo_porcentaje": "2",
                    "base_imponible": 0.61,
                    "valor": 0.07
                },
                {
                    "codigo": "3",
                    "tarifa": 35.0,
                    "codigo_porcentaje": "3080",
                    "base_imponible": 0.45,
                    "valor": 0.16
                }
            ],
            "detalles_adicionales": {},
            "cantidad": 1.0,
            "codigo_auxiliar": "",
            "descuento": 0.0,
            "codigo_principal": "AGDAS-001"
        }
    ],
    "tipo_documento_modificado": "01",
    "numero_documento_modificado": "001-002-000000001",
    "clave_acceso": "0405202004123456789000110010010000000062235571918",
    "motivo": "Motivo de la nota de credito"
}
````

## Consulta de una nota de crédito

Consulta una nota de crédito para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emisión),
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /credit-notes/<invoice-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/credit-notes/<id-notacredito> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/credit-notes/<id-notacredito>',
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
secuencial | string | Número de secuencia de la nota de crédito.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales-nota-de-crédito) | Listado de totales.
comprador | objeto tipo [persona](#persona) | Información del comprador.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la nota de crédito.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`


## Re-emisión de una nota de crédito

### Operación

`POST /credit-notes/:id/reissue`

### Requerimiento

```shell
curl -v https://link.datil.co/credit-notes/<id-notacredito>/reissue \
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
    "importe_total":4882.68
  },
  "fecha_emision_documento_modificado": "2015-02-27T11:28:56.782Z",
  "numero_documento_modificado": "001-002-000058473",
  "tipo_documento_modificado": "01",
  "motivo": "Devolución de produtos",
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.008907,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4359.54,
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

nota_credito = {
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
    "importe_total":4882.68
  },
  "fecha_emision_documento_modificado": "2015-02-27T11:28:56.782Z",
  "numero_documento_modificado": "001-002-000058473",
  "tipo_documento_modificado": "01",
  "motivo": "Devolución de produtos",
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
      "precio_unitario": 7.008907,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4359.54,
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
    "https://link.datil.co/credit-notes/<id-notacredito>/reissue",
    headers = cabeceras,
    data = json.dumps(nota_credito))
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
      var idNotaCredito = "<id-notacredito>";
      var request = new RestRequest("credit-notes/" + idNotaCredito + "/reissue", Method.POST);
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
          ""importe_total"":4882.68
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
            ""precio_unitario"": 7.008907,
            ""descripcion"": ""Zanahoria granel  50 Kg."",
            ""precio_total_sin_impuestos"": 4359.54,
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

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el id de la nota de crédito recibida al momento de emitirla.

El cuerpo del requerimiento es un objeto nota de crédito con los datos corregidos para que pueda ser procesado y autorizado.

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
    "importe_total": 4882.68
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
      "precio_unitario": 7.008907,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4359.54,
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
generado también se incluirá como parte de la respuesta. Sí la nota de crédito ya está autorizada se retornará un error.
