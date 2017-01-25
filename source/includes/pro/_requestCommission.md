## requestCommission

Запрос на расчет комиссии по платежу – отправляется заполненная форма с информацией о платеже, результатом работы является ответ, содержащий размер комиссии и валюту

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
filledForm | [FilledFormDTO](#filledformdto) | 1..1 | заполненная форма с данными
**Response:** | | |
commission | int | 1..1 | размер комиссии
currencyCode | string | 1..1 | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
message | string | 0..1 | сообщение об ошибке или иное сообщение
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
