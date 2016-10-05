## makeTransfer

Запрос на совершение платежа, поддерживает два режима – с подтверждением и без. Если необходимо подтверждение платежа, признак needConfirmation должен быть выставлен в true и присутствовать код перевода в transferCode, данный код используется в #confirmTransfer для обозначения того, какой перевод мы подтверждаем

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