## changePassword

```text
participant Bank proxy as b
participant iDa Pro as p
participant Mobile as m

note over p,m,b: change password

m->p:
p->b: login { login, password }
b->p: loginResult { bankClientId, PASSWORD_CHANGING_REQUIRED, message }
m->p:
p->b: changePassword { newPassword }
b->p: ok
p->m: ok


note over p,m,b: SMS factor change password

m->p:
p->b: login { login, password }
b->p: loginResult { bankClientId, VALIDATION_REQUIRED, message }
p->m:
b->m: send SMS
m->p:
p->b: login { login, password, validationCode }
b->p: loginResult { bankClientId, PASSWORD_CHANGING_REQUIRED, message }
p->b: changePassword { newPassword }
b->p: ok
p->m: ok
```

Запрос на смену пароля при логине. Фактически пользователь логинится под старым паролем (или временным), но банк принудительно заставляет его сменить пароль на новый.

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBwcm94eSBhcyBiCgAQDGlEYSBQcm8gYXMgcAAMDU1vYmlsZSBhcyBtCgpub3RlIG92ZXIgcCxtLGI6IGNoYW5nZSBwYXNzd29yZAoKbS0-cDogCnAtPmI6IGxvZ2luIHsAAgYsAB0JIH0KYgAiBQAbBVJlc3VsdCB7IGJhbmtDbGllbnRJZCwgUEFTU1dPUkRfQ0hBTkdJTkdfUkVRVUlSRUQsIG1lc3NhZ2UgfQBhDgCBBwZQAF4IeyBuZXcABQkAbAhvawpwLT5tAAQFAIE-E1NNUyBmYWN0b3IAgQFbVkFMSURBVElPTgCBQBUAgRsFCmIAgSEFc2VuZCBTTVMAglMGAII6HiwgdmFsaWRhdGlvbkNvZGUAgh1LAIIrNg&s=default)

Два варианта:
1. Просто смена пароля без 2х факторного подтверждения смс
2. Сммена пароля с 2х факторной процедурой

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
newPassword | string | 1..1 | новый пароль в открытом виде
**Response:** | | |
result | string | 1..1 | результат выполнения команды {OK, ERROR}
message | string | 0..1 | расширенное сообщение об ошибке
