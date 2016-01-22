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
  - invoices
  - credit-notes
  - retentions
  - waybills
  - common
  - errores
  - webhooks

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


