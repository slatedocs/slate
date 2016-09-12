## checkSubscriptionAuthorized

Проверка наличия подтвержденной подписки

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
userId | string | 1..1 | идентификатор клиента внутри системы Банка (обычно - логин)
deviceId | string | 1..1 | уникальный код устройства (обычно VENDOR_ID железа телефона)
platform | string | 1..1 | мобильная платформа {ANDROID, IOS}
**Response:** | | |
authorized | bool | 1..1 | флаг, обозначающий, что клиент уже ранее подтвердил (например, через SMS) заинтересованность в подписке
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
