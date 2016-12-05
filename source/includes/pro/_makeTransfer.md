## makeTransfer

```text
www.websequencediagrams.com

participant Bank proxy as b
participant iDa Pro as p
participant Mobile as m
participant PiGeon as pi

p->+b: query form
b->-p: form ( hasNext = false )
p->m:
m->p:
p->b: makeTransfer

alt needConfirmation = true, transferCode = tcode

    b->p:
    b->pi: send confirmCode = ccode
    pi->m:
    m->p:
    p->b: confirmTransfer ( transferCode = tcode, confirmCode = ccode)
    b->p: ok
    p->m:

else needConfirmation = false

    b->p: ok
    p->m:

end
```

Запрос на совершение платежа, поддерживает два режима – с подтверждением и без. Если необходимо подтверждение платежа, признак needConfirmation должен быть выставлен в true и присутствовать код перевода в transferCode, данный код используется в [confirmTransfer](#confirmtransfer) для обозначения того, какой перевод мы подтверждаем

![image](https://www.websequencediagrams.com/cgi-bin/cdraw?lz=cGFydGljaXBhbnQgQmFuayBwcm94eSBhcyBiCgAQDGlEYSBQcm8gYXMgcAAMDU1vYmlsZSBhcyBtACQNUGlHZW9uACsFaQoKcC0-K2I6IHF1ZXJ5IGZvcm0KYi0-LXA6AAcFICggaGFzTmV4dCA9IGZhbHNlICkKcC0-bTogCm0tPnA6CnAtPmI6IG1ha2VUcmFuc2ZlcgoKYWx0IG5lZWRDb25maXJtYXRpb24gPSB0cnVlLCB0ACAHQ29kZSA9IHRjb2RlCgogICAgYgBMBQACCGk6IHNlbmQgYwA_BgAoB2MAKgUgICAgcGktPm0AKQYAgQUFIAAQBgCBCgUALQcAgQoIICgAYRUsAEgUKQCBAQogb2sATAhtOiAKCmVsc2UAgUQUAIITBQCBOAsAJxFuZAo&s=default)

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
filledForm | [FilledFormDTO](#filledformdto) | 1..1 | заполненная форма с данными
requestId | string | 1..1 | уникальный идентификатор запроса в виде UUID
deviceInfo | [DeviceInfoDTO](#deviceinfodto) | 1..1 | дополнительная информация об устройстве
**Response:** | | |
result | string | 1..1 | результат операции {OK, ERROR}
needConfirmation | bool | 0..1 | признак необходимости подтверждения
transferCode | string | 0..1 | код операции
message | string | 0..1 | сообщение об ошибке или иное сообщение
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует

**deprecated:**

 ||||
--- | ---- | :----: | ---:
faultMessage | string | 0..1 | сообщение об ошибке или иное сообщение
confirmationMessage | string | 0..1 | сообщение об ошибке или иное сообщение