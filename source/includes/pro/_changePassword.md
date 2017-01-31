## changePassword

```text
www.websequencediagrams.com

participant Bank proxy as b
participant iDa Pro as p
participant Mobile as m

note over p,m,b: --- var 1 ---

m->p:
p->b: login { login, password }
b->p: loginResult { bankClientId, PASSWORD_CHANGING_REQUIRED }
m->p:
p->b: changePassword { newPassword }
b->p: ok
p->m: ok


note over p,m,b: --- var 1 ---

m->p:
p->b: login { login, password }
b->p: loginResult { bankClientId, VALIDATION_REQUIRED }
p->m:
b->m: send SMS
m->p:
p->b: login { login, password, validationCode }
b->p: loginResult { bankClientId, PASSWORD_CHANGING_REQUIRED }
p->b: changePassword { newPassword }
b->p: ok
p->m: ok
```

Запрос на смену пароля при логине. Фактически пользователь логинится под старым паролем (или временным), но банк принудительно заставляет его сменить пароль на новый.

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBwcm94eSBhcyBiCgAQDGlEYSBQcm8gYXMgcAAMDU1vYmlsZSBhcyBtCgpub3RlIG92ZXIgcCxtLGI6IC0tLSB2YXIgMSAtLS0KCm0tPnA6CnAtPmI6IGxvZ2luIHsAAgYsIHBhc3N3b3JkIH0KYi0-cAAZB1Jlc3VsdCB7IGJhbmtDbGllbnRJZCwgUEFTU1dPUkRfQ0hBTkdJTkdfUkVRVUlSRUQgfQBYDWNoYW5nZVAAVAh7IG5ldwAFCQBiCG9rCnAtPm0ABAUAgSkbMgB2TlZBTElEQVRJT04AgTEMAIEEBQpiAIEKBXNlbmQgU01TAIITJCwgdmFsaWRhdGlvbkNvZGUAggVCAIILNg&s=default)

**Варианты использования**

0. Смена пароля без 2х факторного подтверждения смс
0. Смена пароля с 2х факторной процедурой

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
newPassword | string | 1..1 | новый пароль в открытом виде
**Response:** | | |
result | string | 1..1 | результат выполнения команды {OK, ERROR}
message | string | 0..1 | расширенное сообщение об ошибке
