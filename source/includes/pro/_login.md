## login

```xml

```

Запрос проверяет корректность пары login/password, если пара верна – возвращает идентификатор клиента bankClientId, соответствующий логину на стороне бэка

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
login | string | 1..1 | логин
password | string | 1..1 | пароль
validationCode | string | 0..1 | код из SMS, который передаётся только в случае ответа на команду логин с результатом VALIDATION_REQUIRED
**Response:** | | |
result | [resultLoginKey](#resultloginkey) | 1..1 | результат проверки пары логин-пароль
bankClientId | string | 1..1 | идентификатор клиента
faultMessage | string | 0..1 | расширенное сообщение об ошибке авторизации

### resultLoginKey

key | comment
--- | ---:
OK | все в порядке и можно продолжать
INVALID_CREDENTIALS | не верные данные логина/пароля
ERROR | показывается сообщение из faultMessage
PASSWORD_CHANGING_REQUIRED | необходимо обязательно сменить пароль, после установки нового пароля будет произведен login уже с ним
VALIDATION_REQUIRED | двухфакторная аутентификация с ожиданием кода из СМС
