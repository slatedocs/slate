# Liquidaciones de compras

## Emisión de una liquidación de compras

### Operación

`POST /purchase-settlements/issue`
<h3 id="requerimiento-liquidacion">Requerimiento</h3>

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/purchase-settlements/issue \
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
        "base_imponible":4359.54,
        "valor":523.14,
        "codigo":"2",
        "codigo_porcentaje":"2"
      }
    ],
    "importe_total":4882.68,
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "pagos": [
    {
      "forma_pago": "01",
      "total": 4882.68,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ],
}'
```

```python
import requests, json

liquidacion_compras = {
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
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
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
  "pagos": [
    {
      "forma_pago": "01",
      "total": 4882.68,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ]
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/purchase-settlements/issue",
    headers = cabeceras,
    data = json.dumps(liquidacion_compras))
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
      var request = new RestRequest("purchase-settlements/issue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
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
          ""descuento"":0.0
        },
        ""maquina_fiscal"": {
          ""marca"": ""SISPAU"",
          ""modelo"": ""ABC123"",
          ""serie"": ""CGNC1405""
        },
        ""proveedor"":{
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
      ""pagos"": [
        {
          ""forma_pago"": ""01"",
          ""total"": 4882.68
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

Para la emisión de una liquidación de compras se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la liquidación de compras. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
totales | objeto tipo [totales](#totales-liquidacion) | Listado de totales. __Requerido__
maquina_fiscal | objeto [maquina_fiscal](#maquina-fiscal) | Información de máquina fiscal.
proveedor | objeto tipo [persona](#persona) | Información del proveedor. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la liquidación de compras. __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`
pagos | Listado de objetos tipo [pagos](#pagos-liquidacion) | Listado de formas de pago aplicables a la liquidación de compras. __Requerido__

<h4 id="totales-liquidacion"> Totales </h4>

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
descuento           | float | Suma de los descuentos de cada ítem. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

<h4 id="pagos-liquidacion">Pagos</h4>

Parámetro   | Tipo         | Descripción
----------- | ------------ | ----------
forma_pago       | string       | Código del [tipo de forma de pago](#tipos-de-forma-de-pago-del-sri). __Requerido__
total       | float        | Total aplicable a la forma de pago especificada. __Requerido__
unidad_tiempo       | string       | Máximo 10 caracteres.
plazo       | string       | Máximo 14 caracteres.

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
    "descuento": 0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor": {
    "email": "juan.perez@xyz.com",
    "identificacion": "0987654321",
    "tipo_identificacion": "05",
    "razon_social": "Juan Pérez",
    "direccion": "Calle única Numero 987",
    "telefono": "046029400"
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "items":[
    {
      "cantidad": 622.0,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "pagos": [
    {
      "forma_pago": "01",
      "total": 4882.68,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ]
}
```

Retorna un objeto tipo **[liquidacion](#requerimiento-liquidacion)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la liquidación de compras. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

## Emisión de una liquidación de compra a partir de XML

`POST /purchase-settlements/issue/xml`

### Requerimiento a partir de XML

Para la emisión de una liquidación de compra a partir de un XML se debe enviar contenido del archivo XML como parámetro en el cuerpo del requerimiento en formato JSON.


Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
xml                 | string  | Contenido del archivo xml. __Requerido__


> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/purchase-settlements/issue/xml \
-H "Content-Type: application/json" \
-H "X-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{"xml" : "<?xml version=\"1.1.0\" encoding=\"UTF-8\"?>
<liquidacionCompra id= \"comprobante\" version= \"1.1.0\">
    <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>DATILMEDIA S.A. DE C.V.</razonSocial>
        <nombreComercial>DATILMEDIA S.A.</nombreComercial>
        <ruc>0992712554001</ruc>
        <claveAcceso>1234567890098765432112345678900987654321987654321</claveAcceso>
        <codDoc>03</codDoc>
        <estab>001</estab>
        <ptoEmi>001</ptoEmi>
        <secuencial>000002134</secuencial>
        <dirMatriz>VICTOR EMILIO ESTRADA 112 Y CIRCUNVALACION NORTE</dirMatriz>
    </infoTributaria>
    <infoLiquidacionCompra>
        <fechaEmision>20/10/2019</fechaEmision>
        <dirEstablecimiento>VICTOR EMILIO ESTRADA 112 Y CIRCUNVALACION NORTE 2</dirEstablecimiento>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <tipoIdentificacionProveedor>04</tipoIdentificacionProveedor>
        <razonSocialProveedor>Sistemas XYZ</razonSocialProveedor>
        <identificacionProveedor>0987343992001</identificacionProveedor>
        <totalSinImpuestos>6.00</totalSinImpuestos>
        <totalDescuento>1.50</totalDescuento>
        <totalConImpuestos>
            <totalImpuesto>
                <codigo>2</codigo>
                <codigoPorcentaje>2</codigoPorcentaje>
                <baseImponible>6.00</baseImponible>
                <valor>0.72</valor>
            </totalImpuesto>
        </totalConImpuestos>
        <importeTotal>6.72</importeTotal>
        <moneda>DOLAR</moneda>
        <pagos>
            <pago>
                <formaPago>01</formaPago>
                <total>6.72</total>
            </pago>
        </pagos>
    </infoLiquidacionCompra>
    <detalles>
        <detalle>
            <codigoPrincipal>105AP</codigoPrincipal>
            <descripcion>Aceite Protector</descripcion>
            <cantidad>1.400000</cantidad>
            <precioUnitario>5.357143</precioUnitario>
            <descuento>1.50</descuento>
            <precioTotalSinImpuesto>6.00</precioTotalSinImpuesto>
            <impuestos>
                <impuesto>
                    <codigo>2</codigo>
                    <codigoPorcentaje>2</codigoPorcentaje>
                    <tarifa>12.00</tarifa>
                    <baseImponible>6.00</baseImponible>
                    <valor>0.72</valor>
                </impuesto>
            </impuestos>
        </detalle>
    </detalles>
    <infoAdicional>
        <campoAdicional nombre= \"Info\">Adicional</campoAdicional>
    </infoAdicional>
</liquidacionCompra>"}'
```

```python
import requests, json

liquidacion_compra = {
    "xml": '''<?xml version="1.1.0" encoding="UTF-8"?>
    <liquidacionCompra id="comprobante" version="1.1.0">
      <infoTributaria>
        <ambiente>1</ambiente>
        <tipoEmision>1</tipoEmision>
        <razonSocial>DATILMEDIA S.A.</razonSocial>
        <nombreComercial>DATILMEDIA S.A.</nombreComercial>
        <ruc>0992712554001</ruc>
        <claveAcceso>1234567890098765432112345678900987654321987654321</claveAcceso>
        <codDoc>03</codDoc>
        <estab>001</estab>
        <ptoEmi>001</ptoEmi>
        <secuencial>000002134</secuencial>
        <dirMatriz>VICTOR EMILIO ESTRADA 112 Y CIRCUNVALACION NORTE</dirMatriz>
      </infoTributaria>
      <infoLiquidacionCompra>
        <fechaEmision>20/10/2019</fechaEmision>
        <dirEstablecimiento>VICTOR EMILIO ESTRADA 112 Y CIRCUNVALACION NORTE 2</dirEstablecimiento>
        <obligadoContabilidad>NO</obligadoContabilidad>
        <tipoIdentificacionProveedor>04</tipoIdentificacionProveedor>
        <razonSocialProveedor>Sistemas XYZ</razonSocialProveedor>
        <identificacionProveedor>0987343992001</identificacionProveedor>
        <totalSinImpuestos>6.00</totalSinImpuestos>
        <totalDescuento>1.50</totalDescuento>
        <totalConImpuestos>
          <totalImpuesto>
            <codigo>2</codigo>
            <codigoPorcentaje>2</codigoPorcentaje>
            <baseImponible>6.00</baseImponible>
            <valor>0.72</valor>
          </totalImpuesto>
        </totalConImpuestos>
        <importeTotal>6.72</importeTotal>
        <moneda>DOLAR</moneda>
        <pagos>
          <pago>
            <formaPago>01</formaPago>
            <total>6.72</total>
          </pago>
        </pagos>
      </infoLiquidacionCompra>
      <detalles>
        <detalle>
          <codigoPrincipal>105AP</codigoPrincipal>
          <descripcion>Aceite Protector</descripcion>
          <cantidad>1.400000</cantidad>
          <precioUnitario>5.357143</precioUnitario>
          <descuento>1.50</descuento>
          <precioTotalSinImpuesto>6.00</precioTotalSinImpuesto>
          <impuestos>
            <impuesto>
              <codigo>2</codigo>
              <codigoPorcentaje>2</codigoPorcentaje>
              <tarifa>12.00</tarifa>
              <baseImponible>6.00</baseImponible>
              <valor>0.72</valor>
            </impuesto>
          </impuestos>
        </detalle>
      </detalles>
      <infoAdicional>
        <campoAdicional nombre="Info">Adicional</campoAdicional>
      </infoAdicional>
    </liquidacionCompra>'''
}

cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/invoices/issue/xml",
    headers = cabeceras,
    data = json.dumps(liquidacion_compra))
```

```csharp
```

> #### Reespuesta de ejemplo

```json
{
    "pagos": [
        {
            "plazo": null,
            "total": "6.72",
            "unidad_tiempo": "",
            "forma_pago": "01"
        }
    ],
    "secuencial": 3,
    "proveedor": {
        "correo": null,
        "identificacion": "0987343992001",
        "razon_social": "Sistemas XYZ",
        "direccion": "",
        "tipo_identificacion": "04"
    },
    "emisor": {
        "provincia": 10,
        "email": "devops@datilmedia.com",
        "categoria": "Combustible",
        "ruc": "1234567890001",
        "obligado_contabilidad": false,
        "contribuyente_especial": "",
        "subcategoria": "Desarrollo de software",
        "nombre_comercial": "Hexlab Demo",
        "pais": 1,
        "market_id": "denny",
        "razon_social": "Hexlab Demo",
        "direccion": "Innvernadero Coworking, Bálsamos 813 entre Guayacanes e Higueras",
        "ciudad": "Guayaquil",
        "exportador": false,
        "telefono": "046029400",
        "tipoentidad": "Sociedad Anónima"
    },
    "correos_enviados": [],
    "numero": "001-001-000000003",
    "anulado": false,
    "es_valida": true,
    "id": "c1f05f6cd3494c88a21877d8c8d3a5ea",
    "informacion_adicional": {
        "Info": "Adicional"
    },
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": "6.00",
        "importe_total": "6.72",
        "impuestos": [
            {
                "codigo": "2",
                "codigo_porcentaje": "2",
                "base_imponible": "6.00",
                "valor": "0.72"
            }
        ],
        "descuento": "1.50"
    },
    "envio_sri": {},
    "items": [
        {
            "precio_unitario": "5.357143",
            "descripcion": "Aceite Protector",
            "precio_total_sin_impuestos": "6.00",
            "unidad_medida": null,
            "impuestos": [
                {
                    "codigo": "2",
                    "tarifa": "12.00",
                    "codigo_porcentaje": "2",
                    "base_imponible": "6.00",
                    "valor": "0.72"
                }
            ],
            "detalles_adicionales": {},
            "cantidad": "1.400000",
            "codigo_auxiliar": null,
            "descuento": "1.50",
            "codigo_principal": "105AP"
        }
    ],
    "pre_autorizado": false,
    "clave_acceso": "2010201903123456789000110010010000000032235587919",
    "autorizacion": {}
}
```

## Emisión de una liquidación de compras de reembolso

### Operación

`POST /purchase-settlements/issue`
<h3 id="requerimiento-liquidacion">Requerimiento</h3>

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/purchase-settlements/issue \
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
    "total_sin_impuestos":50.00,
    "impuestos":[
      {
        "base_imponible":50.00,
        "valor":0.00,
        "codigo":"2",
        "codigo_porcentaje":"0"
      }
    ],
    "importe_total":50.00,
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  },
  "items": [{
    "cantidad": 1.0,
    "codigo_principal": "REEM",
    "codigo_auxiliar": "",
    "precio_unitario": 50.00,
    "descuento": 0,
    "descripcion": "Reembolso de gastos",
    "precio_total_sin_impuestos": 50.00,
    "impuestos": [{
      "base_imponible": 50.00,
      "valor": 0.00,
      "tarifa": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "0"
    }],
    "descuento": 0.00
  }],
  "reembolso": {
    "subtotal": 50.00,
    "total": 50.00,
    "total_impuestos": 0.00,
    "documentos": [
      {
        "tipo_identificacion_proveedor": "04",
        "pais_origen_proveedor": "593",
        "tipo_proveedor": "01",
        "identificacion_proveedor": "0918723323001",
        "tipo": "01",
        "numero_autorizacion": 3811201601,
        "fecha_emision": "2020-01-28T10:50:26-05:00",
        "codigo_punto_emision": "001",
        "codigo_establecimiento": "003",
        "secuencia": 897,
        "impuestos": [
          {
            "tarifa": 0.0,
            "codigo": "2",
            "codigo_porcentaje": "0",
            "base_imponible": "50.0",
            "valor": "0.00",
          }
        ],
      }
    ],
  },
  "pagos": [
    {
      "forma_pago": "01",
      "total": 50.00,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ],
}'
```

```python
import requests, json

liquidacion_compras = {
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
    "total_sin_impuestos":50.00,
    "impuestos":[
      {
        "base_imponible":50.00,
        "valor":0.00,
        "codigo":"2",
        "codigo_porcentaje":"0"
      }
    ],
    "importe_total":50.00,
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  },
  "items": [{
    "cantidad": 1.0,
    "codigo_principal": "REEM",
    "codigo_auxiliar": "",
    "precio_unitario": 50.00,
    "descuento": 0,
    "descripcion": "Reembolso de gastos",
    "precio_total_sin_impuestos": 50.00,
    "impuestos": [{
      "base_imponible": 50.00,
      "valor": 0.00,
      "tarifa": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "0"
    }],
    "descuento": 0.00
  }],
  "reembolso": {
    "subtotal": 50.00,
    "total": 50.00,
    "total_impuestos": 0.00,
    "documentos": [
      {
        "tipo_identificacion_proveedor": "04",
        "pais_origen_proveedor": "593",
        "tipo_proveedor": "01",
        "identificacion_proveedor": "0918723323001",
        "tipo": "01",
        "numero_autorizacion": 3811201601,
        "fecha_emision": "2020-01-28T10:50:26-05:00",
        "codigo_punto_emision": "001",
        "codigo_establecimiento": "003",
        "secuencia": 897,
        "impuestos": [
          {
            "tarifa": 0.0,
            "codigo": "2",
            "codigo_porcentaje": "0",
            "base_imponible": 50.00,
            "valor": 0.00,
          }
        ],
      }
    ],
  },
  "pagos": [
    {
      "forma_pago": "01",
      "total": 50.00,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ]
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/purchase-settlements/issue",
    headers = cabeceras,
    data = json.dumps(liquidacion_compras))
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
      var request = new RestRequest("purchase-settlements/issue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
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
          ""total_sin_impuestos"":50.00,
          ""impuestos"":[
            {
              ""base_imponible"":0.0,
              ""valor"":0.0,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""0""
            },
            {
              ""base_imponible"":50.00,
              ""valor"":523.14,
              ""codigo"":""2"",
              ""codigo_porcentaje"":""2""
            }
          ],
          ""importe_total"":50.00,
          ""descuento"":0.0
        },
        ""maquina_fiscal"": {
          ""marca"": ""SISPAU"",
          ""modelo"": ""ABC123"",
          ""serie"": ""CGNC1405""
        },
        ""proveedor"":{
          ""email"":""juan.perez@xyz.com"",
          ""identificacion"":""0987654321"",
          ""tipo_identificacion"":""05"",
          ""razon_social"":""Juan Pérez"",
          ""direccion"":""Calle única Numero 987"",
          ""telefono"":""046029400""
        },
        ""items"":[
          {
            ""cantidad"":1.0,
            ""codigo_principal"":""REEM"",
            ""codigo_auxiliar"": """",
            ""precio_unitario"": 50.00,
            ""descripcion"": ""Reembolso de gastos"",
            ""precio_total_sin_impuestos"": 50.00,
            ""impuestos"": [
              {
                ""base_imponible"":50.00,
                ""valor"":0.00,
                ""tarifa"":0.00,
                ""codigo"":""2"",
                ""codigo_porcentaje"":""0""
              }
            ],
            ""detalles_adicionales"": {
              ""Peso"":""5000.0000""
            },
            ""descuento"": 0.0,
          }
      ],
      ""reembolso"": {
        ""subtotal"": 50.00,
        ""total"": 50.00,
        ""total_impuestos"": 0.00,
        ""documentos"": [
          {
            ""tipo_identificacion_proveedor"": ""04"",
            ""pais_origen_proveedor"": ""593"",
            ""tipo_proveedor"": ""01"",
            ""identificacion_proveedor"": ""0918723323001"",
            ""tipo"": ""01"",
            ""numero_autorizacion"": 3811201601,
            ""fecha_emision"": ""2020-01-28T10:50:26-05:00"",
            ""codigo_punto_emision"": ""001"",
            ""codigo_establecimiento"": ""003"",
            ""secuencia"": 897,
            ""impuestos"": [
              {
                ""tarifa"": 0.0,
                ""codigo"": ""2"",
                ""codigo_porcentaje"": ""0"",
                ""base_imponible"": 50.00,
                ""valor"": 0.00,
              }
            ],
          }
        ],
      },
      ""pagos"": [
        {
          ""forma_pago"": ""01"",
          ""total"": 50.00,
          ""unidad_tiempo"": ""10"",
          ""plazo"": ""30""
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

Para la emisión de una liquidación de compras de reembolso se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la liquidación de compras. __Requerido__
emisor | [emisor](#emisor) | Información completa del emisor. __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>__Requerido__
totales | objeto tipo [totales](#totales-liquidacion) | Listado de totales. __Requerido__
maquina_fiscal | objeto [maquina_fiscal](#maquina-fiscal) | Información de máquina fiscal.
proveedor | objeto tipo [persona](#persona) | Información del proveedor. __Requerido__
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la liquidación de compras. Para liquidaciones de compras de reembolso el impuesto del ítem es No Objeto de Impuesto __Requerido__
version | string | Versión del formato de comprobantes electrónicos de SRI. Si no se especifica, se utilizará la última revisión del formato implementada,
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
informacion_adicional | objeto | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`
pagos | Listado de objetos tipo [pagos](#pagos-liquidacion) | Listado de formas de pago aplicables a la liquidación de compras. __Requerido__
reembolso | objeto tipo [reembolso](#reembolso) | Información de reembolso. __Requerido__

<h4 id="totales-liquidacion"> Totales </h4>

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
descuento           | float | Suma de los descuentos de cada ítem. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

<h4 id="pagos-liquidacion">Pagos</h4>

Parámetro   | Tipo         | Descripción
----------- | ------------ | ----------
forma_pago       | string       | Código del [tipo de forma de pago](#tipos-de-forma-de-pago-del-sri). __Requerido__
total       | float        | Total aplicable a la forma de pago especificada. __Requerido__
unidad_tiempo       | string       | Máximo 10 caracteres.
plazo       | string       | Máximo 14 caracteres.

### Respuesta

> #### Respuesta de ejemplo

```json
{
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
    "total_sin_impuestos":50.00,
    "impuestos":[
      {
        "base_imponible":50.00,
        "valor":0.00,
        "codigo":"2",
        "codigo_porcentaje":"0"
      }
    ],
    "importe_total":50.00,
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
    "email":"juan.perez@xyz.com",
    "identificacion":"0987654321",
    "tipo_identificacion":"05",
    "razon_social":"Juan Pérez",
    "direccion":"Calle única Numero 987",
    "telefono":"046029400"
  },
  "items": [{
    "cantidad": 1.0,
    "codigo_principal": "REEM",
    "codigo_auxiliar": "",
    "precio_unitario": 50.00,
    "descuento": 0,
    "descripcion": "Reembolso de gastos",
    "precio_total_sin_impuestos": 50.00,
    "impuestos": [{
      "base_imponible": 50.00,
      "valor": 0.00,
      "tarifa": 0.00,
      "codigo": "2",
      "codigo_porcentaje": "0"
    }],
    "descuento": 0.00
  }],
  "reembolso": {
    "subtotal": 50.00,
    "total": 50.00,
    "total_impuestos": 0.00,
    "documentos": [
      {
        "tipo_identificacion_proveedor": "04",
        "pais_origen_proveedor": "593",
        "tipo_proveedor": "01",
        "identificacion_proveedor": "0918723323001",
        "tipo": "01",
        "numero_autorizacion": 3811201601,
        "fecha_emision": "2020-01-28T10:50:26-05:00",
        "codigo_punto_emision": "001",
        "codigo_establecimiento": "003",
        "secuencia": 897,
        "impuestos": [
          {
            "tarifa": 0.0,
            "codigo": "2",
            "codigo_porcentaje": "0",
            "base_imponible": 50.00,
            "valor": 0.00,
          }
        ],
      }
    ],
  },
  "pagos": [
    {
      "forma_pago": "01",
      "total": 50.00,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ]
}
```

Retorna un objeto tipo **[liquidacion](#requerimiento-liquidacion)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la liquidación de compras. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

## Consulta de una liquidación de compra

Consulta una liquidación de compra para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emision),
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /purchase-settlements/<purchase-settlement-ID>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/purchase-settlements/<id-liquidacion> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/purchase-settlements/<id-liquidacion>',
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
      var idLiquidacion = "<id-liquidacion>";
      var request = new RestRequest("purchase-settlements/" + idLiquidacion, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<purchase-settlement-ID>` por el `id` de la liquidación de compra que necesitas consultar.


### Respuesta

> #### Respuesta de ejemplo

```json
{
    "id": "abcf12343faad0678512343faad06785",
    "secuencial": "16",
    "fecha_emision": "2019-05-03",
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
            "fecha_envio": "2019-05-03T16:36:48.274604",
            "destinatarios": "cplaza@gye593.com"
        }
    ],
    "moneda": "USD",
    "informacion_adicional": [],
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": "150.00",
        "descuento": "0.00",
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
    "maquina_fiscal": {
        "marca": "SISPAU",
        "modelo": "ABC123",
        "serie": "CGNC1405"
    },
    "proveedor": {
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
    "pagos": [
      {
        "forma_pago": "01",
        "total": 168.0,
        "unidad_tiempo": "dias",
        "plazo": "30"
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
secuencial | string | Número de secuencia de la liquidación de compras.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf).
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envio-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorizacion-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales-liquidacion) | Listado de totales.
maquina_fiscal | objeto [maquina_fiscal](#maquina-fiscal) | Información de máquina fiscal.
proveedor | objeto [persona](#persona) | Información del proveedor.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la liquidación de compras.
pagos | listado de objetos tipo [pagos](#pagos-liquidacion) | Listado de formas de pago aplicables a la liquidación de compras.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

## Consulta de una liquidación de compra de reembolso

Consulta una liquidación de compra de reembolso para obtener toda la información del comprobante, incluyendo
el estado del mismo.
El parámetro `estado` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle, en que estado del [proceso de emisión](#proceso-de-emision),
se debe examinar los parámetros `envio_sri` y `autorizacion_sri` de la respuesta.

### Operación

`GET /purchase-settlements/<purchase-settlement-ID>`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/purchase-settlements/<id-liquidacion> \
-H "Content-Type: application/json" \
-H "X-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/purchase-settlements/<id-liquidacion>',
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
      var idLiquidacion = "<id-liquidacion>";
      var request = new RestRequest("purchase-settlements/" + idLiquidacion, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<purchase-settlement-ID>` por el `id` de la liquidación de compra que necesitas consultar.


### Respuesta

> #### Respuesta de ejemplo

```json
{
    "id": "abcf12343faad0678512343faad06785",
    "secuencial": "16",
    "fecha_emision": "2019-05-03",
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
            "fecha_envio": "2019-05-03T16:36:48.274604",
            "destinatarios": "cplaza@gye593.com"
        }
    ],
    "moneda": "USD",
    "informacion_adicional": [],
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": 50.00,
        "descuento": "0.00",
        "impuestos": [
            {
                "codigo": 2,
                "codigo_porcentaje": "2",
                "base_imponible": 50.00,
                "valor": 0.00
            }
        ],
        "importe_total": 50.00
    },
    "maquina_fiscal": {
        "marca": "SISPAU",
        "modelo": "ABC123",
        "serie": "CGNC1405"
    },
    "proveedor": {
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
    "items": [{
      "cantidad": 1.0,
      "codigo_principal": "REEM",
      "codigo_auxiliar": "",
      "precio_unitario": 50.00,
      "descuento": 0,
      "descripcion": "Reembolso de gastos",
      "precio_total_sin_impuestos": 50.00,
      "impuestos": [{
        "base_imponible": 50.00,
        "valor": 0.00,
        "tarifa": 0.00,
        "codigo": "2",
        "codigo_porcentaje": "0"
      }],
      "descuento": 0.00
    }],
    "reembolso": {
      "subtotal": 50.00,
      "total": 50.00,
      "total_impuestos": 0.00,
      "documentos": [
        {
          "tipo_identificacion_proveedor": "04",
          "pais_origen_proveedor": "593",
          "tipo_proveedor": "01",
          "identificacion_proveedor": "0918723323001",
          "tipo": "01",
          "numero_autorizacion": 3811201601,
          "fecha_emision": "2020-01-28T10:50:26-05:00",
          "codigo_punto_emision": "001",
          "codigo_establecimiento": "003",
          "secuencia": 897,
          "impuestos": [
            {
              "tarifa": 0.0,
              "codigo": "2",
              "codigo_porcentaje": "0",
              "base_imponible": 50.00,
              "valor": 0.00,
            }
          ],
        }
      ],
    },
    "pagos": [
      {
        "forma_pago": "01",
        "total": 50.0,
        "unidad_tiempo": "dias",
        "plazo": "30"
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
      "fecha": "2019-05-15T16:32:35.000380"
    }
}
```

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la liquidación de compras.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`, `ERROR`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf).
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envio-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorizacion-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales-liquidacion) | Listado de totales.
maquina_fiscal | objeto [maquina_fiscal](#maquina-fiscal) | Información de máquina fiscal.
proveedor | objeto [persona](#persona) | Información del proveedor.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la liquidación de compras.
pagos | listado de objetos tipo [pagos](#pagos-liquidacion) | Listado de formas de pago aplicables a la liquidación de compras.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`
reembolso | objeto tipo [reembolso](#reembolso) | Información de reembolso.

## Re-emisión de una liquidación de compra

### Operación

`POST /purchase-settlements/:id/reissue`

### Requerimiento

> #### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/purchase-settlements/<id-liquidacion>/reissue \
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
        "base_imponible":4359.54,
        "valor":523.14,
        "codigo":"2",
        "codigo_porcentaje":"2"
      }
    ],
    "importe_total":4882.68,
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "pagos": [
    {
      "forma_pago": "01",
      "total": 4882.68,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ],
}'
```

```python
import requests, json

liquidacion_compras = {
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
    "descuento":0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor":{
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
  "pagos": [
    {
      "forma_pago": "01",
      "total": 4882.68,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ]
}
cabeceras = {
    'x-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://link.datil.co/purchase-settlements/<id-liquidacion>/reissue",
    headers = cabeceras,
    data = json.dumps(liquidacion_compras))
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
      var idLiquidacion = "<id-liquidacion>";
      var request = new RestRequest("purchase-settlements/" + idLiquidacion +  "/reissue", Method.POST);
      request.AddHeader("X-Key", "<clave-del-api>");
      request.AddHeader("X-Password", "<clave-certificado-firma>");
      request.AddHeader("Content-Type", "application/json");
      request.RequestFormat = DataFormat.Json;

      var body = (@"{
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
          ""descuento"":0.0
        },
        ""maquina_fiscal"": {
          ""marca"": ""SISPAU"",
          ""modelo"": ""ABC123"",
          ""serie"": ""CGNC1405""
        },
        ""proveedor"":{
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
      ""pagos"": [
        {
          ""forma_pago"": ""01"",
          ""total"": 4882.68
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
    "descuento": 0.0
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "proveedor": {
    "email": "juan.perez@xyz.com",
    "identificacion": "0987654321",
    "tipo_identificacion": "05",
    "razon_social": "Juan Pérez",
    "direccion": "Calle única Numero 987",
    "telefono": "046029400"
  },
  "maquina_fiscal": {
    "marca": "SISPAU",
    "modelo": "ABC123",
    "serie": "CGNC1405"
  },
  "items":[
    {
      "cantidad": 622.0,
      "codigo_principal": "ZNC",
      "codigo_auxiliar": "050",
      "precio_unitario": 7.01,
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
      "descuento": 0.0,
      "unidad_medida": "Kilos"
    }
  ],
  "pagos": [
    {
      "forma_pago": "01",
      "total": 4882.68,
      "unidad_tiempo": "dias",
      "plazo": "30"
    }
  ]
}
```

Retorna un objeto tipo **[liquidacion](#requerimiento-liquidacion)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la liquidación de compras. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta. Sí la liquidación de compra ya está autorizada se retornará un error.