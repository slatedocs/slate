## WsLocationTypeDTO

```xml
<type type="WsLocationTypeDTO">
   <id>bank_atm</id>
   <kind>atm</kind>
   <order>1</order>
</type>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор типа для группировки
kind | [LocationType](#locationtype) | 1..1 | тип
order | int | 1..1 | порядок сортировки в списке фильтра

### LocationType

key | comment
--- | ---:
OFFICE | офис
ATM | банкомат
SALE | партнер по скидкам
