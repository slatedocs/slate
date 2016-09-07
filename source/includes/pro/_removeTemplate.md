## removeTemplate

Запрос на проверку валидности клиента во время авторизации по ПИН-коду

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
templateId | string | 1..1 | логин клиента
**Response:** | | |
result | string | 1..1 | результат выполнения команды {OK, ERROR}
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
