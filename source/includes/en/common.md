# Access Code

To comply with the Ecuador tax authority, each e-document has a unique access code comprised of 49 numeric characters. Datil generates this code for you on each request.

In specific cases you may want to generate the access code yourself, here is how to construct it:

Field | Format | Length
--------- | ---- |-----------
Issuance date| ddmmyyyy| 8
Document type| Table 4| 2
Tax identification (RUC)| 1234567890001| 13
Environment type| Table 5| 1
Series| 001001| 6
Sequencial document number| 000000001| 9
Numeric code| Numeric| 8
Issuance mode| Table 2| 1
Check digit (modulo 11 )| Numeric| 1

**Note:** All fields must conform to the specified length. If the access code is malformed the e-document will not be authorized.

The check digit must be computed using all 48 characters of the access code and then incorporated into the code using modulo 11. Here is an [example algorithm](https://es.wikipedia.org/wiki/C%C3%B3digo_de_control)

# Common objects

## Issuer

Information about the e-document issuer:

Parameter | Type | Description
--------- | ---- |-----------
ruc | string | Tax identification (RUC). 13 characters long.
razon_social | string | Legal name. 300 characters limit.
nombre_comercial | string| Commercial name. 300 characters limit.
direccion | string | Address on record. 300 characters limit.
contribuyente_especial | string | Special contributor resolution number. Empty if you are not a special contributor.
obligado_contabilidad | boolean | `true` if you are required to do accounting.
establecimiento | [location](#location) | Location issuing the e-document.

## Location

Describes an issuing location:

Parameter | Type | Description
--------- | ---- |-----------
codigo | string | Numeric identification code for the location. 3 characters long. Example: `001`.
direccion | string | Address on record. 300 characters limit.
punto_emision | string | Numeric identification code for the point of sale. Example: `001`.

## Recipient

Information about the e-document recipient. Used as __comprador__ in invoices and credit notes, and __sujeto__ in withholdings.

Parameter | Type | Description
--------- | ---- |-----------
razon_social | string | Legal name. 300 characters limit. __Required__
identificacion | string | Tax identification. 5 to 20 characters. __Required__
tipo_identificacion | string | [Identification type](#identification-types) code. __Required__
email | string | Email. 300 characters limite. __Required__
telefono | string | Telephone.
direccion | string | Address


## Identification types

Identification type | Code
--------------------------- | ------
RUC                         | `04`
CEDULA                      | `05`
PASAPORTE                   | `06`
VENTA A CONSUMIDOR FINAL*   | `07`
IDENTIFICACION DELEXTERIOR* | `08`
PLACA                       | `09`


## Total Tax

Parameter | Type | Description
--------- | ---- |-----------
codigo | string | [tax type](#invoice-tax-types) code. __Required__
codigo_porcentaje | string | Invoice [rate code](#invoice-rate-code).
base_imponible | float | Taxable amount.
valor | float | Total tax amount.
descuento_adicional | float | Global discount applied to the invoice, expressed in monetary value. It only applies to VAT type taxes.


## Tax item

Parameter | Type | Description
--------- | ---- |-----------
codigo | string | [Tax type](#invoice-tax-types) code.
codigo_porcentaje | string | Invoice [rate code](#invoice-rate-code).
base_imponible | float | Taxable amount.
valor | float | Total tax amount.
tarifa | float | Tax rate expresed as a number between 0.0 y 100.0


## SRI sending

Information about the sending step of the e-document.

Parameter           | Type                    | Description
------------------- | ----------------------- |-----------
mensajes | list of [SRI message](#sri-response-messages) objects | List of messages.
estado   | string | Valid values: `RECIBIDA`, `DEVUELTA`
fecha    | string | [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) date when the e-document was sent (AAAA-MM-DDHourTimeZone).


## SRI authorization

Information about the authorization step of the e-document.

Parameter           | Type                    | Description
------------------- | ----------------------- |-----------
mensajes | list of [SRI message](#sri-response-messages) objects | List of messages.
estado   | string | Valid values: `AUTORIZADO`, `NO AUTORIZADO`
numero   | string | Authorization number.
fecha    | string | [ISO8601](http://tools.ietf.org/html/rfc3339#section-5.6) date of the authorization (AAAA-MM-DDHourTimeZone).

## SRI response messages

Parameter             | Type   | Description
--------------------- | ------ | -----------
identificador         | string | IRS message code.
mensaje               | string | Description of the message.
tipo                  | string | Valid values: `INFORMATIVO` (information), `ADVERTENCIA` (warning), `ERROR` (error).
informacion_adicional | string | Additional information.

## Line item

Describes a product or service.

Parameter | Type | Description
--------- | ---- |-----------
descripcion | string | Item description. __Required__
codigo_principal | string | Stock keeping unit. Máximo 25 characters.
codigo_auxiliar | string | Additional stock keeping unit. Máximo 25 characters.
cantidad | float | Quantity. __Required__
precio_unitario | float | Unit price. __Required__
descuento | float | Unit discount, expressed in monetary value.  __Required__
precio_total_sin_impuestos | float | Price before taxes. It is the product of `cantidad` and `precio_unitario`.
impuestos | listado list of [tax line item](#tax-line-item) objects | Taxes for the item. __Required__
detalles_adicionales | object | Additional product information the dictionary format. Example:<br><code>{"brand": "Ferrari", "chasis": "UANEI832-NAU101"}</code>. Limited to 3 key and value pairs.

## Invoice withholdings

Withholdings to be included in the invoice. Specific case for traders or distributors of petroleum derivates and for presumptive VAT Retention for publishers, distributors and newsvendors involved in the marketing of newspapers and / or magazines.

Parameter | Type | Description
--------- | ---- |-----------
codigo | string | [Tax type for invoice withholdings](#tax-types-for-invoice-withholdings) code.  __Required__
codigo_porcentaje | string | [Tax rate for invoice withholding](#tax-rates-for-invoice-withholdings) code. __Required__
tarifa | float | Tax rate. 3 integers with 2 decimals limit.  __Required__
valor | float | Tax amount. 12 integers with 2 decimals limit.  __Required__

# Catalog

## Invoice tax types

Tax | Code
-------- | ------
IVA      | 2
ICE      | 3
IRBPNR   | 5

## Invoice rate code

Percentage| Code | Rate
-------- | ------ | ------
0%     | 0 |  0
12%      | 2 | 12
14%   | 3 | 14
Not subject to tax   | 6 | -
Exempt from VAT  | 7 | -

## Withholding tax types

Tax | Code
-------- | ------
RENTA    | 1
IVA      | 2
ISD      | 6

## Tax types for invoice withholdings

Specific case for traders or distributors of petroleum derivates and for presumptive VAT Retention for publishers, distributors and newsvendors involved in the marketing of newspapers and / or magazines.

Tax                  | Code
------------------------- | ------
IVA PRESUNTIVO Y RENTA    | 4

## IVA withholding

IVA rate | Code
-------------- | ------
10%            | 9
20%            | 10
30%            | 1
70%            | 2
100%           | 3

__Zero-amount withholding__

IVA rate | code
-------------- | ------
0%             | 7

__No withholding__

IVA rate | Code
-------------- | ------
0%             | 8

## ISD withholding

ISD rate | Code
-------------- | ------
5%             | 4580


## Tax rates for Invoice Withholdings

Specific case for traders or distributors of petroleum derivates and for presumptive VAT Retention for publishers, distributors and newsvendors involved in the marketing of newspapers and / or magazines.

__IVA withholding__

Presuntive IVA rate                              | Code
--------------------------------------------------------| ------
100%                                                    | 3
12%  (Editores a Margen de Comercialización Voceadores) | 4
100% (Venta periódicos y/o Revistas a Distribuidores)   | 5
100% (Venta periódicos y/o Revistas a Voceadores)       | 6

__Income withholding__

Income withholding rate | Code
---------------- | ------
0.2%             | 327
0.3%             | 328


## Document Types

Document                | Code
------------------------ | ------
Invoice                  | 01
Credit note          | 04
Debit note           | 05
Waybill        | 06
Withholding | 07

## Payment forms

Payment form            | Code
------------------------ | ------
Cash | efectivo
Cheque | cheque
Bank debit | debito_cuenta_bancaria
Bank transfer | transferencia
Bank deposit | deposito_cuenta_bancaria
Debit card | tarjeta_debito
Ecuador E-Money | dinero_electronico_ec
Prepaid card | tarjeta_prepago
Credit card | tarjeta_credito
Other payment methods | otros
Certificate endorsement | endoso_titulos

## Payment method code equivalences between SRI and Dátil

Dátil payment method   | Code | SRI payment method      | Code
------------------------ | ------ | -----------------------|-------
Cash | efectivo | Sin utilización del sistema financiero | 01
Cheque | cheque | Otros con utilización del sistema financiero | 20
 | debito_cuenta_bancaria | Otros con utilización del sistema financiero| 20
Bank transfer | transferencia | Otros con utilización del sistema financiero | 20
Credit card | tarjeta_credito | Tarjeta de crédito nacional | 19
Bank deposit | deposito_cuenta_bancaria | Otros con utilización del sistema financiero | 20
Debit card | tarjeta_debito | Tarjeta de débito | 16
Ecuador E-Money| dinero_electronico_ec | Dinero electrónico | 17
Prepaid card | tarjeta_prepago | Tarjeta prepago | 18
Other payment methods | otros | Otros con utilización del sistema financiero | 20
Certificate endorsement | endoso_titulos | Endoso de títulos | 21

Due to the Ecuadorian Internal Revenue Service requiring all invoices to include payment method information, Dátil will automatically add a payment with code `20` to invoices that include a `credit` object.
