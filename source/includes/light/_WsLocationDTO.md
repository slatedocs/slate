## WsLocationDTO

```xml
<locations type="WsLocationDTO">
   <address>i18n{"ru":"Чапаевский пер., вл.3","en":"Chapaevsky lane., Vl.3"}</address>
   <attributes type="WsLocationAttributeDTO">
      <key>metro</key>
      <value>i18n{"ru":"Аэропорт","en":"Aerport"}</value>
   </attributes>
   <city>i18n{"ru":"Москва","en":"Moscow"}</city>
   <id>22b1b909-64a0-4bad-b2f8-956c886fb54c</id>
   <lat>55.798416</lat>
   <lng>37.520843</lng>
   <logicalId>umb002</logicalId>
   <name>i18n{"ru":"АТМ в ЖК «Триумф Паласс»","en":"ATM Victory Plasa"}</name>
   <operationTime>i18n{"ru":"24 часа","en":"24 hour"}</operationTime>
   <services type="WsLocationServiceDTO">
      <description nil="true"/>
      <id>6aaccc31-b6d0-48af-bb04-d4c07d884df6</id>
      <logicalId>chf</logicalId>
      <name>i18n{"ru":"Швейцарский франк","en":"Swiss Franc"}</name>
      <parentId>cur</parentId>
   </services>
   <services type="WsLocationServiceDTO">
      <description nil="true"/>
      <id>4a2ec9fb-36d2-468a-b62c-7f551b96617d</id>
      <logicalId>usd</logicalId>
      <name>i18n{"ru":"Американский доллар","en":"US Dollar"}</name>
      <parentId>cur</parentId>
   </services>
   <type type="WsLocationTypeDTO">
      <id>UniMegaBank_atm</id>
      <kind>atm</kind>
      <order>1</order>
   </type>
</locations>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | наименование
city | string | 0..1 | город
address | string | 0..1 | адрес
lat | int | 1..1 | широта
lng | int | 1..1 | долгота
logicalId | string | 1..1 | логический идентификатор
operationTime | string | 0..1 | режим работы
type | [WsLocationTypeDTO](#wslocationtypedto) | 1..1 | тип
services | [WsLocationServiceDTO](#wslocationservicedto) | 0..1 | список сервисов
attributes | [WsLocationAttributeDTO](#wslocationservicedto) | 0..1 | атрибуты фильтра

### WsLocationTypeDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
kind | string | 1..1 | тип {office, sale, atm}
order | int | 1..1 | порядок сортировки

### WsLocationServiceDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 1..1 | наименование
description | string | 0..1 | описание
logicalId | string | 1..1 | логический идентификатор

### WsLocationAttributeDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
key | string | 1..1 | ключ {currency.1, currency.2, open, description}
value | string | 1..1 | значение

<aside class="notice">для локализации использовать i18n{"ru":"Чапаевский пер., вл.3","en":"Chapaevsky lane., Vl.3"}</aside>
