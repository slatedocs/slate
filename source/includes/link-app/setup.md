# Instalación

Luego de descargar el instalador, empiece la instalación con doble click, siguiendo
el flujo de ventanas que aparecerán en su pantalla.

<img src='/images/linkapp/install-step-1.png'></img>
<img src='/images/linkapp/install-step-3.png'></img>
<img src='/images/linkapp/install-step-4.png'></img>
<img src='/images/linkapp/install-step-5.png'></img>

## Preparando el ambiente

Link utiliza dos tablas indispensables para su operación: Control y Mensaje.
En la tabla de Control registra los documentos que debe procesar y el estado de
cada uno de ellos. Puedes crear estas tablas en la misma base de datos de tu
ERP o en una distinta.

Crea la tabla de control y mensaje:

<pre>
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
