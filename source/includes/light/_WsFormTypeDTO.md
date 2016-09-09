## WsFormTypeDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | название
emailBodyFormat | string | 0..1 | формат для текста сообщения
position | string | 0..1 | положение формы {CONTACTS, PRODUCT_ORDER}
fields | [WsFieldDTO](#wsfielddto) | 0..1 | список полей
