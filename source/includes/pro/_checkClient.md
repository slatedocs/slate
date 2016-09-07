## checkClient

Запрос на проверку валидности клиента во время авторизации по ПИН-коду

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
login | string | 1..1 | логин клиента
deviceInfo | string | 1..1 | информация о программном и аппаратном обеспечении, используемом на клиентском приложении
**Response:** | | |
result | string | 1..1 | результат выполнения команды {OK, ERROR, PASSWORD_CHANGING_REQUIRED}
correctClient | bool | 0..1 | флаг, отвечающий за разрешение или запрет авторизации по корректному ПИН-коду в текущий момент
faultMessage | string | 0..1 | расширенное сообщение об ошибке
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
