## WsFormTypeDTO

```xml
<formTypes type="WsFormTypeDTO">
    <emailBodyFormat>Request from ${name}, ${birth}. Phone: ${phone}</emailBodyFormat>
        <fields type="WsFieldDTO">
            <groupName nil="true"/>
            <hint>i18n{"ru":"Формат +7 (ХХХ) ХХХ-ХХ-ХХ","en":"Format +7 (ХХХ) ХХХ-ХХ-ХХ"}</hint>
            <id>field_id</id>
            <isRequired>true</isRequired>
            <ordinal>1</ordinal>
            <key>phone</key>
            <name>i18n{"ru":"Контактный телефон","en":"Contact Phone"}</name>
            <ordinal>1</ordinal>
            <placeholder nil="true"/>
            <type>PHONE</type>
        </fields>
        <fields type="WsFieldDTO">
            <id>field_id</id>
            <isRequired>true</isRequired>
            <key>name</key>
            <name>i18n{"ru":"Полное имя","en":"Full name"}</name>
            <ordinal>2</ordinal>
            <type>SINGLE_LINE_TEXT</type>
        </fields>
        <fields type="WsFieldDTO">
            <id>field_id</id>
            <isRequired>true</isRequired>
            <key>birth</key>
            <name>i18n{"ru":"Дата рождения","en":"Date of birth"}</name>
            <ordinal>3</ordinal>
            <type>DATE</type>
        </fields>
    <id>contact_form_type_id</id>
    <name>Call request</name>
    <position>CONTACTS</position>
</formTypes>
```

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
name | string | 1..1 | название
ordinal | int | 1..1 | порядковый номер поля в форме
isRequired | bool | 1..1 | признак обязательности поля
type | [FieldClass](#fieldclass) | 1..1 | тип поля формы, определяющий формат данных
hint | string | 0..1 | подсказка
ordinal | int | 0..1 | порядок для сортировки
key | string | 0..1 | ключ для привязки к типу в email

### FieldClass

key | type | comment
--- | ---- | ---:
SINGLE_LINE_TEXT | string | однострочный текст
MULTI_LINE_TEXT | string | многострочный текст
CHECK_BOX | bool | чекбокс {true, false}
MONTH_YEAR | string | YYYY/MM (например 2012/11)
DATE | int | UNIXTIME (например 1394582400)
COMBO_BOX | string | список строк для comboBoxValues выбора 1..*
PHONE | int | 99999999999
PRINTED_TEXT | string | текст пояснение без возможности редактирования пользователем
IMAGE | [LogoResource](#logoresource) | картинка
MONEY | int | ddddd (умноженное на 100)
