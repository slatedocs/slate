## checkClient

```text
www.websequencediagrams.com

participant Bank proxy as b
participant iDa Pro as p
participant Mobile as m

note over p,m,b: use PIN code first time

m->p: loginWithPassword { login, password, deviceInfo }
p->b: login { login, password, deviceInfo }
b->p: bankClientId
p->m: sessionId
m->p: isPinEstablished { deviceInfo, login }

alt NO PIN

    m->+p: establishPin { pin }
    p-->>p: PostgreSQL [ login, pin, sessionId ]
    p->-m: OK

end

note over p,m,b: use PIN code second time

m->p: loginWithPin { pin, login, deviceInfo }
p->b: checkClient { bankClientId }
```

Запрос на проверку валидности клиента во время авторизации по ПИН-коду

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBwcm94eSBhcyBiCgAQDGlEYSBQcm8gYXMgcAAMDU1vYmlsZSBhcyBtCgpub3RlIG92ZXIgcCxtLGI6IHVzZSBQSU4gY29kZSBmaXJzdCB0aW1lCgptLT5wOiAKcC0-YjogbG9naW4gewACBiwgcGFzc3dvcmQgfQpiACIFYmFua0NsaWVudElkCnAtPm06IHNlc3Npb25JZABDB2lzUGluRXN0YWJsaXNoZWQgeyBkZXZpY2VJbmZvLABbB30KCmFsdCBOTyBQSU4KCiAgICBtLT4rcDogZQAyCFAAgQQFcAAoBSAgICBwLS0-PnA6IFBvc3RncmVTUUwgWwCBHwlpbiwAgH8KIF0AKgc-LW06IE9LCgplbmQAgXMgc2Vjb25kAIIHDQCCCAVXaXQAgQEKAIE4BywAgUcLIH0AgjQHY2hlYwCCFQcgewCCHA0gfQ&s=default)

**Краткое описание схемы**

0. Отправляется запрос IsPinEstablishedRequest с текущим логином и кодом из ответа на запрос GetDeviceVerificationCodeRequest.
0. В случае не 2xx HTTP ответа от сервера установка пина прерывается, пользователь переходит в pro-часть приложения.
0. Если в ответе на IsPinEstablishedRequest вернулось, что пин уже установлен, то пользователю показывается сообщение об этом, в настройках приложения сохраняется маркер, что для пользователя с таким логином пин установлен. Пользователь переходит в pro-часть приложения.
0. Если пин до этого не был установлен, пользователю показывается интерфейс для ввода пина. После того, как он нажмет на кнопку “Установить”, на сервер отправится запрос EstablishSecurityKeyRequest с ключами из алгоритма Диффи- Хеллмана.
0. В случае, если запрос вернул ошибку, пользователю покажется сообщение об ошибке, и он остается на экране установки пина.
0. В случае успешного ответа, пин шифруется с помощью алгоритма Диффи-Хеллмана с полученным из ответа на EstablishSecurityKeyRequest публичным ключем от сервера. Зашифрованный пин отправляется на сервер запросом EstablishPinRequest.
0. В случае, если запрос вернул ошибку, пользователю показывается сообщение. Он остается на экране установки пина.
0. Успешный ответ означает, что пин установлен на сервере. В настройках приложения сохраняется маркер, что для пользователя с таким логином пин установлен. Пользователь переходит в pro-часть приложения.

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
login | string | 1..1 | логин клиента
deviceInfo | [DeviceInfoDTO](#deviceinfodto) | 1..1 | дополнительная информация об устройстве
**Response:** | | |
result | [resultcheckClientKey](#resultcheckclientkey) | 1..1 | результат проверки
correctClient | bool | 0..1 | флаг, отвечающий за разрешение или запрет авторизации по корректному ПИН-коду в текущий момент
faultMessage | string | 0..1 | расширенное сообщение об ошибке
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует

### resultcheckClientKey

key | comment
--- | ---:
OK | все в порядке и можно продолжать
ERROR | показывается сообщение из faultMessage
PASSWORD_CHANGING_REQUIRED | необходимо обязательно сменить пароль [changePassword](#changepassword)
