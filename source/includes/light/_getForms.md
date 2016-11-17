## getForms

Получение списка всех форм

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
**Response:** | | |
forms | [WsFormDTO](#wsformdto) | 0..1 | массив доступных пользователю форм
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | время последнего обновления данных
sucсess | bool | 0..1 | статус операции
errorMessage | string | 0..1 | текстовое сообщение
