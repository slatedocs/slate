## removeTemplate

Удаление шаблона

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
templateId | string | 1..1 | идентификатор шаблона
**Response:** | | |
result | string | 1..1 | результат выполнения команды {OK, ERROR}
message | string | 0..1 | сообщение об ошибке или иное сообщение
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
