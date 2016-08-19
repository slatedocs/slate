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
* Windows 7
* Windows 8

Para saber si la versión de su equipo es de 32 o 64 bits en Windows, siga los pasos del [siguiente enlace](https://support.microsoft.com/es-es/kb/827218).

**Linux** (próximamente)

* Centos
* Ubuntu

## Motor de Base de Datos

Link puede conectarse a los siguientes motores de bases de datos relacionales:

**SQL Server** 

* SQL Server 2005
* SQL Server 2008
* SQL Server 2012

Para conocer la versión de SQL Server puede ejecutar el siguiente comando

`SELECT @@version`


Link también puede  extraer información de los siguientes archivos de base de datos:

**DBF (Visual Fox Pro)**




# Descargas

Instaladores del programa Link de Dátil:

__Windows__

Windows 32 bits: [linkapp-windows-32bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+Link+App_3.0.6_32bit_generic.exe)

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


# Configuración de credenciales

Luego de la instalación un acceso directo al programa Link aparecerá en el  Escritorio
de su computador.

<img style='width:100px;display:block;margin-right: auto;margin-left:auto;' src='/images/linkapp/desktop-shortcut.png'></img>

Con doble click sobre él un ícono de Dátil aparecerá en la barra de tareas.

<img style='width:80%;display:block;margin-right: auto;margin-left:auto;' src='/images/linkapp/task-bar-icon.png'></img>

# Configuración de queries

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


## Factura

Los queries para la emisión electrónica de __facturas__ se guardan en el archivo de configuración `invoice.ini`.

[Ejemplo de archivo invoice.ini](/link-app#invoice-ini)



### Todas las facturas

Obtiene las facturas de su ERP o sistema contable a partir de una fecha determinada

```sql

all_stored_locally = SELECT
  id_local
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  fecha_emision >= ?

```

Campo |  Descripción | Valor de ejemplo
--------- | -----------| ---------
id_local | string | Identifica de manera única la factura. __Requerido__
fecha_emision | string  | Parámetro de búsqueda, es la fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__

### Facturas no controladas

Obtiene las nuevas facturas generadas por su ERP o sistema contable a partir de una fecha determinada.
Se deben configurar dos queries.

```sql
not_controlled = SELECT
  id_local,
  numero,
  fecha_emision
  FROM
  DocElectronicoFactura.cabecera
  where
  id_local in (:sequence) AND
  fecha_emision >= ?


not_controlled_first_time = SELECT TOP :limit
  id_local,
  numero,
  fecha_emision
  FROM
  DocElectronicoFactura.cabecera
  where
  fecha_emision >= ?
```

> `:sequence` y `:limit` son variables que maneja __Link__, no deben editarse o reemplazarse.

Campo |  Descripción | Valor de ejemplo
--------- | -----------| ---------
id_local | string | Identifica de manera única la factura. __Requerido__
numero | string | El número completo de la factura. Ejemplo: '001-002-000000034' __Requerido__
fecha_emision | string  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__


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
fecha_emision | string  | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).  __Requerido__
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
invoice_totals  = SELECT
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
  cast(id_factura as varchar) + cast(detalle as varchar) = ?
```

> `cast(id_factura as varchar) + cast(detalle as varchar)` es un ejemplo para identificar de manera única el ítem en la factura

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
  cast(id_factura as varchar) + cast(detalle as varchar) = ?
```

> `cast(id_factura as varchar) + cast(detalle as varchar)` es un ejemplo para identificar de manera única el ítem en la factura

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
payments  = SELECT
  id_pago,
  medio_pago,
  total_pago
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
payment_properties = SELECT
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
-- FACTURA: CABECERA
CREATE TABLE [DocElectronicoFactura].[cabecera](
    [id_factura] [varchar](17) NOT NULL,

    [ambiente] [int] NOT NULL,
    [tipo_emision] [int] NOT NULL,
    [secuencial] [varchar](9) NOT NULL,
    [fecha_emision] [datetime] NULL,    
    [moneda] [varchar](15) NOT NULL,
    [guia_remision] [varchar](17),
    [clave_acceso] [varchar](49),
    -- EMISOR
    [ruc_emisor] [varchar](13) NULL,
    [obligado_contabilidad] [varchar](2) NULL,
    [contribuyente_especial] [int] NULL,
    [nombre_comercial] [varchar](300) NULL,
    [razon_social] [varchar](300) NULL,
    [direccion_matriz] [varchar](300) NULL,
    [codigo_establecimiento] [varchar](3) NULL,
    [punto_emision] [varchar](3) NULL,
    [direccion_establecimiento] [varchar](300) NULL,
    -- COMPRADOR
    [email_comprador] [varchar](100) NULL,
    [identificacion_comprador] [varchar](200) NULL,
    [tipo_identificacion_comprador] [varchar](2) NULL,
    [razon_social_comprador] [varchar](200) NULL,
    [direccion_comprador] [varchar](200) NULL,
    [telefono_comprador] [varchar](200) NULL,
    -- TOTALES
    [total_sin_impuestos] [decimal](14,2) NULL,
    [importe_total] [decimal](14,2) NULL,
    [propina] [decimal](14,2) NULL,
    [descuento] [decimal](14,2) NULL
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
    ( [id_factura] ASC ) )

-- FACTURA: ITEMS
CREATE TABLE [DocElectronicoFactura].[items](
    [id_factura] [varchar](17) NOT NULL,
    [detalle] [int] NOT NULL,

    [cantidad] [decimal](14,2)  NOT NULL,
    [codigo_principal] [varchar](50)  NULL,
    [codigo_auxiliar] [varchar](50)  NULL,
    [precio_unitario] [decimal](14,2)  NOT NULL,
    [descripcion] [varchar](300)  NOT NULL,
    [precio_total_sin_impuestos] [decimal](14,2)  NOT NULL,
    [descuento] [decimal](14,2)  NULL
    CONSTRAINT pk_items PRIMARY KEY (id_factura,detalle)
    )

-- FACTURA: IMPUESTOS DE ITEMS 
CREATE TABLE [DocElectronicoFactura].[items_impuestos](
    [id_factura] [varchar](17) NOT NULL,
    [detalle] [int] NOT NULL,
    [codigo] [varchar](2) NOT NULL,

    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL,
    [tarifa] [decimal](14,2) NOT NULL, -- porcentaje
    [codigo_porcentaje] [varchar](2) NOT NULL
    CONSTRAINT pk_items_impuestos PRIMARY KEY (id_factura,detalle, codigo)
    )
    
-- FACTURA: DETALLES ADICIONALES DE ITEMS
CREATE TABLE [DocElectronicoFactura].[items_detalles_adicionales](
    [id_factura] [varchar](17) NOT NULL,
    [detalle] [int] NOT NULL,
    [nombre] [varchar](100) NOT NULL,

    [valor] [varchar](100) NOT NULL
    CONSTRAINT pk_items_detalles_adicionales PRIMARY KEY (id_factura,detalle, nombre)
    )

-- FACTURA: IMPUESTOS DE TOTALES 
CREATE TABLE [DocElectronicoFactura].[totales_impuestos](
    [id_factura] [varchar](17) NOT NULL,
    [orden] [int] NOT NULL,

    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL,
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](2) NOT NULL
    CONSTRAINT pk_totales_impuestos PRIMARY KEY (id_factura, orden)
    )
    
-- FACTURA: INFORMACION ADICIONAL DE LA FACTURA
CREATE TABLE [DocElectronicoFactura].[informacion_adicional](
    [id_factura] [varchar](17) NOT NULL,
    [nombre] [varchar](100) NOT NULL,

    [valor] [varchar](100) NOT NULL
    CONSTRAINT pk_informacion_adicional PRIMARY KEY (id_factura, nombre)
    )   


```
