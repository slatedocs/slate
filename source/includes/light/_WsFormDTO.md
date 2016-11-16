## WsFormDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
typeId | string | 1..1 | идентификатор типа формы
name | string | 0..1 | название
destinationEmail | string | 0..1 | адрес электронной почты назначения
emailTopic | string | 0..1 | тема письма электронной почты
fieldValues | [WsFieldValueDTO](#wsfieldvaluedto) | 0..1 | список полей формы
logoResource | [LogoResource](https://doc.idamob.ru/pro#logoresource) | 0..1 | url для доступа к логотипу

### WsFieldValueDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
serializedValue | string | 0..1 | значение
name | string | 0..1 | название
key | string | 0..1 | ключ
