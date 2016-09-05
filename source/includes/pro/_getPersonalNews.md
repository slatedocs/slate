## getPersonalNews

Запрос на получение личных уведомлений и новостей для пользователя. Физически попадает в отдельный раздел меню. Наличие раздела управляется через ключ PERSONAL_NEWS в BANKCLIENTDTO

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | время последнего обновления данных на клиенте
**Response:** | | |
news | [PersonalNewsDTO](#personalnewsdto) | 0..1 | список объектов с информацией о счетах
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | время последнего обновления данных на клиенте
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
