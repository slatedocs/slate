## getTransactionDetails

Запрос возвращает список шаблонов пользоватея, принимает идентификатор транзакции, возвращает информацию о транзакции

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
transactionId | string | 1..1 | идентификатор транзакции
**Response:** | | |
transaction | [TransactionDTO](#transactiondto) | 1..1 | 
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
ReloginRequiredException | string | 0..1 | ???