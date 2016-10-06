## requestHashedPassword

Запрос проверяет наличие пользователя, если пользователь присутствует – возвращает информацию, необходимую для проверки пароля

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
login | string | 1..1 | логин
**Response:** | | |
result | [resultHashedPasswordKey](#resulthashedpasswordkey) | 1..1 | результат проверки пары логин-пароль
bankClientId | string | 1..1 | идентификатор клиента
method | [hashMethodKey](#hashmethodkey) | 1..1 | алгоритм генерации hash-кода
salt | string | 0..1 | соль, используемая для хеширования пароля в зависимости от метода шифрования
hash | string | 1..1 | текст, захешированный с солью в зависимости от метода шифрования
faultMessage | string | 0..1 | расширенное сообщение об ошибке

### resultHashedPasswordKey

key | comment
--- | ---:
OK | все в порядке и можно продолжать
UNKNOWN_USER | не верные данные логина/пароля, показывается сообщение из faultMessage

### hashMethodKey

key | comment
--- | ---:
PLAIN | hash-функция не используется, пароль передан в открытом виде
BCRYPT | aдаптивная криптографическая функция [BCRYPT](https://ru.wikipedia.org/wiki/Bcrypt)
SHA2 | от пароля взят hash по алгоритму [SHA2](https://ru.wikipedia.org/wiki/SHA-2) (без использования salt)

<aside class="warning">PLAIN может использоваться только для тестирования, так как пароль идет в открытом виде</aside>
