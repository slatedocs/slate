## getNotificationDetails

Получение подробностей уведомления

key | type | status | comment
--- | --- | :---: | ---:
**Request:** | | |
id | string | 1..1 | уникальный идентификатор
**Response:** | | |
status | [status](#status) | 1..1 | статус сервера по доставке
errorMessage | string | 0..1 | описание возможной ошибки
notification | [notification](#notification) | 0..1 | тело сообщения
