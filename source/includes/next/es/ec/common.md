## Objetos comunes

### UUID (Clave de acceso)

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


### Result set

Este objeto siempre se obtiene como respuesta al consultar un listado de recursos

Atributos | &nbsp;
---------------------------------------------- | -------
count<p class="dt-data-type">integer</p>       | Número total de elementos en la lista
results<p class="dt-data-type">array</p>       | Listado de elementos
next<p class="dt-data-type">string</p>         | URL para obtener la página siguiente de resultados, es `null` si no existe una siguiente página de resultados.
previous<p class="dt-data-type">string</p>         | URL para obtener la página anterior de resultados, es `null` si no existe una página anterior de resultados.


### Tax

Impuesto aplicado a una transacción o item.

Atributos | &nbsp;
--------- | -------
tax_code<p class="dt-data-type">string</p> | Código del grupo al que pertenece el impuesto.
rate_code <p class="dt-data-type">string</p> | Código de la tarifa de impuesto aplicado.
amount <p class="dt-data-type">string</p> | Valor a pagar de impuesto
taxable_amount<p class="dt-data-type">object</p> | Base imponible. Valor a partir del cual el impuesto se calcula.
rate <p class="dt-data-type">string</p> | Porcentaje del impuesto aplicado.


### Documento Relacionado

Atributos | &nbsp;
--------- | -------
number<p class="dt-data-type">string</p> | Código del grupo al que pertenece el impuesto.
type <p class="dt-data-type">string</p> | Tipo del documento relacionado. Ver tabla de [Tipos de documentos](#tipos-de-documentos)
issue_date<p class="dt-data-type">string</p> | Fecha de emisión del documento relacionado en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).


### Supplier

Información del emisor de un comprobante.

Atributos | &nbsp;
--------- | -------
tax_identification<p class="dt-data-type">string</p> | Número de RUC de 13 caracteres
legal_name<p class="dt-data-type">string</p> | Razón social
commercial_name<p class="dt-data-type">string</p> | Nombre comercial
address<p class="dt-data-type">string</p> | Dirección del establecimiento registrada en el SRI
locality<p class="dt-data-type">string</p> | Ciudad o pueblo
administrative_district_level_1 <p class="dt-data-type">string</p> | Provincia
country<p class="dt-data-type">string</p> | País
properties <p class="dt-data-type">list of [property](#property) objects</p> |
location | [location](#location) | Información del establecimiento que emite el documento


### Location

Representa un establecimiento del negocio.

Atributos | &nbsp;
--------- | -------
code<p class="dt-data-type">string</p> | Código numérico de 3 caracteres que representa al establecimiento. Ejemplo: `001`
address<p class="dt-data-type">string</p> | Dirección registrada en el SRI. Máximo 300 caracteres
administrative_district_level_1<p class="dt-data-type">string</p> | Provincia
administrative_district_level_2<p class="dt-data-type">string</p> | Ciudad
point_of_sale<p class="dt-data-type">object [punto de venta](#point_of_sale)</p> | Información del punto de venta que emite el documento


### Point of sale

Atributos | &nbsp;
--------- | -------
id<p class="dt-data-type">string</p> | ID único del punto de venta
code<p class="dt-data-type">string</p> | Código numérico de 3 caracteres que identifica al punto de emisión, o punto de venta. Ejemplo: "001"


### Contacto

Los contactos están representados por un objeto _Contact_


#### El objeto Contact

Atributos | &nbsp;
--------- | -------
person <p class="dt-data-type">object</p> | objeto tipo [person](#person). Aparece cuando el contacto es una persona.
business <p class="dt-data-type">object</p> | objeto tipo [business](#business). Aparece cuando el contacto es una empresa.
properties <p class="dt-data-type">object</p> | diccionario de datos. Representa información complementarios del contacto.
tax_identification <p class="dt-data-type">string</p> | De 5 a máximo 20 caracteres.
tax_identification_type <p class="dt-data-type">string</p> | Ver [tabla](#tipo-de-identificación) de tipos de identificación
email <p class="dt-data-type">string</p> | Correo electrónico. Máximo 255 caracteres.
phone <p class="dt-data-type">string</p> | Teléfono.
address <p class="dt-data-type">string</p> | Dirección
locality <p class="dt-data-type">string</p> | Ciudad o pueblo
sublocality <p class="dt-data-type">string</p> | Sector o barrio
administrative_district_level_1 <p class="dt-data-type">string</p> | Provincia

El contacto debe incluir alguno de los dos atributos, `business` o `person`.


### Business

Atributos | &nbsp;
--------- | -------
legal_name <p class="dt-data-type">string</p> | Razón social.
commercial_name <p class="dt-data-type">string</p> | Nombre de comercial.


### Person

Atributos | &nbsp;
--------- | -------
first_name <p class="dt-data-type">string</p> | Nombre de pila.
middle_name <p class="dt-data-type">string</p> | Segundo nombre.
last_name <p class="dt-data-type">string</p> | Apellido.


### Property

Atributos | &nbsp;
--------- | -------
name <p class="dt-data-type">string</p> | Nombre de la propiedad. Esto permite asociar información de cualquier índole a los recursos que soportan esta propiedad.
description <p class="dt-data-type">string</p> | Valor de la propiedad.


### Envío SRI

Contiene la información y el estado de la fase de envío al SRI

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
mensajes | listado de objeto [mensaje SRI](#mensajes-de-respuesta-sri) | Listado de mensajes.
estado   | string | Posibles valores: `RECIBIDA`, `DEVUELTA`
fecha    | string | Fecha en la que se realizó el envío en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).


### Autorización SRI

Contiene la información y el estado de la fase de autorización del comprobante.

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
mensajes | listado de objeto [mensaje SRI](#mensajes-de-respuesta-sri) | Listado de mensajes.
estado   | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`
numero   | string | Número de autorización.
fecha    | string | Fecha en la que se otorgó la autorización en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).


### Mensajes de respuesta SRI

Parámetro             | Tipo   | Descripción
--------------------- | ------ | -----------
identificador         | string | Número con el que el SRI identifica al mensaje.
mensaje               | string | Descripción del error, información o advertencia.
tipo                  | string | Posibles valores: `INFORMATIVO`, `ADVERTENCIA`, `ERROR`
informacion_adicional | string | Información adicional del mensaje.


<h3 id="retencion-de-factura">Retención en factura </h2>

Caso específico de Retenciones en la Comercializadores / Distribuidores de derivados del Petróleo y Retención presuntiva de IVA a los Editores, Distribuidores y Voceadores que participan en la comercialización de periódicos y/o revistas.

Parámetro | Tipo | Descripción
--------- | ---- |-----------
codigo | string | Código del [tipo de impuesto para la retención en la factura](#tipos-de-impuesto-para-la-retención-en-la-factura).  __Requerido__
codigo_porcentaje | string | Código del [porcentaje del impuesto](#retención-de-iva-presuntivo-y-renta). __Requerido__
tarifa | float | Porcentaje actual del impuesto. Máximo 3 enteros y 2 decimales.  __Requerido__
valor | float | Valor del impuesto. Máximo 12 enteros y 2 decimales.  __Requerido__
