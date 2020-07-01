# Introducción

Integra tu sistema contable o ERP con Facturación Electrónica. La aplicación
**Link** de Dátil te permite emitir todos los tipos de comprobantes
electrónicos: facturas, retenciones, notas de crédito, notas de débito,
guías de remisión y liquidaciones de compra.

**Link** se instala como un servicio del sistema operativo. De esta manera se mantiene
en ejecución permanente para revisar periódicamente la base de datos en busca de
comprobantes a emitir.


**¿Cómo funciona?**

- Link consulta los documentos utilizando las sentencias SQL de los archivos de
configuración.
- Registra los nuevos documentos detectados en una tabla de Control.
- La *tarea de emisión* de Link toma de la tabla de Control el ID del documento
(id_local) en las tablas o vistas del ERP y consulta toda la información de
todas las tablas/vistas relacionadas establecidas en la configuración.
- Si el intento de emisión del documento fue exitoso, Link actualiza la tabla
de Control con el estado _RECIBIDO_
- La *tarea de consulta de resultado* consulta al [servicio de Dátil](https://datil.dev)
el estado de autorización del documento hasta obtener un estado final (AUTORIZADO,
NO AUTORIZADO o DEVUELTO).


# Compatibilidad

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

Para saber si la versión de su equipo es de 32 o 64 bits en Windows, sigue los
pasos del [siguiente enlace](https://support.microsoft.com/es-es/kb/827218).

**Linux** (próximamente)

* CentOS

## Bases de Datos

Link utiliza ODBC para interactuar con la base de datos, por lo que si el
sistema de base de datos que utiliza tu sistema tiene un controlador ODBC Link
debería funcionar sin problemas.

Consulta la documentación del driver ODBC que utilizas para construir la cadena
de conexión (connection string). El sitio web [www.connectionstrings.com](https://www.connectionstrings.com/) también puede ser de utilidad. Este sitio tiene documentación sobre varios motores de base de datos y drivers ODBC.

Link ha sido probado y es utilizado en producción en estos motores de base de
datos.

### SQL Server

* SQL Server 2000
* SQL Server 2005
* SQL Server 2008
* SQL Server 2012
* SQL Server 2014

### Sybase

### ORACLE

### MySQL
