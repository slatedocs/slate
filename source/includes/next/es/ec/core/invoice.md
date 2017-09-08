## Facturas

Una Factura está representada por un objeto _Invoice_.


##### El objeto Invoice

Atributos |  &nbsp;
--------- | -----------
number<p class="dt-data-type">string</p> | Número completo de la factura. Es un número secuencial que se forma a partir de {código establecimiento}-{código pto. emisión}-{secuencia}
currency<p class="dt-data-type">string</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
sequence<p class="dt-data-type">integer</p> | Número de secuencia.
issue_date<p class="dt-data-type">string</p> | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
totals<p class="dt-data-type">objeto [totals](#invoice-totals)</p> | Totales de la factura
customer<p class="dt-data-type">objeto [contacto](#contacto) | Información del comprador.
items<p class="dt-data-type">lista de [items](#invoice-item)</p> | Bienes o servicios facturados.
uuid<p class="dt-data-type">string</p> | La clave de acceso de la factura. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties<p class="dt-data-type">list de [property objects](#property)</p> | Información adicional adjunta al comprobante.
payments<p class="dt-data-type">lista de [payments](#payment)</p> | Pagos realizados a la factura.
payment_methods<p class="dt-data-type">lista de [payment_methods](#payment-method)</p> | Listado de formas de pago aplicables a la factura.
electronic_document<p class="dt-data-type">string</p> | Documento electrónico, el XML que representa a esta factura ante el SRI.
electronic_document_url<p class="dt-data-type">string</p> | URL de descarga del documento electrónico, el XML.
printable_version_url<p class="dt-data-type">string</p> | URL de descarga del RIDE.


<h4 id="invoice-totals">Totals</h4>

Atributos | &nbsp;
--------- | -------
total_discount_amount<p class="dt-data-type">string</p> | Subtotal sin impuestos
subtotal_amount<p class="dt-data-type">string</p> | Subtotal sin impuestos. El subtotal sin impuestos se obtiene con la suma del subtotal de los items.
total_tax_amount<p class="dt-data-type">string</p> | Total de impuesto recaudado
total_amount<p class="dt-data-type">string</p> | Total final.
tip_amount<p class="dt-data-type">string</p> | Propina. También llamado servicio.
additional_discount_amount<p class="dt-data-type">string</p> | Descuento adicional al descuento que se puede aplicar a cada item. Este descuento es aplicado al subtotal de la factura.

<h4 id="invoice-item">Item</h4>

Atributos | &nbsp;
--------- | -------
description<p class="dt-data-type">string</p> | Descripción del ítem.
sku<p class="dt-data-type">string</p> | Código alfanumérico de uso del comercio. Máximo 25 caracteres.
quantity<p class="dt-data-type">string</p> | Cantidad de items.
unit_price<p class="dt-data-type">string</p> | Precio unitario.
unit_discount<p class="dt-data-type">string</p> | El descuento aplicado para este item, expresado en valor monetario.
discount<p class="dt-data-type">string</p> | El descuento aplicado para este item, expresado en valor monetario.
subtotal_amount<p class="dt-data-type">string</p> | Subtotal antes de impuestos. Se obtiene multiplicando `quantity` por `unit_price` menos `discount`
total_amount<p class="dt-data-type">string</p> | subtotal_amount + total tax amount
unit_of_measurement<p class="dt-data-type">string</p> | Unidad de medida, ejemplos: l, kg, cm
taxes | listado de [impuestos](#tax) | Impuestos grabados sobre el producto.
properties<p class="dt-data-type">list de [property objects](#property)</p> | Datos adicionales


#### Payment

Atributos | &nbsp;
--------- | -------
date<p class="dt-data-type">string</p> | Fecha de recepción del pago en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
method <p class="dt-data-type">string</p> | Código del método de pago según [4461 UN/CEFACT standard v06B](http://www.unece.org/trade/untdid/d16a/tred/tred4461.htm)
amount <p class="dt-data-type">string</p> | Valor pagado
properties<p class="dt-data-type">list de [property objects](#property)</p> | Información adicional adjunta al pago Ejemplo:<br>` [{"name":"bank", "description":"Safe Bank"}, {"name":"account_number", "description":"1020304050"}]`


#### Payment method

Atributos | &nbsp;
--------- | -------
due_date<p class="dt-data-type">string</p> | Fecha de vencimiento en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
method <p class="dt-data-type">string</p> | Código del método de pago según [4461 UN/CEFACT standard v06B](http://www.unece.org/trade/untdid/d16a/tred/tred4461.htm)
amount <p class="dt-data-type">string</p> | Valor a pagar por este medio.
properties<p class="dt-data-type">list de [property objects](#property)</p> | Información adicional adjunta al pago Ejemplo:<br>` [{"name":"bank", "description":"Safe Bank"}, {"name":"account_number", "description":"1020304050"}]`
