## createOrder

Создание заявки

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
orderId | string | 1..1 | идентификатор
orderTypeId | string | 0..1 | внутренний тип формы в базе iDa Light
data | [FieldValueDTO](#fieldvaluedto) | 0..1 | массив полей со значениями, заполненными пользователем
**Response:** | | |
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
