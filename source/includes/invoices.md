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
  "fecha_emision":"2019-10-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad": true,
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
  "info_adicional":[
    {
      "nombre": "Tiempo de entrega",
      "valor": "5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.008907,
      "descuento": 0,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-31",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}'
```

```python
import requests, json

factura = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-10-28T11:28:56.782Z",
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
  "moneda":"USD",
  "info_adicional":[
    {
      "nombre":"Tiempo de entrega",
      "valor":"5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
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
      "precio_unitario": 7.008907,
      "descuento":0,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "notas": "Depositado en cuenta corriente",
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      }
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/issue",
    headers = cabeceras,
    data = json.dumps(factura))
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
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":148,
        ""fecha_emision"":""2019-09-28T11:28:56.782Z"",
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
            ""codigo_principal"":""ZNC"",
            ""codigo_auxiliar"": ""050"",
            ""precio_unitario"": 7.01,
            ""descuento"": 0,
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
            ""descuento"": 0.0,
            ""unidad_medida"": ""Kilos""
          }
      ],
        ""valor_retenido_iva"": 70.40,
        ""valor_retenido_renta"": 29.60,
        ""credito"": {
            ""fecha_vencimiento"": ""2015-03-28"",
            ""monto"": 1900.00
        },
      ""pagos"": [
        {
          ""medio"": ""cheque"",
          ""total"": 2882.68,
          ""notas"": ""Depositado en cuenta corriente"",
          ""propiedades"": {
            ""numero"": ""1234567890"",
            ""banco"": ""Banco Pacífico""
          }
        }
      ],
      ""exportacion"": {
        ""incoterm"": {
          ""termino"": ""CIF"",
          ""lugar"": ""Guayaquil"",
          ""total_sin_impuestos"": 10.25
        },
        ""origen"": {
          ""codigo_pais"":""EC"",
          ""puerto"": ""Guayaquil""
        },
        ""destino"": {
          ""codigo_pais"":""CN"",
          ""puerto"": ""China""
        },
        ""codigo_pais_adquisicion"": ""EC"",
        ""totales"": {
          ""flete_internacional"": 1000.00,
          ""seguro_internacional"": 200.00,
          ""gastos_aduaneros"": 800,
          ""otros_gastos_transporte"": 350.00
        }
      }");
      request.AddParameter("application/json", body, ParameterType.RequestBody);
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
secuencial | integer (min. 1 - max. 999999999 ) | Número de secuencia de la factura. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
guia_remision | string (17 caracteres) | Número de guía de remisión asociada a esta factura en formato 001-002-000000003 ([0-9]{3}-[0-9]{3}-[0-9]{9})
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
totales | objeto tipo [totales](#totales) | Listado de totales. __Requerido__
comprador | objeto tipo [persona](#persona) | Información del comprador. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string (49 caracteres) | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
info_adicional | Listado de objectos de tipo [información adicional](#info-adicional) | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` [{"nombre":"plan", "valor":"Inicial", "nombre":"vigencia", "valor":"1 mes"}]`
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}` <span style="color: red">__Obsoleto__</span> *utiliza el parámetro info_adicional*
valor_retenido_iva | float | Valor retenido por IVA
valor_retenido_renta | float | Valor retenido por renta
retenciones | Listado de objetos de tipo [retencion](#retencion-de-factura) | Retenciones incluídas en la factura. Caso específico de Retenciones en la Comercializadores / Distribuidores de derivados del Petróleo y Retención presuntiva de IVA a los Editores, Distribuidores y Voceadores que participan en la comercialización de periódicos y/o revistas.
pagos | Listado de objetos tipo [pagos](#pagos) | Listado de formas de pago aplicables a la factura. __Requerido__
credito | Objeto de tipo [credito](#credito) | Información del crédito directo otorgado al cliente.
compensaciones | Objeto de tipo [compensación solidaria](#compensacion-solidaria) | __Solo__ para las provincias de Manabí y Esmeraldas según la Ley Orgánica de Solidaridad y de Corresponsabilidad Ciudadana
exportacion | Objeto de tipo [exportacion](#exportacion) | __Solo__ para facturas de exportación

#### Totales

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |------------
total_sin_impuestos | float (hasta 2 cifras decimales) | Total antes de los impuestos. __Requerido__
descuento_adicional | float (hasta 2 cifras decimales) | Descuento aplicado al subtotal de la factura expresado en valor monetario.
descuento           | float (hasta 2 cifras decimales) | Suma de los descuentos de cada ítem y del descuento adicional. __Requerido__
propina             | float (hasta 2 cifras decimales) | Propina total, llamado también servicio. __Requerido__
importe_total       | float (hasta 2 cifras decimales) | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

#### Pagos

Parámetro   | Tipo         | Descripción
----------- | ------------ | ----------
fecha       | string       | Fecha de recepción del pago en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es especificado se utiliza la fecha y hora actual.
medio       | string       | Código del [tipo de forma de pago](#tipos-de-forma-de-pago). __Requerido__
total       | float        | Total aplicable a la forma de pago especificada. __Requerido__
notas       | string (máximo 300 caracteres) | Texto abierto que te permite registrar cualquier nota relacionada al pago.
propiedades | objeto       | Información adicional adjunta al pago en forma de diccionario. Ejemplo:<br>` {"plazo": "30", "unidad_tiempo": "dias"}`

#### Crédito

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
fecha_vencimiento   | string  | Fecha de vencimiento en formato AAAA-MM-DD, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
monto               | float   | Monto otorgado de crédito. __Requerido__

#### Compensación solidaria

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
codigo   | int  | Código del porcentaje de IVA . __Requerido__
tarifa   | int   | Porcentaje de compensación. __Requerido__
valor   | float   | Valor de la compensación. __Requerido__

#### Exportación

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
incoterm   | Objeto de tipo [incoterm](#incoterm)  | Información del Incoterm . __Requerido__
origen   | Objeto de tipo [origen de exportación](#origen-de-exportaci-n)  | Origen de la exportación . __Requerido__
destino   | Objeto de tipo [destino de exportación](#destino-de-exportaci-n)  | Destino de la exportación. __Requerido__
codigo_pais_adquisicion   | string  | Código de dos caracteres del país de adquisición según [ISO_3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)
totales | Objecto de tipo [totales de exportación](#totales-de-exportaci-n) | Totales de la exportación

#### Incoterm

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
termino   | string  | Código de 3 letras correspondiente al [Incoterm](http://www.proecuador.gob.ec/exportadores/requisitos-para-exportar/incoterms/). __Requerido__
lugar   | string  | Lugar Incoterm. __Requerido__
total_sin_impuestos   | string  | Total sin impuestos del incoterm. __Requerido__

#### Origen de exportación

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
codigo_pais  | string  | Código  de dos caracteres del país origen según [ISO_3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements). __Requerido__
puerto   | string  | Puerto de origen . __Requerido__

#### Destino de exportación

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
codigo_pais  | string  | Código de dos caracteres del país destino según [ISO_3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)
puerto   | string  | Puerto de destino. . __Requerido__

#### Totales de exportación

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
flete_internacional   | float  | Total del flete internacional.
seguro_internacional   | float  | Total del seguro internacional.
gastos_aduaneros   | float  | Total de los gastos aduaneros.
otros_gastos_transporte   | float  | Total de otros gastos de transporte.


<aside class="notice">
La información de crédito será enviada como forma de pago al Servicio de
Rentas Internas (SRI) con el código 01, Sin utilización del sistema financiero.
</aside>

### Respuesta

> #### Respuesta de ejemplo

```json
{
  "id": "abcdef09876123cea56784f01",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-09-28T11:28:56.782Z",
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos":[
        {
          "base_imponible": 4360.22,
          "valor": 523.14,
          "tarifa": 12.0,
          "codigo": "2",
          "codigo_porcentaje": "2"
        }
      ],
      "detalles_adicionales": {
        "Peso": "5000.0000"
      },
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
```

Retorna un objeto tipo **[factura](#requerimiento)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.


## Emisión de una factura a partir de XML

### Operación

`POST /invoices/issue/xml`

### Requerimiento a partir de XML

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/issue/xml \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{"xml" : "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<factura id= \"comprobante\" version= \"1.1.0\">
    <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>Angel Arreaga</razonSocial>
        <nombreComercial>XYZ</nombreComercial>
        <ruc>0953239092002</ruc>
        <claveAcceso>None</claveAcceso>
        <codDoc>01</codDoc>
        <estab>002</estab>
        <ptoEmi>003</ptoEmi>
        <secuencial>000098431</secuencial>
        <dirMatriz>Mucho Lote 1</dirMatriz>
    </infoTributaria>
    <infoFactura>
        <fechaEmision>17/10/2019</fechaEmision>
        <dirEstablecimiento>Mucho Lote 1</dirEstablecimiento>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
        <razonSocialComprador>DATILMEDIA S.A.</razonSocialComprador>
        <identificacionComprador>0992712554001</identificacionComprador>
        <direccionComprador>Entre Guayacanes e Higueras, Guayaquil, Ecuador</direccionComprador>
        <totalSinImpuestos>12.00</totalSinImpuestos>
        <totalDescuento>0.00</totalDescuento>
        <totalConImpuestos>
            <totalImpuesto>
                <codigo>2</codigo>
                <codigoPorcentaje>2</codigoPorcentaje>
                <baseImponible>12.00</baseImponible>
                <valor>1.44</valor>
            </totalImpuesto>
        </totalConImpuestos>
        <propina>0.00</propina>
        <importeTotal>13.44</importeTotal>
        <moneda>DOLAR</moneda>
    </infoFactura>
    <detalles>
        <detalle>
            <codigoPrincipal>105AP1</codigoPrincipal>
            <descripcion>Aceite Protector Madera</descripcion>
            <cantidad>1.000000</cantidad>
            <precioUnitario>12.000000</precioUnitario>
            <descuento>0.00</descuento>
            <precioTotalSinImpuesto>12.00</precioTotalSinImpuesto>
            <impuestos>
                <impuesto>
                    <codigo>2</codigo>
                    <codigoPorcentaje>2</codigoPorcentaje>
                    <tarifa>12.00</tarifa>
                    <baseImponible>12.00</baseImponible>
                    <valor>1.44</valor>
                </impuesto>
            </impuestos>
        </detalle>
    </detalles>
</factura>"}'
```

```python
import requests, json

factura = {
    "xml" : '''<?xml version="1.0" encoding="UTF-8"?>
    <factura id="comprobante" version="1.1.0">
      <infoTributaria>
          <ambiente>1</ambiente>
          <tipoEmision>1</tipoEmision>
          <razonSocial>XYZ Corporación S.A.</razonSocial>
          <nombreComercial>XYZ Corp</nombreComercial>
          <ruc>0910000000001</ruc>
          <claveAcceso></claveAcceso>
          <codDoc>01</codDoc>
          <estab>002</estab>
          <ptoEmi>003</ptoEmi>
          <secuencial>000098431</secuencial>
          <dirMatriz>Av. Primera 234 y calle 5ta</dirMatriz>
      </infoTributaria>
      <infoFactura>
          <fechaEmision>17/10/2019</fechaEmision>
          <dirEstablecimiento>Av. Primera 234 y calle 5ta</dirEstablecimiento>
          <obligadoContabilidad>SI</obligadoContabilidad>
          <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
          <razonSocialComprador>Juan Pérez</razonSocialComprador>
          <identificacionComprador>0987654321</identificacionComprador>
          <direccionComprador>Calle única Numero 987</direccionComprador>
          <totalSinImpuestos>12.00</totalSinImpuestos>
          <totalDescuento>0.00</totalDescuento>
          <totalConImpuestos>
              <totalImpuesto>
                  <codigo>2</codigo>
                  <codigoPorcentaje>2</codigoPorcentaje>
                  <baseImponible>12.00</baseImponible>
                  <valor>1.44</valor>
              </totalImpuesto>
          </totalConImpuestos>
          <propina>0.00</propina>
          <importeTotal>13.44</importeTotal>
          <moneda>DOLAR</moneda>
      </infoFactura>
      <detalles>
          <detalle>
              <codigoPrincipal>105AP1</codigoPrincipal>
              <descripcion>Aceite Protector Madera</descripcion>
              <cantidad>1.000000</cantidad>
              <precioUnitario>12.000000</precioUnitario>
              <descuento>0.00</descuento>
              <precioTotalSinImpuesto>12.00</precioTotalSinImpuesto>
              <impuestos>
                  <impuesto>
                      <codigo>2</codigo>
                      <codigoPorcentaje>2</codigoPorcentaje>
                      <tarifa>12.00</tarifa>
                      <baseImponible>12.00</baseImponible>
                      <valor>1.44</valor>
                  </impuesto>
              </impuestos>
          </detalle>
      </detalles>
    </factura>'''
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/issue/xml",
    headers = cabeceras,
    data = json.dumps(factura))
```

```csharp
```

Para la emisión de una factura a partir de un XML se debe enviar el XML como parámetro en el cuerpo del requerimiento en formato JSON.
Este XML debe cumplir con la especificación del SRI


Parámetro   | Tipo    | Descripción
----------- | ------- | ----------
xml         | string  | Contenido del archivo xml. __Requerido__


### Respuesta

> #### Respuesta de ejemplo

```json
{
  "id": "abcdef09876123cea56784f01",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-09-28T11:28:56.782Z",
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos":[
        {
          "base_imponible": 4360.22,
          "valor": 523.14,
          "tarifa": 12.0,
          "codigo": "2",
          "codigo_porcentaje": "2"
        }
      ],
      "detalles_adicionales": {
        "Peso": "5000.0000"
      },
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
```

Retorna un objeto tipo **[factura](#requerimiento)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

## Emisión de una factura de reembolso

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
  "ambiente": 1,
  "tipo_emision": 1,
  "secuencial": 148,
  "fecha_emision": "2019-10-28T11:28:56.782Z",
  "emisor": {
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
  "info_adicional": [{
    "nombre": "Tiempo de entrega",
    "valor": "5 días"
  }],
  "totales": {
    "total_sin_impuestos": 300,
    "impuestos": [{
      "base_imponible": 300,
      "valor": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "6"
    }],
    "importe_total": 300.00,
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
  "items": [{
    "cantidad": 1.0,
    "codigo_principal": "REEM",
    "codigo_auxiliar": "",
    "precio_unitario": 300.00,
    "descuento": 0,
    "descripcion": "Reembolso de gastos",
    "precio_total_sin_impuestos": 300.00,
    "impuestos": [{
      "base_imponible": 300.00,
      "valor": 0.00,
      "tarifa": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "0"
    }],
    "descuento": 0.00
  }],
  "pagos": [{
    "medio": "cheque",
    "total": 300.00,
    "propiedades": {
      "numero": "1234567890",
      "banco": "Banco Pacífico"
    },
    "notas": "Depositado en cuenta corriente"
  }],
  "reembolso": {
    "codigo": "41",
    "documentos": [{
      "codigo_establecimiento": "002",
      "codigo_punto_emision": "003",
      "fecha_emision": "2019-10-28T11:28:56.782Z",
      "identificacion_proveedor": "1790017478001",
      "impuestos": [{
        "base_imponible": 300.00,
        "codigo": "2",
        "codigo_porcentaje": "0",
        "tarifa": 0.00,
        "valor": 0.00
      }],
      "numero_autorizacion": "1234567890",
      "pais_origen_proveedor": "EC",
      "secuencia": 2132,
      "tipo": "01",
      "tipo_identificacion_proveedor": "04",
      "tipo_proveedor": "02"
    }],
    "subtotal": 300.00,
    "total": 300.00,
    "total_impuestos": 0.00
  }
}'
```

```python
import requests, json

factura = {
  "ambiente": 1,
  "tipo_emision": 1,
  "secuencial": 148,
  "fecha_emision": "2019-10-28T11:28:56.782Z",
  "emisor": {
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
  "info_adicional": [{
    "nombre": "Tiempo de entrega",
    "valor": "5 días"
  }],
  "totales": {
    "total_sin_impuestos": 300,
    "impuestos": [{
      "base_imponible": 300,
      "valor": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "6"
    }],
    "importe_total": 300.00,
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
  "items": [{
    "cantidad": 1.0,
    "codigo_principal": "REEM",
    "codigo_auxiliar": "",
    "precio_unitario": 300.00,
    "descuento": 0,
    "descripcion": "Reembolso de gastos",
    "precio_total_sin_impuestos": 300.00,
    "impuestos": [{
      "base_imponible": 300.00,
      "valor": 0.00,
      "tarifa": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "0"
    }],
    "descuento": 0.00
  }],
  "pagos": [{
    "medio": "cheque",
    "total": 300.00,
    "propiedades": {
      "numero": "1234567890",
      "banco": "Banco Pacífico"
    },
    "notas": "Depositado en cuenta corriente"
  }],
  "reembolso": {
    "codigo": "41",
    "documentos": [{
      "codigo_establecimiento": "002",
      "codigo_punto_emision": "003",
      "fecha_emision": "2019-10-28T11:28:56.782Z",
      "identificacion_proveedor": "1790017478001",
      "impuestos": [{
        "base_imponible": 300.00,
        "codigo": "2",
        "codigo_porcentaje": "0",
        "tarifa": 0.00,
        "valor": 0.00
      }],
      "numero_autorizacion": "1234567890",
      "pais_origen_proveedor": "EC",
      "secuencia": 2132,
      "tipo": "01",
      "tipo_identificacion_proveedor": "04",
      "tipo_proveedor": "02"
    }],
    "subtotal": 300.00,
    "total": 300.00,
    "total_impuestos": 0.00
  }
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/issue",
    headers = cabeceras,
    data = json.dumps(factura))
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
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""ambiente"": 1,
        ""tipo_emision"": 1,
        ""secuencial"": 148,
        ""fecha_emision"": ""2019-10-28T11:28:56.782Z"",
        ""emisor"": {
          ""ruc"": ""0910000000001"",
          ""obligado_contabilidad"": true,
          ""contribuyente_especial"": ""12345"",
          ""nombre_comercial"": ""XYZ Corp"",
          ""razon_social"": ""XYZ Corporación S.A."",
          ""direccion"": ""Av. Primera 234 y calle 5ta"",
          ""establecimiento"": {
            ""punto_emision"": ""002"",
            ""codigo"": ""001"",
            ""direccion"": ""Av. Primera 234 y calle 5ta""
          }
        },
        ""moneda"": ""USD"",
        ""info_adicional"": [{
          ""nombre"": ""Tiempo de entrega"",
          ""valor"": ""5 días""
        }],
        ""totales"": {
          ""total_sin_impuestos"": 300,
          ""impuestos"": [{
            ""base_imponible"": 300,
            ""valor"": 0.00,
            ""codigo"": ""2"",
            ""codigo_porcentaje"": ""6""
          }],
          ""importe_total"": 300.00,
          ""propina"": 0.0,
          ""descuento"": 0.0
        },
        ""comprador"": {
          ""email"": ""juan.perez@xyz.com"",
          ""identificacion"": ""0987654321"",
          ""tipo_identificacion"": ""05"",
          ""razon_social"": ""Juan Pérez"",
          ""direccion"": ""Calle única Numero 987"",
          ""telefono"": ""046029400""
        },
        ""items"": [{
          ""cantidad"": 1.0,
          ""codigo_principal"": ""REEM"",
          ""codigo_auxiliar"": "",
          ""precio_unitario"": 300.00,
          ""descuento"": 0,
          ""descripcion"": ""Reembolso de gastos"",
          ""precio_total_sin_impuestos"": 300.00,
          ""impuestos"": [{
            ""base_imponible"": 300.00,
            ""valor"": 0.00,
            ""tarifa"": 0.00,
            ""codigo"": ""2"",
            ""codigo_porcentaje"": ""0""
          }],
          ""descuento"": 0.00
        }],
        ""pagos"": [{
          ""medio"": ""cheque"",
          ""total"": 300.00,
          ""propiedades"": {
            ""numero"": ""1234567890"",
            ""banco"": ""Banco Pacífico""
          },
          ""notas"": ""Depositado en cuenta corriente""
        }],
        ""reembolso"": {
          ""codigo"": ""41"",
          ""documentos"": [{
            ""codigo_establecimiento"": ""002"",
            ""codigo_punto_emision"": ""003"",
            ""fecha_emision"": ""2019-10-28T11:28:56.782Z"",
            ""identificacion_proveedor"": ""1790017478001"",
            ""impuestos"": [{
              ""base_imponible"": 300.00,
              ""codigo"": ""2"",
              ""codigo_porcentaje"": ""0"",
              ""tarifa"": 0.00,
              ""valor"": 0.00
            }],
            ""numero_autorizacion"": ""1234567890"",
            ""pais_origen_proveedor"": ""EC"",
            ""secuencia"": 2132,
            ""tipo"": ""01"",
            ""tipo_identificacion_proveedor"": ""04"",
            ""tipo_proveedor"": ""02""
          }],
          ""subtotal"": 300.00,
          ""total"": 300.00,
          ""total_impuestos"": 0.00
        }
      }");
      request.AddParameter("application/json", body, ParameterType.RequestBody);
      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
      Console.ReadLine();
    }
  }
}
```

Para la emisión de una factura de reembolso se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON. El total de ítems de la factura de reembolso debe ser igual al total de los documentos.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | integer (min. 1 - max. 999999999 ) | Número de secuencia de la factura. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
totales | objeto tipo [totales](#totales-reembolso) | Listado de totales. __Requerido__
comprador | objeto tipo [persona](#persona) | Información del comprador. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura. Para facturas de reembolso el impuesto del ítem es No Objeto de Impuesto __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string (49 caracteres) | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
info_adicional | Listado de objectos de tipo [información adicional](#info-adicional) | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` [{"nombre":"plan", "valor":"Inicial", "nombre":"vigencia", "valor":"1 mes"}]`
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}` <span style="color: red">__Obsoleto__</span> *utiliza el parámetro info_adicional*
pagos | Listado de objetos tipo [pagos](#pagos) | Listado de formas de pago aplicables a la factura. __Requerido__
reembolso | objeto tipo [reembolso](#reembolso) | Información de reembolso. __Requerido__

<h3 id="totales-reembolso"> Totales </h3>

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
descuento           | float | Suma de los descuentos de cada ítem y del descuento adicional. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

#### Pagos

Parámetro   | Tipo         | Descripción
----------- | ------------ | ----------
fecha       | string       | Fecha de recepción del pago en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es especificado se utiliza la fecha y hora actual.
medio       | string       | Código del [tipo de forma de pago](#tipos-de-forma-de-pago). __Requerido__
total       | float        | Total aplicable a la forma de pago especificada. __Requerido__
notas       | string (máximo 300 caracteres) | Texto abierto que te permite registrar cualquier nota relacionada al pago.
propiedades | objeto       | Información adicional adjunta al pago en forma de diccionario. Ejemplo:<br>` {"plazo": "30", "unidad_tiempo": "dias"}`

## Emisión de una factura con descuentos

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
  "secuencial":52,
  "fecha_emision":"2020-06-30T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad": true,
    "contribuyente_especial":"12345",
    "nombre_comercial":"XYZ Corp",
    "razon_social":"XYZ Corporación S.A.",
    "direccion":"Av. Primera 234 y calle 5ta",
    "establecimiento":{
      "punto_emision":"001",
      "codigo":"001",
      "direccion":"Av. Primera 234 y calle 5ta"
    }
  },
  "moneda":"USD",
  "info_adicional":[
    {
      "nombre": "Tiempo de entrega",
      "valor": "5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":14,
    "impuestos":[
      {
        "base_imponible":14,
        "valor":1.56,
        "codigo":"2",
        "codigo_porcentaje":"2"
      }
    ],
    "importe_total":14.56,
    "propina":0.0,
    "descuento":4,
    "descuento_adicional":1
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
      "cantidad":1,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7,
      "descuento": 1,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 6,
      "impuestos": [
        {
          "base_imponible":6,
          "valor":0.72,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales": {
        "Peso":"5"
      },
      "unidad_medida": "Kilos"
    },
    {
      "cantidad":2,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 5,
      "descuento": 1,
      "descripcion": "Brocoli granel  50 Kg.",
      "precio_total_sin_impuestos": 8,
      "impuestos": [
        {
          "base_imponible":8,
          "valor":0.96,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales": {
        "Peso":"5"
      },
      "unidad_medida": "Kilos"
    }
  ]
}'
```

```python
import requests, json

factura = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":52,
  "fecha_emision":"2020-06-30T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad": true,
    "contribuyente_especial":"12345",
    "nombre_comercial":"XYZ Corp",
    "razon_social":"XYZ Corporación S.A.",
    "direccion":"Av. Primera 234 y calle 5ta",
    "establecimiento":{
      "punto_emision":"001",
      "codigo":"001",
      "direccion":"Av. Primera 234 y calle 5ta"
    }
  },
  "moneda":"USD",
  "info_adicional":[
    {
      "nombre": "Tiempo de entrega",
      "valor": "5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":14,
    "impuestos":[
      {
        "base_imponible":14,
        "valor":1.56,
        "codigo":"2",
        "codigo_porcentaje":"2"
      }
    ],
    "importe_total":14.56,
    "propina":0.0,
    "descuento":4,
    "descuento_adicional":1
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
      "cantidad":1,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7,
      "descuento": 1,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 6,
      "impuestos": [
        {
          "base_imponible":6,
          "valor":0.72,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales": {
        "Peso":"5"
      },
      "unidad_medida": "Kilos"
    },
    {
      "cantidad":2,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 5,
      "descuento": 1,
      "descripcion": "Brocoli granel  50 Kg.",
      "precio_total_sin_impuestos": 8,
      "impuestos": [
        {
          "base_imponible":8,
          "valor":0.96,
          "tarifa":12.0,
          "codigo":"2",
          "codigo_porcentaje":"2"
        }
      ],
      "detalles_adicionales": {
        "Peso":"5"
      },
      "unidad_medida": "Kilos"
    }
  ]
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/issue",
    headers = cabeceras,
    data = json.dumps(factura))
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
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":52,
        ""fecha_emision"":""2020-06-30T11:28:56.782Z"",
        ""emisor"":{
          ""ruc"":""0910000000001"",
          ""obligado_contabilidad"": true,
          ""contribuyente_especial"":""12345"",
          ""nombre_comercial"":""XYZ Corp"",
          ""razon_social"":""XYZ Corporación S.A."",
          ""direccion"":""Av. Primera 234 y calle 5ta"",
          ""establecimiento"":{
            ""punto_emision"":""001"",
            ""codigo"":""001"",
            ""direccion"":""Av. Primera 234 y calle 5ta""
          }
        },
        ""moneda"":""USD"",
        ""info_adicional"":[
          {
            ""nombre"": ""Tiempo de entrega"",
            ""valor"": ""5 días""
          }
        ],
        ""totales"":{
          ""total_sin_impuestos"":14,
          ""impuestos"":[
            {
              ""base_imponible"":14,
              ""valor"":1.56,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""2""
            }
          ],
          ""importe_total"":14.56,
          ""propina"":0.0,
          ""descuento"":4,
          ""descuento_adicional"":1
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
            ""cantidad"":1,
            ""codigo_principal"": ""ZNC"",
            ""codigo_auxiliar"": ""050"",
            ""precio_unitario"": 7,
            ""descuento"": 1,
            ""descripcion"": ""Zanahoria granel  50 Kg."",
            ""precio_total_sin_impuestos"": 6,
            ""impuestos"": [
              {
                ""base_imponible"":6,
                ""valor"":0.72,
                ""tarifa"":12.0,
                ""codigo"":""2"",
                ""codigo_porcentaje"":""2""
              }
            ],
            ""detalles_adicionales"": {
              ""Peso"":""5""
            },
            ""unidad_medida"": ""Kilos""
          },
          {
            ""cantidad"":2,
            ""codigo_principal"": ""ZNC"",
            ""codigo_auxiliar"": ""050"",
            ""precio_unitario"": 5,
            ""descuento"": 1,
            ""descripcion"": ""Brocoli granel  50 Kg."",
            ""precio_total_sin_impuestos"": 8,
            ""impuestos"": [
              {
                ""base_imponible"":8,
                ""valor"":0.96,
                ""tarifa"":12.0,
                ""codigo"":""2"",
                ""codigo_porcentaje"":""2""
              }
            ],
            ""detalles_adicionales"": {
              ""Peso"":""5""
            },
            ""unidad_medida"": ""Kilos""
          }
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

Para la emisión de una factura con descuentos se debe enviar la información completa del comprobante en el cuerpo del requerimiento en formato JSON. Se debe considerar el descuento para las bases imponibles de los items. 

<h3 id="totales-reembolso"> Totales </h3>

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos sin incluir el descuento adicional. __Requerido__
descuento           | float | Suma de los descuentos de cada ítem y del descuento adicional. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

## Consulta de una factura

Consulta una factura para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emision),
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /invoices/<invoice-id>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/<id-factura> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>"
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/invoices/<id-factura>',
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
    "fecha_emision": "2016-05-15",
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
            ],
            "unidad_medida": "Kilos"
        }
    ],
    "valor_retenido_iva": 70.40,
    "valor_retenido_renta": 29.60,
    "credito": {
        "fecha_vencimiento": "2016-06-28",
        "monto": 34.21
    },    
    "pagos": [
      {
        "medio": "cheque",
        "total": 4882.68,
        "propiedades": {
          "numero": "1234567890",
          "banco": "Banco Pacífico"
        },
        "notas": "Depositado en cuenta corriente"
      }
    ],
    "compensaciones": [
      {
        "codigo": 1,
        "tarifa": 2,
        "valor": 2.00
      }
    ],
    "exportacion": {
      "incoterm": {
        "termino": "CIF",
        "lugar": "Guayaquil",
        "total_sin_impuestos": "CIF"
      },
      "origen": {
        "codigo_pais":"EC",
        "puerto": "Guayaquil"
      },
      "destino": {
        "codigo_pais":"CN",
        "puerto": "China"
      },
      "codigo_pais_adquisicion": "EC",
      "totales": {
        "flete_internacional": 1000.00,
        "seguro_internacional": 200.00,
        "gastos_aduaneros": 800,
        "otros_gastos_transporte": 350.00
      }
    },
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
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf).
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envio-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorizacion-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales) | Listado de totales.
comprador | objeto [persona](#persona) | Información del comprador.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura.
pagos | listado de objetos tipo [pagos](#pagos) | Listado de formas de pago aplicables a la factura.
credito | Objeto de tipo [credito](#credito) | Información del crédito directo otorgado al cliente.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

## Consulta de una factura de reembolso

Consulta una factura de reembolso para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emision),
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
  "secuencial": 148,
  "fecha_emision": "2019-10-28T11:28:56.782Z",
  "version": "1.0.0",
  "clave_acceso": "1505201501099271255400110011000000000162092727615",
  "ambiente": 1,
  "tipo_emision": 1,
  "emisor": {
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
  "estado": "AUTORIZADO",
  "correos_enviados": [{
    "fecha_envio": "2019-10-28T16:36:48.274604",
    "destinatarios": "juanantonioplaza@datilmedia.com"
  }],
  "moneda": "USD",
  "info_adicional": [{
    "nombre": "Tiempo de entrega",
    "valor": "5 días"
  }],
  "totales": {
    "total_sin_impuestos": 300,
    "impuestos": [{
      "base_imponible": 300,
      "valor": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "6"
    }],
    "importe_total": 300.00,
    "propina": 0.0,
    "descuento": 0.0
  },
  "envio_sri": {
      "mensajes": [],
      "estado": "RECIBIDA",
      "fecha": ""
  },
  "comprador": {
    "email": "juan.perez@xyz.com",
    "identificacion": "0987654321",
    "tipo_identificacion": "05",
    "razon_social": "Juan Pérez",
    "direccion": "Calle única Numero 987",
    "telefono": "046029400"
  },
  "items": [{
    "cantidad": 1.0,
    "codigo_principal": "REEM",
    "codigo_auxiliar": "",
    "precio_unitario": 300.00,
    "descuento": 0,
    "descripcion": "Reembolso de gastos",
    "precio_total_sin_impuestos": 300.00,
    "impuestos": [{
      "base_imponible": 300.00,
      "valor": 0.00,
      "tarifa": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "0"
    }],
    "descuento": 0.00
  }],
  "pagos": [{
    "medio": "cheque",
    "total": 300.00,
    "propiedades": {
      "numero": "1234567890",
      "banco": "Banco Pacífico"
    },
    "notas": "Depositado en cuenta corriente"
  }],
  "reembolso": {
    "codigo": "41",
    "documentos": [{
      "codigo_establecimiento": "002",
      "codigo_punto_emision": "003",
      "fecha_emision": "2019-10-28T11:28:56.782Z",
      "identificacion_proveedor": "1790017478001",
      "impuestos": [{
        "base_imponible": 300.00,
        "codigo": "2",
        "codigo_porcentaje": "0",
        "tarifa": 0.00,
        "valor": 0.00
      }],
      "numero_autorizacion": "1234567890",
      "pais_origen_proveedor": "EC",
      "secuencia": 2132,
      "tipo": "01",
      "tipo_identificacion_proveedor": "04",
      "tipo_proveedor": "02"
    }],
    "subtotal": 300.00,
    "total": 300.00,
    "total_impuestos": 0.00
  },
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
    "fecha": "2019-10-28T16:32:35.000380"
  }
}
```

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la factura.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf).
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envio-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorizacion-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales-reembolso) | Listado de totales.
comprador | objeto [persona](#persona) | Información del comprador.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura.
pagos | listado de objetos tipo [pagos](#pagos) | Listado de formas de pago aplicables a la factura.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`
reembolso | objeto tipo [reembolso](#reembolso) | Información de reembolso.


## Re-emisión de una factura

### Operación

`POST /invoices/:id/reissue`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/<id-factura>/reissue \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-10-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad": true,
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
  "info_adicional":[
    {
      "nombre": "Tiempo de entrega",
      "valor": "5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.008907,
      "descuento": 0,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-31",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}'
```

```python
import requests, json

factura = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-10-28T11:28:56.782Z",
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
  "moneda":"USD",
  "info_adicional":[
    {
      "nombre":"Tiempo de entrega",
      "valor":"5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
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
      "precio_unitario": 7.008907,
      "descuento":0,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "notas": "Depositado en cuenta corriente",
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      }
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/<id-factura>/reissue",
    headers = cabeceras,
    data = json.dumps(factura))
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
      var idFactura = "<id-factura>";
      var request = new RestRequest("invoices/" + idFactura + "/reissue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":148,
        ""fecha_emision"":""2019-09-28T11:28:56.782Z"",
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
            ""codigo_principal"":""ZNC"",
            ""codigo_auxiliar"": ""050"",
            ""precio_unitario"": 7.01,
            ""descuento"": 0,
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
            ""descuento"": 0.0,
            ""unidad_medida"": ""Kilos""
          }
      ],
        ""valor_retenido_iva"": 70.40,
        ""valor_retenido_renta"": 29.60,
        ""credito"": {
            ""fecha_vencimiento"": ""2015-03-28"",
            ""monto"": 1900.00
        },
      ""pagos"": [
        {
          ""medio"": ""cheque"",
          ""total"": 2882.68,
          ""notas"": ""Depositado en cuenta corriente"",
          ""propiedades"": {
            ""numero"": ""1234567890"",
            ""banco"": ""Banco Pacífico""
          }
        }
      ],
      ""exportacion"": {
        ""incoterm"": {
          ""termino"": ""CIF"",
          ""lugar"": ""Guayaquil"",
          ""total_sin_impuestos"": 10.25
        },
        ""origen"": {
          ""codigo_pais"":""EC"",
          ""puerto"": ""Guayaquil""
        },
        ""destino"": {
          ""codigo_pais"":""CN"",
          ""puerto"": ""China""
        },
        ""codigo_pais_adquisicion"": ""EC"",
        ""totales"": {
          ""flete_internacional"": 1000.00,
          ""seguro_internacional"": 200.00,
          ""gastos_aduaneros"": 800,
          ""otros_gastos_transporte"": 350.00
        }
      }");
      request.AddParameter("application/json", body, ParameterType.RequestBody);
      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
      Console.ReadLine();
    }
  }
}
```

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o
DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el `id` de la factura recibida al
momento de emitirla.

El cuerpo del requerimiento es un objeto [factura](#requerimiento) con los
datos corregidos para que pueda ser procesado y autorizado.


### Respuesta

> #### Respuesta de ejemplo

```json
{
  "id": "abcdef09876123cea56784f01",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-09-28T11:28:56.782Z",
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos":[
        {
          "base_imponible": 4360.22,
          "valor": 523.14,
          "tarifa": 12.0,
          "codigo": "2",
          "codigo_porcentaje": "2"
        }
      ],
      "detalles_adicionales": {
        "Peso": "5000.0000"
      },
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
```

Retorna un objeto tipo **[factura](#requerimiento)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado también se incluirá como parte de la respuesta. Sí la factura ya está autorizada se retornará un error.


## Creación de una factura

### Operación

`POST /invoices`

### Requerimiento

Para la creación de una factura se debe enviar la información completa del comprobante en el cuerpo del requerimiento en formato JSON.

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-10-28T11:28:56.782Z",
  "emisor":{
    "ruc":"0910000000001",
    "obligado_contabilidad": true,
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
  "info_adicional":[
    {
      "nombre": "Tiempo de entrega",
      "valor": "5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.008907,
      "descuento": 0,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-31",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}'
```

