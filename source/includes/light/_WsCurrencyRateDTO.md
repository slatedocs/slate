## WsCurrencyRateDTO

```xml
<rates type="WsCurrencyRateDTO">
   <buy>66.03</buy>
   <date>2016-09-08</date>
   <firstCurrency>CHF</firstCurrency>
   <groupName>Курс отделений</groupName>
   <id>сurrency_id</id>
   <secondCurrency>RUB</secondCurrency>
   <sell>70.0</sell>
   <type>CENTRAL_BANK</type>
</rates>
```

key | type | status | comment
--- | ---- | :----: | ---:
id | string | 1..1 | идентификатор
date | string | 0..1 | дата
firstCurrency | string | 1..1 | первая валюта
secondCurrency | string | 1..1 | вторая валюта
buy | string | 1..1 | цена покупки
sell | string | 1..1 | цена продажи
type | [CurrencyRateType](#currencyratetype) | 1..1 | тип курса
groupName | string | 0..1 | имя группы

### CurrencyRateType

key | comment
--- | ---:
CENTRAL_BANK | курс центробанка с поддержкой 4 символов после запятой
OTHER | все остальные курсы
