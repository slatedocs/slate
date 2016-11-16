## WsFormTypeDTO

Верхнеуровневый вид формы. Используется как шаблон-генератор на который должна ссылаться клиентская форма

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | название
emailBodyFormat | string | 0..1 | формат для текста сообщения (применимо к контактным формам)
position | [FormPosition](#formposition) | 1..1 | положение формы
fields | [WsFieldDTO](#wsfielddto) | 0..1 | список полей

### FormPosition

key | comment
--- | ---:
CONTACTS | форма в разделе контактов
PRODUCT_ORDER | форма в приватном разделе ``SPECIAL_ORDERS`` про части
HIDDEN | форма не видна в списках, но на нее возможен переход

### WsFieldDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | название
type | string | 0..1 | тип
hint | string | 0..1 | подсказка
isRequired | bool | 0..1 | признак обязательности поля
ordinal | int | 0..1 | порядок для сортировки
key | string | 0..1 | ключ для привязки к типу
