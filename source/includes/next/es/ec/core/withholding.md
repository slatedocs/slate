## Retención

Una Retención está representada por un objeto _Withholding_.


##### El objeto Withholding

Atributos |  &nbsp;
--------- | -----------
number<p class="dt-data-type">string</p> | Número completo de la retención. Es un número secuencial que se forma a partir de {código establecimiento}-{código pto. emisión}-{secuencia}
currency<p class="dt-data-type">string</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
sequence<p class="dt-data-type">integer</p> | Número de secuencia.
issue_date<p class="dt-data-type">string</p> | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
recipient<p class="dt-data-type">objeto [contacto](#contacto) | Información del receptor. Normalmente un proveedor.
items<p class="dt-data-type">lista de [items](#withholding-item)</p> | Impuestos retenidos.
uuid<p class="dt-data-type">string</p> | La clave de acceso de la retención. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties<p class="dt-data-type">list de [property objects](#property)</p> | Información adicional adjunta al comprobante.
electronic_document<p class="dt-data-type">string</p> | Documento electrónico, el XML que representa a esta retención ante el SRI.
electronic_document_url<p class="dt-data-type">string</p> | URL de descarga del documento electrónico, el XML.
printable_version_url<p class="dt-data-type">string</p> | URL de descarga del RIDE.

<h4 id="withholding-item">Item</h4>

Atributos | &nbsp;
--------- | -------
amount<p class="dt-data-type">string</p> | Monto retenido.
taxable_amount<p class="dt-data-type">string</p> | Base imponible.
tax_code<p class="dt-data-type">string</p> | Código del tipo de impuesto retenido
rate_code<p class="dt-data-type">string</p> | Código del impuesto específico retenido
rate<p class="dt-data-type">string</p> | Porcentaje del impuesto
affected_document<p class="dt-data-type">object [related document](#documento-relacionado)</p> | Documento afectado por esta retención


