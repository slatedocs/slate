# Instalación

Descarga Link e instalalo siguiendo el asistente de instalación.

<img src='/images/linkapp/install-step-1.png'></img>
<img src='/images/linkapp/install-step-3.png'></img>
<img src='/images/linkapp/install-step-4.png'></img>
<img src='/images/linkapp/install-step-5.png'></img>

## Preparando el ambiente

Link utiliza dos tablas indispensables para su operación: Control y Mensaje.
En la tabla de Control registra los documentos que debe procesar y el estado de
cada uno de ellos. Puedes crear estas tablas en la misma base de datos de tu
ERP o en una distinta.

Crea la tabla de control y mensaje, y agrega los siguientes índices

```sql
CREATE TABLE Control (
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

CREATE TABLE
    Mensaje(
    id_control bigint,
    identificador varchar(5) NOT NULL,
    mensaje TEXT NOT NULL,
    tipo varchar(50) NOT NULL,
    fecha_creacion datetime NOT NULL,
    CONSTRAINT pk_comprobante_identificador PRIMARY KEY (id_control, identificador),
    CONSTRAINT fk_control_id FOREIGN KEY (id_control) REFERENCES Control(id_control)
  );

CREATE NONCLUSTERED INDEX estado ON Control
(
    tipo_comprobante ASC,
    estado ASC,
    company_name ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON PRIMARY

ALTER TABLE Control ADD  CONSTRAINT ix_tipo_idlocal UNIQUE NONCLUSTERED
(
    tipo_comprobante ASC,
    id_local ASC,
    numero_comprobante ASC,
    company_name ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON PRIMARY

CREATE NONCLUSTERED INDEX IX_Control_tipo_fecha ON Control
(
    tipo_comprobante ASC,
    fecha_emision ASC,
    company_name ASC
) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON PRIMARY
```

## Información de los Comprobantes

