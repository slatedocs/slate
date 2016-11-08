## WsLocationDTO

```xml
<locations type="WsLocationDTO">
   <id>22b1b909-64a0-4bad-b2f8-956c886fb54c</id>
   <attributes type="WsLocationAttributeDTO">
      #
      # attributes
      #
   </attributes>
   <services type="WsLocationServiceDTO">
      <logicalId>logical_id</logicalId>
   </services>
   <address>i18n{"ru":"Чапаевский переулок, 3","en":"Chapaevsky lane, 3"}</address>
   <city>i18n{"ru":"Москва","en":"Moscow"}</city>
   <lat>55.798416</lat>
   <lng>37.520843</lng>
   <logicalId>22b1b909-64a0-4bad-b2f8-956c886fb54c</logicalId>
   <name>i18n{"ru":"АТМ в ЖК «Триумф Паласс»","en":"ATM Victory Plasa"}</name>
   <operationTime>i18n{"ru":"24 часа","en":"24 hour"}</operationTime>
   <type type="WsLocationTypeDTO">
      <id>bank_atm</id>
   </type>
</locations>
```

Локация обьекта на карте. При включенном геопозиционировании на устройстве список сортируется по удаленности от устройства.

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
name | string | 0..1 | наименование
city | string | 0..1 | город
address | string | 0..1 | адрес
lat | string | 1..1 | широта
lng | string | 1..1 | долгота
logicalId | string | 1..1 | логический идентификатор, может быть такой же как id (используется для внутреннего построителя в базе iDa)
operationTime | string | 0..1 | режим работы
type | [WsLocationTypeDTO](#wslocationtypedto) | 1..1 | идентификатор типа локации
services | [WsLocationServiceDTO](#wslocationservicedto) | 0..1 | идентификатор сервиса локации
attributes | [WsLocationAttributeDTO](#wslocationattributedto) | 0..1 | атрибуты локации

<aside class="notice">для локализации использовать i18n{"ru":"Русский текст","en":"English text"}</aside>

### WsLocationAttributeDTO

```xml
<attributes type="WsLocationAttributeDTO">
   <key>METRO</key>
   <value>i18n{"ru":"Аэропорт","en":"Aerport"}</value>
</attributes>
```

key | type | status | comment
--- | ---- | :----: | ---:
key | [LocationAttributeType](#locationattributetype) | 1..1 | ключ
value | string | 1..1 | значение

#### LocationAttributeType

key | type | comment
--- | ---- | ---:
METRO | string | ближайшая станция метро
DESCRIPTION | string | описание в виде текстового блока
PHONE | string | номер телефона точки
