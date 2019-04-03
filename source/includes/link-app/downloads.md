
# Descargas

Integra Dátil a tu sistema en minutos.

### Más reciente (5.0.1)

- [Windows 32 bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+LinkApp_5.0.1_32bit.exe)
- [Windows 64 bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+LinkApp_5.0.1_64bit.exe)

#### Notas de la versión

#### <strong>5.0.1</strong><br><small><strong>Enero 5, 2018</strong></small>

##### Corregido
La longitud máxima para el nombre de una columna en versiones de ORACLE menores
a la 12 es de 30 caracteres. Por esto agregamos alias más cortos para parámetros
que exceden esta longitud, como `fecha_emision_documento_sustento -> fecha_emi_doc_sustento`,
`numero_autorizacion_documento_sustento -> num_aut_doc_sustento`

### Versiones anteriores

#### 5.0.0

- [Windows 32 bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+LinkApp_5.0.0_32bit.exe)
- [Windows 64 bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+LinkApp_5.0.0_64bit.exe)

#### Notas de la versión

#### <strong>5.0.0</strong><br><small><strong>Enero 5, 2018</strong></small>

##### Nuevo
Soporte para ORACLE.<br/>
Personalización del formato de fecha utilizado como literal de fecha utilizando
la nueva entrada de configuración `datetime_format`.<br/>

##### Removido
La tarea `sync_resources` fue removida completamente en favor de tarea más
reciente `resource_sync`.


#### 4.7.0

- [Windows 32 bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+LinkApp_4.7.0_32bit.exe)
- [Windows 64 bits](https://s3-us-west-2.amazonaws.com/linkapp-installers/Datil+LinkApp_4.7.0_64bit.exe)

#### Notas de la versión

#### <strong>4.7.0</strong><br><small><strong>Octubre 19, 2017</strong></small>

##### Nuevo
Emisión de facturas de reembolso. Se agregaron tres nuevas entradas al archivo
de configuración `config/receipts/invoice.ini`: invoice_reimbursement,
invoice_reimbursement_document, invoice_reimbursement_document_tax

