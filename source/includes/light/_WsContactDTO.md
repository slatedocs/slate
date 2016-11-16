## WsContactDTO

```xml
<contacts type="WsContactDTO">
   <id>ec9251b6-a5de-4e67-8e17-26260efda2d1</id>
   <logoResourceURL>http://static.idamob.ru/jet/forms/${image.type}/ic_call_24.png</logoResourceURL>
   <name>i18n{"ru":"VIP звонок в банк","en":"VIP Line"}</name>
   <position>PRODUCT_ORDER</position>
   <type>PHONE</type>
   <value>(800) 700–700–4</value>
</contacts>
<contacts type="WsContactDTO">
   <id>3b467b82-2296-4e1a-9074-4a61283419e6</id>
   <logoResourceURL>http://static.idamob.ru/jet/forms/${image.type}/ic_www.png</logoResourceURL>
   <name>i18n{"ru":"Сайт Банка","en":"Web"}</name>
   <position>CONTACTS</position>
   <type>URL</type>
   <value>i18n{"ru":"www.idamob.ru","en":"www.idamob.com"}</value>
</contacts>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | наименование
type | [ContactTypeKey](#contacttypekey) | 1..1 | тип
value | string | 0..1 | значение
logoResourceURL | [LogoResource](https://doc.idamob.ru/pro#logoresource) | 0..1 | url для доступа к логотипу
position | [FormPosition](#formposition) | 0..1 | расположение формы для ряда уникальных кейсов

### ContactTypeKey
key | comment
--- | ---:
PHONE | номер телефона
URL | ссылка
TEXT | текстовый блок

### FormPosition
key | comment
--- | ---:
CONTACTS | форма в списке контактов
PRODUCT_ORDER | форма попадает в отдельный раздел бокового меню
