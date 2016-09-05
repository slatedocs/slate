## markPersonalNewsRead

Запрос на отметку новостей как прочитанных

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
entityIds | string | 1..1 | список идентификаторов уведомлений (персональных новостей), которые нужно пометить как прочитанные
**Response:** | | |
result | string | 0..1 | статус выполнения запроса, обрабатывается только OK, ERROR
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
