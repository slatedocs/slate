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
  "items":[
    {
      "base_imponible": 4226.4,
      "codigo": "1",
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
  "items":[
    {
      "base_imponible": 4226.4,
      "codigo": "1",
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
        ""items"":[
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

Para la emisión de una retención se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | integer (min. 1 - max. 999999999 ) | Número de secuencia de la retención. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
sujeto | objeto tipo [persona](#persona) | Información de la persona a quién va dirigida la retención. __Requerido__
periodo_fiscal | string | Mes y año en el siguiente formato MM/AAAA. Ejm: 12/2015 __Requerido__
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
items | vector de objetos tipo [impuesto](#impuesto-retenido) | Listado de impuestos retenidos. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"Email": "contabilidad@empresa.com"}`

#### Impuesto Retenido

Parámetro                        | Tipo   | Descripción
-------------------------------- | ------ |------------
base_imponible                   | float  | Base imponible, máximo 2 cifras decimales. __Requerido__
codigo                           | string | Código de [tipo de impuesto](#tipos-de-impuesto-para-la-retencion). __Requerido__
codigo_porcentaje                | string | [Código del porcentaje](#retencion-de-iva) a aplicar dentro del tipo de impuesto __Requerido__
porcentaje                       | float  | Porcentaje establecido para el impuesto
valor_retenido                   | float  | Valor retenido, multiplicación de la base imponible por el porcentaje de retención, máximo 2 cifras decimales. __Requerido__
fecha_emision_documento_sustento | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
numero_documento_sustento        | string | Número completo del documento sobre el que se aplica la retención. Ejm: 001-002-592738007
tipo_documento_sustento | string | Códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__

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
  "items":[
    {
      "base_imponible": 4226.4,
      "codigo": "1",
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
```

Retorna un objeto tipo **[retención](#requerimiento-retencion)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la retención. El campo `clave_acceso`
generado también se incluirá como parte de la respuesta.

## Emisión de retenciones a partir de XML

`POST /retentions/issue/xml`

### Requerimiento a partir de XML

Para la emisión de un comprobante de retención a partir de un XML se debe enviar contenido del archivo XML como parámetro en el cuerpo del requerimiento en formato JSON. Este XML debe cumplir con la especificación del SRI.

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
xml                 | string  | Contenido del archivo xml. __Requerido__

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/retentions/issue/xml \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{"xml": "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<comprobanteRetencion id=\"comprobante\" version=\"1.0.0\">
  <infoTributaria>
    <ambiente>1</ambiente>
    <tipoEmision>1</tipoEmision>
    <razonSocial>DATILMEDIA S.A.</razonSocial>
    <nombreComercial>Datil</nombreComercial>
    <ruc>1234567890001</ruc>
    <claveAcceso>0405202007123456789000110010010000000012235571911</claveAcceso>
    <codDoc>07</codDoc>
    <estab>001</estab>
    <ptoEmi>001</ptoEmi>
    <secuencial>000000001</secuencial>
    <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
  </infoTributaria>
  <infoCompRetencion>
    <fechaEmision>04/05/2020</fechaEmision>
    <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
    <obligadoContabilidad>NO</obligadoContabilidad>
    <tipoIdentificacionSujetoRetenido>04</tipoIdentificacionSujetoRetenido>
    <razonSocialSujetoRetenido>Juan Perez</razonSocialSujetoRetenido>
    <identificacionSujetoRetenido>0953239092001</identificacionSujetoRetenido>
    <periodoFiscal>05/2020</periodoFiscal>
  </infoCompRetencion>
  <impuestos>
    <impuesto>
      <codigo>1</codigo>
      <codigoRetencion>401CD</codigoRetencion>
      <baseImponible>10.00</baseImponible>
      <porcentajeRetener>0.00</porcentajeRetener>
      <valorRetenido>0.00</valorRetenido>
      <codDocSustento>01</codDocSustento>
      <numDocSustento>001001000000001</numDocSustento>
      <fechaEmisionDocSustento>03/05/2020</fechaEmisionDocSustento>
    </impuesto>
  </impuestos>
  <infoAdicional>
    <campoAdicional nombre="Campo adicional">Información adicional</campoAdicional>
  </infoAdicional>
</comprobanteRetencion>"}'
```

```python
import requests, json

retencion = {
    "xml": '''<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <comprobanteRetencion id=\"comprobante\" version=\"1.0.0\">
      <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>DATILMEDIA S.A.</razonSocial>
        <nombreComercial>Datil</nombreComercial>
        <ruc>1234567890001</ruc>
        <claveAcceso>0405202007123456789000110010010000000012235571911</claveAcceso>
        <codDoc>07</codDoc>
        <estab>001</estab>
        <ptoEmi>001</ptoEmi>
        <secuencial>000000001</secuencial>
        <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
      </infoTributaria>
      <infoCompRetencion>
        <fechaEmision>04/05/2020</fechaEmision>
        <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <tipoIdentificacionSujetoRetenido>04</tipoIdentificacionSujetoRetenido>
        <razonSocialSujetoRetenido>Juan Perez</razonSocialSujetoRetenido>
        <identificacionSujetoRetenido>0953239092001</identificacionSujetoRetenido>
        <periodoFiscal>05/2020</periodoFiscal>
      </infoCompRetencion>
      <impuestos>
        <impuesto>
          <codigo>1</codigo>
          <codigoRetencion>401CD</codigoRetencion>
          <baseImponible>10.00</baseImponible>
          <porcentajeRetener>0.00</porcentajeRetener>
          <valorRetenido>0.00</valorRetenido>
          <codDocSustento>01</codDocSustento>
          <numDocSustento>001001000000001</numDocSustento>
          <fechaEmisionDocSustento>03/05/2020</fechaEmisionDocSustento>
        </impuesto>
      </impuestos>
      <infoAdicional>
        <campoAdicional nombre="Campo adicional">Información adicional</campoAdicional>
      </infoAdicional>
    </comprobanteRetencion>'''
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/retentions/issue/xml",
    headers = cabeceras,
    data = json.dumps(retencion))
```

> #### Respuesta de ejemplo

```json
{
    "secuencial": "000000001",
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
    "sujeto": {
        "identificacion": "0953239092001",
        "razon_social": "Juan Perez",
        "tipo_identificacion": "04"
    },
    "es_valida": true,
    "periodo_fiscal": "05/2020",
    "id": "41f5188e0256420cbe9e447db99c9753",
    "informacion_adicional": {
        "Campo adicional": "Información adicional"
    },
    "ambiente": "1",
    "tipo_emision": 1,
    "items": [
        {
            "porcentaje": 0.0,
            "codigo_porcentaje": "401CD",
            "fecha_emision_documento_sustento": "2020-05-03T00:00:00-05:19",
            "numero_documento_sustento": "001-001-000000001",
            "codigo": "1",
            "tipo_documento_sustento": "01",
            "base_imponible": 10.0,
            "valor_retenido": 0.0
        }
    ],
    "clave_acceso": "0405202007123456789000110010010000000012235571911"
}
```

## Consulta de un Comprobante de Retención

Consulta una retención para obtener toda la información del comprobante, incluyendo
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
      var idNotaCredito = "<id-retencion>";
      var request = new RestRequest("invoices/" + idNotaCredito, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<receipt-id>` por el `id` de la retención que necesitas consultar.

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
    "items":[
      {
        "base_imponible": 4226.4,
        "codigo": "1",
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
    "informacion_adicional": {},
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
secuencial | string | Número de secuencia de la retención.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
items | vector de objetos tipo [impuesto](#impuesto-retenido) | Listado de impuestos retenidos. __Requerido__
sujeto | objeto [persona](#persona) | Información del sujeto al que se le retiene.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

## Re-emisión de una retención

### Operación

`POST /retentions/:id/reissue`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/retentions/<id-retencion>/reissue \
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
  "items":[
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
  "items":[
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
    "https://link.datil.co/retentions/<id-retencion>/reissue",
    headers = cabeceras,
    data = json.dumps(retencion))
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
      var idRetention = "<id-retencion>"
      var request = new RestRequest("retentions/" + idRetention + "/reissue", Method.POST);
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
        ""items"":[
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

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el id de la retención recibida al momento de emitirla.

El cuerpo del requerimiento es un objeto retención con los datos corregidos para que pueda ser procesado y autorizado.

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

Retorna un objeto tipo **[retención](#requerimiento-retencion)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la retención. El campo `clave_acceso`
generado también se incluirá como parte de la respuesta. Sí el comprobante de retención ya está autorizada se retornará un error.
