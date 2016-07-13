# Ejemplos de archivos de configuración

## invoice.ini

Guarda la configuración y queries para la extracción y emisisón electrónica de facturas.
<pre>

[Api]
issue = /credit-notes/issue
reissue = /credit-notes/:id/reissue
info = /credit-notes/:id

[Constraints]
issue_limit = 1
issue_order = asc
get_info_limit = 1
get_info_order = asc

[Query]
all_stored_locally = SELECT 
  id_local
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  fecha_emision >= ?

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

invoice_totals  = SELECT
  total_sin_impuestos,
  importe_total,
  propina,
  descuento
  FROM
  DocElectronicoFactura.cabecera
  WHERE
  id_factura = ?

invoice_totals  = SELECT
  codigo,
  codigo_porcentaje,
  base_imponible,
  valor
  FROM
  DocElectronicoFactura.totales_impuestos
  WHERE
  id_factura = ?

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

item_details = SELECT
  nombre    nombre,
  valor   valor
  FROM
  DocElectronicoFactura.items_detalles_adicionales
  WHERE
  cast(id_factura as varchar) + cast(detalle as varchar) = ?

invoice_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoFactura.informacion_adicional
  WHERE
  id_factura = ?
</pre>