```python
import requests, json

factura = {
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-10-28T11:28:56.782Z",
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
  "moneda":"USD",
  "info_adicional":[
    {
      "nombre":"Tiempo de entrega",
      "valor":"5 días"
    }
  ],
  "totales":{
    "total_sin_impuestos":4359.54,
    "impuestos":[
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
      "precio_unitario": 7.008907,
      "descuento":0,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "notas": "Depositado en cuenta corriente",
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      }
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices",
    headers = cabeceras,
    data = json.dumps(factura))
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
      var request = new RestRequest("invoices", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
        ""ambiente"":1,
        ""tipo_emision"":1,
        ""secuencial"":148,
        ""fecha_emision"":""2019-09-28T11:28:56.782Z"",
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
            ""codigo_principal"":""ZNC"",
            ""codigo_auxiliar"": ""050"",
            ""precio_unitario"": 7.01,
            ""descuento"": 0,
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
            ""descuento"": 0.0,
            ""unidad_medida"": ""Kilos""
          }
      ],
        ""valor_retenido_iva"": 70.40,
        ""valor_retenido_renta"": 29.60,
        ""credito"": {
            ""fecha_vencimiento"": ""2015-03-28"",
            ""monto"": 1900.00
        },
      ""pagos"": [
        {
          ""medio"": ""cheque"",
          ""total"": 2882.68,
          ""notas"": ""Depositado en cuenta corriente"",
          ""propiedades"": {
            ""numero"": ""1234567890"",
            ""banco"": ""Banco Pacífico""
          }
        }
      ],
      ""exportacion"": {
        ""incoterm"": {
          ""termino"": ""CIF"",
          ""lugar"": ""Guayaquil"",
          ""total_sin_impuestos"": 10.25
        },
        ""origen"": {
          ""codigo_pais"":""EC"",
          ""puerto"": ""Guayaquil""
        },
        ""destino"": {
          ""codigo_pais"":""CN"",
          ""puerto"": ""China""
        },
        ""codigo_pais_adquisicion"": ""EC"",
        ""totales"": {
          ""flete_internacional"": 1000.00,
          ""seguro_internacional"": 200.00,
          ""gastos_aduaneros"": 800,
          ""otros_gastos_transporte"": 350.00
        }
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

> #### Respuesta de ejemplo

```json
{
  "id": "abcdef09876123cea56784f01",
  "ambiente":1,
  "tipo_emision":1,
  "secuencial":148,
  "fecha_emision":"2019-09-28T11:28:56.782Z",
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
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
      "descripcion": "Zanahoria granel  50 Kg.",
      "precio_total_sin_impuestos": 4360.22,
      "impuestos":[
        {
          "base_imponible": 4360.22,
          "valor": 523.14,
          "tarifa": 12.0,
          "codigo": "2",
          "codigo_porcentaje": "2"
        }
      ],
      "detalles_adicionales": {
        "Peso": "5000.0000"
      },
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "valor_retenido_iva": 70.40,
  "valor_retenido_renta": 29.60,
  "credito": {
    "fecha_vencimiento": "2019-12-28",
    "monto": 1900.00
  },
  "pagos": [
    {
      "medio": "cheque",
      "total": 2882.68,
      "propiedades": {
        "numero": "1234567890",
        "banco": "Banco Pacífico"
      },
      "notas": "Depositado en cuenta corriente"
    }
  ],
  "exportacion": {
    "incoterm": {
      "termino": "CIF",
      "lugar": "Guayaquil",
      "total_sin_impuestos": "CIF"
    },
    "origen": {
      "codigo_pais":"EC",
      "puerto": "Guayaquil"
    },
    "destino": {
      "codigo_pais":"CN",
      "puerto": "China"
    },
    "codigo_pais_adquisicion": "EC",
    "totales": {
      "flete_internacional": 1000.00,
      "seguro_internacional": 200.00,
      "gastos_aduaneros": 800,
      "otros_gastos_transporte": 350.00
    }
  }
}
```

Retorna un objeto tipo **[factura](#requerimiento)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.
