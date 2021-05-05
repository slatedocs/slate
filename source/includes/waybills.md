# Guías de Remisión

## Emisión de una guía de remisión

### Operación

`POST /waybills/issue`

<h3 id="requerimiento-guia-remision">Requerimiento</h3>

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
  "direccion_partida": "Victor Emilio Estrada",
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
  "direccion_partida": "Victor Emilio Estrada",
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
      var request = new RestRequest("waybills/issue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");

      request.AddBody(@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":50,
        ""fecha_inicio_transporte"":""2015-02-28T11:28:56.782Z"",
        ""fecha_fin_transporte"":""2015-02-28T11:28:56.782Z"",
        ""direccion_partida"": ""Victor Emilio Estrada"",
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

Para la emisión de una guía de remisión se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la guía de remisión. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
fecha_inicio_transporte | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
fecha_fin_transporte | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
direccion_partida | string | Dirección de partida
transportista | objeto tipo [transportista](#transportista) | Información de la persona que transporta la carga
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
destinatarios | listado de objetos tipo [destinatario](#destinatario) | Descripción de destinatarios y la mercadería transportada. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"email": "juan@empresa.com", "Carga asegurada por": "Securitas"}`

#### Destinatario

Parámetro | Tipo | Descripción
--------- | ------- | -----------------
razon_social | string | Razón social del comprador. Máximo 300 caracteres. __Requerido__
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificación) de tipos de identificación __Requerido__
email | string | Correo electrónico del destinatario.
telefono | string | Teléfono.
direccion | string | Dirección
ruta | string | Ruta de transporte. Máximo 300 caracteres.
documento_aduanero_unico | string | Máximo 20 caracteres.
fecha_emision_documento_sustento | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
numero_documento_sustento | string | Número completo del documento que detalla la mercadería a transportar. Normalmente facturas. Ejm: 001-002-010023098 __Requerido__
codigo_establecimiento_destino | string | Número establecimiento que recibe la entrega. Ejm: 002 __Requerido__
tipo_documento_sustento | string | Ver códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__
motivo_traslado | string | Motivo del traslado. Ejm: Entrega de mercadería. __Requerido__
numero_autorizacion_documento_sustento | string | Autorización del documento de sustento.
items | arreglo de objetos tipo [item destinatario](#item-destinatario) | Items transportados

#### Item destinatario

Parámetro | Tipo | Descripción
--------- | ---- |-----------
descripcion | string | Descripción del ítem. __Requerido__
codigo_principal | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
codigo_auxiliar | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
cantidad | float (hasta 6 cifras decimales) | Cantidad de items. __Requerido__
detalles_adicionales | object | Diccionario de datos de carácter adicional. Ejemplo:<br><code>{"marca": "Ferrari", "chasis": "UANEI832-NAU101"}</code>

#### Transportista

Parámetro | Tipo | Descripción
--------- | ---- |-----------
razon_social | string | Razón social. Máximo 300 caracteres. __Requerido__
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificación) de tipos de identificación __Requerido__
email | string | Correo electrónico. Máximo 300 caracteres. __Requerido__
telefono | string | Teléfono.
direccion | string | Dirección
placa | string | Placa del vehículo

### Respuesta

> #### Respuesta de ejemplo

```json
{
  "id": "abcfde09817263847cdaef8493018fef",
  "clave_acceso":"2802201501091000000000120010010000100451993736618",
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
```

Retorna un objeto tipo **[guía de remisión](#requerimiento-guia-remision)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la guía de remisión. El campo `clave_acceso`
generado también se incluirá como parte de la respuesta.

## Emisión de una guía de remisión a partir de XML

`POST /waybills/issue/xml`

### Requerimiento a partir de XML

Para la emisión de una guia de remisión a partir de un XML se debe enviar contenido del archivo XML como parámetro en el cuerpo del requerimiento en formato JSON. Este XML debe cumplir con la especificación del SRI.

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
xml                 | string  | Contenido del archivo xml. __Requerido__

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/waybills/issue/xml \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{"xml": "<?xml version=\"1.1.0\" encoding=\"UTF-8\">
<guiaRemision id=\"comprobante\" version=\"1.1.0\">
  <infoTributaria>
    <ambiente>1</ambiente>
    <tipoEmision>1</tipoEmision>
    <razonSocial>DATILMEDIA S.A.</razonSocial>
    <nombreComercial>Datil</nombreComercial>
    <ruc>1234567890001</ruc>
    <claveAcceso>0405202006123456789000110010010000000012235571913</claveAcceso>
    <codDoc>06</codDoc>
    <estab>001</estab>
    <ptoEmi>001</ptoEmi>
    <secuencial>000000001</secuencial>
    <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
  </infoTributaria>
  <infoGuiaRemision>
    <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
    <dirPartida>Calle única Numero 987</dirPartida>
    <razonSocialTransportista>Juan Perez</razonSocialTransportista>
    <tipoIdentificacionTransportista>05</tipoIdentificacionTransportista>
    <rucTransportista>0987654321</rucTransportista>
    <obligadoContabilidad>NO</obligadoContabilidad>
    <fechaIniTransporte>04/05/2020</fechaIniTransporte>
    <fechaFinTransporte>05/05/2020</fechaFinTransporte>
    <placa>GSM-0123</placa>
  </infoGuiaRemision>
  <destinatarios>
    <destinatario>
      <identificacionDestinatario>0953239092001</identificacionDestinatario>
      <razonSocialDestinatario>Santacruz Hernandez Anni Rosa</razonSocialDestinatario>
      <dirDestinatario>Solar 23</dirDestinatario>
      <motivoTraslado>Motivo del traslado</motivoTraslado>
      <codEstabDestino>001</codEstabDestino>
      <ruta>GYE - UIO</ruta>
      <codDocSustento>01</codDocSustento>
      <numDocSustento>001-001-000000001</numDocSustento>
      <fechaEmisionDocSustento>01/05/2020</fechaEmisionDocSustento>
      <detalles>
        <detalle>
          <codigoInterno>AGDAS-001</codigoInterno>
          <descripcion>Agua purificada</descripcion>
          <cantidad>1.000000</cantidad>
          <detallesAdicionales/>
        </detalle>
      </detalles>
    </destinatario>
  </destinatarios>
  <infoAdicional>
    <campoAdicional nombre=\"Campo Adicional\">Informacion Adicional</campoAdicional>
  </infoAdicional>
</guiaRemision>"}'
```

```python
import requests, json

guia_remision = {
    "xml": '''<?xml version=\"1.1.0\" encoding=\"UTF-8\">
    <guiaRemision id=\"comprobante\" version=\"1.1.0\">
      <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>DATILMEDIA S.A.</razonSocial>
        <nombreComercial>Datil</nombreComercial>
        <ruc>1234567890001</ruc>
        <claveAcceso>0405202006123456789000110010010000000012235571913</claveAcceso>
        <codDoc>06</codDoc>
        <estab>001</estab>
        <ptoEmi>001</ptoEmi>
        <secuencial>000000001</secuencial>
        <dirMatriz>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirMatriz>
      </infoTributaria>
      <infoGuiaRemision>
        <dirEstablecimiento>Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras</dirEstablecimiento>
        <dirPartida>Calle única Numero 987</dirPartida>
        <razonSocialTransportista>Juan Perez</razonSocialTransportista>
        <tipoIdentificacionTransportista>05</tipoIdentificacionTransportista>
        <rucTransportista>0987654321</rucTransportista>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <fechaIniTransporte>04/05/2020</fechaIniTransporte>
        <fechaFinTransporte>05/05/2020</fechaFinTransporte>
        <placa>GSM-0123</placa>
      </infoGuiaRemision>
      <destinatarios>
        <destinatario>
          <identificacionDestinatario>0953239092001</identificacionDestinatario>
          <razonSocialDestinatario>Santacruz Hernandez Anni Rosa</razonSocialDestinatario>
          <dirDestinatario>Solar 23</dirDestinatario>
          <motivoTraslado>Motivo del traslado</motivoTraslado>
          <codEstabDestino>001</codEstabDestino>
          <ruta>GYE - UIO</ruta>
          <codDocSustento>01</codDocSustento>
          <numDocSustento>001-001-000000001</numDocSustento>
          <fechaEmisionDocSustento>01/05/2020</fechaEmisionDocSustento>
          <detalles>
            <detalle>
              <codigoInterno>AGDAS-001</codigoInterno>
              <descripcion>Agua purificada</descripcion>
              <cantidad>1.000000</cantidad>
              <detallesAdicionales/>
            </detalle>
          </detalles>
        </destinatario>
      </destinatarios>
      <infoAdicional>
        <campoAdicional nombre="Campo Adicional">Informacion Adicional</campoAdicional>
      </infoAdicional>
    </guiaRemision>'''
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/waybills/issue/xml",
    headers = cabeceras,
    data = json.dumps(guia_remision))
```

> #### Respuesta de ejemplo

```json
{
    "secuencial": "000000001",
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
    "direccion_partida": "Calle única Numero 987",
    "transportista": {
        "tipo_identificacion": "05",
        "razon_social": "Juan Perez",
        "direccion": "",
        "placa": "GSM-0123",
        "identificacion": "0987654321",
        "telefono": "",
        "email": ""
    },
    "fecha_fin_transporte": "2020-05-05T00:00:00-05:19",
    "destinatarios": [
        {
            "fecha_emision_documento_sustento": "2020-05-01T00:00:00-05:19",
            "email": "",
            "ruta": "GYE - UIO",
            "identificacion": "0953239092001",
            "motivo_traslado": "Motivo del traslado",
            "documento_aduanero_unico": "",
            "numero_documento_sustento": "001-001-000000001",
            "tipo_identificacion": "05",
            "codigo_establecimiento_destino": "001",
            "razon_social": "Santacruz Hernandez Anni Rosa",
            "numero_autorizacion_documento_sustento": "",
            "direccion": "Solar 23",
            "tipo_documento_sustento": "01",
            "items": [
                {
                    "codigo_auxiliar": "",
                    "descripcion": "Agua purificada",
                    "codigo_principal": "AGDAS-001",
                    "cantidad": 1.0,
                    "detalles_adicionales": {}
                }
            ],
            "telefono": ""
        }
    ],
    "id": "a8ea19c75f2546b883c4a00e9e68e1b9",
    "fecha_inicio_transporte": "2020-05-04T00:00:00-05:19",
    "informacion_adicional": {
        "Campo Adicional": "Informacion Adicional"
    },
    "ambiente": "1",
    "tipo_emision": 1,
    "clave_acceso": "0405202006123456789000110010010000000012235571913"
}
```

## Consulta de una guía de remisión

Consulta una guía de remisión para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emisión),
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /waybills/<receipt-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/waybills/<id-guiaremision> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/waybills/<id-guiaremision>',
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
      var idNotaCredito = "<id-guiaremision>";
      var request = new RestRequest("invoices/" + idNotaCredito, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<receipt-id>` por el `id` de la guía de remisión que necesitas consultar.

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
secuencial | string | Número de secuencia de la guía de remisión. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
fecha_inicio_transporte | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
fecha_fin_transporte | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
direccion_partida | string | Dirección de partida
transportista | objeto tipo [Transportista](#transportista) | Información de la persona que transporta la carga
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
destinatarios | listado de objetos tipo [destinatario](#destinatario) | Descripción de destinatarios y la mercadería transportada. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6)
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"email": "juan@empresa.com", "Carga asegurada por": "Securitas"}`

## Re-emisión de una guía de remisión

### Operación

`POST /waybills/:id/reissue`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/waybills/<id-guiaremision>/reissue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":50,
  "fecha_inicio_transporte":"2015-02-28T11:28:56.782Z",
  "fecha_fin_transporte":"2015-02-28T11:28:56.782Z",
  "direccion_partida": "Victor Emilio Estrada",
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
  "direccion_partida": "Victor Emilio Estrada",
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
    "https://link.datil.co/waybills/<id-guiaremision>/reissue",
    headers = cabeceras,
    data = json.dumps(guia_remision))
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
      var idGuiaRemision = "<id-guiaremision>"
      var request = new RestRequest("waybills/" + idGuiaRemision + "/reissue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");

      request.AddBody(@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":50,
        ""fecha_inicio_transporte"":""2015-02-28T11:28:56.782Z"",
        ""fecha_fin_transporte"":""2015-02-28T11:28:56.782Z"",
        ""direccion_partida"": ""Victor Emilio Estrada"",
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

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el id de la retención recibida al momento de emitirla.

El cuerpo del requerimiento es un objeto retención con los datos corregidos para que pueda ser procesado y autorizado.

### Respuesta

> #### Respuesta de ejemplo

```json
{
  "id": "abcfde09817263847cdaef8493018fef",
  "clave_acceso":"2802201501091000000000120010010000100451993736618",
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
```

Retorna un objeto tipo **[guía de remisión](#requerimiento-guia-remision)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la guía de remisión. El campo `clave_acceso`
generado también se incluirá como parte de la respuesta. Sí la guía de remisión ya está autorizada se retornará un error.
