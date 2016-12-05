## haveUpdates

Проверяет, есть ли обновления списков (есть, если текущее состояние не совпадает с передаваемым)

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
lastUpdateTime | [Date ISO 8601](https://ru.wikipedia.org/wiki/ISO_8601) | 1..1 | дата последнего обновления
type | [ObjectType](#objecttype) | 1..1 | тип для проверки
id | string | 0..1 | идентификатор обьекта из поля type (если не указан, то проверяется то обновляется весь список)
**Response:** | | |
haveUpdates | bool | 1..1 | нужно ли обновлять

### ObjectType

key | comment
--- | ---:
BENEFICIARY_CATEGORIES | раздел платежей
STANDARD_FORMS | список стандартных форм
PAYMENT_FORM | форма и наследник формы
