## addContact

Добавление контакта

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
contact | [WsContactDTO](#wscontactdto) | 1..1 | контакт
**Response:** | | |
contact | [WsContactDTO](#wscontactdto) | 1..1 | контакт
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
