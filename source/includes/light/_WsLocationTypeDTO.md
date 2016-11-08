## WsLocationTypeDTO

```xml
<type type="WsLocationTypeDTO">
   <id>bank_atm</id>
   <kind>ATM</kind>
   <order>1</order>
</type>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор типа для группировки
kind | [LocationTypeKey](#locationtypekey) | 1..1 | тип
order | int | 1..1 | порядок сортировки в списке фильтра

### LocationTypeKey

key | comment
--- | ---:
OFFICE | офис
ATM | банкомат
SALE | партнер по скидкам
