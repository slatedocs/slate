## authorizeSubscription

Запрос на инициацию авторизации подписки (например, отправка секретного переменного кода на мобильный телефон клиента посредствам SMS)

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
userId | string | 1..1 | идентификатор клиента внутри системы Банка (обычно - логин)
deviceId | string | 1..1 | уникальный код устройства (обычно VENDOR_ID железа телефона)
platform | string | 1..1 | мобильная платформа {ANDROID, IOS}
**Response:** | | |
result | string | 1..1 | флаг, обозначающий, что операция авторизация подписки инициирована {OK, ERROR}
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
