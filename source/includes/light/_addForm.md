## addForm

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
formTypeId | string | 1..1 | идентификатор шаблона формы
name | string | 0..1 | заголовок для формы сообщения
destinationEmail | string | 0..1 | e-mail адрес, на который будет отправлено сообщение
emailTopic | string | 0..1 | тело для формы сообщения
logoResourceURL | string | 0..1 | иконка формы
**Response:** | | |
form | [WsFormDTO](#wsformdto) | 1..1 | форма
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
