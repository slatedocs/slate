---
title: Dátil Link App

language_tabs:
  - sql: Ejemplo SQL

toc_footers:
  - <a href='#'>Para obtener mi clave del API</a>
  - <a href='http://github.com/tripit/slate'>Documentación gracias a Slate</a>

includes:
  - common
  - link-app/ini_examples

search: true
---
# Introducción

Integra tu sistema contable o ERP con Facturación Electrónica. La aplicación **Link** de Dátil
te permite emitir todos los tipos de comprobantes electrónicos: facturas, retenciones,
notas de crédito, notas de débito y guías de remisión.

La aplicación Link de Dátil funciona en Windows y en Linux (próximamente) como un servicio del sistema operativo. De esta manera, Link se podrá mantener en ejecución permanente y emitiendo comprobantes.

**Link** se conecta a la base de datos de tu ERP o sistema contable para obtener la información
de los comprobantes mientras sigues usando tu sistema como siempre lo has hecho.

# Requisitos

## Sistema Operativo

Link es compatible con los siguientes sistemas operativos:

**Windows**

_Disponible para 32 y 64 bits_

* Windows Server 2003
* Windows Server 2008
* Windows Server 2012
* Windows XP
* Windows Vista
* Windows 7
* Windows 8

Para saber si la versión de su equipo es de 32 o 64 bits en Windows, siga los pasos del [siguiente enlace](https://support.microsoft.com/es-es/kb/827218).

**Linux** (próximamente)

* Centos
* Ubuntu

## Motor de Base de Datos

Link puede conectarse a los siguientes motores de bases de datos relacionales:

**SQL Server** 

* SQL Server 2000
* SQL Server 2005
* SQL Server 2008
* SQL Server 2012
* SQL Server 2014

Para conocer la versión de SQL Server puede ejecutar el siguiente comando

`SELECT @@version`


Link también puede  extraer información de los siguientes archivos de base de datos:

**DBF (Visual Fox Pro)**




# Descargas

Instaladores del programa Link de Dátil:

__Windows__

Windows 32 bits: [linkapp-windows-32bits]
Windows 64 bits: [linkapp-windows-64bits]

__Linux__

Centos 32 bits (próximamente)

Centos 64 bits (próximamente)

Ubuntu 32 bits (próximamente)

Ubuntu 64 bits (próximamente)


# Instalación

Luego de descargar el instalador, empiece la instalación con doble click, siguiendo
el flujo de ventanas que aparecerán en su pantalla.

<img src='/images/linkapp/install-step-1.png'></img>
<img src='/images/linkapp/install-step-3.png'></img>
<img src='/images/linkapp/install-step-4.png'></img>
<img src='/images/linkapp/install-step-5.png'></img>

# Configuración

## Tablas de Control y Mensaje

Control y Mensaje son tablas que el programa Link necesita para llevar control de los comprobantes emitidos. Pueden estar creados en la misma base de datos o en una distinta a la que almacena la información de los comprobantes.

Para crear la tabla de control  y mensaje ejecutar:

<pre>
CREATE TABLE
    Control(
    id_control bigint IDENTITY(1,1) NOT NULL PRIMARY KEY,
    tipo_comprobante int NOT NULL,
    id_local varchar(100) NOT NULL,
    numero_comprobante varchar(20) NOT NULL,
    estado varchar(13),
    numero_autorizacion varchar(100),
    fecha_autorizacion datetime,
    fecha_emision datetime,
    fecha_ingreso datetime,
    fecha_ultimo_envio datetime,
    clave_acceso varchar(50),
    id_externo varchar(40),
    company_name varchar(40),
    CONSTRAINT ix_tipo_idlocal UNIQUE (tipo_comprobante, id_local, numero_comprobante, company_name)
    )
</pre>

<pre>
CREATE TABLE
    Mensaje(
    id_control bigint,
    identificador varchar(2) NOT NULL,
    mensaje TEXT NOT NULL,
    tipo varchar(50) NOT NULL,
    fecha_creacion datetime NOT NULL,
    CONSTRAINT pk_comprobante_identificador PRIMARY KEY (id_control, identificador),
    CONSTRAINT fk_control_id FOREIGN KEY (id_control) REFERENCES Control(id_control)
    )
</pre>

## Configuración general

Abrir el Bloc de Notas con permisos de administrador, dando click derecho y escogiendo
**Ejecutar como administrador**. Escoger `Archivo` -> `Abrir` -> `C:\Archivos de Programa\Datil\Link\config`, en la opción `Tipo` de la ventana seleccionar _Todos los archivos_ y seleccionar `environment.ini`

### General 

Es la configuración general de la aplicación

En la sección `[General]` editar los parámetros:

* `company` con el nombre de la compañía, ejemplo `Seguros Segurito S.A.`


### DatabaseSource

Es la configuración de la base de datos que contiene las tablas de  control y mensaje.

#### SQL Server

En la sección `[DatabaseSource]` editar los parámetros:

* `driver` con el valor  `SQL Server`.
* `server` con la url o ip o nombre del servidor de base de datos donde se crearon las tablas de Control y Mensaje. Ejemplo: localhost, 192.168.100.102, ADMIN\SQLEXPRESS.
* `name` con el nombre de la base de datos.
* `user` con el usuario que tiene acceso a la base de datos.
* `password` con la clave de acceso a la base de datos.
* `version` con la versión de SQL Server.
* `api` con el valor `odbc`.

Dejar `datasource`  y `provider` con el valor `None` porque no aplican para la conexión con 
SQL Server

### Constraints

En la sección `[Constraints]` editar el parámetro `first_receipt_date` con la fecha desde la cual se desea emitir el primer comprobante. La fecha debe tener el formato `YYYY-mm-dd hh:MM:SS` Ejemplo: `2016-09-12 13:40:00` para el 12 de septiembre del año 2016 a las trece horas con cuarenta minutos y cero segundos. El tiempo debe estar en formato de 24 horas.

### Notification

En la sección `[Notification]`:

Editar el parámetro `email_api_key` con el API key de Sendgrid para el envío de emails.

Editar el parámetro `dest_email` si desea recibir notificaciones cuando ocurra algún error al emitir un comprobante. Agregue una o varias direcciones de correo electrónico al separadas por coma (,).


Guardar el archivo con la configuración editada.


## Configuración de la compañía



Abrir el Bloc de Notas con permisos de administrador, dando click derecho y escogiendo
**Ejecutar como administrador**. Escoger `Archivo` -> `Abrir` -> `C:\Archivos de Programa\Datil\Link\config\companies`, en la opción `Tipo` de la ventana seleccionar _Todos los archivos_ y seleccionar `my_company.ini`


### General

En la sección `[General]` configurar el parámetro `ruc` con el ruc de la empresa.

### Api
En la sección `[Api]` configurar el parámetro `xkey` con el _API key_ de Dátil y 
`xpassword` con la clave del certificado de firma electrónica, `environment` con el valor `1` para emisión en modo de pruebas o `2` para emitir en producción.

### DatabaseSource

Es la configuración de la base de datos de comprobantes


#### SQL Server

En la sección `[DatabaseSource]` editar los parámetros:

* `driver` con el valor `SQL Server`.
* `server` con la url o ip o nombre del servidor de base de datos que contiene la información de los comprobantes. Ejemplo: localhost, 192.168.100.102, ADMIN\SQLEXPRESS.
* `name` con el nombre de la base de datos de los comprobantes.
* `user` con el usuario que tiene acceso a la base de datos de los comprobantes.
* `password` con la clave de acceso a la base de datos de los comprobantes.
* `version` con la versión de SQL Server.
* `api` con el valor `odbc`.

Dejar `datasource`  y `provider` con el valor `None` porque no aplican para la conexión con 
SQL Server

#### DBF (Visual Fox Pro)

* `api` con el valor `adodb`.
* `datasource` con la ruta hacia la carpeta donde están contenidos los archivos .dfb. Ejemplo: C:\Program Files\Contabilidad\Facturacion`
* `provider` con el valor `VFPOLEDB.1`

`driver`, `server`, `name`, `user`, `password` y `version`, no aplican para la conexión con archivos DBF


Al terminar la edición del archivo se puede cambiar el nombre del mismo por el de la compañía, el nombre no debe llevar espacios, solo letras, números y subguiones. Ejemplo: 
`seguros_secomsap`

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

Obtiene información de la cabecera de la factura

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


Campo |  Descripción | Valor de ejemplo
--------- | -----------| ---------
id_local | string | Identifica de manera única la factura. __Requerido__
secuencial | string  | Número de secuencia de la factura. __Requerido__
fecha_emision | datetime  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
guia_remision | string | Número de guía de remisión asociada a esta factura en formato 001-002-000000003 ([0-9]{3}-[0-9]{3}-[0-9]{9})
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda. __Requerido__
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>__Requerido__


### Vendedor

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
  precio_total_sin_impuestos
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

Obtiene la información adicional de la factura.

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
medio              | string                  | Código del [tipo de forma de pago](#tipos-de-forma-de-pago). __Requerido__
total               | float                   | Total aplicable a la forma de pago especificada. __Requerido__

### Propiedades de Pagos

Obtiene la propiedades de los pagos de determinada factura.

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
    [ambiente] [int] NOT NULL, 
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
    [descuento] [decimal](14,2)  NULL
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

CREATE TABLE [facturas].[pago](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_factura] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[factura](id),
    [fecha] [datetime] NOT NULL,
    [medio] [varchar](100) NOT NULL,
    [notas] [varchar](max) NOT NULL,
    [monto] [decimal](14, 2) NOT NULL
)


CREATE TABLE [facturas].[pago_propiedad](
  [id_pago] bigint NOT NULL FOREIGN KEY REFERENCES [facturas].[pago](id),
  [nombre] [varchar](100) NOT NULL,
  [valor] [varchar](100) NOT NULL,
  CONSTRAINT PK_pago_propiedad PRIMARY KEY (id_pago, nombre)
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
id_local | string | Identifica de manera única la nota de crédito. __Requerido__
secuencial | string  | Número de secuencia de la nota de crédito. __Requerido__
fecha_emision | datetime  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
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
id_local | string | Identifica de manera única la retención. __Requerido__
secuencial | string  | Número de secuencia de la retención. __Requerido__
fecha_emision | datetime  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
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
fecha_emision_documento_sustento | datetime | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria del documento sustento de la retención, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__

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
    [codigo_porcentaje] [varchar](2) NOT NULL,
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
id_local | string | Identifica de manera única la guía de remisión. __Requerido__
secuencial | string  | Número de secuencia de la retención. __Requerido__
fecha_inicio_transporte | string  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
fecha_fin_transporte | string  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
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
fecha_emision_documento_sustento | datetime  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
numero_documento_sustento | string | Número completo del documento que detalla la mercadería a transportar. Normalmente facturas. Ejm: 001-002-010023098
codigo_establecimiento_destino | string | Número establecimiento que recibe la entrega.  __Requerido__
fecha_emision_documento_sustento | datetime | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
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



# Actualización

Para actualizar el programa Link de Dátil

* Abra el terminal de windows y detenga el servicio:

`net stop datilink`

* Respalde la carpeta de configuración  `config` 

Windows: `C:\Archivos de Programa\Datil\Link\config` .

* Doble click en el desinstalador:
 
Windows: `C:\Archivos de Programa\Datil\Link\unins`

Dentro del directorio de instalación solo debe quedar la carpeta `logs`. Si otro
archivo o carpeta sigue existiendo, borrarlo.

* Instalar la nueva versión ejecutando el instalador de Link

* Reemplazar la carpeta config recién instalada con la carpeta config respaldada previamente

* Iniciar el servicio con el comando:

`net start datilink`


