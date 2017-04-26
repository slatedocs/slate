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

## Tipos de forma de pago

Forma de pago            | Código
------------------------ | ------
Efectivo | efectivo
Cheque | cheque
Débito de cuenta bancaria | debito_cuenta_bancaria
Transferencia bancaria | transferencia
Depósito en cuenta (Corriente / Ahorros) | deposito_cuenta_bancaria
Tarjeta de débito | tarjeta_debito
Dinero electrónico Ecuador | dinero_electronico_ec
Tarjeta prepago | tarjeta_prepago
Tarjeta de crédito | tarjeta_credito
Otros | otros
Endoso de títulos | endoso_titulos

## Equivalencia entre formas de pago Dátil y formas de pago del SRI

Forma de pago Dátil      | Código | Forma de pago SRI      | Código
------------------------ | ------ | -----------------------|-------
Efectivo | efectivo | Sin utilización del sistema financiero | 01
Cheque | cheque | Otros con utilización del sistema financiero | 20
Débito bancario | debito_cuenta_bancaria | Otros con utilización del sistema financiero| 20
Transferencia bancaria | transferencia | Otros con utilización del sistema financiero | 20
Tarjeta de crédito | tarjeta_credito | Tarjeta de crédito nacional | 19
Depósito en cuenta (Corriente / Ahorros) | deposito_cuenta_bancaria | Otros con utilización del sistema financiero | 20
Tarjeta de débito | tarjeta_debito | Tarjeta de débito | 16
Dinero electrónico Ecuador | dinero_electronico_ec | Dinero electrónico | 17
Tarjeta prepago | tarjeta_prepago | Tarjeta prepago | 18
Otros | otros | Otros con utilización del sistema financiero | 20
Endoso de títulos | endoso_titulos | Endoso de títulos | 21

Debido a que el Servicio de Rentas Internas exige incluir información del pago,
las facturas a crédito se enviarán al SRI con forma de pago "Otros con utilización del sistema financiero".
