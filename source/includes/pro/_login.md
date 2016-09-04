## login

```xml

```

Запрос проверяет корректность пары login/password, если пара верна – возвращает идентификатор клиента bankClientId, соответствующий логину на стороне бэка

#### Request:

key | type | status | comment
--- | ---- | :----: | ---:
login | string | 1..1 | логин
password | string | 1..1 | пароль
validationCode | string | 0..1 | код из SMS, который передаётся только в случае ответа на команду логин с результатом VALIDATION_REQUIRED

#### Response:

key | type | status | comment
--- | ---- | :----: | ---:
result | [loginResponce](#loginresponce) | 1..1 | Результат проверки пары логин-пароль
bankClientId | string | 1..1 | Идентификатор клиента
faultMessage | string | 0..1 | Расширенное сообщение об ошибке авторизации

### loginResponce

key | comment
--- | ---:
OK | все в порядке и можно продолжать
INVALID_CREDENTIALS | не верные данные логина/пароля
ERROR | показывается сообщение из faultMessage
PASSWORD_CHANGING_REQUIRED | необходимо обязательно сменить пароль
VALIDATION_REQUIRED | двухфакторная аутентификация с ожиданием кода из СМС
