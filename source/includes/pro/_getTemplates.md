## getTemplates

Запрос возвращает список шаблонов пользователя с идентификатором bankClientId

key | type | status | comment
--- | ---- | :----: | ---:
**Request:** | | |
bankClientId | string | 1..1 | идентификатор клиента
**Response:** | | |
TemplateDTO | [TemplateDTO](#templatedto) | 0..1 | список форм с предзаполненной информацией для удобства пользователя
**Exception:** | | |
BankClientNotExistsException | string | 0..1 | клиент с запрошенным bankClientId не существует
