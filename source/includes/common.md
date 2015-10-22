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
email | string | Correo electrónico del cliente.

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

<h2 id="item-de-factura">Item de factura y nota de crédito</h2>

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


