## getBills

Запрос возвращает список выставленны счетов для пользователя с идентификатором bankClientId

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
**Response:** | | |
BillDTO | [BillDTO](#billdto) | 0..1 | список объектов с информацией о счетах
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
