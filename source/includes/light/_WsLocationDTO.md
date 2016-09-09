## WsLocationDTO

```xml
<locations type="WsLocationDTO">
   <address>i18n{"ru":"Чапаевский переулок, 3","en":"Chapaevsky lane, 3"}</address>
   <attributes type="WsLocationAttributeDTO">
      #
      # attributes
      #
   </attributes>
   <city>i18n{"ru":"Москва","en":"Moscow"}</city>
   <id>22b1b909-64a0-4bad-b2f8-956c886fb54c</id>
   <lat>55.798416</lat>
   <lng>37.520843</lng>
   <logicalId>22b1b909-64a0-4bad-b2f8-956c886fb54c</logicalId>
   <name>i18n{"ru":"АТМ в ЖК «Триумф Паласс»","en":"ATM Victory Plasa"}</name>
   <operationTime>i18n{"ru":"24 часа","en":"24 hour"}</operationTime>
   <services type="WsLocationServiceDTO">
      #
      # services
      #
   </services>
   <type type="WsLocationTypeDTO">
      <id>bank_atm</id>
      <kind>ATM</kind>
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
lat | string | 1..1 | широта
lng | string | 1..1 | долгота
logicalId | string | 1..1 | логический идентификатор
operationTime | string | 0..1 | режим работы
type | [WsLocationTypeDTO](#wslocationtypedto) | 1..1 | тип
attributes | [WsLocationAttributeDTO](#wslocationservicedto) | 0..1 | атрибуты фильтра
services | [WsLocationServiceDTO](#wslocationservicedto) | 0..1 | список сервисов

<aside class="notice">для локализации использовать i18n{"ru":"Русский текст","en":"English text"}</aside>

### WsLocationTypeDTO

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
kind | [LocationTypeKey](#locationtypekey) | 1..1 | тип
order | int | 1..1 | порядок сортировки

#### LocationTypeKey

key | comment
--- | ---:
OFFICE | 
ATM | 
SALE | 

### WsLocationAttributeDTO

```xml
<attributes type="WsLocationAttributeDTO">
   <key>CURRENCY.1</key>
   <value>USD;EUR;OTHER;0.732;0.733;UP;DOWN</value>
</attributes>
<attributes type="WsLocationAttributeDTO">
   <key>CURRENCY.2</key>
   <value>USD;CHF;OTHER;0.891;0.910;UP;UP</value>
</attributes>
<attributes type="WsLocationAttributeDTO">
   <key>METRO</key>
   <value>i18n{"ru":"Аэропорт","en":"Aerport"}</value>
</attributes>
```

Данные по статусу запрашиваются мобильными клиентами отдельно, и позволяют более точно информировать пользователей о текущем состоянии точки, например изменение курса валют и сотояние работы

key | type | status | comment
--- | ---- | :----: | ---:
key | [LocationAttributeKey](#locationattributekey) | 1..1 | ключ
value | string | 1..1 | значение

#### LocationAttributeKey

key | type | comment
--- | ---- | ---:
OPEN | bool | признак открыто/закрыто
METRO | string | ближайшая станция метро
DESCRIPTION | string | описание в виде текстового блока
PHONE | string | номер телефона точки
CURRENCY.n | string | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)

### WsLocationServiceDTO

```xml
<services type="WsLocationServiceDTO">
   <description nil="true"/>
   <id>6aaccc31-b6d0-48af-bb04-d4c07d884df6</id>
   <logicalId>chf</logicalId>
   <name>i18n{"ru":"Операции с Швейцарским франком","en":"Swiss Franc operations"}</name>
   <parentId>currency</parentId>
</services>
<services type="WsLocationServiceDTO">
   <description>parent</description>
   <id>159b3b82-8391-44c0-8448-d7e1f0f344d1</id>
   <logicalId>currency</logicalId>
   <name>i18n{"ru":"Операции с наличными","en":"Cash operations"}</name>
   <parentId nil="true"/>
</services>
```

> Логический построитель фильтра на основе Service

```json
{  "parentId" : "Наименование раздела № 1",
   "elements" : [
      {  "name" : "Эленента № 1 в разделе № 1"  },
      {  "name" : "Эленента № 2 в разделе № 1"  }
   ]
}
```

Сервисы позволяют настроить более гибкий фильтр по точкам на карте

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 1..1 | наименование
description | string | 0..1 | логическая принадлежность
logicalId | string | 1..1 | логический идентификатор
parentId | string | 0..1 | родительский логический блок
