## addForm

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
formTypeId | string | 1..1 | идентификатор шаблона формы
**Response:** | | |
form | [WsFormDTO](#wsformdto) | 1..1 | форма
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
