## getEvents

Запрос на получение фидов. Лента, поддерживающая все ключи транзакции, но не сортируется самостоятельно и отображается в зависимости от ключа

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
fromIndex | int | 0..1 | индекс начального элемента в общем списке
toIndex | int | 0..1 | индекс начального элемента в общем списке
**Response:** | | |
feedEvents | [FeedEventDTO](#feedeventdto) | 0..1 | массив событий по запрошенному feed
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 0..1 | время последнего обновления данных на клиенте
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
