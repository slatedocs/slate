## haveUpdates

Проверяет, есть ли обновления списков (есть, если текущее состояние-хеш не совпадает с передаваемым)

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
hash | string | 1..1 | хеш последнего полученного результата
type | string | 1..1 | тип списка для проверки {BENEFICIARIES_LIST, STANDARD_FORMS}
**Response:** | | |
haveUpdates | bool | 1..1 | нужно ли обновлять
