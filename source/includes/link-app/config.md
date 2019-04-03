# Configuración

Link utiliza archivos de configuración en formato .ini que contienen todos los
parámetros que se pueden ajustar. Puesto que los archivos de configuración se
encuentran en la carpeta de `C:\Archivos de Progama\Datil\Link\config` para
editarlos debes abrir siempre tu editor con permisos de administrador.

Los [archivos INI](https://es.wikipedia.org/wiki/INI_(extensi%C3%B3n_de_archivo))
están compuestos por secciones y cada sección puede tener varias claves y
valores.

## Base de datos

Cómo lo describimos en la sección de *Introducción* Link utiliza una tabla de
control para mantener un registro de los documentos que ya ha procesado. Este
registro contiene información como el estado, la fecha de registro en la tabla
de control, la fecha y el número de autorización y el ID (id_externo) del
documento en Datil.

En el archivo [environment.ini](#environment-ini) va la configuración de la
conexión a la base donde se encuentran las tablas de control y mensaje.
En el archivo [companies/my company.ini](#companies-my_company-ini) debes
configurar la conexión a la base de datos donde están las tablas/vistas desde
las que Link extraerá la información de los documentos.

Esta separación permite a Link funcionar en estos escenarios:
- Emitir documentos de más de una compañía en un sistema ERP que almacena los
documentos de cada compañía en una base de datos diferente.
- Mantener la base de datos en la que puede _escribir_ Link completamente aislada
de la base de datos de la que sólo puede _leer_ Link.

A partir de la versión [6.0.0](#6-0-0) existen dos maneras de especificar los
parámetros de conexión a la base de datos:

### Simplificada

Link tiene la capacidad de construir la cadena de conexión para los siguientes
drivers ODBC: SQL Anywhere 11, Microsoft ODBC for Oracle, Oracle in OraClient11g_home1,
Microsoft ODBC Driver for Oracle y SQL Server. Si utilizas alguno de estos drivers
debes especificar los siguientes parámetros:

Parámetros | &nbsp;
---------- | -----------
driver | Controlador cuando se establece una conexión por ODBC.
server | Dirección o nombre del servidor
name | Nombre de la base de datos
user | Nombre de usuario.
password | Contraseña del usuario de la base de datos
version<p class="dt-data-param-required">requerido</p> | Versión del motor de base de datos que se utiliza para constriur SQL dependiendo de la versión
connection_string | Permite especificar la cadena de conexión ODBC para conectarse a la base. Si especificas este parámetro todos los otros parámetros de conexión como driver, server, name, user y password serán ignorados. Debes especificar este parámetro o el conjunto de parámetros driver, server, name, user, password.
api<p class="dt-data-param-required">requerido</p> | Puede ser `odbc` o `adodb`
data_source<p class="dt-data-param-required">requerido</p> | Utilizado para conexiones tipo `adodb`
provider<p class="dt-data-param-required">requerido</p> | Utilizado para conexiones tipo `adodb`
datetime_format | Formato de la representación literal de un SQL_TIMESTAMP. Por ejemplo en SQL Server el literal de un `DATETIME` es %Y-%m-%d %H:%M:%S


### Cadena de conexión (connection string) explícita

La nueva manera a partir de la versión 6.0.0 de conexión sólo requiere que se
especifique el parámetro `connection_string`. Así es posible utilizar cualquier
motor de base de datos o controlador no soportado por la manera simplificada de
conexión.

Esta es la manera de conexión recomendada a partir de la versión 6.0.0 de Link.

#### Ejemplos

Ejemplos de configuración para sistemas de base de datos más comunes

##### SQL Server

```ini
driver = SQL Server
server = ADMIN\SQLEXPRESS.
name = DATIL
user = link
password = Link007
version = 2012
api = odbc
datasource = None
provider   = None
```

##### Oracle

```ini
[DatabaseSource]
driver = Microsoft ODBC for Oracle
server = mydbserver
name =
user = link
password = datil
version = 10
api = odbc
data_source = None
provider = None
datetime_format = %Y-%m-%d %H:%M:%S.%f'
```

##### MySQL
```ini
[DatabaseSource]
connection_string = DRIVER={MySQL ODBC 8.0 ANSI Driver};SERVER=localhost;DATABASE=datil;USER=link;PASSWORD=Link007;OPTION=3
driver =
server =
name =
user =
password =
version = 8.0
api = odbc
data_source = None
provider = None
```

Consulta la documentación del driver ODBC que utilizas, o busca en la sitio web
[www.connectionstrings.com](https://www.connectionstrings.com) la documentación
del motor de base de datos que utilizas.


## environment.ini

Parámetros generales del ambiente. Contiene las siguientes secciones.

### [DatabaseSource]

Revisa la sección de configuración de [base de datos](#base-de-datos) para más
información

### [Scheduler]

Las tareas de emisión, consulta y sincronización se ejecutan al iniciar el
servicio y luego esperan el tiempo establecido por estos parámetros antes de
volver a ejecutarse. Todos estos valores se especifican en segundos.

Parámetros | &nbsp;
---------- | -----------
issue_receipts_interval<p class="dt-data-param-required">requerido</p> | Intervalo para la tarea de *emisión* de documentos.
read_receipts_interval<p class="dt-data-param-required">requerido</p> | Intervalo para la tarea de *consulta de estado* de documentos.
issue_receipts_from_xml_interval<p class="dt-data-param-required">requerido</p> | Intervalo para la tarea de *emisión por xml*.
send_status_interval<p class="dt-data-param-required">requerido</p> | Intervalo para la tarea de reporte de estado (aun no utilizada)
sync_resources_interval<p class="dt-data-param-required">requerido</p> | Intervalo para la tarea de *sincronización de recursos*.


### [Constraints]

Restricciones para la consulta de documentos.

Parámetros | &nbsp;
---------- | -----------
issue_limit<p class="dt-data-param-required">requerido</p> | Número máximo de documentos que la tarea de *emisión* de documentos toma cada vez que se ejecuta. Existe un problema conocido en bases de datos ORACLE que impide establecer este parámetro en un valor diferente a uno.
issue_order<p class="dt-data-param-required">requerido</p> | Determina el ordenamiento de los documentos consultados para emitir. Puede ser `ASC` o `DESC`
get_info_limit<p class="dt-data-param-required">requerido</p> | Número máximo de documentos que la tarea de *consulta de estado* de documentos toma cada vez que se ejecuta.
get_info_order<p class="dt-data-param-required">requerido</p> | Determina el ordenamiento de los documentos consultados para obtener su estado. Puede ser `ASC` o `DESC`
first_receipt_date<p class="dt-data-param-required">requerido</p> | Establece la fecha a partir de la cual necesitas emitir documentos. La fecha debe tener el formato `YYYY-mm-dd hh:MM:SS` ejemplo: `2002-09-12 13:40:00` para el 12 de septiembre del año 2002 a las trece horas con cuarenta minutos y cero segundos.
max_days_to_query<p class="dt-data-param-required">requerido</p> | El número máximo de días previos a consultar a partir de la fecha actual. Normalmente se configura con 30 puesto que es el límite de fecha de emisión establecido por el SRI para emitir un documento electrónico.
new_receipts_limit<p class="dt-data-param-required">requerido</p> | Número máximo de documentos que la tarea de *control* inserta a la tabla de Control cada vez que se ejecuta.

## companies/my_company.ini

No es necesario, pero te recomendamos renombrar este archivo con un nombre
corto de tu empresa, sobretodo si vas a utilizar una instalación de Link para
varias empresas. Link utiliza el nombre de este archivo para garantizar que los
registros en la tabla de *control* sean únicos para cada compañía, esto es lo
que verás en el campo `company_name` una vez que Link empiece a funcionar e
inserte registros en la tabla de control.
Utiliza sólo letras, números, guiones o sub-guiones para el nombre del archivo.
Ejemplo: `acme_inc`

### [General]

En la sección `[General]` configura el parámetro `ruc` con el ruc de la empresa.

### [Api]

En la sección `[Api]` configura el parámetro `xkey` con el _API key_ de Dátil y
`xpassword` con la clave del certificado de firma electrónica, `environment`
con el valor `1` para emisión en modo de pruebas o `2` para emitir en producción.

### [IssueFromDatabase]

Los parámetros de esta sección te permiten encender o apagar la *tarea de emisión*
desde la base de datos para cada tipo de comprobante para esta compañía. Los
posibles valores para estos parámetros son `yes` o `no`. El valor `yes` le
indica a Link que debe encender la tarea y `no` que debe apagarla.

### [IssueFromXml]

Estos parámetros permiten encender o apagar la *tarea de emisión por xml*.

### [Read]
Estos parámetros permiten encender o apagar la *tarea de consulta* de
autorización.

### [DatabaseSource]

Revisa la sección de configuración de [base de datos](#base-de-datos) para más
información.

### [XmlSource]

Configuración de las rutas de los directorios donde se encuentran los archivos
XML. Esto aplica para la emisión por XML.

### Sincronización y Eventos

Link tiene la habilidad de suscribirse a [eventos](https://datil.dev/next/events)
emitidos por Datil y ejecutar sentencias SQL y descargar archivos. Cualquier
atributo del evento que contenga la dirección a un recurso (URI) válido puede
ser descargado y almacenado en un directorio del sistema.

El nombre de la sección para cada configuración es el nombre del evento, de
esta manera podrás tener configuraciones diferentes para cada evento.

Estos son los parámetros de configuración para cada evento:

Parámetros | &nbsp;
---------- | -----------
download_files<p class="dt-data-param-required">requerido</p> | Activa o inactiva el proceso de descarga de archivos. Puede ser _yes_ o _no_
update_tables<p class="dt-data-param-required">requerido</p> | Activa o inactiva el proceso de ejecución de SQL. Puede ser _yes_ o _no_
formats_to_download<p class="dt-data-param-required">requerido</p> | Especifica este valor si `download_files` está activo. Puede ser una lista de valores separados por coma o la palabra reservada *all*. Si utilizas la palabra *all* intentará descargar los archivos detallados en este mismo parámetro en la sección [Sync] del archivo environment.ini
download_path | Ruta del directorio donde se descargará los archivos. Requerido si `download_files` está activo.
download_path_[ATRIBUTO] | Ruta del directorio donde se descargarán los archivos para el atributo _"ATRIBUTO"_. Puedes personalizar esta ruta utilizando condicionales, lazos, macros, bloques, variables, etiquetas disponibles en [Jinja2](http://jinja.pocoo.org/).
update_tables_sentences | Sentencias SQL a ejecutar cuando el evento sea recibido. Puedes personalizar este SQL utilizando condicionales, lazos, macros, bloques, variables disponibles en [Jinja2](http://jinja.pocoo.org/). Requerido si `update_tables` está activo.

<h4 class="dt-section">Ejemplo de descarga en un solo directorio</h4>

```ini
[invoice.received]
download_files = yes
update_tables = yes
formats_to_download = printable_version_url, electronic_document_url
download_path = C:/Documentos Recibidos/
update_tables_sentences = UPDATE factura
  SET numero_autorizacion = '{{ authorization.number }}'
  WHERE numero = '{{ number }}'
```

De esta manera podrías, por ejemplo, actualizar información en una tabla de tu
base de datos y descargar el PDF (`printable_version_url`) y el documento
electrónico XML (`electronic_document_url`) cada vez que en tu cuenta Dátil
recibas una factura de compra (invoice.received). La configuración luciría así:

<h4 class="dt-section">Ejemplo de descarga con un directorio diferente para cada archivo</h4>

```ini
[invoice.received]
download_files = yes
update_tables = yes
formats_to_download = printable_version_url, electronic_document_url
download_path_printable_version_url = C:/Documentos Recibidos/{{ issue_date_date.year }}/{{ issue_date_month_name }}/pdf/
download_path_electronic_document_url = C:/Documentos Recibidos/{{ issue_date_date.year }}/{{ issue_date_month_name }}/xml/
update_tables_sentences = UPDATE factura
  SET numero_autorizacion = '{{ authorization.number }}'
  WHERE numero = '{{ number }}'
```

Si quisieras almacenar los archivos en directorios separados podrías configurar
el evento de esta manera.

<aside class="notice">
El nombre del archivo tomará el nombre establecido por el servidor del
archivo a través de la cabecera HTTP Content-Disposition. Si esta cabecera no
está presente, se utilizará el ID del recurso contenido en el evento para dar
nombre al archivo.
</aside>


# Ejecutar el servicio

En el menú `Inicio` buscar el `Simbolo del Sistema` , darle click derecho y escoger la opción `Ejecutar como administrador`.

Luego para iniciar el servicio ejecutar el comando:

`net start datilink`

Enter.

Si desea detener el servicio, ejecutar:

`net stop datilink`

# Queries

__Tablas o Vistas__

Para que la aplicación **Link** se conecte a su ERP o sistema contable se deben configurar
los *queries* para extraer información directamente de las tablas  de su base de datos.

Si no desea que **Link** consulte directamente sus tablas puede crear vistas con la información
de los comprobantes a emitir.

__Formato__

Los queries se guardan siguiendo el formato de archivos `.ini`. en el directorio
*C:/Archivos de Programa/Datil/Link/config/*.

En cada archivo `.ini` cada _query_ está asignado a una variable.

Si aún no ha instalado __Link__, puede crear un archivo `.ini` de respaldo con los queries configurados.

[Ver ejemplos de archivos de configuración](link-app#ejemplos-de-archivos-de-configuraci-n)

__Nombres de tablas y columnas__

Sea directamente o por medio de vistas, dependiendo de su sistema, deberá cambiar los nombres de las tablas  al configurar los _queries_.

Los nombres de las columnas en las tablas
de su sistema pueden ser distintos pero el resultado de cada _query_ debe tener los nombres establecidos en esta documentación.

__Queries opcionales__

Algunos queries son opcionales porque la información que extraen no es obligatoria para el SRI, en este caso la variable que se configura en el archivo `.ini` debe tener asignada el valor de `None`.

Ejemplo:

`invoice_additional_information = None`

`item_details = None`


## Facturas

Los queries para la emisión electrónica de __facturas__ se guardan en el archivo de configuración `invoice.ini`.

[Ejemplo de archivo invoice.ini](/link-app#invoice-ini)

### Cabecera

Obtiene información de la cabecera de la factura.

```sql
headers = SELECT
  id_factura            id_local,
  secuencial,
  fecha_emision,
  guia_remision,
  moneda,
  clave_acceso,
  tipo_emision
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  info.id_factura in (:sequence)
  ORDER BY id_factura :order
```


Campo |  Tipo | Descripción
--------- | -----------| ---------
id_local | int o string | Identifica de manera única la factura. __Requerido__
secuencial | string  | Número de secuencia de la factura. __Requerido__
fecha_emision | datetime  | Fecha de emisión   __Requerido__
guia_remision | string | Número de guía de remisión asociada a esta factura en formato 001-002-000000003 ([0-9]{3}-[0-9]{3}-[0-9]{9})
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__

### Emisor

Obtiene información del vendedor en la factura

```sql
invoice_seller  = SELECT
  ruc,
  obligado_contabilidad,
  contribuyente_especial,
  nombre_comercial,
  razon_social,
  direccion_establecimiento,
  direccion_emisor,
  codigo,
  punto_emision
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  id_factura = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
ruc | string | Número de RUC de 13 caracteres. __Requerido__
obligado_contabilidad | string | `'SI'` si está obligado a llevar contabilidad. `'NO'` si no lo está.
contribuyente_especial | string | Número de resolución. En blanco `''` si no es contribuyente especial.
nombre_comercial | string| Nombre comercial. Máximo 300 caracteres __Requerido__
razon_social | string | Razón social. Máximo 300 caracteres __Requerido__
direccion_establecimiento | string | Dirección registrada en el SRI. Máximo 300 caracteres. __Requerido__
direccion_emisor | string | Dirección del punto de emisión. Máximo 300 caracteres. __Requerido__
codigo | string | Código numérico de 3 caracteres que representa al establecimiento. Ejemplo: `001` __Requerido__
punto_emision | string | Código numérico de 3 caracteres que representa al punto de emisión, o punto de venta. Ejemplo: `001`. __Requerido__


### Comprador

Obtiene información del comprador en la factura

```sql
invoice_buyer  = SELECT
  identificacion,
  tipo_identificacion,
  razon_social,
  direccion,
  email,
  telefono
  FROM
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  id_factura = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
razon_social | string | Razón social. Máximo 300 caracteres. __Requerido__
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificaci-n) de tipos de identificación __Requerido__
email | string | Correo electrónico. Máximo 300 caracteres. __Requerido__
telefono | string | Teléfono
direccion | string | Dirección


### Totales

Obtiene información de los valores totales de la facturas

```sql
invoice_totals  = SELECT
  total_sin_impuestos,
  importe_total,
  propina,
  descuento
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  id_factura = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
propina             | float | Propina total, llamado también servicio. __Requerido__
descuento           | float | Suma de los descuentos de cada ítem y del descuento adicional. __Requerido__

### Impuestos de totales

Obtiene información de los impuestos de los totales de la factura

```sql
invoice_totals_taxes  = SELECT
  codigo,
  codigo_porcentaje,
  base_imponible,
  valor
  FROM
  DocElectronicoFactura.totales_impuestos
  WHERE
  id_factura = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto) __Requerido__
codigo_porcentaje | string | Código del [porcentaje](#c-digo-de-porcentaje-de-iva). __Requerido__
base_imponible | float | Base imponible. __Requerido__
valor | float | Valor del total. __Requerido__


### Items

Obtiene todos los items de una factura

```sql
items  = SELECT
  id_detalle,
  codigo_principal,
  codigo_auxiliar,
  descripcion,
  cantidad,
  precio_unitario,
  descuento,
  precio_total_sin_impuestos,
  unidad_medida
  FROM
  DocElectronicoFactura.items
  WHERE
  id_factura = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
id_detalle | string | Identifica de manera única el ítem o detalle de la factura. Si no hay un solo campo que lo identifique de manera única se debe usar la concatenación de varios.__Requerido__
codigo_principal | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres. __Requerido__
codigo_auxiliar | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
descripcion | string | Descripción del ítem. __Requerido__
cantidad | float | Cantidad de items. __Requerido__
precio_unitario | float | Precio unitario. __Requerido__
descuento | float | El descuento es aplicado por cada producto. __Requerido__
precio_total_sin_impuestos | float | Precio antes de los impuestos. Se obtiene multiplicando la `cantidad` por el `precio_unitario` __Requerido__
unidad_medida | string | Unidad de medida. Ejemplo: Kilos. __Requerido para facturas de exportación__

### Impuestos de items

Obtiene los impuestos de un item. Este query es __opcional__

```sql
item_taxes  = SELECT
  base_imponible,
  valor,
  tarifa,
  codigo,
  codigo_porcentaje
  FROM
  DocElectronicoFactura.items_impuestos
  WHERE
  id_detalle = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
base_imponible | float | Base imponible. __Requerido__
valor | float | Valor del total. __Requerido__
tarifa | float | Porcentaje actual del impuesto expresado por un número entre 0.0 y 100.0 __Requerido__
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto) __Requerido__
codigo_porcentaje | string | Código del [porcentaje](#c-digo-de-porcentaje-de-iva). __Requerido__

### Detalles adicionales de items

Obtiene los detalles adicionales de un ítem. Este query es __opcional__.

Los detalles adicionales de un ítem se manejan de la forma 'Clave':'Valor'. Ejemplo: 'Peso':'Kg'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con detalles adicionales del ítem:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Peso        |   KG
Color           |   Rojo
Caducidad                 |   10 días

```sql
item_details = SELECT
  columna_de_nombres    nombre,
  columna_de_valores   valor
  FROM
  DocElectronicoFactura.items_detalles_adicionales
  WHERE
  id_detalle = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
nombre | string | Nombre del detalle adicional del ítem
valor | string | Valor del detalle adicional del ítem

### Información adicional

Obtiene la información adicional de la factura. Este query es __opcional__

La información adicional de la factura se maneja de la forma 'Clave':'Valor'. Ejemplo: 'Tipo de pago':'Cheque'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con información adicional de la factura:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Tipo de servicio        |   Avanzado
Forma de pago           |   Cheque
Periodo                 |   3 meses

```sql
invoice_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoFactura.informacion_adicional
  WHERE
  id_factura = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
`_nombre_` | string | Nombre de la información adicional de la factura
`_valor_` | string | Valor de la información adicional de la factura

### Pagos

Obtiene la información de los pagos aplicables a la factura.

```sql
payment_methods  = SELECT
  id_pago,
  medio_pago medio,
  total_pago total
  FROM
  DocElectronicoFactura.pagos
  WHERE
  id_factura = ?
```

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- | ----------
id_pago              | --                  | Identificador único del pago, se usa para obtener las [propiedades
del pago](Propiedades de Pagos), si no hay un identificador único del pago o no hay propiedades de pagos, se debe devolver el *id_factura*.
medio              | string                  | Código del [tipo de forma de pago](#tipos-de-forma-de-pago). __Requerido__
total               | float                   | Total aplicable a la forma de pago especificada. __Requerido__

### Propiedades de Pagos

Obtiene la propiedades de los pagos de determinada factura. Este query es __opcional__

Las propiedades de los pagos se manejan de la forma 'Clave':'Valor'. Ejemplo: 'Plazo':'5'

Se asume que en la tabla consultada una columna tiene los nombres y otra los valores.

Ejemplo de columnas con propiedades de los pagos:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
plazo        |   9
unidad_tiempo           |   dias

```sql
payment_method_properties = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoFactura.propiedades_pagos
  WHERE
  id_pago = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
`_nombre_` | string | Nombre de la propiedad del pago
`_valor_` | string | Valor de la propiedad del pago


Para el Servicio de Rentas Internas de Ecuador (SRI), las únicas propiedades que se tomarán en cuenta son `plazo` (especifica el plazo del tipo de pago) y `unidad_tiempo` (especifica la unidad de tiempo en la cual se expresa el plazo).

Las demás propiedades que se especifiquen se registrarán en Dátil como parte del pago, pero no se reportarán al SRI.

### Crédito

Crédito otorgado en la venta.  Este query es __opcional__ , en caso de que todos los pagos se realizan en el momento de la venta, es decir no hay crédito.

Campo           | Tipo    | Descripción
------------------- | ------- | ----------
fecha_vencimiento   | string  | Fecha de vencimiento en formato AAAA-MM-DD, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
monto               | float   | Monto otorgado de crédito. __Requerido__

```sql
invoice_credit = SELECT
  monto,
  fecha_vencimiento
  FROM
  facturas.credito
  WHERE
  id_factura = ?
```

### Compensación solidaria

Descuento otorgado a las provincias de Manabí y Esmeraldas. Obligatorio solo para estas provincias.


Campo           | Tipo    | Descripción
------------------- | ------- | ----------
codigo   | int  | Código del porcentaje de IVA . __Requerido__
tarifa   | int   | Porcentaje de compensación. __Requerido__
valor   | float   | Valor de la compensación. __Requerido__

```sql
invoice_compensation = SELECT
  codigo,
  tarifa,
  valor
  FROM
  facturas.compensacion
  WHERE
  id_factura = ?
```

### Exportación

Obligatorio __solo__ para facturas de exportación


Campo           | Tipo    | Descripción
------------------- | ------- | ----------
incoterm_termino   | string  | Código de 3 letras correspondiente al [Incoterm](http://www.proecuador.gob.ec/exportadores/requisitos-para-exportar/incoterms/) . __Requerido__
incoterm_lugar   | string  | Lugar Incoterm . __Requerido__
incoterm_total_sin_impuestos   | string  | Total sin impuestos pagado por el incoterm. __Requerido__
codigo_pais_origen   | string  | Código de dos letras del país origen según [ISO_3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)  . __Requerido__
codigo_pais_destino   | string  | Código de dos letras del país origen según [ISO_3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)  
codigo_pais_adquisicion   | string  | Código de dos letras del país origen según[ISO_3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements)
puerto_origen   | string  | Puerto de origen. __Requerido__
puerto_destino   | string  | Puerto de destino. __Requerido__
total_flete_internacional   | float  | Total del flete internacional
total_seguro_internacional   | float  | Total del seguro internacional
total_gastos_aduaneros   | float  | Total de los gastos aduaneros
total_otros_gastos_transporte   | float  | Total de otros gastos de transporte

```sql
invoice_export = SELECT
  incoterm_termino,
  incoterm_lugar,
  incoterm_total_sin_impuestos,
  codigo_pais_origen,
  codigo_pais_destino,
  codigo_pais_adquisicion,
  puerto_origen,
  puerto_destino,
  total_flete_internacional,
  total_seguro_internacional,
  total_gastos_aduaneros,
  total_otros_gastos_transporte,
  FROM
  facturas.exportacion
  WHERE
  id_factura = ?
```

### Tablas recomendadas

Estructura recomendada para las tablas o vistas con información de la factura.

Ejemplo en SQL Server:

```sql
CREATE SCHEMA facturas

DROP TABLE [facturas].[pago_propiedad]
DROP TABLE [facturas].[pago]
DROP TABLE [facturas].[item_impuesto]
DROP TABLE [facturas].[item_detalle_adicional]
DROP TABLE [facturas].[item]
DROP TABLE [facturas].[total_impuesto]
DROP TABLE [facturas].[informacion_adicional]
DROP TABLE [facturas].[factura]


CREATE TABLE [facturas].[factura](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [ambiente] [int] NOT NULL, -- (OPCIONAL) el ambiente se toma del archivo de configuración de Link App.
    [tipo_emision] [int] NOT NULL,
    [secuencial] [bigint] NOT NULL,
    [fecha_emision] [datetime] NULL,
    [moneda] [varchar](15) NOT NULL, -- USD para dólares
    [guia_remision] [varchar](17),
    [clave_acceso] [varchar](49) NULL,
    -- EMISOR
    [ruc] [varchar](13) NULL,
    [obligado_contabilidad] [varchar](2) NULL,
    [contribuyente_especial] [varchar](10) NULL,
    [nombre_comercial] [varchar](300) NULL,
    [razon_social] [varchar](300) NULL,
    [direccion_matriz] [varchar](300) NULL,
    [codigo_establecimiento] [varchar](3) NULL,
    [punto_emision] [varchar](3) NULL,
    [direccion_establecimiento] [varchar](300) NULL,
    -- COMPRADOR
    [email_comprador] [varchar](254) NULL,
    [identificacion_comprador] [varchar](20) NULL,
    [tipo_identificacion_comprador] [varchar](2) NULL,
    [razon_social_comprador] [varchar](200) NULL,
    [direccion_comprador] [varchar](200) NULL,
    [telefono_comprador] [varchar](200) NULL,
    -- TOTALES
    [total_sin_impuestos] [decimal](14,2) NULL,
    [importe_total] [decimal](14,2) NULL,
    [propina] [decimal](14,2) NULL,
    [descuento] [decimal](14,2) NULL,
    [descuento_adicional] [decimal](14,2) NULL,
    -- CREDITO
    [monto_credito] [decimal](14,2) NULL,
    [fecha_vencimiento_credito] [date] NULL,
    -- VALORES RETENIDOS
    [valor_retenido_iva] [decimal](14,2) NULL,
    [valor_retenido_renta] [decimal](14,2) NULL,
)

-- FACTURA: ITEMS
CREATE TABLE [facturas].[item](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
    [cantidad] [decimal](14,2)  NOT NULL,
    [codigo_principal] [varchar](50)  NULL,
    [codigo_auxiliar] [varchar](50)  NULL,
    [precio_unitario] [decimal](14,2)  NOT NULL,
    [descripcion] [varchar](300)  NOT NULL,
    [precio_total_sin_impuestos] [decimal](14,2)  NOT NULL,
    [descuento] [decimal](14,2)  NULL,
    [unidad_medida] [varchar](50)  NULL

)

-- FACTURA: IMPUESTOS DE ITEMS
CREATE TABLE [facturas].[item_impuesto](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [facturas].[item](id),
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](2) NOT NULL,
    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL,
    [tarifa] [decimal](14,2) NOT NULL, -- porcentaje
    CONSTRAINT PK_item_impuesto PRIMARY KEY (id_item, codigo, codigo_porcentaje)
)

-- FACTURA: DETALLES ADICIONALES DE ITEMS
CREATE TABLE [facturas].[item_detalle_adicional](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [facturas].[item](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT pk_items_detalles_adicionales PRIMARY KEY (id_item, nombre)
)

-- FACTURA: IMPUESTOS TOTALES
CREATE TABLE [facturas].[total_impuesto](
    [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](2) NOT NULL,
    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL
    CONSTRAINT PK_total_impuesto PRIMARY KEY (id_factura, codigo, codigo_porcentaje)
)

-- FACTURA: INFORMACION ADICIONAL DE LA FACTURA
CREATE TABLE [facturas].[informacion_adicional](
    [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT PK_informacion_adicional PRIMARY KEY (id_factura, nombre)
)

-- FACTURA: PAGOS
CREATE TABLE [facturas].[pago](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
    [fecha] [datetime] NOT NULL,
    [medio] [varchar](100) NOT NULL,
    [notas] [varchar](max) NOT NULL,
    [monto] [decimal](14, 2) NOT NULL
)

-- FACTURA: PROPIEDADES DE PAGOS
CREATE TABLE [facturas].[pago_propiedad](
  [id_pago] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[pago](id),
  [nombre] [varchar](100) NOT NULL,
  [valor] [varchar](100) NOT NULL,
  CONSTRAINT PK_pago_propiedad PRIMARY KEY (id_pago, nombre)
)

-- FACTURA: CREDITO
CREATE TABLE [facturas].[credito](
  [id] bigint IDENTITY(1,1) PRIMARY KEY,
  [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
  [monto] [decimal](14,2) NOT NULL,
  [fecha_vencimiento] [varchar](10) NOT NULL
)

-- FACTURA: COMPENSACION SOLIDARIA
CREATE TABLE [facturas].[compensacion](
  [id] bigint IDENTITY(1,1) PRIMARY KEY,
  [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
  [codigo] [int] NOT NULL,
  [tarifa] [int] NOT NULL,
  [valor] [decimal](14,2) NOT NULL
)

-- FACTURA: EXPORTACION
CREATE TABLE [facturas].[exportacion](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
    [incoterm_termino] [varchar](10)  NULL,
    [incoterm_lugar] [varchar](300)  NULL,
    [incoterm_total_sin_impuestos] [varchar](10)  NOT NULL,
    [codigo_pais_origen] [varchar](2)  NULL,
    [codigo_pais_destino] [varchar](2)  NULL,
    [codigo_pais_adquisicion] [varchar](2)  NULL,
    [puerto_origen] [varchar](300)  NULL,
    [puerto_destino] [varchar](300)  NULL,
    [total_flete_internacional] [decimal](14,2)  NOT NULL,
    [total_seguro_internacional] [decimal](14,2)  NOT NULL,
    [total_gastos_aduaneros] [decimal](14,2)  NOT NULL,
    [total_otros_gastos_transporte] [decimal](14,2)  NOT NULL
)
```



## Notas de crédito

Los queries para la emisión electrónica de __notas de crédito__ se guardan en el archivo de configuración `credit_note.ini`.

[Ejemplo de archivo credit_note.ini](/link-app#credit_note-ini)

### Cabecera

Obtiene información de la cabecera de la nota de crédito

```sql
headers = SELECT
  id_nota_credito             id_local,
  secuencial,
  fecha_emision,
  moneda,
  clave_acceso,
  tipo_emision,
  fecha_emision_documento_modificado,
  numero_documento_modificado,
  tipo_documento_modificado,
  motivo
  FROM
  DocElectronicoNotaCredito.cabecera
  WHERE
  id_nota_credito in (:sequence)
  ORDER BY id_nota_credito :order
```

Campo |  Descripción | Valor de ejemplo
--------- | -----------| ---------
id_local | int o string | Identifica de manera única la nota de crédito. __Requerido__
secuencial | string  | Número de secuencia de la nota de crédito. __Requerido__
fecha_emision | datetime  | Fecha de emisión   __Requerido__
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
fecha_emision_documento_modificado | datetime | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria del documento modificado, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
numero_documento_modificado | string | Número completo del documento que se está afectando. Normalmente facturas. Ejm: 001-002-010023098 __Requerido__
tipo_documento_modificado | string | Códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__
motivo | string | Motivo de la operación. Ejm: Devolución de producto. __Requerido__


### Vendedor

Obtiene información del vendedor en la nota de crédito

```sql
credit_note_seller  = SELECT
  ruc,
  obligado_contabilidad,
  contribuyente_especial,
  nombre_comercial,
  razon_social,
  direccion_establecimiento,
  direccion_emisor,
  codigo,
  punto_emision
  FROM
  DocElectronicoNotaCredito.cabecera
  WHERE
  id_nota_credito = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
ruc | string | Número de RUC de 13 caracteres. __Requerido__
obligado_contabilidad | string | `'SI'` si está obligado a llevar contabilidad. `'NO'` si no lo está.
contribuyente_especial | string | Número de resolución. En blanco `''` si no es contribuyente especial.
nombre_comercial | string| Nombre comercial. Máximo 300 caracteres __Requerido__
razon_social | string | Razón social. Máximo 300 caracteres __Requerido__
direccion_establecimiento | string | Dirección registrada en el SRI. Máximo 300 caracteres. __Requerido__
direccion_emisor | string | Dirección del punto de emisión. Máximo 300 caracteres. __Requerido__
codigo | string | Código numérico de 3 caracteres que representa al establecimiento. Ejemplo: `001` __Requerido__
punto_emision | string | Código numérico de 3 caracteres que representa al punto de emisión, o punto de venta. Ejemplo: `001`. __Requerido__


### Comprador

Obtiene información del comprador en la nota de crédito

```sql
credit_note_buyer  = SELECT
  identificacion,
  tipo_identificacion,
  razon_social,
  direccion,
  email,
  telefono
  FROM
  DocElectronicoNotaCredito.cabecera
  WHERE
  id_nota_credito = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
razon_social | string | Razón social. Máximo 300 caracteres. __Requerido__
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificaci-n) de tipos de identificación __Requerido__
email | string | Correo electrónico. Máximo 300 caracteres.
telefono | string | Teléfono
direccion | string | Dirección


### Totales

Obtiene información de los valores totales de la nota de crédito

```sql
credit_note_totals  = SELECT
  total_sin_impuestos,
  importe_total
  FROM
  DocElectronicoNotaCredito.cabecera
  WHERE
  id_nota_credito = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__

### Impuestos de totales

Obtiene información de los impuestos de los totales de la nota de crédito

```sql
credit_note_totals_taxes  = SELECT
  codigo,
  codigo_porcentaje,
  base_imponible,
  valor
  FROM
  DocElectronicoNotaCredito.totales_impuestos
  WHERE
  id_nota_credito = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto) __Requerido__
codigo_porcentaje | string | Código del [porcentaje](#c-digo-de-porcentaje-de-iva). __Requerido__
base_imponible | float | Base imponible. __Requerido__
valor | float | Valor del total. __Requerido__


### Items

Obtiene todos los items de una nota de crédito

```sql
items  = SELECT
  id_detalle,
  codigo_principal,
  codigo_auxiliar,
  descripcion,
  cantidad,
  precio_unitario,
  descuento,
  precio_total_sin_impuestos
  FROM
  DocElectronicoNotaCredito.items
  WHERE
  id_nota_credito = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
id_detalle | string | Identifica de manera única el ítem o detalle de la nota de crédito. Si no hay un solo campo que lo identifique de manera única se debe usar la concatenación de varios.__Requerido__
codigo_principal | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres. __Requerido__
codigo_auxiliar | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
descripcion | string | Descripción del ítem. __Requerido__
cantidad | float | Cantidad de items. __Requerido__
precio_unitario | float | Precio unitario. __Requerido__
descuento | float | El descuento es aplicado por cada producto. __Requerido__
precio_total_sin_impuestos | float | Precio antes de los impuestos. Se obtiene multiplicando la `cantidad` por el `precio_unitario` __Requerido__

### Impuestos de items

Obtiene los impuestos de un item

```sql
item_taxes  = SELECT
  base_imponible,
  valor,
  tarifa,
  codigo,
  codigo_porcentaje
  FROM
  DocElectronicoNotaCredito.items_impuestos
  WHERE
  id_detalle = ?
```


Campo | Tipo | Descripción
--------- | ------- | -----------
base_imponible | float | Base imponible. __Requerido__
valor | float | Valor del total. __Requerido__
tarifa | float | Porcentaje actual del impuesto expresado por un número entre 0.0 y 100.0 __Requerido__
codigo | string | Código del [tipo de impuesto](#tipos-de-impuesto) __Requerido__
codigo_porcentaje | string | Código del [porcentaje](#c-digo-de-porcentaje-de-iva). __Requerido__

### Detalles adicionales de items

Obtiene los detalles adicionales de un ítem. Este query es opcional.

Los detalles adicionales de un ítem se manejan de la forma 'Clave':'Valor'. Ejemplo: 'Peso':'Kg'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con detalles adicionales del ítem:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Peso        |   KG
Color           |   Rojo
Caducidad                 |   10 días

```sql
item_details = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores   _valor_
  FROM
  DocElectronicoNotaCredito.items_detalles_adicionales
  WHERE
  id_detalle = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
nombre | string | Nombre del detalle adicional del ítem
valor | string | Valor del detalle adicional del ítem

### Información adicional

Obtiene la información adicional de la nota de crédito.

La información adicional de la nota de crédito se maneja de la forma 'Clave':'Valor'. Ejemplo: 'Tipo de pago':'Cheque'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con información adicional de la nota de crédito:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Tipo de servicio        |   Avanzado
Forma de pago           |   Cheque
Periodo                 |   3 meses

```sql
credit_note_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoNotaCredito.informacion_adicional
  WHERE
  id_nota_credito = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
`_nombre_` | string | Nombre de la información adicional de la nota de crédito
`_valor_` | string | Valor de la información adicional de la nota de crédito


### Detalles adicionales de items

Obtiene los detalles adicionales de un ítem. Este query es opcional.

Los detalles adicionales de un ítem se manejan de la forma 'Clave':'Valor'. Ejemplo: 'Peso':'Kg'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con detalles adicionales del ítem:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Peso        |   KG
Color           |   Rojo
Caducidad                 |   10 días

```sql
item_details = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores   _valor_
  FROM
  DocElectronicoNotaCredito.items_detalles_adicionales
  WHERE
  id_detalle = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
nombre | string | Nombre del detalle adicional del ítem
valor | string | Valor del detalle adicional del ítem


### Tablas recomendadas

Estructura recomendada para las tablas o vistas con información de la nota de crédito.

Ejemplo en SQL Server:

```sql

CREATE SCHEMA notas_de_credito

DROP TABLE [notas_de_credito].[item_impuesto]
DROP TABLE [notas_de_credito].[item_detalle_adicional]
DROP TABLE [notas_de_credito].[item]
DROP TABLE [notas_de_credito].[total_impuesto]
DROP TABLE [notas_de_credito].[informacion_adicional]
DROP TABLE [notas_de_credito].[nota_de_credito]


CREATE TABLE [notas_de_credito].[nota_de_credito](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [ambiente] [int] NOT NULL,
    [tipo_emision] [int] NOT NULL,
    [secuencial] [bigint] NOT NULL,
    [fecha_emision] [datetime] NULL,
    [moneda] [varchar](15) NOT NULL,
    [clave_acceso] [varchar](49),
    -- DOCUMENTO MODIFICADO
    [fecha_emision_documento_modificado] [datetime] NULL,
    [numero_documento_sustento] [varchar](17) NULL,
    [tipo_documento_modificado] [varchar](2) NULL,
    [motivo] [varchar](300) NULL,
    -- EMISOR
    [ruc] [varchar](13) NULL,
    [obligado_contabilidad] [varchar](2) NULL,
    [contribuyente_especial] [varchar](10) NULL,
    [nombre_comercial] [varchar](300) NULL,
    [razon_social] [varchar](300) NULL,
    [direccion_matriz] [varchar](300) NULL,
    [codigo_establecimiento] [varchar](3) NULL,
    [punto_emision] [varchar](3) NULL,
    [direccion_establecimiento] [varchar](300) NULL,
    -- COMPRADOR
    [email_comprador] [varchar](254) NULL,
    [identificacion_comprador] [varchar](20) NULL,
    [tipo_identificacion_comprador] [varchar](2) NULL,
    [razon_social_comprador] [varchar](200) NULL,
    [direccion_comprador] [varchar](200) NULL,
    [telefono_comprador] [varchar](200) NULL,
    -- TOTALES
    [total_sin_impuestos] [decimal](14,2) NULL,
    [importe_total] [decimal](14,2) NULL,
)

-- NOTA DE CRÉDITO: ITEMS
CREATE TABLE [notas_de_credito].[item](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_nota_credito] bigint NOT NULL FOREIGN KEY REFERENCES [notas_de_credito].[nota_de_credito](id),
    [cantidad] [decimal](14,2)  NOT NULL,
    [codigo_principal] [varchar](50)  NULL,
    [codigo_auxiliar] [varchar](50)  NULL,
    [precio_unitario] [decimal](14,2)  NOT NULL,
    [descripcion] [varchar](300)  NOT NULL,
    [precio_total_sin_impuestos] [decimal](14,2)  NOT NULL,
    [descuento] [decimal](14,2)  NULL
)

-- NOTA DE CRÉDITO: IMPUESTOS DE ITEMS
CREATE TABLE [notas_de_credito].[item_impuesto](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [notas_de_credito].[item](id),
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](2) NOT NULL,
    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL,
    [tarifa] [decimal](14,2) NOT NULL, -- porcentaje
    CONSTRAINT PK_item_impuesto PRIMARY KEY (id_item, codigo, codigo_porcentaje)
)

-- NOTA DE CRÉDITO: DETALLES ADICIONALES DE ITEMS
CREATE TABLE [notas_de_credito].[item_detalle_adicional](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [notas_de_credito].[item](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT pk_items_detalles_adicionales PRIMARY KEY (id_item, nombre)
)

-- NOTA DE CRÉDITO: IMPUESTOS TOTALES
CREATE TABLE [notas_de_credito].[total_impuesto](
    [id_nota_credito] bigint NOT NULL FOREIGN KEY REFERENCES [notas_de_credito].[nota_de_credito](id),
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](2) NOT NULL,
    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL
    CONSTRAINT PK_total_impuesto PRIMARY KEY (id_nota_credito, codigo, codigo_porcentaje)
)

-- NOTA DE CRÉDITO: INFORMACION ADICIONAL DE LA NOTA DE CRÉDITO
CREATE TABLE [notas_de_credito].[informacion_adicional](
    [id_nota_credito] bigint NOT NULL FOREIGN KEY REFERENCES [notas_de_credito].[nota_de_credito](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT PK_informacion_adicional PRIMARY KEY (id_nota_credito, nombre)
)

```


## Comprobantes de Retención

Los queries para la emisión electrónica de __retención__ se guardan en el archivo de configuración `retention.ini`.

[Ejemplo de archivo retention.ini](/link-app#retention-ini)

### Cabecera

Obtiene información de la cabecera de la retención

```sql
headers = SELECT
  id_nota_credito             id_local,
  secuencial,
  fecha_emision,
  clave_acceso,
  tipo_emision,
  periodo_fiscal
  FROM
  DocElectronicoRetencion.cabecera
  WHERE
  id_retencion in (:sequence)
  ORDER BY id_retencion :order
```

Campo |  Descripción | Valor de ejemplo
--------- | -----------| ---------
id_local | int o string | Identifica de manera única la retención. __Requerido__
secuencial | string  | Número de secuencia de la retención. __Requerido__
fecha_emision | datetime  | Fecha de emisión   __Requerido__
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__
periodo_fiscal | string | Mes y año en el siguiente formato MM/AAAA. Ejm: 12/2015 __Requerido__


### Vendedor

Obtiene información del vendedor en la retención

```sql
retention_seller  = SELECT
  ruc,
  obligado_contabilidad,
  contribuyente_especial,
  nombre_comercial,
  razon_social,
  direccion_establecimiento,
  direccion_emisor,
  codigo,
  punto_emision
  FROM
  DocElectronicoRetencion.cabecera
  WHERE
  id_retencion = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
ruc | string | Número de RUC de 13 caracteres. __Requerido__
obligado_contabilidad | string | `'SI'` si está obligado a llevar contabilidad. `'NO'` si no lo está.
contribuyente_especial | string | Número de resolución. En blanco `''` si no es contribuyente especial.
nombre_comercial | string| Nombre comercial. Máximo 300 caracteres __Requerido__
razon_social | string | Razón social. Máximo 300 caracteres __Requerido__
direccion_establecimiento | string | Dirección registrada en el SRI. Máximo 300 caracteres. __Requerido__
direccion_emisor | string | Dirección del punto de emisión. Máximo 300 caracteres. __Requerido__
codigo | string | Código numérico de 3 caracteres que representa al establecimiento. Ejemplo: `001` __Requerido__
punto_emision | string | Código numérico de 3 caracteres que representa al punto de emisión, o punto de venta. Ejemplo: `001`. __Requerido__


### Sujeto retenido

Obtiene información del sujeto retenido en la retención

```sql
retention_recipient  = SELECT
  identificacion,
  tipo_identificacion,
  razon_social,
  direccion,
  email,
  telefono
  FROM
  DocElectronicoRetencion.cabecera
  WHERE
  id_retencion = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificaci-n) de tipos de identificación __Requerido__
razon_social | string | Razón social. Máximo 300 caracteres. __Requerido__
direccion | string | Dirección
email | string | Correo electrónico. Máximo 300 caracteres.
telefono | string | Teléfono


### Impuestos de la retención

Obtiene información de los impuestos de la retención

```sql
retention_taxes  = SELECT
    codigo,
    codigo_porcentaje,
    porcentaje,
    base_imponible,
    valor_retenido,
    tipo_documento_sustento,
    numero_documento_sustento,
    fecha_emision_documento_sustento
    FROM
    DocElectronicoRetencion.impuesto
    WHERE
    id_retencion = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
codigo                           | string | Código de [tipo de impuesto](#tipos-de-impuesto-para-la-retenci-n). __Requerido__
codigo_porcentaje                | string | [Código del porcentaje](#retenci-n-de-iva) a aplicar dentro del tipo de impuesto __Requerido__
porcentaje | string | Porcentaje a retener __Requerido__
base_imponible | float | Base imponible. __Requerido__
valor_retenido | float | Valor retenido. __Requerido__
tipo_documento_sustento | string | Códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__
numero_documento_sustento | string | Número completo del documento que se está afectando. Normalmente facturas. Ejm: 001-002-010023098 __Requerido__
fecha_emision_documento_sustento | datetime | Fecha de emisión del documento sustento de la retención__Requerido__

### Información adicional

Obtiene la información adicional de la retención.

La información adicional de la retención se maneja de la forma 'Clave':'Valor'. Ejemplo: 'Tipo de pago':'Cheque'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con información adicional de la retención:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Tipo de servicio        |   Avanzado
Forma de pago           |   Cheque
Periodo                 |   3 meses

```sql
retention_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoRetencion.informacion_adicional
  WHERE
  id_retencion = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
`_nombre_` | string | Nombre de la información adicional de la rentención
`_valor_` | string | Valor de la información adicional de la retención

### Tablas recomendadas

Estructura recomendada para las tablas o vistas con información de la retención.

Ejemplo en SQL Server:


```sql

CREATE SCHEMA retenciones

DROP TABLE [retenciones].[item]
DROP TABLE [retenciones].[informacion_adicional]
DROP TABLE [retenciones].[retencion]


CREATE TABLE [retenciones].[retencion](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [ambiente] [int] NOT NULL,
    [tipo_emision] [int] NOT NULL,
    [secuencial] [bigint] NOT NULL,
    [fecha_emision] [datetime] NULL,
    [clave_acceso] [varchar](49) NULL,
    [periodo_fiscal] [varchar](7),
    -- EMISOR
    [ruc] [varchar](13) NULL,
    [obligado_contabilidad] [varchar](2) NULL,
    [contribuyente_especial] [varchar](10) NULL,
    [nombre_comercial] [varchar](300) NULL,
    [razon_social] [varchar](300) NULL,
    [direccion_matriz] [varchar](300) NULL,
    [codigo_establecimiento] [varchar](3) NULL,
    [punto_emision] [varchar](3) NULL,
    [direccion_establecimiento] [varchar](300) NULL,
    -- SUJETO RETENIDO
    [email_sujeto] [varchar](254) NULL,
    [identificacion_sujeto] [varchar](20) NULL,
    [tipo_identificacion_sujeto] [varchar](2) NULL,
    [razon_social_sujeto] [varchar](200) NULL,
    [direccion_sujeto] [varchar](200) NULL,
    [telefono_sujeto] [varchar](200) NULL,
)

-- RETENCION: ITEMS
CREATE TABLE [retenciones].[item](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_retencion] bigint NOT NULL FOREIGN KEY REFERENCES [retenciones].[retencion](id),
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](5) NOT NULL,
    [base_imponible] [decimal](14,2) NOT NULL,
    [fecha_emision_documento_sustento] [datetime] NULL,
    [numero_documento_sustento] [varchar](17) NULL,
    [tipo_documento_sustento] [varchar](2) NULL,
    [porcentaje] [decimal](14,2) NULL,
    [valor_retenido] [decimal](14,2) NULL,
)

-- RETENCION: INFORMACION ADICIONAL DE LA RETENCION
CREATE TABLE [retenciones].[informacion_adicional](
    [id_retencion] bigint NOT NULL FOREIGN KEY REFERENCES [retenciones].[retencion](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT PK_informacion_adicional PRIMARY KEY (id_retencion, nombre)
)

```




## Guías de Remisión

Los queries para la emisión electrónica de __guías de remisión__ se guardan en el archivo de configuración `waybill.ini`.

[Ejemplo de archivo waybill.ini](/link-app#waybill-ini)

### Cabecera

Obtiene información de la cabecera de la guía de remisión

```sql
headers = SELECT
  id_guia_remision             id_local,
  secuencial,
  fecha_inicio_transporte,
  fecha_fin_transporte,
  direccion_partida,
  clave_acceso,
  tipo_emision
  FROM
  DocElectronicoGuiaRemision.cabecera
  WHERE
  id_guia_remision in (:sequence)
  ORDER BY id_guia_remision :order
```

Campo |  Descripción | Valor de ejemplo
--------- | -----------| ---------
id_local | int o string | Identifica de manera única la guía de remisión. __Requerido__
secuencial | string  | Número de secuencia de la retención. __Requerido__
fecha_inicio_transporte | datetime  | Fecha en la que inicia el transporte dada la guía de remisión __Requerido__
fecha_fin_transporte | datetime  | Fecha en la que termina el transporte dada la guía de remisión __Requerido__
direccion_partida | string | Dirección de partida
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__

### Vendedor

Obtiene información del vendedor en la guía de remisión

```sql
waybill_seller  = SELECT
  ruc,
  obligado_contabilidad,
  contribuyente_especial,
  nombre_comercial,
  razon_social,
  direccion_establecimiento,
  direccion_emisor,
  codigo,
  punto_emision
  FROM
  DocElectronicoGuiaRemision.cabecera
  WHERE
  id_guia_remision = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
ruc | string | Número de RUC de 13 caracteres. __Requerido__
obligado_contabilidad | string | `'SI'` si está obligado a llevar contabilidad. `'NO'` si no lo está.
contribuyente_especial | string | Número de resolución. En blanco `''` si no es contribuyente especial.
nombre_comercial | string| Nombre comercial. Máximo 300 caracteres __Requerido__
razon_social | string | Razón social. Máximo 300 caracteres __Requerido__
direccion_establecimiento | string | Dirección registrada en el SRI. Máximo 300 caracteres. __Requerido__
direccion_emisor | string | Dirección del punto de emisión. Máximo 300 caracteres. __Requerido__
codigo | string | Código numérico de 3 caracteres que representa al establecimiento. Ejemplo: `001` __Requerido__
punto_emision | string | Código numérico de 3 caracteres que representa al punto de emisión, o punto de venta. Ejemplo: `001`. __Requerido__


### Transportista

Obtiene información del transportista en la guía de remisión

```sql
waybill_shipper  = SELECT
  identificacion,
  tipo_identificacion,
  razon_social,
  direccion,
  email,
  telefono
  FROM
  DocElectronicoGuiaRemision.cabecera
  WHERE
  id_guia_remision = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificaci-n) de tipos de identificación __Requerido__
razon_social | string | Razón social. Máximo 300 caracteres. __Requerido__
direccion | string | Dirección
email | string | Correo electrónico. Máximo 300 caracteres.
telefono | string | Teléfono


### Destinatarios

Obtiene información de los destinatarios en la guía de remisión

```sql
waybill_receivers  = SELECT
    id_destinatario     receiver_id,
    razon_social,
    identificacion,
    tipo_identificacion,
    email,
    telefono,
    direccion,
    ruta,
    documento_aduanero_unico,
    codigo_establecimiento_destino,
    fecha_emision_documento_sustento,
    numero_documento_sustento,
    tipo_documento_sustento,
    motivo_traslado,
    numero_autorizacion_documento_sustento
    FROM
    DocElectronicoGuiaRemision.destinatario
    WHERE
    id_guia_remision = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
receiver_id | string | Identifica de manera única al destinatario en la guía de remisión. __Requerido__
razon_social | string | Razón social del destinatario. Máximo 300 caracteres __Requerido__
identificacion | string | De 5 a 20 caracteres. __Requerido__
tipo_identificacion | string | Ver [tabla](#tipo-de-identificaci-n) de tipos de identificación __Requerido__
email | string | Correo electrónico del destinatario. Máximo 300 caracteres.
telefono | string | Teléfono del destinatario
direccion | string | Dirección del destinatario
ruta | string | Ruta de transporte. Máximo 300 caracteres.
documento_aduanero_unico | string |  Máximo 20 caracteres.
fecha_emision_documento_sustento | datetime  | Fecha de emisión del documento sustento de la guía de remisión, usualmente una factura.  __Requerido__
numero_documento_sustento | string | Número completo del documento que detalla la mercadería a transportar. Normalmente facturas. Ejm: 001-002-010023098
codigo_establecimiento_destino | string | Número establecimiento que recibe la entrega.  __Requerido__
numero_documento_sustento | string | Número completo del documento que detalla la mercadería a transportar. Normalmente facturas. Ejm: 001-002-010023098 __Requerido__
tipo_documento_sustento | string | tipo_documento_sustento | string | Códigos de [tipos de documentos](#tipos-de-documentos). __Requerido__
motivo_traslado | string | Motivo del traslado. Ejm: Entrega de mercadería. __Requerido__
numero_autorizacion_documento_sustento | string | Autorización del documento de sustento.

### Items del destinatario

Obtiene la información de los items que recibirá el destinatario

```sql
waybill_receiver_items = SELECT
    id_detalle,
    descripcion,
    codigo_principal,
    codigo_auxiliar,
    cantidad
    FROM
    DocElectronicoGuiaRemision.detalle
    WHERE
    id_destinatario = ?

```


Campo | Tipo | Descripción
--------- | ------- | -----------
id_detalle | string | Identifica de manera única el ítem o detalle de la factura. Si no hay un solo campo que lo identifique de manera única se debe usar la concatenación de varios.__Requerido__
descripcion | string | Descripción del ítem. __Requerido__
codigo_principal | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres. __Requerido__
codigo_auxiliar | string | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
cantidad | float | Cantidad de items. __Requerido__


### Detalles adicionales de items

Obtiene los detalles adicionales de un ítem. Este query es opcional.

Los detalles adicionales de un ítem se manejan de la forma 'Clave':'Valor'. Ejemplo: 'Peso':'Kg'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con detalles adicionales del ítem:

columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Peso        |   KG
Color           |   Rojo
Caducidad                 |   10 días

```sql
item_details = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores   _valor_
  FROM
  DocElectronicoGuiaRemision.items_detalles_adicionales
  WHERE
  id_detalle = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
nombre | string | Nombre del detalle adicional del ítem
valor | string | Valor del detalle adicional del ítem


### Información adicional

Obtiene la información adicional de la guía de remisión.

La información adicional de la guía de remisión se maneja de la forma 'Clave':'Valor'. Ejemplo: 'Tipo de pago':'Cheque'

Se asume que en la tabla consultada
una columna tiene los nombres y otra los valores.

Ejemplo de columnas con información adicional de la guía de remisión:



columna_de_nombres  |  columna_de_valores
-------------------- | --------------
Tipo de servicio        |   Avanzado
Forma de pago           |   Cheque
Periodo                 |   3 meses

```sql
waybill_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoRetencion.informacion_adicional
  WHERE
  id_retencion = ?
```

Campo | Tipo | Descripción
--------- | ------- | -----------
`_nombre_` | string | Nombre de la información adicional de la rentención
`_valor_` | string | Valor de la información adicional de la retención

### Tablas recomendadas

Estructura recomendada para las tablas o vistas con información de la guía de remisión.

Ejemplo en SQL Server:

```sql
CREATE SCHEMA guias_de_remision

DROP TABLE [guias_de_remision].[guia_remision]
DROP TABLE [guias_de_remision].[destinatario]
DROP TABLE [guias_de_remision].[item]
DROP TABLE [guias_de_remision].[item_detalle_adicional]
DROP TABLE [guias_de_remision].[informacion_adicional]

CREATE TABLE [guias_de_remision].[guia_remision](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [ambiente] [int] NOT NULL,
    [tipo_emision] [int] NOT NULL,
    [secuencial] [bigint] NOT NULL,
    [fecha_inicio_transporte] [datetime] NULL,
    [fecha_fin_transporte] [datetime] NULL,
    [direccion_partida] [varchar](200) NULL,
    [clave_acceso] [varchar](49),
    -- EMISOR
    [ruc] [varchar](13) NULL,
    [obligado_contabilidad] [varchar](2) NULL,
    [contribuyente_especial] [int] NULL,
    [nombre_comercial] [varchar](300) NULL,
    [razon_social] [varchar](300) NULL,
    [direccion] [varchar](300) NULL,
    [codigo_establecimiento] [varchar](3) NULL,
    [punto_emision] [varchar](3) NULL,
    [direccion_establecimiento] [varchar](300) NULL,
    -- TRANSPORTISTA
    [email_comprador] [varchar](254) NULL,
    [identificacion_comprador] [varchar](20) NULL,
    [tipo_identificacion_comprador] [varchar](2) NULL,
    [razon_social_comprador] [varchar](200) NULL,
    [direccion_comprador] [varchar](200) NULL,
    [telefono_comprador] [varchar](200) NULL,
    [placa] [varchar](200) NULL
)

-- GUIA DE REMISION: DESTINATARIOS
CREATE TABLE [guias_de_remision].[destinatario](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_destinatario] bigint NOT NULL FOREIGN KEY REFERENCES [guias_de_remision].[guia_remision](id),
    [email] [varchar](254) NULL,
    [identificacion] [varchar](20) NULL,
    [tipo_identificacion] [varchar](2) NULL,
    [razon_social] [varchar](200) NULL,
    [direccion] [varchar](200) NULL,
    [telefono] [varchar](200) NULL,
    [fecha_emision_documento_sustento] [datetime] NULL,
    [numero_documento_sustento] [varchar](17) NULL,
    [tipo_documento_sustento] [varchar](2) NULL,
    [numero_autorizacion_documento_sustento] [varchar](300) NULL,
    [ruta] [varchar](300) NULL,
    [motivo_traslado] [varchar](300) NULL,
    [documento_aduanero_unico] [varchar](300) NULL,
    [codigo_establecimiento_destino] [varchar](3) NULL
)

-- GUIA DE REMISION: ITEMS
CREATE TABLE [guias_de_remision].[item](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_destinatario] bigint NOT NULL FOREIGN KEY REFERENCES [guias_de_remision].[destinatario](id),
    [cantidad] [decimal](14,2)  NOT NULL,
    [codigo_principal] [varchar](50)  NULL,
    [codigo_auxiliar] [varchar](50)  NULL,
    [descripcion] [varchar](300)  NOT NULL
)

-- GUIA DE REMISION: DETALLES ADICIONALES DE ITEMS
CREATE TABLE [guias_de_remision].[item_detalle_adicional](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [guias_de_remision].[item](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT pk_items_detalles_adicionales PRIMARY KEY(id_item, nombre)
)

-- GUIA DE REMISION: INFORMACION ADICIONAL DE LA GUIA DE REMISION
CREATE TABLE [guias_de_remision].[informacion_adicional](
    [id_guia_remision] bigint NOT NULL FOREIGN KEY REFERENCES [guias_de_remision].[guia_remision](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT PK_informacion_adicional PRIMARY KEY (id_guia_remision, nombre)
)

```
