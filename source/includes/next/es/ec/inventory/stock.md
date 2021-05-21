## Existencia

Una Existencia está representado por un objeto _Stock_.

#### Stock
Atributos |  &nbsp;
--------- | -----------
to_buy<p class="dt-data-type">integer</p> | Cantidad de items a comprar para completar las existencias mínimas
item_id<p class="dt-data-type">string</p> | Identificador único del item
stock_alarm<p class="dt-data-type">string</p> | `"ok"` si tiene habilitado alarmas por existencias mínimas
latest_update_by_transaction<p class="dt-data-type">string</p> | Fecha de la última actualización por transacción
warehouse | Objeto de tipo [Warehouse](#warehouse)
created_at<p class="dt-data-type">string</p> | Fecha de creación de las existencias
total<p class="dt-data-type">string</p> | Monto total que existe en la bodega
updated_at<p class="dt-data-type">string</p> | Fecha de creación de las existancias
unit_price<p class="dt-data-type">string</p> | Precio unitario del item
quantity<p class="dt-data-type">string</p> | Cantidad de las existencias en el inventario