## WsFormDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | название
destinationEmail | string | 0..1 | адрес электронной почты назначения
emailTopic | string | 0..1 | тема письма электронной почты
typeId | string | 0..1 | идентификатор типа
position | string | 0..1 | расположение
fieldValues | [WsFieldValueDTO](#wsfieldvaluedto) | 0..1 | список полей формы
logoResource | [LogoResource](#logoresource) | 0..1 | url для доступа к логотипу
