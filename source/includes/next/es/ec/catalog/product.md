## Productos

Un Producto está representado por un objeto _Product_.

#### Product

Atributos |  &nbsp;
--------- | -----------
id<p class="dt-data-type">string</p> | Identificador único del producto en Dátil
name<p class="dt-data-type">string</p> | Nombre del producto
description<p class="dt-data-type">string</p> | Esta información se mostrará en Market.
created_at<p class="dt-data-type">string</p> | Fecha de creación generada por Dátil.
updated_at<p class="dt-data-type">string</p> | Fecha de actualización generada automáticamente por Dátil.
sku<p class="dt-data-type">string</p> | Código del producto (Stock Keeping Unit). Se utiliza principalmente para el control de inventario. Puede utilizarse también para realizar búsquedas con pocos caracteres.
unit_cost<p class="dt-data-type">string</p> | Costo unitario del producto sin impuestos. Este es el valor que normalmente pagas al proveedor al comprar este producto.
type<p class="dt-data-type">string</p> | Tipo de producto. Bien "good" o servicio "service".
unit_price<p class="dt-data-type">string</p> | Precio unitario de venta sin impuestos.
unit_of_measurement<p class="dt-data-type">[unit_of_measurement](#unit-of-measurement)</p> | Unida de medida del producto.
images<p class="dt-data-type">list of [product_images](#product-image)</p> | Listado de imágenes asociadas a este producto.
category<p class="dt-data-type">[category](#category)</p> | Categoría a la que pertenece el producto.
applicable_taxes<p class="dt-data-type">list of [product-tax](#product-tax)</p> | Listado de los impuestos que deben aplicarse a este producto al momento de vender.
purchase_applicable_taxes<p class="dt-data-type">list of [product-tax](#product-tax)</p> | Listado de los impuestos que deben aplicarse a este producto al momento de comprarlo.
track_inventory<p class="dt-data-type">boolean</p> | Verdadero cuando Dátil controla el las existencias de este producto.
tags<p class="dt-data-type">list of string</p> | Las etiquetas te permiten agregar información complementaria al producto y podrás buscar productos con esta información.
available_on_market<p class="dt-data-type">boolean</p> | Verdadero si está disponible en tu Market ([más información de Market](https://datil.co/producto#market))


#### Product Tax

Atributos | &nbsp;
--------- | -------
tax_code<p class="dt-data-type">string</p> | Código del grupo al que pertenece el impuesto.
rate_code <p class="dt-data-type">string</p> | Código de la tarifa de impuesto aplicado.
rate <p class="dt-data-type">string</p> | Porcentaje del impuesto aplicado.
name <p class="dt-data-type">string</p> | Nombre descriptivo del impuesto.


#### Unit of measurement

Atributos | &nbsp;
--------- | -------
abbreviation<p class="dt-data-type">string</p> | Abreviatura, tratando en lo posible de utilizar el Sistema Internacional de medidas.
name<p class="dt-data-type">string</p> | Nombre completo de la unidad.


#### Product Image

Atributos | &nbsp;
--------- | -------
src<p class="dt-data-type">string</p> | URL de la imagen.
title<p class="dt-data-type">string</p> | Título de la imagen.
