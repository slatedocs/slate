---
title: API Dátil

language_tabs:
  - shell
  - python

toc_footers:
  - <a href='#'>Para obtener mi llave del API</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errores

search: true
---

# Introducción

Integra tu aplicación con Facturación Electrónica. Este API de Dátil te permite
emitir todos los tipos de comprobantes electrónicos: facturas, retenciones, notas
de crédito, notas de débito y guías de remisión.

El API de Dátil está diseñado como un servicio [REST](http://en.wikipedia.org/wiki/Representational_State_Transfer).
De esta manera resulta sencillo conversar con nuestra interfaz utilizando cualquier
lenguaje que provea un cliente HTTP, ya que utilizamos el componentes del estándar
como los verbos y los códigos de respuesta.

Todos las operaciones responden en formato [JSON](http://www.json.org/), 
incluso los errores.

Dátil se encarga de todo el proceso de emisión del comprobante. El proceso de
emisión bajo condiciones normales, toma entre 3 a 5 segundos. Luego de ese período
de tiempo bastará con consultar el comprobante para conocer su estado.

# Autenticación

Para obtener tu llave del API, inicia sesión con tu cuenta en 
[app.datil.co](https://app.datil.co), revisa en la opción _Configuración_ la
sección "API Key".

Dátil utiliza claves de API para autorizar el acceso al API. La llave de API
debe estar incluída en todos los requerimientos en una cabecera:

`X-Key: api-key`

Para la firma de cada comprobante se requiere también de la clave del certificado
de firma electrónica. Esta clave deberá ser provista en una cabecera:

`X-Password: clave-certificado-firma`

<!--aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside-->

# Facturas

## Emisión de una factura

> Requerimiento de ejemplo

```shell
curl -v https://app.datil.co/api/facturar \
-H "Content-Type:application/json" \
-H "X-Key: <API-key>" \
-d '{
  "secuencial": 0,
  "emisor": {
    "ruc": "string",
    "razon_social": "string",
    "nombre_comercial": "string",
    "direccion": "string",
    "contribuyente_especial": "string",
    "obligado_contabilidad": true,
    "establecimiento": {
      "codigo": "string",
      "direccion": "string",
      "punto_emision": "string"
    }
  },
  "moneda": "string",
  "id": "string",
  "ambiente": 0,
  "totales": {
    "impuestos": [
      {
        "codigo": "string",
        "codigo_porcentaje": "string"
      }
    ]
  },
  "comprador": {
    "razon_social": "string",
    "identificacion": "string",
    "tipo_identificacion": "string",
    "email": "string",
    "direccion": "string",
    "telefono": "string"
  },
  "tipo_emision": 0,
  "items": [
    {
      "descripcion": "string",
      "impuestos": [
        {
          "codigo": "string",
          "codigo_porcentaje": "string"
        }
      ],
      "detalles_adicionales": {},
      "codigo_auxiliar": "string",
      "codigo_principal": "string"
    }
  ],
  "version": "string",
  "clave_acceso": "string"
}'
```

```python
import requests, json

factura = {
  "secuencial": 0,
  "emisor": {
    "ruc": "string",
    "razon_social": "string",
    "nombre_comercial": "string",
    "direccion": "string",
    "contribuyente_especial": "string",
    "obligado_contabilidad": true,
    "establecimiento": {
      "codigo": "string",
      "direccion": "string",
      "punto_emision": "string"
    }
  },
  "moneda": "string",
  "id": "string",
  "ambiente": 0,
  "totales": {
    "impuestos": [
      {
        "codigo": "string",
        "codigo_porcentaje": "string"
      }
    ]
  },
  "comprador": {
    "razon_social": "string",
    "identificacion": "string",
    "tipo_identificacion": "string",
    "email": "string",
    "direccion": "string",
    "telefono": "string"
  },
  "tipo_emision": 0,
  "items": [
    {
      "descripcion": "string",
      "impuestos": [
        {
          "codigo": "string",
          "codigo_porcentaje": "string"
        }
      ],
      "detalles_adicionales": {},
      "codigo_auxiliar": "string",
      "codigo_principal": "string"
    }
  ],
  "version": "string",
  "clave_acceso": "string"
}
cabeceras = {
    'x-key': 'clave-del-api'
    'x-pasword': 'clave-certificado-firma',
    'content-type': 'application/json'}
respuesta = requests.post(
    "https://app.datil.co/api/facturar",
    headers = cabeceras,
    data = json.dumps(factura))
```

> Respuesta de ejemplo

```shell
curl -v https://app.datil.co/api/facturar \
-H "Content-Type:application/json" \
-H "X-Key: <API-key>" \
-d '{
  "secuencial": 0,
  "emisor": {
    "ruc": "string",
    "razon_social": "string",
    "nombre_comercial": "string",
    "direccion": "string",
    "contribuyente_especial": "string",
    "obligado_contabilidad": true,
    "establecimiento": {
      "codigo": "string",
      "direccion": "string",
      "punto_emision": "string"
    }
  },
  "moneda": "string",
  "id": "string",
  "ambiente": 0,
  "totales": {
    "impuestos": [
      {
        "codigo": "string",
        "codigo_porcentaje": "string"
      }
    ]
  },
  "comprador": {
    "razon_social": "string",
    "identificacion": "string",
    "tipo_identificacion": "string",
    "email": "string",
    "direccion": "string",
    "telefono": "string"
  },
  "tipo_emision": 0,
  "items": [
    {
      "descripcion": "string",
      "impuestos": [
        {
          "codigo": "string",
          "codigo_porcentaje": "string"
        }
      ],
      "detalles_adicionales": {},
      "codigo_auxiliar": "string",
      "codigo_principal": "string"
    }
  ],
  "version": "string",
  "clave_acceso": "string"
}'
```

```python
print respuesta.json()
"""
{
  "id": "abcf12343faad06785",
  "secuencial": 0,
  "emisor": {
    "ruc": "string",
    "razon_social": "string",
    "nombre_comercial": "string",
    "direccion": "string",
    "contribuyente_especial": "string",
    "obligado_contabilidad": true,
    "establecimiento": {
      "codigo": "string",
      "direccion": "string",
      "punto_emision": "string"
    }
  },
  "moneda": "string",
  "id": "string",
  "ambiente": 0,
  "totales": {
    "impuestos": [
      {
        "codigo": "string",
        "codigo_porcentaje": "string"
      }
    ]
  },
  "comprador": {
    "razon_social": "string",
    "identificacion": "string",
    "tipo_identificacion": "string",
    "email": "string",
    "direccion": "string",
    "telefono": "string"
  },
  "tipo_emision": 0,
  "items": [
    {
      "descripcion": "string",
      "impuestos": [
        {
          "codigo": "string",
          "codigo_porcentaje": "string"
        }
      ],
      "detalles_adicionales": {},
      "codigo_auxiliar": "string",
      "codigo_principal": "string"
    }
  ],
  "version": "string",
  "clave_acceso": "string"
}
"""
```

### Operación

`POST /facturar`

### Requerimiento

Para la emisión de una factura se debe enviar la información completa del
comprobante en el cuerpo del requerimiento en formato JSON.

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la factura. *Requerido*
emisor | [emisor](#emisor) | Información completa del emisor. *Requerido*
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. *Requerido*
ambiente | integer | Pruebas: `1`. Producción `2` *Requerido*
totales | objeto [totales](#totales) | Listado de totales. *Requerido*
comprador | objeto [comprador](#comprador) | Información del comprador. *Requerido*
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>*Requerido*
items | listado de objetos tipo [item](#item) | Items incluídos en la factura. *Requerido*
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, el API la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?

<!--aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside-->


### Respuesta

Retorna un objeto *[factura](#reqerimiento)* qu incluye un nuevo parámetro `id`
que identifica de manera única a la factura.

# Clave de acceso

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

*Nota:* Todos los campos deben completarse conforme a la longitud indicada, es decir si en el número secuencial no completa los 9 dígitos, la clave de acceso estará mal conformada y será motivo de rechazo de la autorización en línea.

El dígito verificador será aplicado sobre toda la clave de acceso (48 dígitos) y deberá ser incorporado por el contribuyente a través del método denominado Módulo 11, con un factor de chequeo ponderado (2), este mecanismo de detección de errores, será verificado al momento de la recepción del comprobante. Cuando el resultado del dígito verificador obtenido sea igual a once (11), el digito verificador será el cero (0) y cuando el resultado del dígito verificador obtenido sea igual a diez 10, el digito verificador será el uno (1).

El código numérico constituye un mecanismo para brindar seguridad al emisor en cada comprobante emitido, el algoritmo numérico para conformar este código es potestad absoluta del contribuyente emisor.

Ver [aquí](https://es.wikipedia.org/wiki/C%C3%B3digo_de_control) ejemplo de verificación utilizando algoritmo de módulo 11


# Objetos del API

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

Representa un establecimiento del comercio.

Parámetro | Tipo | Descripción
--------- | ---- |-----------
impuestos | listado de objetos [impuesto](#total-impuesto) | Listado de impuesto totalizados.

### Total impuesto

Parámetro | Tipo | Descripción
--------- | ---- |-----------
codigo | string | Código del impuesto.
codigo_porcentaje | string | Código del porcentaje.