En esta sección utilizamos [DDL](https://es.wikipedia.org/wiki/Lenguaje_de_definici%C3%B3n_de_datos)
en dialecto SQL Server para describir la estructura de las tablas o vistas
que deben existir para que Link pueda obtener la información completa del comprobante y
emitirlo.


## Facturas

A continuación están detalladas todas las estructuras disponibles para emitir una
factura. Las únicas que deben contener información son:
facturas.factura, facturas.item, facturas.item_impuesto, y facturas.total_impuesto

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

Consulta [la documentación de nuestro servicio web](https://datil.dev/#emision-de-una-factura)
para obtener más información sobre cada uno de los parámetros.

## Comprobantes de Retención

A continuación están detalladas todas las estructuras disponibles para emitir una
comprobante de retención. Las únicas que deben contener información son:
retenciones.retencion, retenciones.item

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

Consulta [la documentación de nuestro servicio web](https://datil.dev/#emision-de-una-retencion)
para obtener más información sobre cada uno de los parámetros.

## Notas de Crédito

A continuación están detalladas todas las estructuras disponibles para emitir una
nota de crédito. Las únicas que deben contener información son:
notas_de_credito.nota_de_credito, notas_de_credito.item, notas_de_credito.item_impuesto,
y notas_de_credito.total_impuesto

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

Consulta [la documentación de nuestro servicio web](https://datil.dev/#emision-de-una-nota-de-credito)
para obtener más información sobre cada uno de los parámetros.

## Notas de Débito

A continuación están detalladas todas las estructuras disponibles para emitir una nota de débito. Las únicas que deben contener información son:
notas_de_debito.nota_de_debito, notas_de_debito.totales_impuestos y notas_de_debito.items

```sql

CREATE SCHEMA notas_de_debito

CREATE TABLE [notas_de_debito].[nota_de_debito] (
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [ambiente] [int] NOT NULL,
    [tipo_emision] [int] NOT NULL,
    [secuencial] [bigint] NOT NULL,
    [fecha_emision] [datetime] NULL,
    [moneda] [varchar](15) NOT NULL,
    [clave_acceso] [varchar](49),
    -- DOCUMENTO MODIFICADO
    [fecha_emision_documento_modificado] [datetime] NULL,
    [numero_documento_modificado] [varchar](17) NULL,
    [tipo_documento_modificado] [varchar](2) NULL,
    -- EMISOR
    [ruc] [varchar](13) NULL,
    [obligado_contabilidad] [varchar](2) NULL,
    [contribuyente_especial] [varchar](10) NULL,
    [nombre_comercial] [varchar](300) NULL,
    [razon_social] [varchar](300) NULL,
    [direccion_emisor] [varchar](300) NULL,
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

-- NOTA DE DÉBITO: TOTALES IMPUESTOS
CREATE TABLE [notas_de_debito].[totales_impuestos] (
    [id_nota_debito] bigint NOT NULL FOREIGN KEY REFERENCES [notas_de_debito].[nota_de_debito](id),
    [codigo] [varchar](2) NOT NULL,
    [codigo_porcentaje] [varchar](2) NOT NULL,
    [base_imponible] [decimal](14,2) NOT NULL,
    [valor] [decimal](14,2) NOT NULL,
    [tarida] [decimal](14,2) NOT NULL,
    CONSTRAINT PK_total_impuesto PRIMARY KEY (id_nota_debito, codigo, codigo_porcentaje)
)

-- NOTA DE DÉBITO: ITEMS
CREATE TABLE [notas_de_debito].[item](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_nota_debito] bigint NOT NULL FOREIGN KEY REFERENCES [notas_de_debito].[nota_de_debito](id),
    [cantidad] [decimal](14,2)  NOT NULL,
    [codigo_principal] [varchar](50)  NULL,
    [codigo_auxiliar] [varchar](50)  NULL,
    [precio_unitario] [decimal](14,2)  NOT NULL,
    [descripcion] [varchar](300)  NOT NULL,
    [precio_total_sin_impuestos] [decimal](14,2)  NOT NULL,
    [descuento] [decimal](14,2)  NULL,
    [motivo] [varchar](300) NOT NULL,
    [valor] [varchar](300) NOT NULL,
)

-- NOTA DE DEBITO: INFORMACIÓN ADICIONAL
CREATE TABLE [notas_de_debito].[informacion_adicional](
    [id_nota_debito] bigint NOT NULL FOREIGN KEY REFERENCES [notas_de_debito].[nota_de_debito](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT PK_informacion_adicional PRIMARY KEY (id_nota_debito, nombre)
)

```

Consulta [la documentación de nuestro servicio web](https://datil.dev/#emision-de-una-nota-de-debito)
para obtener más información sobre cada uno de los parámetros.

## Guías de Remisión

A continuación están detalladas todas las estructuras disponibles para emitir una
guía de remisión. Las únicas que deben contener información son:
guia_remision.guia_remision, guia_remision.destinatario, guia_remision.item

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

Consulta [la documentación de nuestro servicio web](https://datil.dev/#emision-de-una-guia-de-remision)
para obtener más información sobre cada uno de los parámetros.


## Liquidaciones de Compra de Bienes y Prestación de Servicios

A continuación están detalladas todas las estructuras disponibles para emitir una
liquidacion. Las únicas que deben contener información son:
liquidaciones_compra.liquidacion, liquidaciones_compra.item,
liquidaciones_compra.item_impuesto, liquidaciones_compra.pago,
y liquidaciones_compra.total_impuesto


```sql
CREATE SCHEMA liquidaciones_compra;
CREATE TABLE [liquidaciones_compra].[liquidacion](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [ambiente] [int] NOT NULL,
    [tipo_emision] [int] NOT NULL,
    [secuencial] [bigint] NOT NULL,
    [clave_acceso] [VARCHAR](49) NULL,
    [fecha_emision] [DATETIME] NULL,
    [moneda] [VARCHAR](15) NOT NULL,
    [codigo_documento] [VARCHAR](2) NOT NULL,
    -- EMISOR
    [ruc] [VARCHAR](13) NULL,
    [obligado_contabilidad] [VARCHAR](10) NULL,
    [contribuyente_especial] [VARCHAR](13) NULL,
    [nombre_comercial] [VARCHAR](300) NULL,
    [razon_social] [VARCHAR](300) NULL,
    [direccion_matriz] [VARCHAR](300) NOT NULL,
    [codigo_establecimiento] [VARCHAR](3) NULL,
    [punto_emision] [VARCHAR](3) NULL,
    [direccion_establecimiento] [VARCHAR](300) NULL,
    -- PROVEEDOR
    [tipo_identificador_proveedor] [VARCHAR](2) NULL,
    [razon_social_proveedor] [VARCHAR](300) NOT NULL,
    [identificador_proveedor] [VARCHAR](20) NOT NULL,
    [direccion_proveedor] [vARCHAR](300) NULL,
    -- TOTALES
    [total_sin_impuestos] [DECIMAL](14, 2) NOT NULL,
    [descuento] [DECIMAL](14, 2) NOT NULL,
    [importe_total] [DECIMAL](14, 2) NOT NULL,
    -- REEMBOLSO
    [codigo_documento_reembolso] [VARCHAR](2) NOT NULL,
    [total_comprobante_reembolso] [DECIMAL](14, 2) NOT NULL,
    [total_base_imponible_reembolso] [DECIMAL](14, 2) NOT NULL,
    [total_impuesto_reembolso] [DECIMAL](14, 2) NOT NULL,
)

-- LIQUIDACION: ITEMS
CREATE TABLE [liquidaciones_compra].[item](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_liquidacion] bigint NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[liquidacion](id),
    [codigo_principal] [VARCHAR](25) NOT NULL,
    [codigo_auxiliar] [VARCHAR](25)  NULL,
    [descripcion] [VARCHAR](300)  NOT NULL,
    [unidad_medida] [VARCHAR](50) NULL,
    [cantidad] [DECIMAL](14,6)  NOT NULL,
    [precio_unitario] [DECIMAL](18,6)  NOT NULL,
    [descuento] [DECIMAL](14,2)  NULL,
    [precio_total_sin_impuestos] [DECIMAL](14,2)  NOT NULL,
)

-- LIQUIDIACION: DETALLES ADICIONALES DE ITEMS
CREATE TABLE [liquidaciones_compra].[item_detalle_adicional](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[item](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar](100) NOT NULL
    CONSTRAINT pk_items_detalles_adicionales PRIMARY KEY (id_item, nombre)
)

-- LIQUIDACION: IMPUESTOS DE ITEMS
CREATE TABLE [liquidaciones_compra].[item_impuesto](
    [id_item] [bigint] NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[item](id),
    [codigo] [VARCHAR](2) NOT NULL,
    [codigo_porcentaje] [VARCHAR](2) NOT NULL,
    [base_imponible] [DECIMAL](14,2) NOT NULL,
    [valor] [DECIMAL](14,2) NOT NULL,
    [tarifa] [DECIMAL](5,2) NOT NULL, -- porcentaje
    CONSTRAINT PK_item_impuesto PRIMARY KEY (id_item, codigo, codigo_porcentaje)
)

-- LIQUIDACION: IMPUESTOS TOTALES
CREATE TABLE [liquidaciones_compra].[total_impuesto](
    [id_liquidacion] bigint NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[liquidacion](id),
    [codigo] [VARCHAR](2) NOT NULL,
    [codigo_porcentaje] [VARCHAR](2) NOT NULL,
    [descuento_adicional] [DECIMAL](14, 2) NULL,
    [base_imponible] [DECIMAL](14,2) NOT NULL,
    [tarifa] [DECIMAL](14, 2) NOT NULL,
    [valor] [DECIMAL](14,2) NOT NULL
    CONSTRAINT PK_total_impuesto PRIMARY KEY (id_liquidacion, codigo, codigo_porcentaje)
)

-- LIQUIDIACION: PAGOS
CREATE TABLE [liquidaciones_compra].[pago](
    [id] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_liquidacion] bigint NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[liquidacion](id),
    [forma_pago] [VARCHAR](2) NOT NULL,
    [total] [DECIMAL](14, 2) NOT NULL,
    [plazo] VARCHAR(50) NOT NULL,
    [unidad_tiempo] VARCHAR(50) NOT NULL
)

-- LIQUIDACION: REEMBOLSOS
CREATE TABLE [liquidaciones_compra].[reembolso](
    [id_reembolso] bigint IDENTITY(1,1) PRIMARY KEY,
    [id_liquidacion] bigint NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[liquidacion](id),
    [tipo_id_proveedor_reembolso] [VARCHAR](2) NOT NULL,
    [id_proveedor_reembolso] [VARCHAR](20) NOT NULL,
    [codigo_pais_pago_proveedor_reembolso] [VARCHAR](2) NOT NULL,
    [tipo_proveedor_reembolso] [VARCHAR](2) NOT NULL,
    [codigo_documento_reembolso] [VARCHAR](3) NOT NULL,
    [codigo_establecimiento_reembolso] [DECIMAL](3) NOT NULL,
    [punto_emision_reembolso] [VARCHAR](3) NOT NULL,
    [secuencial_reembolso] [bigint] NOT NULL,
    [fecha_emision_reembolso] [DATETIME] NOT NULL,
    [numero_autorizacion_reembolso] [VARCHAR](49) NOT NULL
)

-- LIQUIDACION: REEMBOLSO IMPUESTOS
CREATE TABLE [liquidaciones_compra].[reembolso_tax](
    [id_reembolso] [bigint] NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[reembolso](id_reembolso),
    [codigo] [VARCHAR](2) NOT NULL,
    [codigo_porcentaje] [VARCHAR](2) NOT NULL,
    [tarifa] [DECIMAL](14, 2) NOT NULL,
    [base_imponible] [DECIMAL](14,2) NOT NULL,
    [impuesto_reembolso] [DECIMAL](14, 2) NOT NULL
)

-- LIQUIDACION: MAQUINA FISCAL
CREATE TABLE [liquidaciones_compra].[maquina_fiscal](
    [id_liquidacion] bigint NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[liquidacion](id),
    [marca] [VARCHAR](100) NOT NULL,
    [modelo] [VARCHAR](100) NOT NULL,
    [serie] [VARCHAR](100) NOT NULL,
    CONSTRAINT pk_maquina_fiscal PRIMARY KEY (id, marca)
)

-- LIQUIDACION: INFO ADICIONAL
CREATE TABLE [liquidaciones_compra].[info_adicional](
    [id_liquidacion] [bigint] NOT NULL FOREIGN KEY REFERENCES [liquidaciones_compra].[liquidacion](id),
    [nombre] [varchar](100) NOT NULL,
    [valor] [varchar(100)] NOT NULL,
    CONSTRAINT pk_info_adicionales PRIMARY KEY (id_liquidacion, nombre)
)
```

Consulta [la documentación de nuestro servicio web](https://datil.dev/#emision-de-una-liquidacion-de-compras)
para obtener más información sobre cada uno de los parámetros.

