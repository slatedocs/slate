## verifySubscriptionAuthorization

Проверка корректности введенного переменного кода

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
userId | string | 1..1 | идентификатор клиента внутри системы Банка (обычно - логин)
deviceId | string | 1..1 | уникальный код устройства (обычно VENDOR_ID железа телефона)
verificationCode | string | 1..1 | код, введенный пользователем для подтверждения подписки
**Response:** | | |
result | string | 1..1 | флаг, обозначающий, что операция авторизация пройдена успешна {OK, VERIFICATION_FAILED}
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
