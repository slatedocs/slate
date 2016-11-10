## WsFormTypeDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | название
emailBodyFormat | string | 0..1 | формат для текста сообщения
position | [FormPosition](#formposition) | 1..1 | положение формы
fields | [WsFieldDTO](#wsfielddto) | 0..1 | список полей

### FormPosition

key | comment
--- | ---:
CONTACTS | форма в разделе контактов
PRODUCT_ORDER | форма в приватном разделе ``SPECIAL_ORDERS`` про части
HIDDEN | форма не видна в списках, но на нее возможен переход
