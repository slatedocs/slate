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
Microsoft ODBC Driver for Oracle, SQL Server y Access ODBC Driver. Si utilizas alguno de estos drivers
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

Recomendamos renombrar este archivo con un nombre
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


# Operación

En el menú `Inicio` buscar el `Simbolo del Sistema` , darle click derecho y escoger la opción `Ejecutar como administrador`.

Luego para iniciar el servicio ejecutar el comando:

`net start datilink`

Enter.

Si desea detener el servicio, ejecutar:

`net stop datilink`
