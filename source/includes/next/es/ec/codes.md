# Catálogo de Códigos

## Tipo de identificación

Tipo de identificación                         | Código
---------------------------------------------- | ------
RUC                                            | 04
CEDULA                                         | 05
PASAPORTE                                      | 06
VENTA A CONSUMIDOR FINAL <small>(1)</smal>     | 07
IDENTIFICACION DEL EXTERIOR <small>(2)</small> | 08
PLACA                                          | 09

(1) En la venta a Consumidor Final la identificación del cliente se formará con 13 dígitos de nueve (9999999999999).
(2) La identificación del Exterior corresponderá al número de Identificación otorgado por la Administración Tributaria (AT) del país que es Residente Fiscal.


## Tipos de impuesto

Impuesto | Código
-------- | ------
IVA      | 2
ICE      | 3
IRBPNR   | 5


## Código de Porcentaje de IVA

Porcentaje de IVA | Código | Tarifa
-------- | ------ | ------
0%     | 0 |  0
12%      | 2 | 12
14%   | 3 | 14
No Objeto de Impuesto   | 6 | -
Exento de IVA   | 7 | -


## Tipos de impuesto para la retención

Impuesto | Código
-------- | ------
RENTA    | 1
IVA      | 2
ISD      | 6


## Tipos de impuesto para la retención en la factura

Caso específico de Retenciones en la Comercializadores / Distribuidores de derivados del
Petróleo y Retención presuntiva de IVA a los Editores, Distribuidores y Voceadores que
participan en la comercialización de periódicos y/o revistas.

Impuesto                  | Código
------------------------- | ------
IVA PRESUNTIVO Y RENTA    | 4


## Retención de IVA

Porcentaje IVA | Código
-------------- | ------
10%            | 9
20%            | 10
30%            | 1
70%            | 2
100%           | 3

__Retención en cero__

Porcentaje IVA | Código
-------------- | ------
0%             | 7

__No procede retención__

Porcentaje IVA | Código
-------------- | ------
0%             | 8

## Retención ISD

Porcentaje IVA | Código
-------------- | ------
5%             | 4580


## Retención de IVA Presuntivo y Renta

Caso específico de Retenciones en la Comercializadores / Distribuidores de derivados del
Petróleo y Retención presuntiva de IVA a los Editores, Distribuidores y Voceadores que
participan en la comercialización de periódicos y/o revistas.

__Retención IVA__

Porcentaje IVA presuntivo                               | Código
--------------------------------------------------------| ------
100%                                                    | 3
12%  (Editores a Margen de Comercialización Voceadores) | 4
100% (Venta periódicos y/o Revistas a Distribuidores)   | 5
100% (Venta periódicos y/o Revistas a Voceadores)       | 6

__Retención Renta__

Porcentaje Renta | Código
---------------- | ------
0.2%             | 327
0.3%             | 328


## Tipos de documentos

Documento                | Código
------------------------ | ------
Factura                  | 01
Nota de Crédito          | 04
Nota de Débito           | 05
Guía de Remisión         | 06
Comprobante de Retención | 07

## Formas de pago

Forma de pago            | Código
------------------------ | ------
Alia | alia
American Express | american_express
Cheque | check
Cheque certificado | certified_check
Cheque de gerencia | cashiers_check
Cheque del exterior | outside_check
Compensación de deudas | debt_compensation
Débito de cuenta bancaria | bank_account_debit
Depósito Banco Bolivariano | banco_bolivariano
Depósito Banco Pacífico | banco_pacifico
Depósito Banco Pichincha | banco_pichincha
Depósito en cuenta (Corriente / Ahorros) | bank_account_deposit
Dinero electrónico | dinero_electronico_ec
Diners Club | diners_club
Discover | discover
Efectivo | cash
Endoso de inversión | investment_endorsement
Endoso de títulos | certificate_endorsement
Giro | money_order
MasterCard | mastercard
Nota de Crédito | credit_note
Orden de Pago Banco Pichincha | banco_pichincha_payment_order
Otros | others
PayPal | paypal
PayPhone | payphone
Retención | retention
Tarjeta de crédito | credit_card
Tarjeta de crédito internacional | international_credit_card
Tarjeta de crédito nacional | local_credit_card
Tarjeta de débito | debit_card
Tarjeta prepago | prepaid_card
Transferencia | wire_transfer
Transferencia banco exterior | international_bank_transfer
Transferencia en el mismo banco | same_bank_transfer
Transferencia otro banco nacional | other_bank_transfer
Visa | visa

## Equivalencia entre formas de pago Dátil y formas de pago del SRI

Forma de pago Dátil      | Forma de pago SRI      | Código
------------------------ | -----------------------|-------
Efectivo | Sin utilización del sistema financiero | 01
Cheque | Otros con utilización del sistema financiero | 20
Débito bancario | Otros con utilización del sistema financiero| 20
Transferencia bancaria | Otros con utilización del sistema financiero | 20
Tarjeta de crédito | Tarjeta de crédito nacional | 19
Depósito en cuenta (Corriente / Ahorros) | Otros con utilización del sistema financiero | 20
Tarjeta de débito | Tarjeta de débito | 16
Dinero electrónico Ecuador | Dinero electrónico | 17
Tarjeta prepago | Tarjeta prepago | 18
Otros | Otros con utilización del sistema financiero | 20
Endoso de títulos | Endoso de títulos | 21

Debido a que el Servicio de Rentas Internas exige incluir información del pago,
las facturas a crédito se enviarán al SRI con forma de pago "Otros con utilización del sistema financiero".

<h2 id="document-status">Estado de un documento</h2>

Estado            | Descripción
----------------- | ------------------------------
Anulado           | El documento fue marcado como anulado
Autorizado        | Autorización confirmada por la autoridad tributaria
Firmado           | El documento fue firmado correctamente. Este es un estado transitorio que puede verse durante el proceso de emisión
Procesando        | El documento está siendo autorizado.
No Autorizado     | Rechazado por la autoridad tributaria
En Proceso        | Está en espera de ser procesado por la autoridad tributaria.
Error             | Este estado aparece para documentos que se registraron pero no cumplieron con requisitos de validación, o la clave del certificado está incorrecta
Enviado al SRI    | Estado transitorio mientras es procesado.
Borrador          | El documento fue creado en Datil y no ha sido autorizado.

<h2 id="document-status-code">Código del estado de un documento</h2>

Estado            | Descripción
----------------- | ------------------------------
approved          | Autorizado
rejected          | No autorizado
cancelled         | Anulado
processing        | Procesando
signed            | Firmado
draft             | Borrador

<h2 id="document-payment-status-code">Código del estado de pago</h2>

Estado            | Descripción
----------------- | ------------------------------
payed             | Pagado
due               | Pendiente de pago y vencido (la fecha máxima de pago es menor a la fecha actual)
pending           | Pendiente de pago
