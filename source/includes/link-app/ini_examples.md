# Ejemplos de archivos de configuración

## invoice.ini

Guarda la configuración y queries para la extracción y emisisón electrónica de facturas.
<pre>

[Query]
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

invoice_totals_taxes  = SELECT
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
  id_detalle = ?

item_details = SELECT
  nombre    nombre,
  valor   valor
  FROM
  DocElectronicoFactura.items_detalles_adicionales
  WHERE
  id_detalle = ?

invoice_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoFactura.informacion_adicional
  WHERE
  id_detalle = ?
</pre>

## credit_note.ini

Guarda la configuración y queries para la extracción y emisisón electrónica de notas de crédito.
<pre>

[Query]
headers = SELECT
  id_nota_credito            id_local,
  secuencial,
  fecha_emision,
  guia_remision,
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
  info.id_nota_credito in (:sequence)
  ORDER BY id_nota_credito :order

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

credit_note_totals  = SELECT
  total_sin_impuestos,
  importe_total
  FROM
  DocElectronicoNotaCredito.cabecera
  WHERE
  id_nota_credito = ?

credit_note_totals_taxes  = SELECT
  codigo,
  codigo_porcentaje,
  base_imponible,
  valor
  FROM
  DocElectronicoNotaCredito.totales_impuestos
  WHERE
  id_nota_credito = ?

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

item_details = SELECT
  nombre    nombre,
  valor   valor
  FROM
  DocElectronicoNotaCredito.items_detalles_adicionales
  WHERE
  id_detalle = ?

credit_note_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoNotaCredito.informacion_adicional
  WHERE
  id_detalle = ?
</pre>


## retention.ini

Guarda la configuración y queries para la extracción y emisisón electrónica de retenciones.
<pre>

[Query]
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

retention_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoRetencion.informacion_adicional
  WHERE
  id_retencion = ?
</pre>



## waybill.ini

Guarda la configuración y queries para la extracción y emisisón electrónica de guías de remisión.
<pre>

[Query]
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

item_details = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores   _valor_
  FROM
  DocElectronicoGuiaRemision.items_detalles_adicionales
  WHERE
  id_detalle = ?

waybill_additional_information = SELECT
  columna_de_nombres    _nombre_,
  columna_de_valores     _valor_
  FROM
  DocElectronicoRetencion.informacion_adicional
  WHERE
  id_retencion = ?
  
</pre>

## purchase_settlement.ini

Guarda la configuración y queries para la extracción y emisisón electrónica de liquidaciones de compra.

<pre>

headers = SELECT
      id id_local,
      secuencial,
      fecha_emision,
      moneda,
      tipo_emision
    FROM
      liquidaciones_compra.liquidacion
    WHERE
      id in (:sequence)
    ORDER BY id :order

purchase_settlement_buyer  = SELECT
      ruc,
      obligado_contabilidad,
      contribuyente_especial,
      nombre_comercial,
      razon_social,
      direccion_establecimiento,
      direccion_matriz direccion_emisor,
      codigo_establecimiento codigo,
      punto_emision
    FROM
      liquidaciones_compra.liquidacion
    WHERE
      id = ?

purchase_settlement_provider = SELECT
      identificador_proveedor identificacion,
      tipo_identificador_proveedor tipo_identificacion,
      razon_social_proveedor razon_social,
      direccion_proveedor direccion
    FROM
      liquidaciones_compra.liquidacion
    WHERE
      id = ?

purchase_settlement_totals  = SELECT
      total_sin_impuestos,
      importe_total,
      descuento
    FROM
      liquidaciones_compra.liquidacion
    WHERE
      id = ?

purchase_settlement_totals_taxes = SELECT
      codigo,
      codigo_porcentaje,
      base_imponible,
      valor
    FROM 
      liquidaciones_compra.total_impuesto
    WHERE
      id_liquidacion = ?

items  = SELECT
      id id_detalle,
      codigo_principal,
      codigo_auxiliar,
      descripcion,
      cantidad,
      unidad_medida,
      precio_unitario,
      descuento,
      precio_total_sin_impuestos
    FROM
      liquidaciones_compra.item
    WHERE
      id_liquidacion = ?

item_taxes  = SELECT
      id_item id_detalle,
      base_imponible,
      valor,
      tarifa,
      codigo,
      codigo_porcentaje
    FROM
      liquidaciones_compra.item_impuesto
    WHERE
      id_item = ?

item_details = SELECT
      nombre    nombre,
      valor   valor
    FROM
      liquidaciones_compra.item_detalle_adicional
    WHERE
      id_item = ?

purchase_settlement_additional_information = SELECT
      nombre    _nombre_,
      valor     _valor_
    FROM
      liquidaciones_compra.info_adicional
    WHERE
      id_liquidacion = ?

purchase_settlement_reimbursement = SELECT
        r.id_reembolso,
        l.codigo_documento_reembolso
      FROM
        liquidaciones_compra.liquidacion AS l JOIN
        liquidaciones_compra.reembolso AS r 
      ON
        l.id = r.id_liquidacion
      WHERE
        id = ?

purchase_settlement_reimbursement_totals = SELECT
        total_comprobante_reembolso subtotal,
        total_base_imponible_reembolso total,
        total_impuesto_reembolso total_impuestos
    FROM
        liquidaciones_compra.liquidacion
    WHERE
        id = ?

purchase_settlement_reimbursement_document = SELECT
        codigo_documento_reembolso codigo,
        id_reembolso id_documento,
        id_proveedor_reembolso,
        tipo_id_proveedor_reembolso,
        codigo_pais_pago_proveedor_reembolso,
        tipo_proveedor_reembolso,
        secuencia_reembolso,
        punto_emision_reembolso,
        fecha_emision_reembolso,
        numero_autorizacion_reembolso,
        codigo_establecimiento_reembolso
    FROM
      liquidaciones_compra.reembolso
    WHERE
      id_reembolso = ?

purchase_settlement_reimbursement_tax = SELECT
        codigo,
        codigo_porcentaje,
        tarifa,
        base_imponible,
        impuesto_reembolso
    FROM
        liquidaciones_compra.reembolso_tax
    WHERE
        id_reembolso = ?

purchase_settlement_fiscal_machine = SELECT
        [marca],
        [modelo],
        [serie]
    FROM
        liquidaciones_compra.maquina_fiscal
    WHERE
        id_liquidacion = ?

</pre>