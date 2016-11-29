## WsLocationStatusDTO

```xml
<status type="WsLocationStatusDTO">
   <id>159b3b82-8391-44c0-8448-d7e1f0f344d1</id>
   <key>currency.1</key>
   <value>USD;EUR;OTHER;0.732;0.733;UP;DOWN</value>
</status>
<status type="WsLocationAttributeDTO">
   <id>159b3b82-8391-44c0-8448-d7e1f0f344d1</id>
   <key>currency.2</key>
   <value>USD;CHF;OTHER;0.891;0.910;UP;UP</value>
</status>
```
Данные запрашиваются мобильными клиентами отдельно, и позволяют более точно информировать пользователей о текущем состоянии точки, например изменение курса валют и сотояние работы

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор локации
key | [LocationStatusType](#locationstatustype) | 1..1 | ключ
value | string | 1..1 | значение

### LocationStatusType

key | type | comment
--- | ---- | ---:
OPEN | bool | признак открыто/закрыто
DESCRIPTION | string | описание в виде текстового блока
CURRENCY.n | string | текстовый код валюты по [ISO 4217](https://ru.wikipedia.org/wiki/ISO_4217)
