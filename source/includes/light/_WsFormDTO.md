## WsFormDTO

```xml
<forms type="WsFormDTO">
    <id>contact_form_id</id>
    <destinationEmail>info@idamob.ru</destinationEmail>
    <emailTopic>Заказ звонка от ${name}</emailTopic>
    <logoResourceURL>http://static.idamob.ru/jet/forms/${image.type}/ic_depo.png</logoResourceURL>
    <name>Contact form name</name>
    <typeId>contact_form_type_id</typeId>
</forms>
<forms type="WsFormDTO">
    <id>contact_form_id</id>
    <position>HIDDEN</position>
    <typeId>contact_form_type_id</typeId>
    <destinationEmail>dev@idamob.ru</destinationEmail>
    <emailTopic>Credit request</emailTopic>
    <fieldValues type="WsFieldValueDTO">
        <id>form_field_id</id>
        <serializedValue>от 3 до 9 лет,от 8 до 15 лет,от 15 до 30 лет</serializedValue>
    </fieldValues>
    <fieldValues type="WsFieldValueDTO">
        <id>form_field_id</id>
        <serializedValue>10% cost,15% cost,20% cost</serializedValue>
    </fieldValues>
</forms>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
typeId | string | 1..1 | идентификатор типа формы
name | string | 0..1 | название
destinationEmail | string | 0..1 | адрес электронной почты назначения
emailTopic | string | 0..1 | тема письма электронной почты
fieldValues | [WsFieldValueDTO](#wsfieldvaluedto) | 0..1 | список полей формы
logoResource | [LogoResource](https://doc.idamob.ru/pro#logoresource) | 0..1 | url для доступа к логотипу
position | string | 0..1 | возможно переопределение позиции указанной в [WsFormTypeDTO](#wsformtypedto)

### WsFieldValueDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
serializedValue | string | 0..1 | значение
name | string | 0..1 | название
key | string | 0..1 | ключ для привязки к типу в email
