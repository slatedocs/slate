## changePassword

Запрос на смену пароля

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
newPassword | string | 1..1 | новый пароль в открытом виде
**Response:** | | |
result | string | 1..1 | результат выполнения команды {OK, ERROR}
faultMessage | string | 0..1 | расширенное сообщение об ошибке
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
