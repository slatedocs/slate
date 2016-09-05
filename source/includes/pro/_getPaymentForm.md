## getPaymentForm

Возвращает форму оплаты для получателя с идентификатором beneficiaryId

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
beneficiaryId | string | 1..1 | идентификатор получателя, для которого нужно получить форму
**Response:** | | |
form | [FormDTO](#formdto) | 0..1 | форма данного получателя
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
BeneficiaryNotExistsException | string | 0..1 | получатель с запрошенным beneficiaryId не существует
