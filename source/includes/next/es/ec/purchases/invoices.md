## Facturas

Una factura de compra está representada por un objeto _Purchase Invoice_.


### El objeto Purchase Invoice

Atributos |  &nbsp;
--------- | -----------
number<p class="dt-data-type">string</p> | Número completo de la factura. Es un número secuencial que se forma a partir de {código establecimiento}-{código pto. emisión}-{secuencia} 
currency<p class="dt-data-type">string</p> | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
issue_date<p class="dt-data-type">string</p> | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
totals<p class="dt-data-type">objeto [totals](#invoice-totals)</p> | Totales de la factura
customer<p class="dt-data-type">objeto [contact](#contact) | Información del comprador.
items<p class="dt-data-type">lista de [items](#invoice-item)</p> | Bienes o servicios facturados.
uuid<p class="dt-data-type">string</p> | La clave de acceso de la factura. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties<p class="dt-data-type">objeto</p> | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`
payments<p class="dt-data-type">lista de [payments](#payment)</p> | Pagos realizados a la factura. 
payment_methods<p class="dt-data-type">lista de [payment_methods](#payment-method)</p> | Listado de formas de pago aplicables a la factura.
payment_terms | Objeto de [payment_terms](#payment-terms) | Información del crédito directo otorgado al cliente.
electronic_document<p class="dt-data-type">string</p> | Documento electrónico, el XML.
electronic_document_url<p class="dt-data-type">string</p> | URL de descarga del documento electrónico, el XML.
printable_version_url<p class="dt-data-type">string</p> | URL de descarga del RIDE.


<h4 id="invoice-totals">Totals</h4>

Atributos | &nbsp; 
--------- | -------
total_discount_amount<p class="dt-data-type">string</p> | Subtotal sin impuestos
subtotal_amount<p class="dt-data-type">string</p> | Subtotal sin impuestos
total_tax_amount<p class="dt-data-type">string</p> | Total de impuestos recaudados
total_amount<p class="dt-data-type">string</p> | Total final.

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
unit_of_measurement<p class="dt-data-type">string</p> | Unidad de medida, ejemplos: l, kg, cm
taxes | listado de [impuestos](#item-taxes) | Impuestos grabados sobre el producto.
properties | hash | Diccionario de datos de carácter adicional. Ejemplo:<br><code>{"marca": "Ferrari", "chasis": "UANEI832-NAU101"}</code>


#### Payment

Atributos | &nbsp; 
--------- | -------
date<p class="dt-data-type">string</p> | Fecha de recepción del pago en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
method <p class="dt-data-type">string</p> | Código del método de pago según [4461 UN/CEFACT standard v06B](http://www.unece.org/trade/untdid/d16a/tred/tred4461.htm)
amount <p class="dt-data-type">string</p> | Valor pagado
properties<p class="dt-data-type">object</p> | Información adicional adjunta al pago en forma de diccionario. Ejemplo:<br>` {"bank": "Safe Bank", "account_number": "1020304050"}`


#### Payment method

Atributos | &nbsp; 
--------- | -------
due_date<p class="dt-data-type">string</p> | Fecha de vencimiento en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
method <p class="dt-data-type">string</p> | Código del método de pago según [4461 UN/CEFACT standard v06B](http://www.unece.org/trade/untdid/d16a/tred/tred4461.htm)
amount <p class="dt-data-type">string</p> | Valor a pagar por este medio.
properties<p class="dt-data-type">object</p> | Información adicional. Ejemplo:<br>` {"bank": "Safe Bank", "account_number": "1020304050"}`


### Registro de una factura utilizando su XML

#### Operación

`POST /locations/:location-id/purchases/invoices/imports`

#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/location/31a8edd4-cf56-4435-a387-7bf1d2eb94e1/invoices/issue \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-d '{
      "electronic_document": "
        <?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <autorizacion>
            <estado>AUTORIZADO</estado>
            <numeroAutorizacion>2411201601200100200000939717922618485</numeroAutorizacion>
            <fechaAutorizacion class=\"fechaAutorizacion\">24/11/2016 12:49:35 PM</fechaAutorizacion>
            <comprobante><![CDATA[<?xml version=\"1.0\" encoding=\"UTF-8\"?>
        <factura id=\"comprobante\" version=\"1.0.0\">
            <infoTributaria>
                <ambiente>2</ambiente>
                <tipoEmision>1</tipoEmision>
                <razonSocial>Acme Corp.</razonSocial>
                <nombreComercial>Acme</nombreComercial>
                <ruc>99999999999999</ruc>
                <claveAcceso>241120160199999999999990020000093971234567814</claveAcceso>
                <codDoc>01</codDoc>
                <estab>001</estab>
                <ptoEmi>002</ptoEmi>
                <secuencial>000009397</secuencial>
                <dirMatriz>Palora Y Amazonas</dirMatriz>
            </infoTributaria>
            <infoFactura>
                <fechaEmision>24/11/2016</fechaEmision>
                <dirEstablecimiento>Palora 37 Y Amazonas</dirEstablecimiento>
                <obligadoContabilidad>SI</obligadoContabilidad>
                <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
                <razonSocialComprador>Datil S. A.</razonSocialComprador>
                <identificacionComprador>0992712555001</identificacionComprador>
                <totalSinImpuestos>534.60</totalSinImpuestos>
                <totalDescuento>59.40</totalDescuento>
                <totalConImpuestos>
                    <totalImpuesto>
                        <codigo>2</codigo>
                        <codigoPorcentaje>3</codigoPorcentaje>
                        <baseImponible>534.60</baseImponible>
                        <valor>74.84</valor>
                    </totalImpuesto>
                </totalConImpuestos>
                <propina>0.00</propina>
                <importeTotal>609.44</importeTotal>
                <moneda>DOLAR</moneda>
                <pagos>
                    <pago>
                        <formaPago>20</formaPago>
                        <total>609.44</total>
                        <plazo>1</plazo>
                        <unidadTiempo>dias</unidadTiempo>
                    </pago>
                </pagos>
            </infoFactura>
            <detalles>
                <detalle>
                    <codigoPrincipal>12-01-02-001</codigoPrincipal>
                    <descripcion>TNT</descripcion>
                    <cantidad>22</cantidad>
                    <precioUnitario>10.00</precioUnitario>
                    <descuento>22.00</descuento>
                    <precioTotalSinImpuesto>198.00</precioTotalSinImpuesto>
                    <impuestos>
                        <impuesto>
                            <codigo>2</codigo>
                            <codigoPorcentaje>3</codigoPorcentaje>
                            <tarifa>14</tarifa>
                            <baseImponible>198.00</baseImponible>
                            <valor>27.72</valor>
                        </impuesto>
                    </impuestos>
                </detalle>
                <detalle>
                    <codigoPrincipal>4880102001</codigoPrincipal>
                    <descripcion>Fósforos de seguridad</descripcion>
                    <cantidad>22</cantidad>
                    <precioUnitario>17.00</precioUnitario>
                    <descuento>37.40</descuento>
                    <precioTotalSinImpuesto>336.60</precioTotalSinImpuesto>
                    <impuestos>
                        <impuesto>
                            <codigo>2</codigo>
                            <codigoPorcentaje>3</codigoPorcentaje>
                            <tarifa>14</tarifa>
                            <baseImponible>336.60</baseImponible>
                            <valor>47.12</valor>
                        </impuesto>
                    </impuestos>
                </detalle>
            </detalles>
            <infoAdicional>
                <campoAdicional nombre=\"dirCliente\">The cliff</campoAdicional>
                <campoAdicional nombre=\"telfCliente\">555 5555</campoAdicional>
                <campoAdicional nombre=\"ciudadCliente\">Guayaquil</campoAdicional>
                <campoAdicional nombre=\"observacion\">Manejar la carga con precaución</campoAdicional>
            </infoAdicional>
        <ds:Signature xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\" xmlns:etsi=\"http://uri.etsi.org/01903/v1.3.2#\" Id=\"Signature1045091\">
        <ds:SignedInfo Id=\"Signature-SignedInfo601725\">
        <ds:CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"></ds:CanonicalizationMethod>
        <ds:SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"></ds:SignatureMethod>
        <ds:Reference Id=\"SignedPropertiesID239839\" Type=\"http://uri.etsi.org/01903#SignedProperties\" URI=\"#Signature1045091-SignedProperties836357\">
        <ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod>
        <ds:DigestValue>MnIK5RfVmbYVxP+TMe0pVgpYJEM=</ds:DigestValue>
        </ds:Reference>
        <ds:Reference URI=\"#Certificate1593074\">
        <ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod>
        <ds:DigestValue>nVizRbnLCJNqrttEXqbYW9csutY=</ds:DigestValue>
        </ds:Reference>
        <ds:Reference Id=\"Reference-ID-623928\" URI=\"#comprobante\">
        <ds:Transforms>
        <ds:Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"></ds:Transform>
        </ds:Transforms>
        <ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod>
        <ds:DigestValue>uZZlQDETRz2ySjoCRgNiupguX4g=</ds:DigestValue>
        </ds:Reference>
        </ds:SignedInfo>
        <ds:SignatureValue Id=\"SignatureValue454111\">
        pVNXwneGQW6fRL/4j8I77yHKrL823NgTmKu1uc1NWNsghhgnjmwZnQbrSB3Xw9aFhYGXbWAVMKxA
        o/scbPMpzXRh50NUJrSOnF8nmDK+Zysw14iVRLbXcyN8fC1QO1F+OkStwSTQQou/mKRwoA1RzZwp
        KqQ6W8QB7jU3EAaq51kOeOtIC+7ohCAVnP87Rm72inQpvTXIY/OV3H1B7pWSqXoymaFSnWZ4XzvB
        +ALGHYtLCviJrv1lY1zpmz8J9zkjyBARQhSNCGGmVIOk0IvbiWdy9a6iIbm0AwXB17hEyWxHBQMa
        Zw4sZOVh2hP4RUWbm4Gcj/S5QSgJhU+qAjEeYQ==
        </ds:SignatureValue>
        <ds:KeyInfo Id=\"Certificate1593074\">
        <ds:X509Data>
        <ds:X509Certificate>
        MIIJ6zCCCNOgAwIBAgIEVM493jANBgkqhkiG9w0BAQsFADCBkzELMAkGA1UEBhMCRUMxGzAZBgNV
        BAoTElNFQ1VSSVRZIERBVEEgUy5BLjEwMC4GA1UECxMnRU5USURBRCBERSBDRVJUSUZJQ0FDSU9O
        IERFIElORk9STUFDSU9OMTUwMwYDVQQDEyxBVVRPUklEQUQgREUgQ0VSVElGSUNBQ0lPTiBTVUIg
        U0VDVVJJVFkgREFUQTAeFw0xNjA2MDMxOTI2MzVaFw0xODA2MDMxOTU2MzVaMIGYMQswCQYDVQQG
        EwJFQzEbMBkGA1UEChMSU0VDVVJJVFkgREFUQSBTLkEuMTAwLgYDVQQLEydFTlRJREFEIERFIENF
        UlRJRklDQUNJT04gREUgSU5GT1JNQUNJT04xOjATBgNVBAUTDDAzMDYxNjE0NTIyMjAjBgNVBAMT
        HFJhbWlybyBQYXRyaWNpbyBBbmRpbm8gQm9yamEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
        AoIBAQCvMRbbfkmG7t1cnSTc/COJ5sSy2KTM1lBVidGd+bF/iMs61M7hTs46xIY/Wh18XN4MARCz
        PsPPXnwNq4sAItwPGxJkVKZ2IIJH//HyRkPGcNZZakPts8KKoyXE2OPgOsQvG/k8DVRFyDrYE6db
        OrZTxvxY2sY8lznIg1tHx0zjZqoybn5rmdXHA4dHRikQYng9fueyAtHiWawX60MSM/eG8B/ncOcz
        93h8MeVMJDWZsoHGBcSrWXqDi+4crERTHMCFNGDb+VRIzF658qIdPPgT/hfWdzmMJYgv22o+mUBc
        89DoM5onBb/DDBtuwmNNrzg1bioWS2fj1OkjgAi502vBAgMBAAGjggY+MIIGOjALBgNVHQ8EBAMC
        BeAwWQYIKwYBBQUHAQEETTBLMEkGCCsGAQUFBzABhj1odHRwOi8vb2NzcGd3LnNlY3VyaXR5ZGF0
        YS5uZXQuZWMvZWpiY2EvcHVibGljd2ViL3N0YXR1cy9vY3NwMIHKBgNVHSAEgcIwgb8wPwYKKwYB
        BAGCpnICCjAxMC8GCCsGAQUFBwICMCMaIUNlcnRpZmljYWRvIGRlIE1pZW1icm8gZGUgRW1wcmVz
        YTB8BgorBgEEAYKmcgIEMG4wbAYIKwYBBQUHAgEWYGh0dHBzOi8vd3d3LnNlY3VyaXR5ZGF0YS5u
        ZXQuZWMvbGV5ZXNfbm9ybWF0aXZhcy9Qb2xpdGljYXMgZGUgQ2VydGlmaWNhZG8gTWllbWJybyBk
        ZSBFbXByZXNhLnBkZjBFBgorBgEEAYKmcgMKBDcTNVNFQ1VSSVRZIERBVEEgU0VHVVJJREFEIEVO
        IERBVE9TIFkgRklSTUEgRElHSVRBTCBTLkEuMB0GCisGAQQBgqZyAwsEDxMNMTc5MjI2MTg0ODAw
        MTAaBgorBgEEAYKmcgMBBAwTCjE3MTU5ODg0NzEwHwYKKwYBBAGCpnIDAgQREw9SYW1pcm8gUGF0
        cmljaW8wFgYKKwYBBAGCpnIDAwQIEwZBbmRpbm8wFQYKKwYBBAGCpnIDBAQHEwVCb3JqYTAjBgor
        BgEEAYKmcgMFBBUTE0Nvb3JkaW5hZG9yIEdlbmVyYWwwMAYKKwYBBAGCpnIDBwQiEyBQYWxvcmEg
        T2UyLTM3IFkgQXYuIFJpbyBBbWF6b25hczAWBgorBgEEAYKmcgMiBAgTBjE3MDUwMTAbBgorBgEE
        AYKmcgMIBA0TCzU5MzIzOTYzMTEwMBUGCisGAQQBgqZyAwkEBxMFUVVJVE8wFwYKKwYBBAGCpnID
        DAQJEwdFY3VhZG9yMCAGCisGAQQBgqZyAyAEEhMQMDAyMDAxMDAwMDAwMDAwMTATBgorBgEEAYKm
        cgMhBAUTA1BGWDAuBgNVHREEJzAlgSNwYXRyaWNpby5hbmRpbm9Ac2VjdXJpdHlkYXRhLm5ldC5l
        YzCCAnkGA1UdHwSCAnAwggJsMIICaKCCAmSgggJghj1odHRwOi8vb2NzcGd3LnNlY3VyaXR5ZGF0
        YS5uZXQuZWMvZWpiY2EvcHVibGljd2ViL3N0YXR1cy9vY3NwhoHUbGRhcDovL2RpcmVjdC5zZWN1
        cml0eWRhdGEubmV0LmVjL2NuPUNSTDg1LGNuPUFVVE9SSURBRCUyMERFJTIwQ0VSVElGSUNBQ0lP
        TiUyMFNVQiUyMFNFQ1VSSVRZJTIwREFUQSxvdT1FTlRJREFEJTIwREUlMjBDRVJUSUZJQ0FDSU9O
        JTIwREUlMjBJTkZPUk1BQ0lPTixvPVNFQ1VSSVRZJTIwREFUQSUyMFMuQS4sYz1FQz9jZXJ0aWZp
        Y2F0ZVJldm9jYXRpb25MaXN0P2Jhc2WGgZ5odHRwczovL2RpcmVjdC5zZWN1cml0eWRhdGEubmV0
        LmVjL35jcmwvYXV0b3JpZGFkX2RlX2NlcnRpZmljYWNpb25fc3ViX3NlY3VyaXR5X2RhdGFfZW50
        aWRhZF9kZV9jZXJ0aWZpY2FjaW9uX2RlX2luZm9ybWFjaW9uX2N1cml0eV9kYXRhX3MuYS5fY19l
        Y19jcmxmaWxlLmNybKSBpjCBozELMAkGA1UEBhMCRUMxGzAZBgNVBAoTElNFQ1VSSVRZIERBVEEg
        Uy5BLjEwMC4GA1UECxMnRU5USURBRCBERSBDRVJUSUZJQ0FDSU9OIERFIElORk9STUFDSU9OMTUw
        MwYDVQQDEyxBVVRPUklEQUQgREUgQ0VSVElGSUNBQ0lPTiBTVUIgU0VDVVJJVFkgREFUQTEOMAwG
        A1UEAxMFQ1JMODUwKwYDVR0QBCQwIoAPMjAxNjA2MDMxOTI2MzVagQ8yMDE4MDYwMzE5NTYzNVow
        HwYDVR0jBBgwFoAU9y9M4HXnYqN4llsGti5xO8xsP5AwHQYDVR0OBBYEFOodsnikhv06ozDa503A
        exi8D6X3MAkGA1UdEwQCMAAwGQYJKoZIhvZ9B0EABAwwChsEVjguMQMCA6gwDQYJKoZIhvcNAQEL
        BQADggEBACzN1CcCzjbz14qfPFZtpoS6CvoNwAJM1YiRakjL2duTrlRYhxkgTgydR9kFILJoUjzu
        dqc8EveTQqquQ5DjA4eotu6JAETqGiEO0vA90AdNHIiKtNmjkWgklzC4xsEiS71svbDSW3Tpp44v
        SCQNryo6f2wqjcc1ktYiudA3wUWbHz5v+Oxek7fmrbrmYksbkA5qdXqbhuYu4u7SvTN8abVTGdP3
        5asXon2+7mzODQJa1GcIg3C42wIYWLcUOLbORn1+qGBpn6Ho/IylEPIGmEYCqJmUQdI6M8wgyN+W
        wbxfcBssuSJ4eSG3AzsiaGaNocn1RNRBXxh6oVcnGqAOdw0=
        </ds:X509Certificate>
        </ds:X509Data>
        <ds:KeyValue>
        <ds:RSAKeyValue>
        <ds:Modulus>
        rzEW235Jhu7dXJ0k3PwjiebEstikzNZQVYnRnfmxf4jLOtTO4U7OOsSGP1odfFzeDAEQsz7Dz158
        DauLACLcDxsSZFSmdiCCR//x8kZDxnDWWWpD7bPCiqMlxNjj4DrELxv5PA1URcg62BOnWzq2U8b8
        WNrGPJc5yINbR8dM42aqMm5+a5nVxwOHR0YpEGJ4PX7nsgLR4lmsF+tDEjP3hvAf53DnM/d4fDHl
        TCQ1mbKBxgXEq1l6g4vuHKxEUxzAhTRg2/lUSMxeufKiHTz4E/4X1nc5jCWIL9tqPplAXPPQ6DOa
        JwW/wwwbbsJjTa84NW4qFktn49TpI4AIudNrwQ==
        </ds:Modulus>
        <ds:Exponent>AQAB</ds:Exponent>
        </ds:RSAKeyValue>
        </ds:KeyValue>
        </ds:KeyInfo>
        <ds:Object Id=\"Signature1045091-Object57467\"><etsi:QualifyingProperties Target=\"#Signature1045091\"><etsi:SignedProperties Id=\"Signature1045091-SignedProperties836357\"><etsi:SignedSignatureProperties><etsi:SigningTime>2016-11-24T12:22:53-05:00</etsi:SigningTime><etsi:SigningCertificate><etsi:Cert><etsi:CertDigest><ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod><ds:DigestValue>Bj57rczVijQfNbqegTH0F53Tmek=</ds:DigestValue></etsi:CertDigest><etsi:IssuerSerial><ds:X509IssuerName>CN=AUTORIDAD DE CERTIFICACION SUB SECURITY DATA,OU=ENTIDAD DE CERTIFICACION DE INFORMACION,O=SECURITY DATA S.A.,C=EC</ds:X509IssuerName><ds:X509SerialNumber>1422802398</ds:X509SerialNumber></etsi:IssuerSerial></etsi:Cert></etsi:SigningCertificate></etsi:SignedSignatureProperties><etsi:SignedDataObjectProperties><etsi:DataObjectFormat ObjectReference=\"#Reference-ID-623928\"><etsi:Description>contenido comprobante</etsi:Description><etsi:MimeType>text/xml</etsi:MimeType></etsi:DataObjectFormat></etsi:SignedDataObjectProperties></etsi:SignedProperties></etsi:QualifyingProperties></ds:Object></ds:Signature></factura>]]></comprobante>
        </autorizacion>
      "
    }'
```

```python
import requests, json

import_data = {
    "electronic_document": "
      <?xml version=\"1.0\" encoding=\"UTF-8\"?>
      <autorizacion>
          <estado>AUTORIZADO</estado>
          <numeroAutorizacion>2411201601200100200000939717922618485</numeroAutorizacion>
          <fechaAutorizacion class=\"fechaAutorizacion\">24/11/2016 12:49:35 PM</fechaAutorizacion>
          <comprobante><![CDATA[<?xml version=\"1.0\" encoding=\"UTF-8\"?>
      <factura id=\"comprobante\" version=\"1.0.0\">
          <infoTributaria>
              <ambiente>2</ambiente>
              <tipoEmision>1</tipoEmision>
              <razonSocial>Acme Corp.</razonSocial>
              <nombreComercial>Acme</nombreComercial>
              <ruc>99999999999999</ruc>
              <claveAcceso>241120160199999999999990020000093971234567814</claveAcceso>
              <codDoc>01</codDoc>
              <estab>001</estab>
              <ptoEmi>002</ptoEmi>
              <secuencial>000009397</secuencial>
              <dirMatriz>Palora Y Amazonas</dirMatriz>
          </infoTributaria>
          <infoFactura>
              <fechaEmision>24/11/2016</fechaEmision>
              <dirEstablecimiento>Palora 37 Y Amazonas</dirEstablecimiento>
              <obligadoContabilidad>SI</obligadoContabilidad>
              <tipoIdentificacionComprador>04</tipoIdentificacionComprador>
              <razonSocialComprador>Datil S. A.</razonSocialComprador>
              <identificacionComprador>0992712555001</identificacionComprador>
              <totalSinImpuestos>534.60</totalSinImpuestos>
              <totalDescuento>59.40</totalDescuento>
              <totalConImpuestos>
                  <totalImpuesto>
                      <codigo>2</codigo>
                      <codigoPorcentaje>3</codigoPorcentaje>
                      <baseImponible>534.60</baseImponible>
                      <valor>74.84</valor>
                  </totalImpuesto>
              </totalConImpuestos>
              <propina>0.00</propina>
              <importeTotal>609.44</importeTotal>
              <moneda>DOLAR</moneda>
              <pagos>
                  <pago>
                      <formaPago>20</formaPago>
                      <total>609.44</total>
                      <plazo>1</plazo>
                      <unidadTiempo>dias</unidadTiempo>
                  </pago>
              </pagos>
          </infoFactura>
          <detalles>
              <detalle>
                  <codigoPrincipal>12-01-02-001</codigoPrincipal>
                  <descripcion>TNT</descripcion>
                  <cantidad>22</cantidad>
                  <precioUnitario>10.00</precioUnitario>
                  <descuento>22.00</descuento>
                  <precioTotalSinImpuesto>198.00</precioTotalSinImpuesto>
                  <impuestos>
                      <impuesto>
                          <codigo>2</codigo>
                          <codigoPorcentaje>3</codigoPorcentaje>
                          <tarifa>14</tarifa>
                          <baseImponible>198.00</baseImponible>
                          <valor>27.72</valor>
                      </impuesto>
                  </impuestos>
              </detalle>
              <detalle>
                  <codigoPrincipal>4880102001</codigoPrincipal>
                  <descripcion>Fósforos de seguridad</descripcion>
                  <cantidad>22</cantidad>
                  <precioUnitario>17.00</precioUnitario>
                  <descuento>37.40</descuento>
                  <precioTotalSinImpuesto>336.60</precioTotalSinImpuesto>
                  <impuestos>
                      <impuesto>
                          <codigo>2</codigo>
                          <codigoPorcentaje>3</codigoPorcentaje>
                          <tarifa>14</tarifa>
                          <baseImponible>336.60</baseImponible>
                          <valor>47.12</valor>
                      </impuesto>
                  </impuestos>
              </detalle>
          </detalles>
          <infoAdicional>
              <campoAdicional nombre=\"dirCliente\">The cliff</campoAdicional>
              <campoAdicional nombre=\"telfCliente\">555 5555</campoAdicional>
              <campoAdicional nombre=\"ciudadCliente\">Guayaquil</campoAdicional>
              <campoAdicional nombre=\"observacion\">Manejar la carga con precaución</campoAdicional>
          </infoAdicional>
      <ds:Signature xmlns:ds=\"http://www.w3.org/2000/09/xmldsig#\" xmlns:etsi=\"http://uri.etsi.org/01903/v1.3.2#\" Id=\"Signature1045091\">
      <ds:SignedInfo Id=\"Signature-SignedInfo601725\">
      <ds:CanonicalizationMethod Algorithm=\"http://www.w3.org/TR/2001/REC-xml-c14n-20010315\"></ds:CanonicalizationMethod>
      <ds:SignatureMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#rsa-sha1\"></ds:SignatureMethod>
      <ds:Reference Id=\"SignedPropertiesID239839\" Type=\"http://uri.etsi.org/01903#SignedProperties\" URI=\"#Signature1045091-SignedProperties836357\">
      <ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod>
      <ds:DigestValue>MnIK5RfVmbYVxP+TMe0pVgpYJEM=</ds:DigestValue>
      </ds:Reference>
      <ds:Reference URI=\"#Certificate1593074\">
      <ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod>
      <ds:DigestValue>nVizRbnLCJNqrttEXqbYW9csutY=</ds:DigestValue>
      </ds:Reference>
      <ds:Reference Id=\"Reference-ID-623928\" URI=\"#comprobante\">
      <ds:Transforms>
      <ds:Transform Algorithm=\"http://www.w3.org/2000/09/xmldsig#enveloped-signature\"></ds:Transform>
      </ds:Transforms>
      <ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod>
      <ds:DigestValue>uZZlQDETRz2ySjoCRgNiupguX4g=</ds:DigestValue>
      </ds:Reference>
      </ds:SignedInfo>
      <ds:SignatureValue Id=\"SignatureValue454111\">
      pVNXwneGQW6fRL/4j8I77yHKrL823NgTmKu1uc1NWNsghhgnjmwZnQbrSB3Xw9aFhYGXbWAVMKxA
      o/scbPMpzXRh50NUJrSOnF8nmDK+Zysw14iVRLbXcyN8fC1QO1F+OkStwSTQQou/mKRwoA1RzZwp
      KqQ6W8QB7jU3EAaq51kOeOtIC+7ohCAVnP87Rm72inQpvTXIY/OV3H1B7pWSqXoymaFSnWZ4XzvB
      +ALGHYtLCviJrv1lY1zpmz8J9zkjyBARQhSNCGGmVIOk0IvbiWdy9a6iIbm0AwXB17hEyWxHBQMa
      Zw4sZOVh2hP4RUWbm4Gcj/S5QSgJhU+qAjEeYQ==
      </ds:SignatureValue>
      <ds:KeyInfo Id=\"Certificate1593074\">
      <ds:X509Data>
      <ds:X509Certificate>
      MIIJ6zCCCNOgAwIBAgIEVM493jANBgkqhkiG9w0BAQsFADCBkzELMAkGA1UEBhMCRUMxGzAZBgNV
      BAoTElNFQ1VSSVRZIERBVEEgUy5BLjEwMC4GA1UECxMnRU5USURBRCBERSBDRVJUSUZJQ0FDSU9O
      IERFIElORk9STUFDSU9OMTUwMwYDVQQDEyxBVVRPUklEQUQgREUgQ0VSVElGSUNBQ0lPTiBTVUIg
      U0VDVVJJVFkgREFUQTAeFw0xNjA2MDMxOTI2MzVaFw0xODA2MDMxOTU2MzVaMIGYMQswCQYDVQQG
      EwJFQzEbMBkGA1UEChMSU0VDVVJJVFkgREFUQSBTLkEuMTAwLgYDVQQLEydFTlRJREFEIERFIENF
      UlRJRklDQUNJT04gREUgSU5GT1JNQUNJT04xOjATBgNVBAUTDDAzMDYxNjE0NTIyMjAjBgNVBAMT
      HFJhbWlybyBQYXRyaWNpbyBBbmRpbm8gQm9yamEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
      AoIBAQCvMRbbfkmG7t1cnSTc/COJ5sSy2KTM1lBVidGd+bF/iMs61M7hTs46xIY/Wh18XN4MARCz
      PsPPXnwNq4sAItwPGxJkVKZ2IIJH//HyRkPGcNZZakPts8KKoyXE2OPgOsQvG/k8DVRFyDrYE6db
      OrZTxvxY2sY8lznIg1tHx0zjZqoybn5rmdXHA4dHRikQYng9fueyAtHiWawX60MSM/eG8B/ncOcz
      93h8MeVMJDWZsoHGBcSrWXqDi+4crERTHMCFNGDb+VRIzF658qIdPPgT/hfWdzmMJYgv22o+mUBc
      89DoM5onBb/DDBtuwmNNrzg1bioWS2fj1OkjgAi502vBAgMBAAGjggY+MIIGOjALBgNVHQ8EBAMC
      BeAwWQYIKwYBBQUHAQEETTBLMEkGCCsGAQUFBzABhj1odHRwOi8vb2NzcGd3LnNlY3VyaXR5ZGF0
      YS5uZXQuZWMvZWpiY2EvcHVibGljd2ViL3N0YXR1cy9vY3NwMIHKBgNVHSAEgcIwgb8wPwYKKwYB
      BAGCpnICCjAxMC8GCCsGAQUFBwICMCMaIUNlcnRpZmljYWRvIGRlIE1pZW1icm8gZGUgRW1wcmVz
      YTB8BgorBgEEAYKmcgIEMG4wbAYIKwYBBQUHAgEWYGh0dHBzOi8vd3d3LnNlY3VyaXR5ZGF0YS5u
      ZXQuZWMvbGV5ZXNfbm9ybWF0aXZhcy9Qb2xpdGljYXMgZGUgQ2VydGlmaWNhZG8gTWllbWJybyBk
      ZSBFbXByZXNhLnBkZjBFBgorBgEEAYKmcgMKBDcTNVNFQ1VSSVRZIERBVEEgU0VHVVJJREFEIEVO
      IERBVE9TIFkgRklSTUEgRElHSVRBTCBTLkEuMB0GCisGAQQBgqZyAwsEDxMNMTc5MjI2MTg0ODAw
      MTAaBgorBgEEAYKmcgMBBAwTCjE3MTU5ODg0NzEwHwYKKwYBBAGCpnIDAgQREw9SYW1pcm8gUGF0
      cmljaW8wFgYKKwYBBAGCpnIDAwQIEwZBbmRpbm8wFQYKKwYBBAGCpnIDBAQHEwVCb3JqYTAjBgor
      BgEEAYKmcgMFBBUTE0Nvb3JkaW5hZG9yIEdlbmVyYWwwMAYKKwYBBAGCpnIDBwQiEyBQYWxvcmEg
      T2UyLTM3IFkgQXYuIFJpbyBBbWF6b25hczAWBgorBgEEAYKmcgMiBAgTBjE3MDUwMTAbBgorBgEE
      AYKmcgMIBA0TCzU5MzIzOTYzMTEwMBUGCisGAQQBgqZyAwkEBxMFUVVJVE8wFwYKKwYBBAGCpnID
      DAQJEwdFY3VhZG9yMCAGCisGAQQBgqZyAyAEEhMQMDAyMDAxMDAwMDAwMDAwMTATBgorBgEEAYKm
      cgMhBAUTA1BGWDAuBgNVHREEJzAlgSNwYXRyaWNpby5hbmRpbm9Ac2VjdXJpdHlkYXRhLm5ldC5l
      YzCCAnkGA1UdHwSCAnAwggJsMIICaKCCAmSgggJghj1odHRwOi8vb2NzcGd3LnNlY3VyaXR5ZGF0
      YS5uZXQuZWMvZWpiY2EvcHVibGljd2ViL3N0YXR1cy9vY3NwhoHUbGRhcDovL2RpcmVjdC5zZWN1
      cml0eWRhdGEubmV0LmVjL2NuPUNSTDg1LGNuPUFVVE9SSURBRCUyMERFJTIwQ0VSVElGSUNBQ0lP
      TiUyMFNVQiUyMFNFQ1VSSVRZJTIwREFUQSxvdT1FTlRJREFEJTIwREUlMjBDRVJUSUZJQ0FDSU9O
      JTIwREUlMjBJTkZPUk1BQ0lPTixvPVNFQ1VSSVRZJTIwREFUQSUyMFMuQS4sYz1FQz9jZXJ0aWZp
      Y2F0ZVJldm9jYXRpb25MaXN0P2Jhc2WGgZ5odHRwczovL2RpcmVjdC5zZWN1cml0eWRhdGEubmV0
      LmVjL35jcmwvYXV0b3JpZGFkX2RlX2NlcnRpZmljYWNpb25fc3ViX3NlY3VyaXR5X2RhdGFfZW50
      aWRhZF9kZV9jZXJ0aWZpY2FjaW9uX2RlX2luZm9ybWFjaW9uX2N1cml0eV9kYXRhX3MuYS5fY19l
      Y19jcmxmaWxlLmNybKSBpjCBozELMAkGA1UEBhMCRUMxGzAZBgNVBAoTElNFQ1VSSVRZIERBVEEg
      Uy5BLjEwMC4GA1UECxMnRU5USURBRCBERSBDRVJUSUZJQ0FDSU9OIERFIElORk9STUFDSU9OMTUw
      MwYDVQQDEyxBVVRPUklEQUQgREUgQ0VSVElGSUNBQ0lPTiBTVUIgU0VDVVJJVFkgREFUQTEOMAwG
      A1UEAxMFQ1JMODUwKwYDVR0QBCQwIoAPMjAxNjA2MDMxOTI2MzVagQ8yMDE4MDYwMzE5NTYzNVow
      HwYDVR0jBBgwFoAU9y9M4HXnYqN4llsGti5xO8xsP5AwHQYDVR0OBBYEFOodsnikhv06ozDa503A
      exi8D6X3MAkGA1UdEwQCMAAwGQYJKoZIhvZ9B0EABAwwChsEVjguMQMCA6gwDQYJKoZIhvcNAQEL
      BQADggEBACzN1CcCzjbz14qfPFZtpoS6CvoNwAJM1YiRakjL2duTrlRYhxkgTgydR9kFILJoUjzu
      dqc8EveTQqquQ5DjA4eotu6JAETqGiEO0vA90AdNHIiKtNmjkWgklzC4xsEiS71svbDSW3Tpp44v
      SCQNryo6f2wqjcc1ktYiudA3wUWbHz5v+Oxek7fmrbrmYksbkA5qdXqbhuYu4u7SvTN8abVTGdP3
      5asXon2+7mzODQJa1GcIg3C42wIYWLcUOLbORn1+qGBpn6Ho/IylEPIGmEYCqJmUQdI6M8wgyN+W
      wbxfcBssuSJ4eSG3AzsiaGaNocn1RNRBXxh6oVcnGqAOdw0=
      </ds:X509Certificate>
      </ds:X509Data>
      <ds:KeyValue>
      <ds:RSAKeyValue>
      <ds:Modulus>
      rzEW235Jhu7dXJ0k3PwjiebEstikzNZQVYnRnfmxf4jLOtTO4U7OOsSGP1odfFzeDAEQsz7Dz158
      DauLACLcDxsSZFSmdiCCR//x8kZDxnDWWWpD7bPCiqMlxNjj4DrELxv5PA1URcg62BOnWzq2U8b8
      WNrGPJc5yINbR8dM42aqMm5+a5nVxwOHR0YpEGJ4PX7nsgLR4lmsF+tDEjP3hvAf53DnM/d4fDHl
      TCQ1mbKBxgXEq1l6g4vuHKxEUxzAhTRg2/lUSMxeufKiHTz4E/4X1nc5jCWIL9tqPplAXPPQ6DOa
      JwW/wwwbbsJjTa84NW4qFktn49TpI4AIudNrwQ==
      </ds:Modulus>
      <ds:Exponent>AQAB</ds:Exponent>
      </ds:RSAKeyValue>
      </ds:KeyValue>
      </ds:KeyInfo>
      <ds:Object Id=\"Signature1045091-Object57467\"><etsi:QualifyingProperties Target=\"#Signature1045091\"><etsi:SignedProperties Id=\"Signature1045091-SignedProperties836357\"><etsi:SignedSignatureProperties><etsi:SigningTime>2016-11-24T12:22:53-05:00</etsi:SigningTime><etsi:SigningCertificate><etsi:Cert><etsi:CertDigest><ds:DigestMethod Algorithm=\"http://www.w3.org/2000/09/xmldsig#sha1\"></ds:DigestMethod><ds:DigestValue>Bj57rczVijQfNbqegTH0F53Tmek=</ds:DigestValue></etsi:CertDigest><etsi:IssuerSerial><ds:X509IssuerName>CN=AUTORIDAD DE CERTIFICACION SUB SECURITY DATA,OU=ENTIDAD DE CERTIFICACION DE INFORMACION,O=SECURITY DATA S.A.,C=EC</ds:X509IssuerName><ds:X509SerialNumber>1422802398</ds:X509SerialNumber></etsi:IssuerSerial></etsi:Cert></etsi:SigningCertificate></etsi:SignedSignatureProperties><etsi:SignedDataObjectProperties><etsi:DataObjectFormat ObjectReference=\"#Reference-ID-623928\"><etsi:Description>contenido comprobante</etsi:Description><etsi:MimeType>text/xml</etsi:MimeType></etsi:DataObjectFormat></etsi:SignedDataObjectProperties></etsi:SignedProperties></etsi:QualifyingProperties></ds:Object></ds:Signature></factura>]]></comprobante>
      </autorizacion>
    "
}

headers = {
    'x-api-key': '<clave-del-api>',
    'content-type': 'application/json'}
response = requests.post(
    "https://api.datil.co/locations/:location-id/purchases/invoices/imports",
    headers = headers,
    data = json.dumps(import_data))
```

Es necesario enviar el XML que representa al documento electrónico autorizado,
para obtener la información de la autorización.

Parámetros | &nbsp;
---------- | -----------
<span class="dt-attr">electronic_document</span><p class="dt-param-required">Requerido</p> | Documento electrónico autorizado

#### Respuesta

> ##### Respuesta de ejemplo

```json
{
  "_id":2389866,
  "created":"2017-01-26T23:31:18.872246+00:00",
  "currency":"USD",
  "customer":{
    "address":"VICTOR EMILIO ESTRADA 112 Y CIRCUNVALACION NORTE EDIFICIO C3 PISO 2",
    "business":"",
    "email":"juliana.toala@datilmedia.com",
    "name":"DATILMEDIA S.A.",
    "phone":"0990289327",
    "tax_id":"0992712554001",
    "tax_id_type":"04"
  },
  "id":"0ca59ad093474d4889974fbabd71cdb7",
  "items":[
    {
      "additional_information":[

      ],
      "description":"WEB CERTIFICATES",
      "discount":"22.00",
      "id":225858,
      "product_id":null,
      "quantity":"22.000000",
      "sk":"12-01-02-001",
      "subtotal":"198.00",
      "taxes":[
        {
          "rate":"1400.00",
          "rate_code":"3",
          "tax_code":"2",
          "taxable_base":"198.00",
          "total":"27.72"
        }
      ],
      "total":"225.72",
      "unit_price":"10.000000"
    },
    {
      "additional_information":[

      ],
      "description":"SOPORTE CERT  BAJO VOL 1",
      "discount":"37.40",
      "id":225859,
      "product_id":null,
      "quantity":"22.000000",
      "sk":"4880102001",
      "subtotal":"336.60",
      "taxes":[
        {
          "rate":"1400.00",
          "rate_code":"3",
          "tax_code":"2",
          "taxable_base":"336.60",
          "total":"47.12"
        }
      ],
      "total":"383.72",
      "unit_price":"17.000000"
    }
  ],
  "number":"9397",
  "payment_methods":[
    {
      "amount":"609.44",
      "due_date":"2016-11-25",
      "method":null
    }
  ],
  "pos":{
    "id":248
  },
  "supplier":{
    "address":"Palora y Amazonas",
    "administrative_district_level_1":null,
    "commercial_name":"Acme",
    "country":"EC",
    "email":"ventas@acme.com.ec",
    "legal_name":"Acme Corp",
    "locality":null,
    "location":{
      "address":"Palora y Amazonas",
      "administrative_district_level_1":"",
      "administrative_district_level_2":"",
      "code":"001",
      "id":"3b604211-aca1-4348-8968-6f6b71f60555"
    },
    "phone":null,
    "tax_identification":"9999999999999"
  },
  "totals":{
    "discount":"59.40",
    "subtotal":"534.60",
    "taxes":[
      {
        "rate":"0",
        "rate_code":"3",
        "tax_code":"2",
        "taxable_base":"534.60",
        "total":"74.84"
      }
    ],
    "tip":"0.00",
    "total":"609.44"
  }
}
```

Retorna un objeto _purchase invoice_ que representa a la factura recién
registrada. Si algo sale mal responde con un [error](#errors).
Recuerda que el XML debe corresponder a la autorización del comprobante y no
sólo del comprobante.


### Registro de una factura de compra

#### Operación

`POST /locations/:location-id/invoices`

#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/location/31a8edd4-cf56-4435-a387-7bf1d2eb94e1/invoices/issue \
-H "Content-Type: application/json" \
-H "X-Api-Key: <API-key>" \
-H "X-Password: <clave-certificado-firma>" \
-d '{
      "country": "EC",
      "device_id": "9008edd4-cf56-4435-a387-7bf1d2eb9aef",
      "sequence": 2,
      "uuid": "2211201601099022690300110010030000011701993241014",
      "issue_date": "2016-11-22 23:00:00",
      "customer": {
        "tax_identification_type": "31",
        "properties": [],
        "address": "Carrera 10 Calle 1",
        "email": "w@datil.co",
        "phone": "57122222222222",
        "locality": "Bogota DC",
        "sublocality": "Centro",
        "tax_identification": "1050320-1",
        "tax_level_code": "2",
        "person": {
          "first_name": "Juan",
          "middle_name": "A.",
          "last_name": "Argüello"
        },
        "administrative_district_level_1": "Guayas",
        "country": "EC"
      },
      "taxes": [
        {
          "amount": 419046.82,
          "tax_code": "03",
          "tax_rate": 4.14,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        },
        {
          "amount": 1619504.64,
          "tax_code": "01",
          "tax_rate": 16.00,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        }
      ],
      "totals": {
        "subtotal_amount": 10121904.00,
        "total_tax_amount": 2038551.46,
        "total_amount": 12160455.46,
      }
      "currency": "USD",
      "items": [
        {
          "description": "Apple",
          "properties": {
            "key": "size",
            "value": "M"
          },
          "unit_discount": "1.00",
          "unit_code": "units",
          "unit_price": "4.3256",
          "id": "afb0110982731abc",
          "subtotal_amount": "6.65",
          "quantity": "2"
        }
      ],
      "properties": [
         {
           "key": "Contract Number",
           "value": "420420"
         }
       ],
       "payments": [
         {
           "properties": {
             "account_number": "2223XXXX23",
             "bank": "Bancolombia"
           },
           "amount": 1.09,
           "method": "42"
         }
       ],
  }'
```

```python
import requests, json

invoice = {
      "country": "EC",
      "location_code": "001",
      "device_id": "9008edd4-cf56-4435-a387-7bf1d2eb9aef",
      "sequence": 2,
      "uuid": "12345-12345-12345-12345-12345",
      "issue_date": "2016-11-22 23:00:00",
      "customer": {
        "tax_identification_type": "31",
        "properties": [],
        "address": "Carrera 10 Calle 1",
        "email": "w@datil.co",
        "phone": "57122222222222",
        "locality": "Bogota DC",
        "sublocality": "Centro",
        "tax_identification": "1050320-1",
        "tax_level_code": "2",
        "person": {"first_name": "Juan",
                   "middle_name": "A.",
                   "last_name": "Argüello"},
        "administrative_district_level_1": "Guayas",
        "country": "EC"
      },
      "taxes": [
        {
          "amount": 419046.82,
          "tax_code": "03",
          "tax_rate": 4.14,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        },
        {
          "amount": 1619504.64,
          "tax_code": "01",
          "tax_rate": 16.00,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        }
      ],
      "totals": {
        "subtotal_amount": 10121904.00,
        "total_tax_amount": 2038551.46,
        "total_amount": 12160455.46,
      }
      "currency": "USD",
      "items": [
        {
          "description": "Apple",
          "properties": {
            "key": "size",
            "value": "M"
          },
          "unit_discount": 0.00,
          "unit_code": "units",
          "unit_price": 43256.00,
          "id": "ABC",
          "subtotal_amount": 10121904.00,
          "total_amount": 1.15,
          "quantity": 234
        }
      ],
      "properties": [
         {
           "key": "Contract Number",
           "value": "420420"
         }
       ],
       "payments": [
         {
           "properties": {
             "account_number": "2223XXXX23",
             "bank": "Bancolombia"
           },
           "amount": 1.09,
           "method": "42"
         }
       ],
  }
headers = {
    'x-api-key': '<clave-del-api>',
    'x-password': '<clave-certificado-firma>',
    'content-type': 'application/json'}
response = requests.post(
    "https://api.datil.co/locations/31a8edd4-cf56-4435-a387-7bf1d2eb94e1/invoices/issue",
    headers = headers,
    data = json.dumps(invoice))
```

Para la emisión de una factura se debe enviar la información completa de la
venta. Las facturas emitidas con un API key de pruebas, serán enviadas al
ambiente de pruebas del SRI.

Parámetros | &nbsp;
---------- | -----------
sequence<p class="dt-data-type">opcional</p> | Número entero positivo mayor a cero
currency<br>__requerido__ | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
issue_date<p class="dt-data-type">opcional</p> | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6).
totals<p class="dt-data-type">objeto tipo [totals](#invoice-totals)</p> | Totales de la factura
customer<p class="dt-data-type">objeto tipo [contact](#contact) | Información del comprador.
items<p class="dt-data-type">arreglo de [items](#invoice-item)</p> | Bienes o servicios vendidos.
uuid<p class="dt-data-type">string</p> | La clave de acceso de la factura. La clave de acceso es un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
properties<p class="dt-data-type">objeto</p> | Información adicional adjunta al comprobante en forma de diccionario. Ejemplo:<br>` {"plan": "Inicial", "vigencia": "1 mes"}`
payments<p class="dt-data-type">arreglo [payment](#payment)</p> | Pagos realizados a la factura. 
payment_methods<p class="dt-data-type">arreglo [payment_method](#payment_method)</p> | Listado de formas de pago aplicables a la factura.
payment_terms | Objeto de tipo [credito](#cr-dito) | Información del crédito directo otorgado al cliente.


##### Totals

Parámetro           | Tipo                    | Descripción
------------------- | ----------------------- |-----------
total_sin_impuestos | float | Total antes de los impuestos. __Requerido__
descuento_adicional | float | Descuento aplicado al subtotal de la factura expresado en valor monetario.
descuento           | float | Suma de los descuentos de cada ítem y del descuento adicional. __Requerido__
propina             | float | Propina total, llamado también servicio. __Requerido__
importe_total       | float | Total incluyendo impuestos. __Requerido__
impuestos           | listado de objetos [total impuesto](#total-impuesto) | Listado de impuesto totalizados. __Requerido__

##### Payments

Parámetro   | Tipo         | Descripción
----------- | ------------ | ----------
fecha       | string       | Fecha de recepción del pago en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). Si no es especificado se utiliza la fecha y hora actual.
medio       | string       | Código del [tipo de forma de pago](#tipos-de-forma-de-pago). __Requerido__
total       | float        | Total aplicable a la forma de pago especificada. __Requerido__
propiedades | objeto       | Información adicional adjunta al pago en forma de diccionario. Ejemplo:<br>` {"plazo": "30", "unidad_tiempo": "dias"}`

##### Payment terms

Parámetro           | Tipo    | Descripción
------------------- | ------- | ----------
fecha_vencimiento   | string  | Fecha de vencimiento en formato AAAA-MM-DD, definido en el estándar [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6). __Requerido__
monto               | float   | Monto otorgado de crédito. __Requerido__


Retorna un objeto **[invoice](#el-objeto-invoice)** que incluye un nuevo parámetro `id`,
el cual identifica de manera única a la factura. El campo `clave_acceso` generado
también se incluirá como parte de la respuesta.

### Consulta de una factura

Consulta una factura para obtener toda la información del comprobante,
incluyendo el estado de autorización del mismo.
El atributo `status` de la respuesta obtenida al invocar esta operación, indica
el estado actual del comprobante.

Si es necesario conocer en detalle el estado del [proceso de emisión](#proceso-de-emisión),
se debe examinar el atributos `authorization` de la factura.

#### Operación

`GET /locations/:location-id/sales/invoices/:invoice-id`

#### Requerimiento

> ##### Requerimiento de ejemplo

```shell
curl -v https://link.datil.co/invoices/<invoice-id> \
-H "Content-Type: application/json" \
-H "X-Api-Key: <clave-del-api>" \
-H "X-Password: <clave-certificado-firma>" \
```

```python
import requests
cabeceras = {'x-key': '<clave-del-api>'}
respuesta = requests.get(
    'https://link.datil.co/invoices/<id-factura>',
    headers = cabeceras)
```

```c#
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DatilClient {
  class InvoicingServiceClient {
    static void Main(string[] args) {

      var client = new RestClient("https://link.datil.co/");
      var idFactura = "<id-factura>";
      var request = new RestRequest("invoices/" + idFactura, Method.GET);
      request.AddHeader("X-Key", "<clave-del-api>");

      IRestResponse response = client.Execute(request);

      Console.WriteLine(response.Content);
    }
  }
}
```

Reemplaza en la ruta `<invoice-ID>` por el `id` de la factura que necesitas consultar.


#### Respuesta

> ##### Respuesta de ejemplo

```json
{
    "id": "abcf12343faad06785",
    "secuencial": "16",
    "fecha_emision": "2016-05-15",
    "version": "1.0.0",
    "clave_acceso": "1505201501099271255500110011000000000162092727615",
    "emisor": {
        "ruc": "0992712555001",
        "razon_social": "Datil S.A.",
        "nombre_comercial": "Dátil",
        "direccion": null,
        "obligado_contabilidad": true,
        "contribuyente_especial": "",
        "establecimiento": {
            "codigo": "001",
            "direccion": "V.E. 112 Y CIRCUNVALACION NORTE",
            "punto_emision": "100"
        }
    },
    "estado": "AUTORIZADO",
    "correos_enviados": [
        {
            "fecha_envio": "2015-05-15T16:36:48.274604",
            "destinatarios": "juanantonioplaza@datilmedia.com"
        }
    ],
    "guia_remision": "",
    "moneda": "USD",
    "informacion_adicional": [],
    "ambiente": "1",
    "totales": {
        "total_sin_impuestos": "150.00",
        "descuento": "0.00",
        "propina": "0.00",
        "impuestos": [
            {
                "codigo": 2,
                "codigo_porcentaje": "2",
                "base_imponible": "150.00",
                "valor": "18.00"
            }
        ],
        "importe_total": "168.00"
    },
    "comprador": {
        "razon_social": "Carlos L. Plaza",
        "identificacion": "0900102222",
        "tipo_identificacion": 1,
        "email": "cplaza@gye593.com",
        "direccion": "Calle Uno y Calle Dos",
        "telefono": "043334445"
    },
    "envio_sri": {
        "mensajes": [],
        "estado": "RECIBIDA",
        "fecha": ""
    },
    "tipo_emision": "1",
    "items": [
        {
            "detalles_adicionales": {
                "Estadía": "2 noches",
                "Habitación": "203"
            },
            "cantidad": "1.000000",
            "codigo_principal": "HAB",
            "codigo_auxiliar": "DOB",
            "descripcion": "Habitación doble",
            "precio_unitario": "150.000000",
            "descuento": "0.00",
            "precio_total_sin_impuestos": "",
            "impuestos": [
                {
                    "tarifa": "12.00",
                    "codigo": "2",
                    "codigo_porcentaje": "2",
                    "base_imponible": "150.00",
                    "valor": "18.00"
                }
            ],
            "unidad_medida": "Kilos"
        }
    ],
    "valor_retenido_iva": 70.40,
    "valor_retenido_renta": 29.60,
    "credito": {
        "fecha_vencimiento": "2016-06-28",
        "monto": 34.21
    },    
    "pagos": [
      {
        "medio": "cheque",
        "total": 4882.68,
        "propiedades": {
          "numero": "1234567890",
          "banco": "Banco Pacífico"
        }
      }
    ],
    "compensaciones": [
      {
        "codigo": 1,
        "tarifa": 2,
        "valor": 2.00
      }
    ],
    "exportacion": {
      "incoterm": {
        "termino": "CIF",
        "lugar": "Guayaquil",
        "total_sin_impuestos": "CIF"
      },
      "origen": {
        "codigo_pais":"EC",
        "puerto": "Guayaquil"
      },
      "destino": {
        "codigo_pais":"CN",
        "puerto": "China"
      },
      "codigo_pais_adquisicion": "EC",
      "totales": {
        "flete_internacional": 1000.00,
        "seguro_internacional": 200.00,
        "gastos_aduaneros": 800,
        "otros_gastos_transporte": 350.00
      }
    }
    "autorizacion": {
        "estado": "AUTORIZADO",
        "mensajes": [
            {
                "identificador": "60",
                "mensaje": "ESTE PROCESO FUE REALIZADO EN EL AMBIENTE DE PRUEBAS",
                "tipo": "INFORMATIVO",
                "informacion_adicional": ""
            }
        ],
        "numero": "1505201516323509927125550010266935227",
        "fecha": "2015-05-15T16:32:35.000380"
    }
}
```

Parámetro | Tipo | Descripción
--------- | ------- | -----------
secuencial | string | Número de secuencia de la factura.
estado | string | Posibles valores: `AUTORIZADO`, `NO AUTORIZADO`, `ENVIADO`, `DEVUELTO`, `RECIBIDO`
fecha_emision | string | Fecha de emisión en formato AAAA-MM-DDHoraZonaHoraria, definido en el estándar [ISO8601](http://tools.ietf).
clave_acceso | string | La clave de acceso representa un identificador único del comprobante. Si esta información no es provista, Dátil la generará.<br>¿Cómo [generar](#clave-de-acceso) la clave de acceso?
envio_sri | objeto tipo [envio sri](#envío-sri) | Información luego de enviar el comprobante.
autorizacion | objeto tipo [autorizacion sri](#autorización-sri) | Información de la autorización.org/html/rfc3339#section-5.6).
emisor | objeto tipo [emisor](#emisor) | Información completa del emisor.
moneda | string | Código [ISO](https://en.wikipedia.org/wiki/ISO_4217) de la moneda.
ambiente | integer | Pruebas: `1`.<br>Producción `2`.<br>
totales | objeto tipo [totales](#totales) | Listado de totales.
comprador | objeto [persona](#persona) | Información del comprador.
tipo_emision | integer | Emisión normal: `1`.<br>Emisión por indisponibilidad: `2`<br>
items | listado de objetos tipo [item](#item-de-factura) | Items incluídos en la factura.
pagos | listado de objetos tipo [pagos](#pagos) | Listado de formas de pago aplicables a la factura.
credito | Objeto de tipo [credito](#cr-dito) | Información del crédito directo otorgado al cliente.
version | string | Versión de la especificación, opciones válidas: `1.0.0`, `1.1.0`

### Re-emisión de una factura

#### Operación

`POST /invoices/:id/reissue`

#### Requerimiento

Esta operación debe ser utilizada para corregir comprobantes NO AUTORIZADOS o
DEVUELTOS por el Servicio de Rentas Internas.

En la URL de esta opción se debe incluir el `id` de la factura recibida al
momento de emitirla.

El cuerpo del requerimiento es un objeto [factura](#requerimiento) con los
datos corregidos para que pueda ser procesado y autorizado.

#### Respuesta

Retornará un error si el comprobante se encuentra autorizado.
