## blockCard

Запрос на блокировку карты

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
cardId | string | 1..1 | идентификатор карты для блокировки
**Response:** | | |
result | string | 1..1 | результат операции {OK, ERROR}
faultMessage | string | 0..1 | сообщение об ошибке
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
CardNotExistsException | string | 0..1 | карта с запрошенным cardId не существует
