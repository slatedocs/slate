## getClientInfo

Получение общей информации о клиенте для отображения в приложении

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
**Response:** | | |
bankClient | [BankClientDTO](#bankclientdto) | 0..1 | информация о клиенте
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
