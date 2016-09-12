## getDeliveryStatus

Данный запрос вызывается, когда банку необходимо проверить параметры доставки сообщения

key | type | status | comment
--- | --- | :---: | ---:
**Request:** | | |
id | string | 1..1 | уникальный идентификатор
**Response:** | | |
status | [status](#status) | 1..1 | статус сервера по доставке
errorMessage | string | 0..1 | описание возможной ошибки
deliveryStatus | [deliveryStatus](#deliverystatus) | 1..1 | результат отправки сообщения
