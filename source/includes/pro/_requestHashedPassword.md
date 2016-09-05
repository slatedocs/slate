## requestHashedPassword

Запрос проверяет наличие пользователя, если пользователь присутствует – возвращает информацию, необходимую для проверки пароля

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
login | string | 1..1 | логин
**Response:** | | |
result | [resultHashedPasswordKey](#resulthashedpasswordkey) | 1..1 | результат проверки пары логин-пароль
bankClientId | string | 1..1 | идентификатор клиента
method | [hashMethodKey](#hashmethodkey) | 1..1 | идентификатор клиента
salt | string | 1..1 | соль, используемая для хеширования пароля
hash | string | 1..1 | пароль, захешированный с солью указанным методом
faultMessage | string | 0..1 | расширенное сообщение об ошибке

### resultHashedPasswordKey

key | comment
--- | ---:
OK | все в порядке и можно продолжать
UNKNOWN_USER | не верные данные логина/пароля, показывается сообщение из faultMessage

### hashMethodKey

key | comment
--- | ---:
PLAIN | 
BCRYPT | 
SHA2 | 